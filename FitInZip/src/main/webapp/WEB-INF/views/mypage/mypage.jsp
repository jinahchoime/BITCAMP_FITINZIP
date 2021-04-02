<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="../resources/mypage/css/mypage.css" rel="stylesheet"></link>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script type="text/javascript">
	
	$(function(){
		
		$.ajax("/userExerciseData",{
			type: "get",
			dataType : "json",
			success : function(returnValue){
				var clsCount = returnValue[0].clscount;
				var checkinCount = returnValue[0].checkinCount;
				let clsParticipation = 0;
				let clsCalorie = 0;
				let time = 0;
				
				let year = new Date().getFullYear();
				let month = new Date().getMonth();
				let date = new 	Date().getDate();
				
				for(let i=0; i<returnValue.length; i++){
					let start = returnValue[i].startTime;
					
					let starthour = new Date(start).getHours();
					let startminute = new Date(start).getMinutes();
					
					let end = returnValue[i].endTime;
					
					let endhour = new Date(end).getHours();
					let endminute = new Date(end).getMinutes();
					
					let lapse = returnValue[i].lapse;
					let calorie = returnValue[i].calorie;
					
					let startTime = new Date(year, month, date, starthour, startminute);
					let endTime = new Date(year, month, date, endhour, endminute);
					
					let compareTime = endTime - startTime;
					
					time += compareTime;
					clsParticipation += lapse;
					clsCalorie += calorie;
				}
				
				var real = (checkinCount / (clsCount * clsParticipation)) * 100;
				var realCalorie = (checkinCount * clsCalorie)
				
				$('#clsCount').text(clsCount + "회");
				$('#clsParticipation').text(parseInt(real) + "%");
				$('#clsTime').text(new Date(time).getHours() + "시간"); //이거 한번 확인하기
				$('#clsCalorie').text(realCalorie + "kcal");
			},
			error : function(){
				alert("실패!");
			}
		})
	})
</script>
<style type="text/css">
	.wrap{margin: 80px; height: 20px;}
	.awsome{color:orange; margin-right: 50px; float: left; margin-left: 20px;}
	.clsTitle{font-size: 20px; float: left;}
	.clsCount{font-size: 20px; float: right; margin-right: 50px;}
</style>
</head>
<body>
	<!-- Navigation -->
    <jsp:include page="../nav.jsp"></jsp:include>
    
    <!-- Content  -->
    <div style="height: 1000px; margin: 0 auto; width: 1200px">
    	<!-- 마이페이지 메뉴  -->
		<jsp:include page="mypageMenu.jsp"></jsp:include>
		
		<div style="padding-top: 24px;">
			<div id="viewArea" class="column_right mt200" style="border-radius: 5px; border: 2px solid #ddd; height: 650px; 
    			">
				<h2 style="margin: 90px 0 20px 89px;">달성내역</h2>
				<div class="wrap">
					<span class="awsome">
						<i class="fas fa-running fa-3x"></i>
					</span>
					<span class="clsTitle">신청한 클래스</span>
					<span class="clsCount" id="clsCount">0회</span>
				</div>
				<div class="wrap">
					<span class="awsome" style="color:pink">
						<i class="fas fa-heartbeat fa-3x"></i>
					</span>
					<span class="clsTitle">참여성공률</span>
					<span class="clsCount" id="clsParticipation">0%</span>
				</div>
				<div class="wrap">
					<span class="awsome" style="color:green">
						<i class="fas fa-stopwatch fa-3x"></i>
					</span>
					<span class="clsTitle">운동시간</span>
					<span class="clsCount" id="clsTime">0시간</span>
				</div>
				<div class="wrap">
					<span class="awsome" style="color:red">
						<i class="fas fa-fire-alt fa-3x"></i>
					</span>
					<span class="clsTitle">소모칼로리</span>
					<span class="clsCount" id="clsCalorie">0kcal</span>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Footer -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>