%include('header.tpl', title='Kamera', system_status=system_status)
<ul>
	%for i in range(len(actions)):
	<li><a href="/camera/{{ i }}"><span class="glyphicon glyphicon glyphicon-{{ actions[i].icon }}"></span> {{ actions[i].name }}</a></li>
	%end
</ul>

%if system_status[1]:
<video id="video" autoplay="autoplay" preload="metadata">
	<source src="http://{{ host }}/stream.ogg" />
</video>
%end
%include('footer.tpl')

