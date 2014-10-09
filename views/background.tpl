%include('header.tpl', title='Hintergrund', system_status=system_status)
<div class="row">
	<div class="col-xs-12 col-sm-6">
		<ul>
			%for i in range(len(actions)):
			<li><a href="/background/{{ i }}" class="btn btn-primary col-xs-12" role="button"> {{ actions[i].name }}</a></li>
			%end
		</ul>
	</div>
</div>
%include('footer.tpl')

