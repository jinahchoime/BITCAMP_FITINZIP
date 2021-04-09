<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style>
* {
	font-family: 'Noto Sans KR', sans-serif !important;
}
.title {
	text-align: center;
	vertical-align: middle;
	padding-top: 20px;
	font-size: 24px;
	font-weight: 500;
}
.contents {
	vertical-align: middle;
	text-align: center;
	padding-top: 40px;
	padding-bottom: 20px;
	font-weight: 500;
}
.pay-container {
	/*border: 1px solid #111; */ 
	width: 500px;
	margin-left: 700px;
	margin-top: 150px;
	border-top: 1px solid #dedfda;
	box-sizing: border-box;
}
.a-btn {
	color: #111;
	text-decoration: underline;
}
.a-btn:active {
	color: gray;
}
.a-btn:hover {
	color: gray;
}
</style>
</head>
<body>
	<jsp:include page="../nav.jsp"></jsp:include>
	
	<div class="pay-container">
		<p class="title" >결제가 완료되었습니다</p><i class="fas fa-dumbbell"></i>
		
		<div class="contents">
			<p>- 구매처: FITINZIP</p>
			<p>- 결제금액: ${detail.totalPrice }원 </p>
			<a class="a-btn" href="/clsHistory">주문조회</a>
		</div>
	</div>
	<div style="height:200px;"></div>
	<!-- Footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>