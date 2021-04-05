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
	color: #fff;
	text-transform: uppercase;
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
						<h3 style="text-align: center; padding-bottom: 10px;"
							id="chartOnePrice">이달의 매출 현황</h3>
					</div>
					<div class="col-md-6">
						<h3 style="text-align: center; padding-bottom: 10px;"
							id="chartTwoPrice">지난달 매출 현황</h3>
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
				<div class="row" style="padding-top:50px;">
					<div class="col-md-9">
						<div class="skillbar clearfix " data-percent="100%">
							<div class="skillbar-title" style="background: #d35400;">
								<span>웨이트</span>
							</div>
							<div class="skillbar-bar" style="background: #e67e22;"></div>
							<div class="skill-bar-percent">120%</div>
						</div>
						<!-- End Skill Bar -->

						<div class="skillbar clearfix " data-percent="25%">
							<div class="skillbar-title" style="background: #2980b9;">
								<span>피트니스</span>
							</div>
							<div class="skillbar-bar" style="background: #3498db;"></div>
							<div class="skill-bar-percent">25%</div>
						</div>
						<!-- End Skill Bar -->

						<div class="skillbar clearfix " data-percent="50%">
							<div class="skillbar-title" style="background: #2c3e50;">
								<span>요가</span>
							</div>
							<div class="skillbar-bar" style="background: #2c3e50;"></div>
							<div class="skill-bar-percent" id ="yogaPer">50%</div>
						</div>
						<!-- End Skill Bar -->

						<div class="skillbar clearfix " data-percent="40%">
							<div class="skillbar-title" style="background: #46465e;">
								<span>필라테스</span>
							</div>
							<div class="skillbar-bar" style="background: #5a68a5;"></div>
							<div class="skill-bar-percent">40%</div>
						</div>
					</div>
				</div>
			</div>
					<div class="col-md-3"></div>

			<div class="line"></div>

			<h3>Lorem Ipsum Dolor</h3>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
				do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
				enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
				ut aliquip ex ea commodo consequat. Duis aute irure dolor in
				reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
				pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
				culpa qui officia deserunt mollit anim id est laborum.</p>

		</div>
	</div>




	<script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
                $(this).toggleClass('active');
            });
            chartOneStart();
            chartTwoStart();
           /*  initChart().then(function () {
            	console.log("yogaPrice : " + yogaPrice);
                console.log("yogaPrice2 : " + yogaPriceTwo);
                console.log("yogaPriceSum : " + (yogaPrice + yogaPriceTwo));            	
            }); */
            
            <!-- 퍼센트바 -->
        	jQuery('.skillbar').each(function(){
        		jQuery(this).find('.skillbar-bar').animate({
        			width:jQuery(this).attr('data-percent')
        		},6000);
        	});
        });
        
     /*    async function initChart() {
        	await chartOneStart();
            await chartTwoStart();
        } */
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
/* 	var weightPrice = 0;
	var fitnessPrice = 0;
	var yogaPrice = 0;
	var pilatesPrice = 0; */
	
	var weightPriceTwo = 0;
	var fitnessPriceTwo = 0;
	var yogaPriceTwo = 0;
	var pilatesPriceTwo = 0;

	/* console.log("오냐 : " + weightPrice + " fitnessPrice" + fitnessPrice + " yogaPrice" + yogaPrice + " pilatesPrice" + pilatesPrice); */
	
	/* yogaPercent = (yogaPriceTwo/yogaPrice*100).toFixed(1); */
	/* document.getElementById('yogaPer').innerHTML=(yogaPriceTwo/yogaPrice*100).toFixed(1) +'%'; */
	
	function addComma(num) {
	  var regexp = /\B(?=(\d{3})+(?!\d))/g;
	  return num.toString().replace(regexp, ',');
	}
	<!-- 메인1번차트 이번달매출 -->
	function chartOneStart(){
		var chartOne 
		
		$.ajax({
			url: "chartOne",
			type: "POST",
			async:false,
			dataType: "json",
			success: function(data){
				getchartOneData(data)	
			},
			error: function (){
				alert("짜쓰~"+error);
				}
		});
		
	}
	
	
	function getchartOneData(data){
 		var weightPrice = 0;
		var fitnessPrice = 0;
		var yogaPrice = 0;
		var pilatesPrice = 0;

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
		
		crateChartOne(weightPrice,fitnessPrice,yogaPrice,pilatesPrice);
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
		            }
			
				   }// option의 끝
			}); // 차트 메인 콜백함수
				
		}// 차트 funtion의 끝

		<!-- 메인2번차트 지난달매출 -->
		function chartTwoStart(){
			
			$.ajax({
				url: "chartTwo",
				type: "POST",
				async:false,
				dataType: "json",
				success: function(data){
					getchartTwoData(data)	
					
				},
				error: function (){
					alert("짜쓰~"+error);
					}
			});
			
		}
		
		
		function getchartTwoData(data){
	/* 		var weightPriceTwo = 0;
			var fitnessPriceTwo = 0;
			var yogaPriceTwo = 0;
			var pilatesPriceTwo = 0; */
			
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
			
			crateChartTwo(weightPriceTwo,fitnessPriceTwo,yogaPriceTwo,pilatesPriceTwo);
		}
			function crateChartTwo(weightPriceTwo,fitnessPriceTwo,yogaPriceTwo,pilatesPriceTwo){
				console.log("cartTwo weightPriceTwo : " + weightPriceTwo + " fitnessPriceTwo" + fitnessPriceTwo + " yogaPriceTwo" + yogaPriceTwo + " pilatesPriceTwo" + pilatesPriceTwo);
				
				let myChartTwo = document.getElementById('myChartTwo').getContext('2d');
				var sumPriceTwo = weightPriceTwo+fitnessPriceTwo+yogaPriceTwo+pilatesPriceTwo;
				console.log(addComma(sumPriceTwo));
				//$('#chartOnePrice').html('이달의 총 매출 : ' + sumPrice);
				document.getElementById('chartTwoPrice').innerHTML = '저번달 총 매출 : ' + addComma(sumPriceTwo)  + ' 원';
				
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
			            }
				
					   }// option의 끝
				}); // 차트 메인 콜백함수
					
			}// 차트 funtion의 끝
/* 	function per(){
		document.getElementById('yogaPer').innerHTML=(yogaPriceTwo/yogaPrice*100).toFixed(1) +'%';
	} */
	

		
	console.log("weightPriceTwo1"+ weightPriceTwo + fitnessPriceTwo +  yogaPriceTwo+ pilatesPriceTwo);
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
