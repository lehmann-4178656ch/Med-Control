<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>{{ title }} &bull; Med-Control</title>
		<link href="/static/css/bootstrap.min.css" rel="stylesheet">
		<link href="/static/css/med-control.css" rel="stylesheet">
	</head>
	<body>
		<div class="container">
			<header class="header">
				<ul class="nav nav-pills pull-right">
					<li><a href="/radio"><span class="glyphicon glyphicon-music"></span> Radio <span class="glyphicon glyphicon-{{ 'play' if system_status[0] else 'stop' }}"></span> <span class="glyphicon glyphicon-volume-{{ 'off' if system_status[3] else 'up' }}"></span>
					</a></li>
					<li><a href="/camera"><span class="glyphicon glyphicon-facetime-video"></span> Kamera <span class="glyphicon glyphicon-eye-{{ 'open' if system_status[1] else 'close' }}"></a></li>
				</ul>
				<h3 class="text-muted"><a href="/">Med-Control</a></h3>
			</header>
