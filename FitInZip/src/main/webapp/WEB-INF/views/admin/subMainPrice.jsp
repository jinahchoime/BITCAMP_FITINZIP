<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jqery -->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	type="text/javascript"></script>
<!-- bbs -->
<link rel="stylesheet" href="../resources/admin/css/bbs.css">
<link href="../resources/admin/js/bbs.js">
<!-- MainSidebar -->
<link rel="stylesheet" href="../resources/admin/css/style5.css">

<!-- Bootstrap CSS CDN -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">

<!-- Bootstrap JS -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
	integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
	crossorigin="anonymous"></script>


<!-- chartJS -->

	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.0.2/chart.js"></script>
	
<!-- MainSidebar -->
<link rel="stylesheet" href="../resources/admin/css/style5.css">

</head>
<body>
	<div class="wrapper">
		<!-- Sidebar Holder -->
		<jsp:include page="mainSideBar.jsp"></jsp:include>

		<!-- Page Content Holder -->
		<div id="content" style='padding-top: 20px' id="navconvert">
			<!-- NavBar -->
			<jsp:include page="mainNavBar.jsp"></jsp:include>

			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<button type="button" class="btn btn-primary" id="btnResult1"
							style="width: 90px;" onclick="chartFirstStart()">ALL</button>
						<button type="button" class="btn btn-primary" id="btnResult2"
							style="width: 90px;" onclick="chartFirstStart('웨이트')">웨이트</button>
						<button type="button" class="btn btn-primary" id="btnResult3"
							onclick="chartFirstStart('피트니스')">피트니스</button>
						<button type="button" class="btn btn-primary" id="btnResult4"
							style="width: 90px;" onclick="chartFirstStart('요가')">요가</button>
						<button type="button" class="btn btn-primary" id="btnResult5"
							onclick="chartFirstStart('필라테스')">필라테스</button>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12" id ="createDiv">
						<canvas id="subMainChartStart" style="margin-top: 60px;"></canvas>
					</div>
				</div>

			</div>
			<!--container 끝-->


		</div>
		<!-- content 끝 -->
	</div>
	<!-- wrapper 끝 -->

	<script>
$(document).ready(function() {
	$('#sidebarCollapse').on('click', function() {
		$('#sidebar').toggleClass('active');
		$(this).toggleClass('active');
	});
	chartFirstStart();
	
});
	function addComma(num) {
		  var regexp = /\B(?=(\d{3})+(?!\d))/g;
		  return num.toString().replace(regexp, ',');
		}

	function chartFirstStart(btnParam){
		/* if(btnParam == null){
			btnParam = '';
		} */
		$.ajax({
			url: "chageChartData",
			type: "POST",
			dataType: "json",
			data :{
				btnParam :btnParam
			},
			success: function(data){
				getSubMainchartOne(data)	
			},
			error: function (){
				alert("짜쓰~"+error);
				}
		});
	}
	function getSubMainchartOne(data){
		
		console.log(data);
/* 		const labels = data.map(v => v.cdate);
		const values = data.map(v => v.rprice);
		console.log(labels);
		console.log(values);
		*/
	/* 	
		const newData = data.map(v => {
			return {
				cdate: v.cdate,
				rprice: v.rprice
			}
		})
		console.log(newData); */
		/*
		document.getElementById('subMainChartStart').remove();
		var a = document.getElementById('createDiv').outerHTML; 
		console.log(a);
		a += "<canvas id='subMainChartStart' style='margin-top: 60px;'></canvas>";
		console.log(a);
		*/
		$('#subMainChartStart').remove();
	    $('#createDiv').append('<canvas id="subMainChartStart" style="margin-top: 60px;"></canvas>');
		
		let myChartStart = document.getElementById('subMainChartStart').getContext('2d');
		
		let getChartOne = new Chart(myChartStart, {
			type : 'bar', //pie, line, doughnut, palarArea, bar
			data : {
				//labels: labels,
				datasets : [{
					data: data,
					backgroundColor : [ 'rgba(247,67,54,0.7)','rgba(33,150,243,0.7)' , 'rgba(255,152,0,0.7)' , 'rgba(233,30,99,0.7)' ],
					borderWidth : 3,
					borderColor : ['rgba(247,67,54,1)','rgba(33,150,243,1)' , 'rgba(255,152,0,1)' , 'rgba(233,30,99,1)']
				}] 
			},
			options: {
				parsing: {
					xAxisKey: 'cdate',
					yAxisKey: 'rprice'
				},scales: {
					y: {
						ticks:{
							beginAtZero:true,
	                        callback: function(value, index, values) {
	                            if(parseInt(value) >= 1000){
	                               return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+ '원';
	                            } else {
	                               return value+'원';
	                            }
	                       }                            
						}
					}
	            },
				plugins:{
					legend: {
	            	    display: false,
	                	labels: {
	                    	color: 'rgb(255, 99, 132)'
	                	}
	            	},tooltip: {
					      callbacks: {
					    	  label: function(context) {
			                        var label = context.dataset.label || '매출액  ';

			                        if (label) {
			                            label += ': ';
			                        }
			                        if (context.parsed.y !== null) {
			                            label += addComma(context.parsed.y) + ' 원';
			                        }
			                        return label;
			                    }
						      }
					   },
				}
			}
		}); // 차트 메인 콜백함수
			
	}// 차트 funtion의 끝
	

</script>
</body>
</html>