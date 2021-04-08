<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style>
* {
	font-family: 'Noto Sans KR', sans-serif !important;
}

.big-title {
	font-size: 24px;
}
.title {
	text-align: center;
	vertical-align: middle;
	font-size: 18px;
	font-weight: 500;
	padding-top: 20px;
}

.contents {
	vertical-align: middle;
	text-align: center;
	font-weight: 500;
}
.pay-container {
	/*border: 1px solid #111; */ 
	width: 800px;
	margin-left: 480px;
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
		<p class="big-title">주문완료<p/>
		<p class="title" >결제가 완료되었습니다</p>
		
		<div class="contents">
			<p>- 구매처: FITINZIP</p>
			<p>- 결제금액: <%= session.getAttribute("totalPrice") %> 원 </p>
			<a class="a-btn" href="/productHistory">주문조회</a>
		</div>
	</div>
	<div style="height:200px;"></div>
	<!-- Footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>