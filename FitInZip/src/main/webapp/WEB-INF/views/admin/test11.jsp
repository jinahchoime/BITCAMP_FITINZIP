<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">

<style>
</style>
</head>
<script>
	
</script>

<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<canvas id="myChartOne"></canvas>
			</div>
			<div class="col-md-4">
				<canvas id="myChartTwo"></canvas>
			</div>
			<div class="col-md-4">
				<canvas id="myChartThree"></canvas>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<canvas id="myChartFour"></canvas>
			</div>
			<div class="col-md-4">
				<canvas id="myChartFive"></canvas>
			</div>
			<div class="col-md-4">
				<canvas id="myChartSix"></canvas>
			</div>
		</div>
	</div>
		<div class="container">
		<div class="row">
			<div class="col-md-4">
				<canvas id="myChartSeven"></canvas>
			</div>
			<div class="col-md-4">
				<canvas id="myChartEight"></canvas>
			</div>
			<div class="col-md-4">
				<canvas id="myChartNine"></canvas>
			</div>
		</div>
	</div>
	
	<script>
		let myChartOne = document.getElementById('myChartOne').getContext('2d');

		let barChart = new Chart(myChartOne, {
			type : 'bar', //pie, line, doughnut, palarArea
			data : {
				labels : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
						'9월', '10월', '11월', '12월' ],
				datasets : [ {
					label : '2020년',
					data : [ 11, 20, 23, 15, 18, 24, 29, 40, 20, 12, 35, 12 ]
				} ]
			}
		})

		let myChartTwo = document.getElementById('myChartTwo').getContext('2d');

		let barChartTwo = new Chart(myChartTwo, {
			type : 'bar', //pie, line, doughnut, palarArea
			data : {
				labels : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
						'9월', '10월', '11월', '12월' ],
				datasets : [ {
					label : '2020년',
					data : [ 110, 200, 222, 150, 231, 126, 329, 67, 56, 126,
							354, 122 ],
					backgroundColor : [ 'red', 'rgba(255,255,0,0.5)',
							'#990000', 'blue', 'skyblue', 'red', 'red', 'red',
							'red', 'red', 'red', 'red', ]
				} ]

			}
		})
		
		let myChartThree = document.getElementById('myChartThree').getContext('2d');
		
		let barChartThree = new Chart(myChartThree, {
			type : 'bar', //pie, line, doughnut, palarArea
			data : {
				labels : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
						'9월', '10월', '11월', '12월' ],
				datasets : [ {
					label : '2020년',
					data : [ 110, 200, 222, 150, 231, 126, 329, 67, 56, 126,
							354, 122 ],
					backgroundColor : [ 'red', 'rgba(255,255,0,0.5)',
							'#990000', 'blue', 'skyblue', 'red', 'red', 'red',
							'red', 'red', 'red', 'red', ],
					borderWidth : 5,
					borderColor : '#000',
					hoverBorderWidth : 8,
				
				} ]

			}
		})
		
		let myChartFour = document.getElementById('myChartFour').getContext('2d');
		
		let barChartFour = new Chart(myChartFour, {
			type : 'bar', //pie, line, doughnut, palarArea
			data : {
				labels : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
						'9월', '10월', '11월', '12월' ],
				datasets : [ {
					label : '2020년',
					data : [ 110, 200, 222, 150, 231, 126, 329, 67, 56, 126,
							354, 122 ],
					backgroundColor : [ 'red', 'rgba(255,255,0,0.5)',
							'#990000', 'blue', 'skyblue', 'red', 'red', 'red',
							'red', 'red', 'red', 'red', ],
					borderWidth : 5,
					borderColor : '#000',
					hoverBorderWidth : 8,
				} ]
			},
			options : {
				title : {
					display : true,
					text : '2020년 매출',
					fontSize : 20,
					fontColor : 'blue'
				}
			}
		})
		
	let myChartFive = document.getElementById('myChartFive').getContext('2d');
		
		let barChartFive = new Chart(myChartFive, {
			type : 'bar', //pie, line, doughnut, palarArea
			data : {
				labels : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
						'9월', '10월', '11월', '12월' ],
				datasets : [ {
					label : '2020년',
					data : [ 110, 200, 222, 150, 231, 126, 329, 67, 56, 126,
							354, 122 ],
					backgroundColor : [ 'red', 'rgba(255,255,0,0.5)',
							'#990000', 'blue', 'skyblue', 'red', 'red', 'red',
							'red', 'red', 'red', 'red', ],
					borderWidth : 5,
					borderColor : '#000',
					hoverBorderWidth : 8,
				} ]
			},
			options : {
				title : {
					display : true,
					text : '2020년 매출',
					fontSize : 20,
					fontColor : 'blue'
				},
				legend :{
					display : true, // true 는 2020년보임 , false 는 안보임
					position: 'right' // rihgt,left,top,bottom
				}
			}
		})
		
	let myChartSix = document.getElementById('myChartSix').getContext('2d');
		
		let barChartSix = new Chart(myChartSix, {
			type : 'bar', //pie, line, doughnut, palarArea
			data : {
				labels : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
						'9월', '10월', '11월', '12월' ],
				datasets : [ {
					label : '2020년',
					data : [ 110, 200, 222, 150, 231, 126, 329, 67, 56, 126,
							354, 122 ],
					backgroundColor : [ 'red', 'rgba(255,255,0,0.5)',
							'#990000', 'blue', 'skyblue', 'red', 'red', 'red',
							'red', 'red', 'red', 'red', ],
					borderWidth : 5,
					borderColor : '#000',
					hoverBorderWidth : 8,
				} ]
			},
			options : {
				title : {
					display : true,
					text : '2020년 매출',
					fontSize : 20,
					fontColor : 'blue'
				},
				legend :{
					display : false,
					position: 'right' // rihgt,left,top,bottom
				},
				layout :{
					padding : {
						left : 10,
						rihgt : 10,
						top : 20,
						bottom : 0
					}
				}
			}
		})
	</script>
</body>
</html>