<html>
<head>

<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">

<style>
body{
	margin:0;
	padding:0;
	
	//background-image: url("good.jpg");
	//background-size: 100% 100%;
	//background: #39CCCC;
	
	font-family: 'Ubuntu', sans-serif;
	text-align: :center;
	font-weight: bold;
}

header{
	text-align: center;
	padding: 1.3%;
	background: #732699;
	//border-bottom:1px solid #78acdf;
	color: #ffffff;
	box-shadow: 0px 2px 5px #888888;
}

a{
	text-decoration: none;
}

#enurl{
	width: 50%;
	padding :1%;
	border-radius: 5px;
	margin-top: 180px;
	margin-left: 350px;
	border: 2px solid #1efefe;
	font-family: 'Ubuntu', sans-serif;
	font-weight: bold;
	font-size: 105%;
}

#sub{
	background: #ffffff;
	border: 3px solid #6456ff;
	border-radius: 3px;
	left: 0;
	right: 0;
	margin-left: 650px;
	padding: 0.8%;
	font-family: 'Ubuntu', sans-serif;
	margin-top: 15px;
	color: #6456ff;
	font-size: 18px;
	font-weight: bold;
}

#sub:hover{
	background: #6456ff;
	color: #ffffff;
}

</style>

</head>
<body>
	<a href = "/"><header>Website Analysis Tool</header></a>
	<form action = "/display" method = "POST">
		<input type = "url" id = "enurl" placeholder="URL" name = "wesbiteURL" required /><br>
		<input type = "submit" id = "sub" value = "Analyze" />
	</form>
</body>	
</html>