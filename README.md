Med-Control
===========

Med-Control is a *simple* control center for switching (web-)radio stations and camera control through the web.
It uses Python 3 and the [Bottle](http://bottlepy.org/docs/dev/index.html) framework. The layout is based on [Bootstrap 3.2.0](http://getbootstrap.com/getting-started/#download).

Installation
============
* Install all requirements (`pip install -r requirements.txt`) in an Python 3 environment.
* Copy or move all *.example file and modify to match own use-case.
* Provide a way to server static files (I use an nginx as reverse-proxy infront which servers static-files)
