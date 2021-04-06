<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Collapsible sidebar using Bootstrap 4</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	type="text/javascript"></script>

<!-- bbs -->
<link rel="stylesheet" href="../resources/admin/css/bbs.css">
<link href="../resources/admin/js/bbs.js">

<!-- percent bar -->
<link rel="stylesheet" href="../resources/admin/css/percent.css">
<!-- progress bar -->
<link rel="stylesheet" href="../resources/admin/css/progress.css">
<script src="https://rendro.github.io/easy-pie-chart/javascripts/jquery.easy-pie-chart.js"></script>


<!-- MainSidebar -->
<link rel="stylesheet" href="../resources/admin/css/style5.css">

<!-- Bootstrap CSS CDN -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">

<!-- Font Awesome JS -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
	integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
	crossorigin="anonymous"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
	integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
	integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
	integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc"
	crossorigin="anonymous"></script>

<!-- Popper.JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
	integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
	crossorigin="anonymous"></script>
<!-- Bootstrap JS -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
	integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
	crossorigin="anonymous"></script>
<!-- MainSidebar -->
<link rel="stylesheet" href="../resources/admin/css/style5.css">
<!-- chartJS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>

<style type="text/css">
*{
	font-family: 'Noto Sans KR', sans-serif;
}
.modal-backdrop {
	background-color: transparent !important;
	position: absolute;
	z-index: -1;
}

.theadWidth {
	width: 100px;
}

.title1 {
	text-align: center;
	font-weight: 800;
	font-size: 20px;
	color: black;/* 여기는글자색 */
	text-transform: uppercase;
}
.easyPieChart{
	width: 220px !important; 
    height: 220px !important;
    margin : -15px !important;
    line-height: 215px !importan;
    padding-top: 30px !importan;
}

