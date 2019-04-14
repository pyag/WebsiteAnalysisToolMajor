<html>
<head>
<title>Website analysis tool</title>

<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">

<script>

var load = function(){
	var chart = new CanvasJS.Chart("chartContainer", {
		animationEnabled: true,
		theme: "light2", // "light1", "light2", "dark1", "dark2"
		title:{
			text: "Response Time"
		},
		axisY: {
			title: "Time (in seconds)"
		},
		data: [{ 
			type: "column",  
			showInLegend: true, 
			legendMarkerColor: "grey",
			//legendText: "MMbbl = one million barrels",
			dataPoints: [
				{ y: {{ responseTime[0] }} , label: "Single Request" },
				{ y: {{ responseTime[1] }} , label: "Low Load" },
				{ y: {{ responseTime[2] }} , label: "Light Load" },
				{ y: {{ responseTime[3] }} , label: "Moderate Load" },
				{ y: {{ responseTime[4] }} , label: "Heavy Load" }
			]
		}]
	});
	
	var chart1 = new CanvasJS.Chart("chartContainer2", {
		exportEnabled: true,
		animationEnabled: true,
		theme: "light2",
		title:{
			text: "Building Components in Webpage"
		},
		legend:{
			cursor: "pointer",
			itemclick: explodePie
		},
		data: [{
			type: "pie",
			showInLegend: true,
			toolTipContent: "{name}: <strong>{y}%</strong>",
			indexLabel: "{name} - {y}%",
			dataPoints: [
				{ y: {{!content[0]}} , name: "Div", exploded: true },
				{ y: {{!content[1]}} , name: "Image" },
				{ y: {{!content[2]}} , name: "Videos" },
				{ y: {{!content[3]}} , name: "Table" },
				{ y: {{!content[4]}} , name: "Audio" }
			]
		}]
	});
	
	var chart2 = new CanvasJS.Chart("chartContainer3", {
		animationEnabled: true,
		theme: "light2", // "light1", "light2", "dark1", "dark2"
		title:{
			text: "Security Status"
		},
		axisY: {
			title: "Levels"
		},
		data: [{        
			type: "column",  
			showInLegend: true, 
			legendMarkerColor: "grey",
			legendText: "Level rating is out of 3",
			dataPoints: [      
				{ y: 3, label: "HTTPS" },
				{ y: 1,  label: "DDoS Attack" },
				{ y: 2,  label: "Cookies" }
			]
		}]
	});
	
	function explodePie (e) {
		if(typeof (e.dataSeries.dataPoints[e.dataPointIndex].exploded) === "undefined" || !		e.dataSeries.dataPoints[e.dataPointIndex].exploded) {
			e.dataSeries.dataPoints[e.dataPointIndex].exploded = true;
		} else {
			e.dataSeries.dataPoints[e.dataPointIndex].exploded = false;
		}
		e.chart.render();

	}
	
	chart.render();
	chart1.render();
	chart2.render();
}
</script>

<style>
body{
	margin: 0;
	padding: 0;
	//background: #abeebb;
	font-family: 'Ubuntu', sans-serif;
}

.graphs{
	padding: 2%;
	border: 1px solid #dddddd;
	border-radius: 9px;
	width: 60%;
	//display: block;
	margin: 2.5% auto;
	background: #ffffff;
	//background: #888888;
	box-shadow: 3px 3px 10px #666666;
}

#wrapper{
	//width: 95%;
	padding: 1%;
	background: #EEEEEE;
	position: relative;
	margin: 0 auto;
}

.blacks{
	//background: #222222;
}

header{
	text-align: center;
	padding: 1.3%;
	background: #732699;
	border-bottom:1px solid #78acdf;
	color: #ffffff;
	font-weight: bold;
}

</style>

</head>

<body>

<a href = "/"><header>Website Analysis Tool</header></a>

<div id = "wrapper">

<div class = "graphs">
<div id="chartContainer" style="height: 300px; width: 100%;"></div>
</div>

<div class = "graphs blacks">
<div id="chartContainer2" style="height: 300px; width: 100%;"></div>
</div>

<div class = "graphs">
<div id="chartContainer3" style="height: 300px; width: 100%;"></div>
</div>

</div>

<script>
window.onload = load;
</script>

</body>

</html>