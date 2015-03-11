%include('header.tpl', title='Hintergrund', system_status=system_status)
<div class="row">
	<div class="col-xs-12 col-sm-6">
		<ul>
			%for i in range(len(actions)):
			<li><a href="/background/{{ i }}" class="btn btn-primary col-xs-12" role="button"> {{ actions[i].name }}</a></li>
			%end
		</ul>
	</div>
	<div class="col-xs-12 col-sm-6">
                <div class="row">
		    <div class="col-xs-9" style="border: 5px solid #E5E5E5; background-color: {{ current }};">&nbsp;</div>
                    <div class="col-xs-3"><p>{{ current }}</p></div>
                </div>
		<form role="form" method="post" action="/background/color">
			<div class="form-group">
				<label for="color">Hex-RGB-Farbe</label>
				<input class="form-control" type="text" name="color" id="color" placeholder="ff4400" />
			</div>
			<input type="submit" class="btn btn-default" value="Setzen"/>
		</form>
	</div>
</div>
%include('footer.tpl')

