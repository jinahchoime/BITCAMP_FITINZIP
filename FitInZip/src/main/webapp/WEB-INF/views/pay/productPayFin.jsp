<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료</title>
<style>
.title {
	text-align: center;
	vertical-align: middle;
}
.contents {
	vertical-align: middle;
	text-align: center;
	padding-top: 20px;
}
.pay-container {
	border: 1px solid #111;
	width: 500px;
	margin-left: 400px;
	margin-top: 150px;
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
		<h4 class="title" >결제가 완료되었습니다</h4>
		
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