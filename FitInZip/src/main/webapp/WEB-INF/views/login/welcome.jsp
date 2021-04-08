<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/login/css/welcome.css">
</head>
<body>
	<jsp:include page="../nav.jsp"></jsp:include>
	<div id="container">
		<div class="contents clearfix" id="contents">
		
			<section class="welcome_wrap">
				<div class="page_title">
	                <h2>환영합니다</h2>
					<p>${member.name}님, 피트인짐 회원가입을 축하합니다<br>수강시 사용 가능한 할인쿠폰을 지급해드렸습니다!</p>
	            </div>
	            <div>
	            	<img class="coupon" src="/resources/login/img/coupon.png">
	            </div>
				<div>
					<a class="main_btn" href="/">메인페이지로 이동</a>
				</div>
				
			</section>
		</div>
	</div>
	<!-- Footer -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>