<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../resources/product/css/productPayFin.css" />
</head>
<body>
	<!-- nav -->
	<jsp:include page="../nav.jsp"></jsp:include>
	
	<div class="pay-container">
		<div class="contents">
			<span class="icon"><i class="far fa-check-circle fa-4x"></i></span>
			<p class="title">결제가 완료되었습니다</p>
			<p class="fit">FITIN.ZIP</p>
			<a class="a-btn" href="/productHistory">주문조회</a>
		</div>
	</div>
	
	<!-- Footer -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>