canvas{
	width: 100% !important;
}
h5{
 font-weight:600;
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

			<!-- 가입승인게시판 -->
			<div><jsp:include page="bbstest.jsp"></jsp:include></div>
			<div class="line"></div>

			<div><jsp:include page="bbsClass.jsp"></jsp:include></div>
			<div class="line"></div>

			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<h5 style="text-align: center; padding-bottom: 10px;"
							id="chartOnePrice">이달의 매출 현황</h5>
					</div>
					<div class="col-md-6">
						<h5 style="text-align: center; padding-bottom: 10px;"
							id="chartTwoPrice">지난달 매출 현황</h5>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6">
						<canvas id="myChartOne"></canvas>
					</div>
					<div class="col-md-6">
						<canvas id="myChartTwo"></canvas>
					</div>
				</div>

				<div class="line"></div>
				<div class="row">
					<div class="col-md-12">
						<h5 style="text-align: center; padding-bottom: 10px;"
							id="chartOnePrice">지난달 대비 매출 달성률</h5>
					</div>
				</div>

				<div class="row" style="padding-top: 50px;">
					<div class="col-md-8">
						<div class="skillbar clearfix " id="weightData" data-percent="30%">
							<div class="skillbar-title"
								style="background: rgba(247, 67, 54, 0.7);">
								<span>웨이트</span>
							</div>
							<div class="skillbar-bar"
								style="background: rgba(247, 67, 54, 0.7)"></div>
							<div class="skill-bar-percent" id="weightPer">120%</div>
						</div>
						<!-- End Skill Bar -->

						<div class="skillbar clearfix " id="fitnessData"
							data-percent="25%">
							<div class="skillbar-title"
								style="background: rgba(33, 150, 243, 0.7);">
								<span>피트니스</span>
							</div>
							<div class="skillbar-bar"
								style="background: rgba(33, 150, 243, 0.7);"></div>
							<div class="skill-bar-percent" id="fitnessPer">25%</div>
						</div>
						<!-- End Skill Bar -->

						<div class="skillbar clearfix " id="yogaData" data-percent="50%">
							<div class="skillbar-title"
								style="background: rgba(255, 152, 0, 0.7);">
								<span>요가</span>
							</div>
							<div class="skillbar-bar"
								style="background: rgba(255, 152, 0, 0.7);"></div>
							<div class="skill-bar-percent" id="yogaPer">50%</div>
						</div>
						<!-- End Skill Bar -->

						<div class="skillbar clearfix " id="pilatesData"
							data-percent="40%">
							<div class="skillbar-title"
								style="background: rgba(233, 30, 99, 0.7);">
								<span>필라테스</span>
							</div>
							<div class="skillbar-bar"
								style="background: rgba(233, 30, 99, 0.7);"></div>
							<div class="skill-bar-percent" id="pilatesPer">40%</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="chart" id="progress" data-percent="10"
							style="padding-top: 30px; padding-left: 10px;">HTML5</div>
					</div>
				</div>
			<div class="line"></div>
			<div class="row">
				<div class="col-md-12">
					<h5 style="text-align: center; padding-bottom: 10px;"
						id="chartOnePrice">이번달 회원 증감 추이</h5>
				</div>
				<div class="row">
					<div class="col-md-12">
						<canvas id="myChartThree"></canvas>
					</div>
				</div>
			</div>
			
			</div>
		</div>
	</div>




	<script type="text/javascript">
        $(document).ready(function () {

            var dataOne = new Array();
            var dataTwo = new Array();
            dataOne = chartOneStart();
            dataTwo = chartTwoStart();
            chartThreeStart();
            
            <!-- 차트 차이 계산하기  소숫점 첫째자리까지-->
            let weightPer = (dataTwo[0] / dataOne[0] * 100).toFixed(1);
            let fitnessPer = (dataTwo[1] / dataOne[1] * 100).toFixed(1);
            let yogaPer = (dataTwo[2] / dataOne[2] * 100).toFixed(1);
            let pilatesPer = (dataTwo[3] / dataOne[3] * 100).toFixed(1);
            
            <!-- 차트 차이 계산하기  없애기-->
            let weightP = (dataTwo[0] / dataOne[0] * 100).toFixed(0);
            let fitnessP = (dataTwo[1] / dataOne[1] * 100).toFixed(0);
            let yogaP = (dataTwo[2] / dataOne[2] * 100).toFixed(0);
            let pilatesP = (dataTwo[3] / dataOne[3] * 100).toFixed(0);
            
            console.log("호호호호호" + weightP+fitnessP+yogaP+pilatesP);
 
            document.getElementById('weightPer').innerHTML = weightPer+'%';
            document.getElementById('fitnessPer').innerHTML = fitnessPer+'%';
            document.getElementById('yogaPer').innerHTML = yogaPer+'%';
            document.getElementById('pilatesPer').innerHTML = pilatesPer+'%';
            
            <!-- 그래프 값넣기 -->
            if(weightP<=99){
            	document.getElementById('weightData').setAttribute('data-percent',weightP+'%');
            }else if(weightP>=100){
            	document.getElementById('weightData').setAttribute('data-percent','100%');	
            }
            
            if(fitnessP<=99){
            	document.getElementById('fitnessData').setAttribute('data-percent',fitnessP+'%');
            }else if(fitnessP>=100){
            	document.getElementById('fitnessData').setAttribute('data-percent','100%');
            }
            
            if(yogaP<=99){
            	document.getElementById('yogaData').setAttribute('data-percent',yogaP+'%');
            }else if(yogaP>=100){
            	document.getElementById('yogaData').setAttribute('data-percent','100%');	
            }
            
            if(pilatesP<=99){
            	document.getElementById('pilatesData').setAttribute('data-percent',pilatesP+'%');
            }else if(pilatesP>=100){
            	 let e4 = document.getElementById('pilatesData').setAttribute('data-percent','100%');	
            }
            
            <!-- progress 값넣기 -->
            var one = dataOne[0] + dataOne[1] +dataOne[2] +dataOne[3];
            var two = dataTwo[0] + dataTwo[1] +dataTwo[2] +dataTwo[3];
            
            var avgOneTwo = (one / two *100).toFixed(1);
            console.log("가즈아~"+avgOneTwo);
            document.getElementById('progress').setAttribute('data-percent',avgOneTwo);
            document.getElementById('progress').innerHTML = avgOneTwo+'%';

           /* 
            let e1 = document.getElementById('weightData').setAttribute('data-percent',weightPer);
            let e2 = document.getElementById('fitnessData').setAttribute('data-percent',fitnessPer);
            let e3 = document.getElementById('yogaData').setAttribute('data-percent',yogaPer);
            let e4 = document.getElementById('pilatesData').setAttribute('data-percent',pilatesPer);

 */            
            <!-- 퍼센트바 -->
        	jQuery('.skillbar').each(function(){
        		jQuery(this).find('.skillbar-bar').animate({
        			width:jQuery(this).attr('data-percent')
        		},6000);
        	});
        	
        	<!-- 실험중 -->
       	 $('.chart').easyPieChart({
       		    scaleColor: "#ecf0f1",
       		    lineWidth: 20,
       		    lineCap: 'butt',
       		    barColor: 'rgba(11,156,49,0.5)',
       		    trackColor:	"#ecf0f1",
       		    size: 160,
       		    animate: 500
       		  });
       	
        	
        });

    </script>
	<script>
	<!--강사가입 승인 modal승인 클릭 부분 -->
	function changeSt(btn){
		let id = btn.parentElement.parentElement.firstElementChild.textContent;
	
		$.ajax({
			url: "bbs1Modal",
			type: "GET",
			dataType: "json",
			data: {id:id},
			success: function(data){
				data.forEach(function(element){
					makeModalData(element);	
				})
				
			},
			error: function (){
				alert("짜쓰~"+error);
				}
		});
		
		function makeModalData(data){
			$('#exampleModalLabel').html(data.name+" 강사님");
			$('#modalBody').html(data.id);
			$('#modalBody2').html(data.phone);
			$('#modalBody3').html(data.gender);
			$('#modalBody4').html(data.birth);
			$('#modalBody5').html(data.trainerIntro);
			$('#modalBody6').html(data.career);
			$('#modalBody7').html(data.questionFirst);
			$('#modalBody8').html(data.questionSecond);
			$('#modalBody9').html(data.registerDate);
		}
	}
	

	function approveTrainer(){
		let id = document.getElementById('modalBody').innerHTML;
		let btnId = document.getElementById('btnResult1').innerHTML
		alert("id : " + id + "btnId" + btnId);
		
		$.ajax({
			url: "approveTrainer",
			type: "post",
			dataType: "json",
			data: {id:id, btnId:btnId},
			success: function(data){
				alert("승인이 완료 되었습니다.");
				window.location.href="adminMain";
			
			},
			error: function (){
				alert("실패 : "+error);
				}
		});
	}
	
	function rejectTrainer(){
		let id = document.getElementById('modalBody').innerHTML;
		let btnId = document.getElementById('btnResult2').innerHTML
		
		$.ajax({
			url: "rejectTrainer",
			type: "post",
			dataType: "json",
			data: {id:id, btnId:btnId},
			success: function(data){
				alert("승인이 거절 되었습니다.");
				window.location.href="adminMain";
			
			},
			error: function (){
				alert("실패 : "+error);
				}
		});
	}
	
	<!--클래스 승인 modal승인 클릭 부분 -->
	function changeClsModal(btn){
		let id = btn.parentElement.parentElement.firstElementChild.textContent;
		

		/* let name = document.getElementById('bbsClsName').innerText; */
		/* $('#clsModalLabel').html(name); */
		$.ajax({
			url: "bbsClsModal",
			type: "POST",
			dataType: "json",
			data: {id:id},
			success: function(data){
				data.forEach(function(element){
					console.log(element);
					makeClsModalList(element);
				})
				
			},
			error: function (){
				alert("짜쓰~"+error);
				}
		});
	}
	function makeClsModalList(data){
		$('#clsModalLabel').html(data.name+" 강사님");
		$('#modalClsBody').html(data.clsCode);
		$('#modalClsBody2').html(data.trainerId);
		$('#modalClsBody3').html(data.commonName);
		$('#modalClsBody4').html(data.clsName);
		$('#modalClsBody5').html(data.sumDate);
		/* $('#modalClsBody6').html(data.endDate); */
		$('#modalClsBody7').html(data.sumTime);
		/* $('#modalClsBody8').html(data.endTime); */
		$('#modalClsBody9').html(data.lapse);
		$('#modalClsBody10').html(data.perPrice+" 원");
		$('#modalClsBody11').html(data.clsInfo);
		$('#modalClsBody12').html(data.curriculum);
		$('#modalClsBody13').html(data.maxMem + " 명");
		$('#modalClsBody14').html(data.calorie + " cal");
	}

	function approveClsTrainer(){
		let id = document.getElementById('modalClsBody').innerHTML;
		let btnId = document.getElementById('btnClsResult1').innerHTML
		alert("id : " + id + "btnId : " + btnId);	
		
		$.ajax({
			url: "approveClsTrainer",
			type: "post",
			dataType: "json",
			data: {id:id, btnId:btnId},
			success: function(data){
				alert("승인 되었습니다.");
				window.location.href="adminMain";
			
			},
			error: function (){
				alert("실패 : ");
				}
		});
	}
	
	function rejectClsTrainer(){
		let id = document.getElementById('modalClsBody').innerHTML;
		let btnId = document.getElementById('btnClsResult2').innerHTML
		alert("id : " + id + "btnId : " + btnId);	
		
		$.ajax({
			url: "approveClsTrainer",
			type: "post",
			dataType: "json",
			data: {id:id, btnId:btnId},
			success: function(data){
				alert("승인 거부 되었습니다.");
				window.location.href="adminMain";
			
			},
			error: function (){
				alert("실패 : ");
				}
		});
	}
	
	
	
</script>
	<script>
	
	function addComma(num) {
	  var regexp = /\B(?=(\d{3})+(?!\d))/g;
	  return num.toString().replace(regexp, ',');
	}
	<!-- 메인1번차트 이번달매출 -->
	function chartOneStart(){
		var dataOne = new Array();
		
		$.ajax({
			url: "chartOne",
			type: "POST",
			async:false,
			dataType: "json",
			success: function(data){
				dataOne = getchartOneData(data)	
			},
			error: function (){
				alert("짜쓰~"+error);
				}
		});
	
		return dataOne;
	}
	
	
	function getchartOneData(data){
 		var weightPrice = 0;
		var fitnessPrice = 0;
		var yogaPrice = 0;
		var pilatesPrice = 0;

		var dateOne = new Array(); 
		data.forEach(function(element){
			switch (element.commonName){
				case '웨이트':
					weightPrice += element.originPrice;
				break;
				case '피트니스':
					fitnessPrice += element.originPrice;
				break;
				case '요가':
					yogaPrice += element.originPrice;
				break;
				case '필라테스':
					pilatesPrice += element.originPrice;
				break;
			}
		})
		
		dateOne[0] = weightPrice;
		dateOne[1] = fitnessPrice;
		dateOne[2] = yogaPrice;
		dateOne[3] = pilatesPrice;
		console.log("히이이익? : " + dateOne[0],dateOne[1] ,dateOne[2] ,dateOne[3] );
		
		crateChartOne(weightPrice,fitnessPrice,yogaPrice,pilatesPrice);
		return dateOne;
	}
		function crateChartOne(weightPrice,fitnessPrice,yogaPrice,pilatesPrice){
			console.log("weightPrice : " + weightPrice + " fitnessPrice" + fitnessPrice + " yogaPrice" + yogaPrice + " pilatesPrice" + pilatesPrice);
			
			let myChartOne = document.getElementById('myChartOne').getContext('2d');
			var sumPrice = weightPrice+fitnessPrice+yogaPrice+pilatesPrice;
			console.log(addComma(sumPrice));
			//$('#chartOnePrice').html('이달의 총 매출 : ' + sumPrice);
			document.getElementById('chartOnePrice').innerHTML = '이달의 총 매출 : ' + addComma(sumPrice)  + ' 원';
			
			let barChartOne = new Chart(myChartOne, {
				type : 'bar', //pie, line, doughnut, palarArea, bar
				data : {
					labels : ['웨이트' ,'피트니스', '요가' , '필라테스'],
					datasets : [ {
						label : '없애야징',
						data : [ weightPrice,fitnessPrice,yogaPrice,pilatesPrice ],
						backgroundColor : [ 'rgba(247,67,54,0.7)','rgba(33,150,243,0.7)' , 'rgba(255,152,0,0.7)' , 'rgba(233,30,99,0.7)' ],
						borderWidth : 3
					} ],
				},
				options: {
				/* 	title : {
						display : true,
						text : '이달의 매출 현황 : '+addComma(sumPrice) + " 원",
						fontSize : 20,
						fontColor : 'black'
					}, */
					tooltips: {
					      callbacks: {
					        label: function(tooltipItem, data) {
					          var dataLabel = data.labels[tooltipItem.index];
					          var value = ': ' + data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index].toLocaleString()+'원';

					          if (Chart.helpers.isArray(dataLabel)) {

					            dataLabel = dataLabel.slice();
					            dataLabel[0] += value;
					          } else {
					            dataLabel += value;
					          }

					          return dataLabel;
					        }
					      }
				   },
				   scales: {
		                yAxes: [{
		                    ticks: {
		                        beginAtZero:true,
		                        callback: function(value, index, values) {
		                            if(parseInt(value) >= 1000){
		                               return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+ '원';
		                            } else {
		                               return value+'원';
		                            }
		                       }                            
		                    }
		                }]
		            },
		            legend :{
		            	display: false
		            },
		            animation: {
		                duration: 8000,
		            },
			
				   }// option의 끝
			}); // 차트 메인 콜백함수
				
		}// 차트 funtion의 끝

		<!-- 메인2번차트 지난달매출 -->
		function chartTwoStart(){
			var dataTwo = new Array(); 
			
			$.ajax({
				url: "chartTwo",
				type: "POST",
				async:false,
				dataType: "json",
				success: function(data){
					dataTwo = getchartTwoData(data)	
					
				},
				error: function (){
					alert("짜쓰~"+error);
					}
			});
			return dataTwo;
		}
		
		
		function getchartTwoData(data){
			var weightPriceTwo = 0;
			var fitnessPriceTwo = 0;
			var yogaPriceTwo = 0;
			var pilatesPriceTwo = 0;
			
			var dataTwo = new Array(); 
			
			data.forEach(function(element){
				switch (element.commonName){
					case '웨이트':
						weightPriceTwo += element.originPrice;
					break;
					case '피트니스':
						fitnessPriceTwo += element.originPrice;
					break;
					case '요가':
						yogaPriceTwo += element.originPrice;
					break;
					case '필라테스':
						pilatesPriceTwo += element.originPrice;
					break;
				}
			})
				dataTwo[0] = weightPriceTwo;
				dataTwo[1] = fitnessPriceTwo;
				dataTwo[2] = yogaPriceTwo;
				dataTwo[3] = pilatesPriceTwo;
			
			crateChartTwo(weightPriceTwo,fitnessPriceTwo,yogaPriceTwo,pilatesPriceTwo);
			
			return dataTwo;
		}
			function crateChartTwo(weightPriceTwo,fitnessPriceTwo,yogaPriceTwo,pilatesPriceTwo){				
				let myChartTwo = document.getElementById('myChartTwo').getContext('2d');
				var sumPriceTwo = weightPriceTwo+fitnessPriceTwo+yogaPriceTwo+pilatesPriceTwo;
				console.log(addComma(sumPriceTwo));
				document.getElementById('chartTwoPrice').innerHTML = '지난달 총 매출 : ' + addComma(sumPriceTwo)  + ' 원';
				
				let barChartTwo = new Chart(myChartTwo, {
					type : 'bar', //pie, line, doughnut, palarArea, bar
					data : {
						labels : ['웨이트' ,'피트니스', '요가' , '필라테스'],
						datasets : [ {
							label : '없애야징',
							data : [ weightPriceTwo,fitnessPriceTwo,yogaPriceTwo,pilatesPriceTwo ],
							backgroundColor : [ 'rgba(247,67,54,0.7)','rgba(33,150,243,0.7)' , 'rgba(255,152,0,0.7)' , 'rgba(233,30,99,0.7)' ],
							borderWidth : 3
						} ],
					},
					options: {
						tooltips: {
						      callbacks: {
						        label: function(tooltipItem, data) {
						          var dataLabel = data.labels[tooltipItem.index];
						          var value = ': ' + data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index].toLocaleString()+'원';

						          if (Chart.helpers.isArray(dataLabel)) {

						            dataLabel = dataLabel.slice();
						            dataLabel[0] += value;
						          } else {
						            dataLabel += value;
						          }

						          return dataLabel;
						        }
						      }
					   },
					   scales: {
			                yAxes: [{
			                    ticks: {
			                        beginAtZero:true,
			                        callback: function(value, index, values) {
			                            if(parseInt(value) >= 1000){
			                               return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+ '원';
			                            } else {
			                               return value+'원';
			                            }
			                       }                            
			                    }
			                }]
			            },
			            legend :{
			            	display: false
			            },
			            animation: {
			                duration: 8000,
			            },
				
					   }// option의 끝
				}); // 차트 메인 콜백함수
					
			}// 차트 funtion의 끝
			
			<!-- 메인3번차트 지난달매출 -->
			function chartThreeStart(){
				var dataThree = new Array(); 
				
				$.ajax({
					url: "chartThree",
					type: "POST",
					dataType: "json",
					success: function(data){
						crateChartThree(data)	
						console.log("오냐고고고고ㅗㄱ"+data['15']);
					},
					error: function (){
						alert("짜쓰~"+error);
						}
				});
			}
			
		<!-- 	
			function getchartThreeData(data){
			
		
				crateChartThree();
				
			
			}
		-->
				function crateChartThree(data){				
					let myChartThree = document.getElementById('myChartThree').getContext('2d');
					
					let lineChartThree = new Chart(myChartThree, {
						type : 'line', //pie, line, doughnut, palarArea, bar
						data : {
							labels : ['1일' ,'2일', '3일' , '4일','5일','6일','7일','8일','9일','10일','11일','12일','13일','14일','15일','16일','17일','18일','19일','20일','21일','22일','23일','24일','25일','26일','27일','28일','29일','30일','31일'],
							datasets : [ {
								label : '일반회원',
								data : [data['01'],data['02'],data['03'],data['04'],data['05'],data['06'],data['07'],data['08'],data['09'],data['10'],data['11'],data['12'],data['13'],data['14'],data['15'],data['16'],data['17'],data['18'],data['19'], data['20'],data['21'],data['22'],data['23'],data['25'],data['26'],data['27'],data['28'],data['29'],data['30'],data['31']],
					            borderColor: 'rgba(247,67,54,0.7)',
					            pointRadius:4,
					            pointHoverRadius:8,
					            pointHoverBackgroundColor:'rgba(247,67,54,0.8)',
					            fill:false
							},{
									label : '트레이너',
									data : [data['-01'],data['-02'],data['-03'],data['-04'],data['-05'],data['-06'],data['-07'],data['-08'],data['-09'],data['-10'],data['-11'],data['-12'],data['-13'],data['-14'],data['-15'],data['-16'],data['-17'],data['-18'],data['-19'], data['-20'],data['-21'],data['-22'],data['-23'],data['-25'],data['-26'],data['-27'],data['-28'],data['-29'],data['-30'],data['-31']],
						            borderColor: "rgba(33,150,243,0.7)",
						            pointRadius:4,
						            pointHoverRadius:8,
						            pointHoverBackgroundColor:'rgba(33,150,243,0.8)',
						            fill:false
						      }
					],
						},
						options: {
							tooltips: {
							      callbacks: {
							        label: function(tooltipItem, data) {
							          var dataLabel = data.labels[tooltipItem.index];
							          var value = ': ' + data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index].toLocaleString()+'명';

							          if (Chart.helpers.isArray(dataLabel)) {

							            dataLabel = dataLabel.slice();
							            dataLabel[0] += value;
							          } else {
							            dataLabel += value;
							          }

							          return dataLabel;
							        }
							      }
						   },
						   scales: {
							   yAxes: [{
				                    ticks: {
				                        beginAtZero:true,
				                        callback: function(value, index, values) {
				                            if(parseInt(value) >= 1000){
				                               return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")+ '명';
				                            } else {
				                               return value+'명';
				                            }
				                       }                            
				                    }
				                }]
				            },
				            /* legend :{
				            	display: false
				            }, */
				            animation: {
				                duration: 8000,
				            },
					
						   }// option의 끝
					}); // 차트 메인 콜백함수
						
				}// 차트 funtion의 끝
</script>


	<!-- 강사가입승인 modal창 설정  -->
	<div class="modal fade" id="exampleModal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">님</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<%@ include file="listModalRM.jsp"%>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btnResult1"
						onclick="approveTrainer();">승인완료</button>
					<button type="button" class="btn btn-secondary" id="btnResult2"
						onclick="rejectTrainer();">승인거부</button>

				</div>
			</div>
		</div>
	</div>
	<!-- 클래스승인 modal창 설정  -->
	<div class="modal fade" id="exampleModal2" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="clsModalLabel"></h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<%@ include file="listModalCLS.jsp"%>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btnClsResult1"
						onclick="approveClsTrainer();">승인완료</button>
					<button type="button" class="btn btn-secondary" id="btnClsResult2"
						onclick="rejectClsTrainer();">승인거부</button>

				</div>
			</div>
		</div>
	</div>
	<!-- modal창 설정 끝 -->

</body>
</html>
