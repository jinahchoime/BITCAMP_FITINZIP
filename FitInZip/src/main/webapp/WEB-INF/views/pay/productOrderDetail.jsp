<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문서</title>
<link href="../resources/mypage/css/mypage.css" rel="stylesheet"></link>
<link href="../resources/product/css/productOrderDetail.css" rel="stylesheet"></link>
</head>
<body>
	 <!-- Navigation -->
    <jsp:include page="../nav.jsp"></jsp:include>
    
    <!-- Content  -->
    <div style="min-height: 858px; margin: 0 auto; width: 1200px">
    	<!-- 마이페이지 메뉴  -->
		<jsp:include page="../mypage/mypageMenu.jsp"></jsp:include>
		
		<div style="display:inline-block;" class="mt200 ml30">
			<p class="tit_area big mb10">주문상세</p>
			
			<div class="item-info">
				<div class="table_basic_board board1 info-wrap">
				<p class="big-title pro-tit">상품 정보</p>
					<p>주문번호: ${sessionOrderNum }</p>
					<c:forEach var="orderDetail" items="${orderDetail }">
						<div class="forEach">
							<p><img class="product-img" style="width:120px; height:120px;" src="${orderDetail.proImg }"></p>
							<div class="pro-content">
								<p class="padding-left">상품번호 :  ${orderDetail.proNum }</p>
								<p class="padding-left">상품명 : ${orderDetail.proName }</p>
								<p class="product-price">상품가격 : ${orderDetail.proPrice } 원</p>
								<p class="padding-left">수량 : ${orderDetail.amount } 개</p>
							</div>
						</div>
					</c:forEach>
				</div>
				
			</div>

			
			<div class="de-container">
				<p class="big-title deli-tit">배송지 정보</p>
				<div class="bobo">
					<span>받는 사람 </span> <span class="right"> ${deli.name }</span>
				</div>
				<div class="bobo">
					<p>휴대전화 : ${deli.phone }</p>
				</div>
				<div class="bobo">
					<p>배송지 : ${deli.address }, ${deli.detailAddress }</p>
				</div>
				<div class="bobo">
					<p>배송메시지 : ${deli.directMsg }</p> 
				</div>
				
				
				
				
			</div>
			
		</div>
	</div>
	  
	 <!-- Footer -->
    <jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>