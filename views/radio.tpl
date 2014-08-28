%include('header.tpl', title='Radio', system_status=system_status)
<div class="row">
	<div class="col-xs-12 col-sm-6 col-sm-push-6">
		<ul>
			<li><a href="/radio/volume/up" class="btn btn-primary col-xs-12" role="button"><span class="glyphicon glyphicon glyphicon-volume-up"></span> lauter</a></li>
			<li><a href="/radio/volume/down" class="btn btn-primary col-xs-12" role="button"><span class="glyphicon glyphicon glyphicon-volume-down"></span> leiser</a></li>
			<li><a href="/radio/volume/togglemute" class="btn btn-primary col-xs-12" role="button"><span class="glyphicon glyphicon glyphicon-volume-{{ 'up' if system_status[3] else 'off' }}"></span> stumm</a></li>
		</ul>
	</div>
	<div class="col-xs-12 col-sm-6 col-sm-pull-6">
		<ul>
		%for i in range(len(actions)):
			<li><a href="/radio/{{ i }}" class="btn btn-primary col-xs-12" role="button"><span class="glyphicon glyphicon glyphicon-{{ actions[i].icon }}"></span> {{ actions[i].name }}</a></li>
		%end
		</ul>
	</div>
</div>
%include('footer.tpl')
