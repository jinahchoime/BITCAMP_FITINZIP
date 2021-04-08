<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문서</title>
<link href="../resources/mypage/css/mypage.css" rel="stylesheet"></link>
<link rel="stylesheet" type="text/css" href="../resources/product/css/productOrderDetail.css" />
</head>
<body>
	 <!-- Navigation -->
    <jsp:include page="../nav.jsp"></jsp:include>
    
    <!-- Content  -->
    <div style="min-height: 858px; margin: 0 auto; width: 1200px">
    	<!-- 마이페이지 메뉴  -->
		<jsp:include page="../mypage/mypageMenu.jsp"></jsp:include>
		
		<div>
			<div class="od-container">
				<p class="big-title">상품 정보</p>
					<c:forEach var="orderDetail" items="${orderDetail }">
						<p>주문번호: ${orderDetail.orderNum }</p>
						<p><img style="width:120px; height:120px;" src="${orderDetail.proImg }"></p>
						<p>상품번호 :  ${orderDetail.proNum }</p>
						<p>상품명 : ${orderDetail.proName }</p>
						<p>상품가격 : ${orderDetail.proPrice }</p>
						<p>수량 : ${orderDetail.amount }</p>
					</c:forEach>
			</div>
			<div class="de-container">
				<p class="big-title">배송지 정보</p>
				<p>받는 사람 : ${deli.name }</p>
				<p>휴대전화 : ${deli.phone }</p>
				<p>배송지 : ${deli.address }, ${deli.detailAddress }</p>
				<p>배송메시지 : ${deli.directMsg }</p> 
			</div>
		</div>
	</div>
	  
	 <!-- Footer -->
    <jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>