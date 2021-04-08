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
					<p style="font-size:14px;">주문번호: ${sessionOrderNum }</p>
					<c:forEach var="orderDetail" items="${orderDetail }">
						<div class="forEach">
							<p><img class="product-img" style="width:120px; height:120px;" src="${orderDetail.proImg }"></p>
							<div class="pro-content float-left">
								<p class="padding-left">상품번호 :  ${orderDetail.proNum }</p>
								<p class="padding-left">${orderDetail.proName }</p>
								<p class="padding-left">수량 : ${orderDetail.amount } 개</p>
							</div>
							<div class="float-right">
								<p class="padding-left">${orderDetail.proPrice } 원</p>
							</div>
						</div>
					</c:forEach>
				</div>
				
			</div>

			
			<div class="deli-container">
				<p class="big-title deli-tit">배송지 정보</p>
				<div class="bobo">
					<span>받으시는 분</span><span class="right"> ${deli.name }</span>
				</div>
				<div class="bobo">
					<span>배송지</span><span class="right">${deli.address }, ${deli.detailAddress }</span>
				</div>
				<div class="bobo">
					<span>휴대전화</span><span class="right"> ${deli.phone }</span>
				</div>
				<div class="bobo">
					<span> ${deli.directMsg }</span> 
				</div>
				
				
				
				
			</div>
			
		</div>
	</div>
	  
	 <!-- Footer -->
    <jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>