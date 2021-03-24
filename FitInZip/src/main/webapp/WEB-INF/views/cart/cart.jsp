<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<link rel="stylesheet" type="text/css" href="../resources/cart/css/cart.css"/>
</head>
<body>
	<jsp:include page="../nav.jsp"></jsp:include>
	
	<article class="contents margin-xsmall">
		<h2 class="cart-title">장바구니</h2>
		<div class="mc-cart-num">
			<span>~개 상품</span>
		</div>
		<div class="item-container">
			<div class="item-list-wrap" id="cart">
				<div class="product-select-all">
					<a class="btn-cart-delete-All" href=#>전체삭제</a>
				</div>
				<div class="product-opt_cart">
					<input type="hidden" name="proName">
					<input type="hidden" name="mem_id">
					<input type="hidden" name="amount">
				
					<div class="item-detail">
						<div class="item-info">
							<span class="img-wrap">
							<img src=".." alt="상품이미지">
							</span>
							<div class="info-wrap">
								<a class="tit">상품명</a>
								<span class="opt quantity">수량 : 몇 개냐</span>
							</div>
						</div>
						<div class="option-wrap">
							<div>
								<button href=# class="optchange-btn btn-link sky-blue width-max">수량 변경</button>
							</div>
						</div>
						<div class="total-price">
							<strong class="retail-price">가격 몇 원</strong>
						</div>
						<div class="delete-btn">
							<a class="btn-delete" href=#><img style= "width:15px; height:15px" src="../resources/delete-icon.png"></a>
						</div>
					</div>
				</div>	
			</div>
			
			<div class="product-checkout">
				<strong class="tit">주문예정금액</strong>
				<div class="info-price">
					<span class="item-price">
						<span class="label">상품 금액</span>
						<span class="price"><strong>얼마다 몇원</strong></span>
					</span>
					<span class="delivery-price">
						<span class="label">예상 배송비</span>
						<span class="price"><strong>0원</strong></span>
					</span>
				</div>
				<div class="total-price">
					<span class="label">총 결제 예정 금액</span>
					<span class="price sale total"><strong>총 결제 몇 원</strong></span>
				</div>
				<a class="btn-link xlarge width-max btn-order indian-red" href=#>주문하기</a>
			</div>
			
		</div>
		
	</article>
	
	<!-- Footer -->
  	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>