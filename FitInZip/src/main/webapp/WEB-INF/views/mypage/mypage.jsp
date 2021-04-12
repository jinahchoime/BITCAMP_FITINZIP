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
				console.log(returnValue);
				var clsCount = returnValue[0].clscount;
				var clsParticipation = (returnValue[0].checkinCount / (returnValue[0].clscount * returnValue[0].lapseCount)) * 100;
				var clsTime = returnValue[0].timeCount;
				var clsCalorie = returnValue[0].calorieCount;
				
				console.log(clsTime);
				
				if(clsCount != null){
					$('#clsCount').text(clsCount + "회");
				}else{
					$('#clsCount').text(0 + "회");
				}
				
				if(clsParticipation != null){
					$('#clsParticipation').text(parseInt(clsParticipation)+"%");
				}else if($.isNumeric()){
					$('#clsParticipation').text(0+"%");
				}
				}else{
					$('#clsParticipation').text(0+"%");
				}
				
				if(clsTime != null){
					$('#clsTime').text(clsTime + "시간"); //이거 한번 확인하기
				}else{
					$('#clsTime').text(0 + "시간");
				}
				if(clsCalorie != null){
					$('#clsCalorie').text(clsCalorie + "kcal");
				}else{
					$('#clsCalorie').text(0 + "kcal");
				}
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
						<i class="fas fa-walking fa-3x"></i>
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
						<i class="fas fa-burn fa-3x"></i>
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