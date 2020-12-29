$(document).ready(function() 
		{
	new Chart(document.getElementById("bar-chart"), {
		type: 'pie',
		data: {
			labels: ["Income", "Refund"],
			datasets: [
			           {
			        	   label: "Month",
			        	   backgroundColor: ["rgba(255, 159, 64, 0.2)", "rgba(75, 192, 192, 0.2)"],
                                           borderColor: ["rgb(255, 159, 64)", "rgb(75, 192, 192)"],
			        	   data: [
			                      7220.5,
			                      1280.0
			                  ]
			           }
			           ]
		},
		options: {
			title: {
				display: true,
				text: 'University Earing & Cost (in Millions)'
			}
		}
	});
		});
                $(document).ready(function() 
		{
	new Chart(document.getElementById("bar-chart2"), {
		type: 'pie',
		data: {
			labels: ["Income", "Refund"],
			datasets: [
			            {
			        	   label: "Today",
			        	   backgroundColor: ["rgba(54, 162, 235, 0.2)", "rgba(153, 102, 255, 0.2)"],
                                           borderColor: ["rgb(54, 162, 235)", "rgb(153, 102, 255)"],
			        	   data: [
			                      100.0,
			                      0
			                  ]
			           }
			           ]
		},
		options: {
			title: {
				display: true,
				text: 'University Earing & Cost (in Millions)'
			}
		}
	});
		});
$(document).ready(function() 
		{
	var ctx = document.getElementById('myChart').getContext('2d');
	var myChart = new Chart(ctx, {
		type: 'line',
		data: {
			labels: ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
			datasets: [{
				label: 'Cost',
				data: [
		                randomScalingFactor(),
		                randomScalingFactor(),
		                randomScalingFactor(),
		                randomScalingFactor(),
		                randomScalingFactor(),
		                randomScalingFactor(),
		                randomScalingFactor()
		            ],
				backgroundColor: "rgba(255,61,103,0.3)"
			}, {
				label: 'Earning',
				data: [
		                randomScalingFactor(),
		                randomScalingFactor(),
		                randomScalingFactor(),
		                randomScalingFactor(),
		                randomScalingFactor(),
		                randomScalingFactor(),
		                randomScalingFactor()
		            ],
				backgroundColor: "rgba(34,206,206,0.3)"
			}]
		}
	});
		});