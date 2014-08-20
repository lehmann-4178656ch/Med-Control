<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>{{ title }} &bull; Med-Control</title>
		<link href="/static/css/bootstrap.min.css" rel="stylesheet">
		<style>
/* Space out content a bit */
body {
  padding-top: 20px;
  padding-bottom: 20px;
}

/* Everything but the jumbotron gets side spacing for mobile first views */
.header,
.footer {
  padding-right: 15px;
  padding-left: 15px;
}

/* Custom page header */
.header {
  border-bottom: 1px solid #e5e5e5;
}
/* Make the masthead heading the same height as the navigation */
.header h3 {
  padding-bottom: 19px;
  margin-top: 0;
  margin-bottom: 0;
  line-height: 40px;
}

/* Custom page footer */
.footer {
  padding-top: 19px;
  color: #777;
  border-top: 1px solid #e5e5e5;
}

/* Customize container */
@media (min-width: 768px) {
  .container {
    max-width: 730px;
  }
}
.container-narrow > hr {
  margin: 30px 0;
}

/* Responsive: Portrait tablets and up */
@media screen and (min-width: 768px) {
  /* Remove the padding we set earlier */
  .header,
  .marketing,
  .footer {
    padding-right: 0;
    padding-left: 0;
  }
  /* Space out the masthead */
  .header {
    margin-bottom: 30px;
  }
  /* Remove the bottom border on the jumbotron for visual effect */
  .jumbotron {
    border-bottom: 0;
  }
}
		</style>
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