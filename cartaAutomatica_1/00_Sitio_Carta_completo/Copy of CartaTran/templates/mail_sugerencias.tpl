<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<title></title>
		<style>
			hr {width: 99%; height: 7px; color: #B00000;}

			p {font-size: 18px; margin: 0px; margin-left: 10px; padding: 0px; font-family: Arial;}
			.name  {color: #333399;}
			.text  {color: #666666; font-size: 12px;}
			.title {color: #999999; font-weight: bold;}

			A {color: #006600;}
			.mail  {font-size: 11px;}
		</style>
	</head>
	<body>
		<p class="name"><b>%strSenderLastName%</b>, %strSenderName%</p>
		<p><a class="mail" href="mailto:%strSenderEmail%?subject=Re: Sugerencia a Carta Automática">%strSenderEmail%</a></p>
		<hr align="center" noshade>
		<p class="title">SUGIERE:</p>
		<br>
		<p class="text">%strBody%</p>
	</body>
</html>
