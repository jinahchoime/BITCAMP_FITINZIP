<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FITINZIP | 장바구니</title>
<link rel="stylesheet" type="text/css" href="../resources/cart/css/cart.css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
 <script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>


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
					<a style="color: #000000;" class="btn-cart-delete-All" href=#>전체삭제</a>
				</div>
		<c:forEach var="cartList" items="${cartList }">
		<form action="/deleteCart" method="get">
				<div class="product-opt_cart">
					<!-- <input type="hidden" name="proName">
					<input type="hidden" name="mem_id">
					<input type="hidden" name="amount"> -->
					<input type="hidden" name="proNum" value="${cartList.proNum }">
					<div class="item-detail">
						<div class="item-info">
							<span class="img-wrap">
							<img style="width:110px; height:110px;" src="${cartList.proImg }" alt="상품이미지">
							</span>
							<div class="info-wrap">
								<a style="color: #000000;" class="tit" href="/product">${cartList.proName }</a>
								<span class="opt quantity">수량 : ${cartList.amount }</span>
								<c:if test="${cartList.proName eq '워크아웃 밴드' }">
								<span class="select-option">스타일: </span>
								</c:if>
							</div>
						</div>
						<div class="option-wrap">
							<div>
								<button href=# class="optchange-btn btn-link sky-blue width-max">옵션 변경</button>
							</div>
						</div>
						<div class="total-price">
							<strong class="retail-price">${cartList.proPrice }원</strong>
							<span><i class="fas fa-arrow-up"></i></span>
							<span><i class="fas fa-arrow-down"></i></span>
						</div>
						
						<!-- Button trigger modal -->
						<button type="button" class="btn btn-primary delete-btn" data-bs-toggle="modal" data-bs-target="#exampleModal">
						  <i style="color:#000000;" class="fas fa-times"></i>
						</button>
						
						<!-- Modal -->
						<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel"></h5>
						        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						      </div>
						      <div class="modal-body">
						        	삭제하시겠습니까?
						      </div>
						      <div class="modal-footer">
						        <button type="button" style=" background-color: #d1d1d1; border: #d1d1d1; color:black;" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						        <button type="submit" style="background-color: #000000; border: #000000; color:white;" class="btn btn-primary btn-delete">확인</button>
						      </div>
						    </div>
						  </div>
						</div>
												
						
					</div>
				</div>	
		</form>
		</c:forEach>
			</div>
			<div class="product-checkout">
				<strong class="tit">주문예정금액</strong>
				<div class="info-price">
					<span class="item-price">
						<span class="label">상품 금액</span>
						<span class="price"><strong>다 더한거</strong></span> 
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
				<a class="btn-link xlarge width-max btn-order indian-red" href="order">주문하기</a>
			</div>
		</div>	
	</article>
	
	<!-- Footer -->
  	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>