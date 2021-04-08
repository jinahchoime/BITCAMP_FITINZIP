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

<style>
#btnResult{
margin-right:20px;
background-color: #D5E1DF;
border-color:#7c9893;
}
</style>

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
					<div class="col-md-12" style="text-align: center;">
						<button type="button" class="btn" id="btnResult" onclick="chartPeopleStart()">ALL</button>
						<button type="button" class="btn" id="btnResult" onclick="chartPeopleStart('20210101')">1월</button>
						<button type="button" class="btn" id="btnResult" onclick="chartPeopleStart('20210201')">2월</button>
						<button type="button" class="btn" id="btnResult" onclick="chartPeopleStart('20210301')">3월</button>
						<button type="button" class="btn" id="btnResult" onclick="chartPeopleStart('20210401')">4월</button>
						<button type="button" class="btn" id="btnResult" onclick="chartPeopleStart('20210501')">5월</button>
						<button type="button" class="btn" id="btnResult" onclick="chartPeopleStart('20210601')">6월</button>
						<button type="button" class="btn" id="btnResult" onclick="chartPeopleStart('20210701')">7월</button>
						<button type="button" class="btn" id="btnResult" onclick="chartPeopleStart('20210801')">8월</button>
						<button type="button" class="btn" id="btnResult" onclick="chartPeopleStart('20210901')">9월</button>
						<button type="button" class="btn" id="btnResult" onclick="chartPeopleStart('202101001')">10월</button>
						<button type="button" class="btn" id="btnResult" onclick="chartPeopleStart('202101101')">11월</button>
						<button type="button" class="btn" id="btnResult" onclick="chartPeopleStart('202101201')">12월</button>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12" id ="createDiv">
						<canvas id="subMainPeopleChart" style="margin-top: 60px;"></canvas>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12" id ="createBBS">
					
					</div>				
				</div>
			</div><!-- 그래프 div끝 -->
				
				<!-- 가입승인게시판 -->
				<section>
					<div class="tbl-header">
						<table cellpadding="0" cellspacing="0" border="0">
							<thead>
								<tr style="text-align: center;">
									<th style="width: 120px;">아이디</th>
									<th style="width: 120px;">이름</th>
									<th style="width: 120px;">성별</th>
									<th style="width: 120px;">생년월일</th>
									<th style="width: 120px;">가입일</th>
									<th style="width: 120px;">역할</th>
								</tr>
							</thead>
						</table>
					</div>
					<div class="tbl-content h700">
						<table cellpadding="0" cellspacing="0" border="0">
							<tbody id="getList">
								<%-- <%@ include file="subMainPart.jsp"%> --%>
							</tbody>

						</table>
					</div>
				</section>
			


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
	chartPeopleStart();

	
});
	function addComma(num) {
		  var regexp = /\B(?=(\d{3})+(?!\d))/g;
		  return num.toString().replace(regexp, ',');
		}

	function chartPeopleStart(btnParam){
		console.log("btnParam"+btnParam);
		
		$.ajax({
			url: "chartPeopleStartOne",
			type: "POST",
			dataType: "json",
			data :{
				btnParam :btnParam
			},
			success: function(data){
				let dataTwo = chartPeopleSecond(btnParam);
				getSubMainchartOne(data, dataTwo)	
			},
			error: function (){
				alert("짜쓰~"+error);
				}
		});
	}
	function getSubMainchartOne(data){
		
		console.log(data);
		$('#subMainChartStart').remove();
	    $('#createDiv').append('<canvas id="subMainChartStart" style="margin-top: 60px;"></canvas>');
		
		let myChartStart = document.getElementById('subMainChartStart').getContext('2d');
		
		let getChartOne = new Chart(myChartStart, {
			type : 'bar', //pie, line, doughnut, palarArea, bar
			data : {
				//labels: labels,
				datasets : [{
					data: data,
					backgroundColor : [ 'rgba(247,67,54,0.7)','rgba(33,150,243,0.7)' , 'rgba(255,152,0,0.7)' , 'rgba(233,30,99,0.7)','rgba(0,188,212,0.7)','rgba(255,193,7,0.7)','rgba(156,39,176,0.7)','rgba(0,150,136,0.7)','rgba(255,152,0,0.7)','rgba(103,58,183,0.7)','rgba(76,175,80,0.7)','rgba(77,44,264,0.7)' ],
					borderWidth : 3,
					borderColor : ['rgba(247,67,54,1)','rgba(33,150,243,1)' , 'rgba(255,152,0,1)' , 'rgba(233,30,99,1)','rgba(0,188,212,1)','rgba(255,193,7,1)','rgba(156,39,176,1)','rgba(0,150,136,1)','rgba(255,152,0,1)','rgba(103,58,183,1)','rgba(76,175,80,1)','rgba(77,44,264,1)']
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
					   }
				}, animation: {
	                duration: 8000,
	            }
			}
		}); // 차트 메인 콜백함수
			
	}// 차트 funtion의 끝
	function chartPeopleSecond(btnParam){
	console.log("Second btnParam : "+btnParam);
	var dataTwo = new Array(); 
	
		$.ajax({
			url: "chageChartData",
			type: "POST",
			dataType: "json",
			async:false,
			data :{
				btnParam :btnParam
			},
			success: function(data){
				dataTwo = chartPeopleSecond(btnParam);
				getSubMainchartOne(data,dataTwo)	
			},
			error: function (){
				alert("짜쓰~"+error);
				}
		});
		return dataTwo
	}
	
	
	function chartStrartBBS(btnParam){
		$.ajax({
			url: "getSubMainBBSData",
			type: "POST",
			data :{
				btnParam :btnParam
			},
			success: function(data){

				$('#getList').html(data);
			},
			error: function (){
				}
		});
	};

</script>
</body>
</html>