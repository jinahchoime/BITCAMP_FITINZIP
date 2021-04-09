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
.btnResult{
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
						<button type="button" class="btn btnResult" id="btnResult" onclick="chartPeopleStart()">2021년</button>
						<button type="button" class="btn" id="btnResult1" onclick="chartPeopleStartTwo('20210101')">1월</button>
						<button type="button" class="btn" id="btnResult2" onclick="chartPeopleStartTwo('20210201')">2월</button>
						<button type="button" class="btn" id="btnResult3" onclick="chartPeopleStartTwo('20210301')">3월</button>
						<button type="button" class="btn" id="btnResult4" onclick="chartPeopleStartTwo('20210401')">4월</button>
						<button type="button" class="btn" id="btnResult5" onclick="chartPeopleStartTwo('20210501')">5월</button>
						<button type="button" class="btn" id="btnResult6" onclick="chartPeopleStartTwo('20210601')">6월</button>
						<button type="button" class="btn" id="btnResult7" onclick="chartPeopleStartTwo('20210701')">7월</button>
						<button type="button" class="btn" id="btnResult8" onclick="chartPeopleStartTwo('20210801')">8월</button>
						<button type="button" class="btn" id="btnResult9" onclick="chartPeopleStartTwo('20210901')">9월</button>
						<button type="button" class="btn" id="btnResult10" onclick="chartPeopleStartTwo('20211001')">10월</button>
						<button type="button" class="btn" id="btnResult11" onclick="chartPeopleStartTwo('20211101')">11월</button>
						<button type="button" class="btn" id="btnResult12" onclick="chartPeopleStartTwo('20211201')">12월</button>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12" id ="createDiv">
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
								<%-- <%@ include file="subMainPeoplePart.jsp"%> --%>
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
		chartStrartBBS(btnParam);
		$.ajax({
			url: "chartPeopleStartOne",
			type: "POST",
			dataType: "json",
			data :{
				btnParam :btnParam
			},
			success: function(data){
				getSubMainchartOne(data)	
			},
			error: function (){
				
				}
		});
	}
	function getSubMainchartOne(data){
		var arrOne = JSON.stringify(data.listOne);
		var arrTwo = JSON.stringify(data.listTwo);
		
		console.log(arrOne);
	
		
		$('#subMainChartStart').remove();
	    $('#createDiv').append('<canvas id="subMainChartStart" style="margin-top: 60px;"></canvas>');
		
		let myChartStart = document.getElementById('subMainChartStart').getContext('2d');
		
		let getChartOne = new Chart(myChartStart, {
			type : 'line', //pie, line, doughnut, palarArea, bar
			data : {
				//labels: labels,[{cdate : '2/1', pcount : '20'}]
				datasets : [{
					label: '일반회원',
					data: JSON.parse(arrOne),
					backgroundColor : [ 'rgba(247,67,54,0.7)','rgba(33,150,243,0.7)' , 'rgba(255,152,0,0.7)' , 'rgba(233,30,99,0.7)','rgba(0,188,212,0.7)','rgba(255,193,7,0.7)','rgba(156,39,176,0.7)','rgba(0,150,136,0.7)','rgba(255,152,0,0.7)','rgba(103,58,183,0.7)','rgba(76,175,80,0.7)','rgba(77,44,264,0.7)' ],
					borderWidth : 3,
					borderColor : ['rgba(247,67,54,1)','rgba(33,150,243,1)' , 'rgba(255,152,0,1)' , 'rgba(233,30,99,1)','rgba(0,188,212,1)','rgba(255,193,7,1)','rgba(156,39,176,1)','rgba(0,150,136,1)','rgba(255,152,0,1)','rgba(103,58,183,1)','rgba(76,175,80,1)','rgba(77,44,264,1)']
				},{
					label : '트레이너',
					data: JSON.parse(arrTwo),
					backgroundColor : [ 'rgba(247,67,54,0.7)','rgba(33,150,243,0.7)' , 'rgba(255,152,0,0.7)' , 'rgba(233,30,99,0.7)','rgba(0,188,212,0.7)','rgba(255,193,7,0.7)','rgba(156,39,176,0.7)','rgba(0,150,136,0.7)','rgba(255,152,0,0.7)','rgba(103,58,183,0.7)','rgba(76,175,80,0.7)','rgba(77,44,264,0.7)' ],
					borderWidth : 3,
					borderColor : ['rgba(247,67,54,1)','rgba(33,150,243,1)' , 'rgba(255,152,0,1)' , 'rgba(233,30,99,1)','rgba(0,188,212,1)','rgba(255,193,7,1)','rgba(156,39,176,1)','rgba(0,150,136,1)','rgba(255,152,0,1)','rgba(103,58,183,1)','rgba(76,175,80,1)','rgba(77,44,264,1)']
				}] 
		
			},
			options: {
				parsing: {
					xAxisKey: 'cdate',
					yAxisKey: 'pcount'
				},
				scales: {
					y: {
						ticks:{
							beginAtZero:true,
	                        callback: function(value, index, values) {
	                            if(parseInt(value) >= 1000){
	                               return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+ '원';
	                            } else {
	                               return value+'명';
	                            }
	                       }                            
						}
					}
	            },
				plugins:{
					legend: {
	            	    display: true,
	                	labels: {
	                    	color: 'rgb(0, 0, 0,1)'
	                	}
	            	},tooltip: {
					      callbacks: {
					    	  label: function(context) {
			                        var label = context.dataset.label || '가입인원  ';

			                        if (label) {
			                            label += ': ';
			                        }
			                        if (context.parsed.y !== null) {
			                            label += addComma(context.parsed.y) + ' 명';
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
	}
	
	function chartPeopleStartTwo(btnParam){
		chartStrartBBS(btnParam);
		console.log("btnParam"+btnParam);
		
		$.ajax({
			url: "chartPeopleStartTwo",
			type: "POST",
			dataType: "json",
			data :{
				btnParam :btnParam
			},
			success: function(data){
				getSubMainchartTwo(data)	
			},
			error: function (){
				
				}
		});
	}
	
	function getSubMainchartTwo(data){
		var arrDetailOne = JSON.stringify(data.listOne);
		var arrDetailTwo = JSON.stringify(data.listTwo);
		
		console.log(arrDetailOne);
	
		
		$('#subMainChartStart').remove();
	    $('#createDiv').append('<canvas id="subMainChartStart" style="margin-top: 60px;"></canvas>');
		
		let myChartStart = document.getElementById('subMainChartStart').getContext('2d');
		
		let getChartTwo = new Chart(myChartStart, {
			type : 'line', //pie, line, doughnut, palarArea, bar
			data : {
				//labels: labels,[{cdate : '2/1', pcount : '20'}]
				datasets : [{
					label: '일반회원',
					data: JSON.parse(arrDetailOne),
					backgroundColor : [ 'rgba(247,67,54,0.7)','rgba(33,150,243,0.7)' , 'rgba(255,152,0,0.7)' , 'rgba(233,30,99,0.7)','rgba(0,188,212,0.7)','rgba(255,193,7,0.7)','rgba(156,39,176,0.7)','rgba(0,150,136,0.7)','rgba(255,152,0,0.7)','rgba(103,58,183,0.7)','rgba(76,175,80,0.7)','rgba(77,44,264,0.7)' ],
					borderWidth : 3,
					pointRadius:4,
					borderColor : ['rgba(247,67,54,1)','rgba(33,150,243,1)' , 'rgba(255,152,0,1)' , 'rgba(233,30,99,1)','rgba(0,188,212,1)','rgba(255,193,7,1)','rgba(156,39,176,1)','rgba(0,150,136,1)','rgba(255,152,0,1)','rgba(103,58,183,1)','rgba(76,175,80,1)','rgba(77,44,264,1)']
				},{
					label : '트레이너',
					data: JSON.parse(arrDetailTwo),
					backgroundColor : [ 'rgba(247,67,54,0.7)','rgba(33,150,243,0.7)' , 'rgba(255,152,0,0.7)' , 'rgba(233,30,99,0.7)','rgba(0,188,212,0.7)','rgba(255,193,7,0.7)','rgba(156,39,176,0.7)','rgba(0,150,136,0.7)','rgba(255,152,0,0.7)','rgba(103,58,183,0.7)','rgba(76,175,80,0.7)','rgba(77,44,264,0.7)' ],
					borderWidth : 3,
					pointRadius:4,
					borderColor : ['rgba(247,67,54,1)','rgba(33,150,243,1)' , 'rgba(255,152,0,1)' , 'rgba(233,30,99,1)','rgba(0,188,212,1)','rgba(255,193,7,1)','rgba(156,39,176,1)','rgba(0,150,136,1)','rgba(255,152,0,1)','rgba(103,58,183,1)','rgba(76,175,80,1)','rgba(77,44,264,1)']
				}] 
		
			},
			options: {
				parsing: {
					xAxisKey: 'cdate',
					yAxisKey: 'pcount'
				},
				scales: {
					y: {
						ticks:{
							beginAtZero:true,
	                        callback: function(value, index, values) {
	                            if(parseInt(value) >= 1000){
	                               return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+ '원';
	                            } else {
	                               return value+'명';
	                            }
	                       }                            
						}
					}
	            },
				plugins:{
					legend: {
	            	    display: true,
	                	labels: {
	                    	color: 'rgb(0, 0, 0,1)'
	                	}
	            	},tooltip: {
					      callbacks: {
					    	  label: function(context) {
			                        var label = context.dataset.label || '가입인원  ';

			                        if (label) {
			                            label += ': ';
			                        }
			                        if (context.parsed.y !== null) {
			                            label += addComma(context.parsed.y) + ' 명';
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
	}
	
	function chartStrartBBS(btnParam){
		$.ajax({
			url: "getChartPeopleBBS",
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