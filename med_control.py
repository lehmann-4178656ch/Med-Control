import configparser
import csv
import locale
import os
import shlex
import signal
import subprocess

import bottle

# Read configuration
BASE_DIR = os.path.dirname(os.path.realpath(__file__))
config = configparser.ConfigParser()
config.read(os.path.join(BASE_DIR, 'config.ini'))

# Add template path to bottle search path
bottle.TEMPLATE_PATH.append(config['Interface'].get('views',
    os.path.join(BASE_DIR, 'views')))


class AudioMixer(object):

    def _pactl(self, key, value):
        id = config['Sound'].get('SINK_NR', '0')
        subprocess.call(['pactl', key, id, value])

    def _filter_pacmd_dump(self, key):
        encoding = locale.getdefaultlocale()[1]
        id = config['Sound'].get('SINK_ID', '')
        if len(id):
            key = key + ' ' + id
        output = subprocess.check_output(['pacmd', 'dump'])
        data = filter(lambda l: l.startswith(key),
                      output.decode(encoding).split('\n'))
        return data

    def get_volume(self):
        data = next(self._filter_pacmd_dump('set-sink-volume'))
        return int(int(data.split()[-1], 16)/65535. * 100)

    def set_volume(self, volume):
        volume = max(min(volume, 100), 0)
        self._pactl('set-sink-volume', '%s%%' % volume)

    volume = property(get_volume, set_volume)

    def get_mute(self):
        data = next(self._filter_pacmd_dump('set-sink-mute'))
        return data.split()[-1] == 'yes'

    def set_mute(self, mute):
        mute = 1 and mute or 0
        self._pactl('set-sink-mute', str(mute))

    mute = property(get_mute, set_mute)


class MediaObject(object):
    def __init__(self, key, name, cmd):
        self.name = name
        self.cmd = config[key].get('cmd').format(cmd=cmd,pid='{pid}')


class PidControl(object):
    def __init__(self, group, name, icon, cmd=None):
        self.pid = '/tmp/%s.pid' % group
        self.name = name
        self.icon = icon
        self.cmd = cmd
        if self.cmd:
            self.cmd = cmd.format(pid=self.pid)
        print('A:'+str(self.cmd))

    def kill(self):
        if os.path.exists(self.pid):
            f = open(self.pid, 'r')
            pid = int(f.readlines()[0])
            f.close()
            os.killpg(pid, signal.SIGTERM)
            os.unlink(self.pid)

    def run(self):
        self.kill()
        if self.cmd is not None:
            print('B:'+self.cmd)
            subprocess.call(shlex.split(self.cmd))


def get_media_objects(key):
    objects = []
    with open(os.path.join(config[key].get('csv')), 'r') as csvfile:
        csvreader = csv.reader(csvfile, delimiter=';', quotechar='|')
        for row in csvreader:
            objects.append(MediaObject(key, row[0], row[1]))
    return objects


def get_media_commands(key):
    commands = [PidControl(key, 'Aus', 'stop')]
    for m in get_media_objects(key):
        commands.append(PidControl(key, m.name, 'play', m.cmd))
    return commands


def get_system_status():
    return (os.path.exists(PidControl('Radio', '', '').pid),
            os.path.exists(PidControl('Camera', '', '').pid),
            AudioMixer().volume,
            AudioMixer().mute)


@bottle.route('/radio')
def radio_index():
    return bottle.template('radio', actions=get_media_commands('Radio'),
                           system_status=get_system_status())


@bottle.route('/radio/volume/<action>')
def radio_volume(action):
    m = AudioMixer()
    if action == 'up':
        m.set_volume(m.get_volume() + 5)
    elif action == 'down':
        m.set_volume(m.get_volume() - 5)
    elif action == 'mute':
        m.set_mute(True)
    elif action == 'unmute':
        m.set_mute(False)
    elif action == 'togglemute':
        m.set_mute(1 - m.get_mute())
    else:
        m.set_volume(int(action))
    bottle.redirect('/radio')


@bottle.route('/radio/<index>')
def radio_action(index):
    index = int(index)
    get_media_commands('Radio')[index].run()
    bottle.redirect('/radio')


@bottle.route('/camera')
def camera_index():
    return bottle.template('camera', actions=get_media_commands('Camera'),
                            system_status=get_system_status(),
                            host=config['Camera'].get('host'))


@bottle.route('/camera/<index>')
def camera_action(index):
    index = int(index)
    get_media_commands('Camera')[index].run()
    bottle.redirect('/camera')


@bottle.route('/')
def index():
    return bottle.template('index', system_status=get_system_status())

bottle.run(host=config['Interface'].get('host', '127.0.0.1'),
           port=config['Interface'].getint('port'))
