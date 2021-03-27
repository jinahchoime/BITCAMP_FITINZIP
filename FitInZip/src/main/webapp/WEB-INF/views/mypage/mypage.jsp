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
			<div id="viewArea" class="column_right mt200" style="border-radius: 10px; border: 2px solid #ddd; height: 650px; 
    			">
				<h2 style="margin: 90px 0 20px 89px;">달성내역</h2>
				<div class="wrap">
					<span class="awsome">
						<i class="fas fa-running fa-3x"></i>
					</span>
					<span class="clsTitle">신청한 클래스</span>
					<span class="clsCount">0회</span>
				</div>
				<div class="wrap">
					<span class="awsome" style="color:pink">
						<i class="fas fa-heartbeat fa-3x"></i>
					</span>
					<span class="clsTitle">참여성공률</span>
					<span class="clsCount">0회</span>
				</div>
				<div class="wrap">
					<span class="awsome" style="color:green">
						<i class="fas fa-stopwatch fa-3x"></i>
					</span>
					<span class="clsTitle">운동시간</span>
					<span class="clsCount">0회</span>
				</div>
				<div class="wrap">
					<span class="awsome" style="color:red">
						<i class="fas fa-fire-alt fa-3x"></i>
					</span>
					<span class="clsTitle">소모칼로리</span>
					<span class="clsCount">0회</span>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Footer -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>