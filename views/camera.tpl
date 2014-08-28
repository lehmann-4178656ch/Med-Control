%include('header.tpl', title='Kamera', system_status=system_status)
<div class="row">
	<div class="col-xs-12 col-sm-6">
		<ul>
			%for i in range(len(actions)):
			<li><a href="/camera/{{ i }}" class="btn btn-primary col-xs-12" role="button"><span class="glyphicon glyphicon glyphicon-{{ actions[i].icon }}"></span> {{ actions[i].name }}</a></li>
			%end
		</ul>
	</div>
</div>

%if system_status[1]:
<video id="video" autoplay="autoplay" preload="metadata">
	<source src="http://{{ host }}/stream.ogg" />
</video>
%end
%include('footer.tpl')

