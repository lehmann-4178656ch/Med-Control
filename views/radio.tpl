%include('header.tpl', title='Radio', system_status=system_status)
<div class="row">
	<div class="col-xs-6">
		<ul>
		%for i in range(len(actions)):
			<li><a href="/radio/{{ i }}"><span class="glyphicon glyphicon glyphicon-{{ actions[i].icon }}"></span> {{ actions[i].name }}</a></li>
		%end
		</ul>
	</div>
	<div class="col-xs-6">
		<ul>
			<li><a href="/radio/volume/up"><span class="glyphicon glyphicon glyphicon-volume-up"></span> lauter</a></li>
			<li><a href="/radio/volume/down"><span class="glyphicon glyphicon glyphicon-volume-down"></span> leiser</a></li>
			<li><a href="/radio/volume/togglemute"><span class="glyphicon glyphicon glyphicon-volume-{{ 'up' if system_status[3] else 'off' }}"></span> stumm</a></li>
		</ul>
	</div>
</div>
%include('footer.tpl')
