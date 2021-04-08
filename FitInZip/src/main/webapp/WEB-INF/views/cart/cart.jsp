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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	//옵션 - 수량 변경
	
	function showModal(form) {
		const modal = new bootstrap.Modal(form.querySelector("#exampleModal2"));
		modal.toggle();
	} 
	
	function up(form) {
		const $viewAmount = form.querySelector("#viewAmount");
		const $changeAmount = form.querySelector("#changeAmount");
		let viewAmount = parseInt($viewAmount.innerText);
		viewAmount++;
		$viewAmount.innerText = viewAmount;
		$changeAmount.innerText = viewAmount;
		
		//let formData = $("form[name=form]").serialize();
		//let formData = new FormData(document.getElementById("thisform"));
		//let formData = new FormData(this.form);
		let formData = new FormData(form);
		
		let options = {
				method: "POST",
				body : new URLSearchParams(formData)
		}
		
		fetch("/updateAmount", options) 
			.then(async function (response) {
				let result = await response.json();
			})
		 
		
		.catch(err => {
			//alert("오류 발생: " + err)
			//location.href="/cart"
		});  
	}
	
	function down(form) {
		const $viewAmount = form.querySelector("#viewAmount");
		const $changeAmount = form.querySelector("#changeAmount");
		let viewAmount = parseInt($viewAmount.innerText);
		viewAmount--;
		$viewAmount.innerText = viewAmount;
		$changeAmount.innerText = viewAmount;
		
		//let formData = $("form[name=form]").serialize();
		let formData = new FormData(form);
		
		let options = {
				method: "POST",
				body : new URLSearchParams(formData)
		}
		
		fetch("/downAmount", options) 
			.then(async function (response) {
				let result = await response.json();
			})
		
		.catch(err => {
			//alert("오류 발생: " + err);
			//location.href="/cart"
		});  
	}
	
	
	//장바구니 전체 삭제
	function deleteAllCart() {
		var check = confirm("장바구니를 비우시겠습니까?")
		if(check) {
			location.href="/deleteAllCart";
		} else {
			location.href="/cart";
		}
		
	}
	
	function reload(){
		location.href="/cart";
	}

</script>
</head>
<body>
	<jsp:include page="../nav.jsp"></jsp:include>
	
	<article class="contents margin-xsmall">
		<h2 class="cart-title">장바구니</h2>
		
		<div class="item-container">
			<div class="item-list-wrap" id="cart">
				<c:if test="${empty cartList }">
					<div class="cart-empty">
					<i class="fas fa-shopping-bag" style="width:120px; height:80px;"></i><br>
					<span style="font-size:16px;">장바구니에 담긴 상품이 없습니다.</span><br>
					<a href="/product" class="goProduct-btn">계속 쇼핑하기</a>
					</div>
				</c:if>
				
				<c:if test="${!empty cartList }">
				<div class="product-select-all">
					<a style="color: #000000;" class="btn-cart-delete-All" href=# onclick="deleteAllCart()">전체삭제</a>
				</div>
				
			<c:forEach var="cartList" items="${cartList }">
					<form method="post" name="form" id="thisform">
					
						<div class="product-opt_cart" id="cart">
							<!-- <input type="hidden" name="proName">
							<input type="hidden" name="mem_id">
							<input type="hidden" name="amount"> -->
							<input type="hidden" name="cartCode" value="${cartList.cartCode }">
							<div class="item-detail">
								<div class="item-info">
									<span class="img-wrap">
									</span>
									<img style="width:110px; height:110px;" src="${cartList.proImg }" alt="상품이미지">
									<div class="info-wrap">
										<a style="color: #000000;" class="tit" href="/product">${cartList.proName }</a>
										<strong class="retail-price">${cartList.proPrice }원</strong>
										<span class="opt quantity">수량 : <span id="viewAmount">${cartList.amount }</span></span>
										
										<c:if test="${cartList.proName eq '워크아웃 밴드' }">
										<!-- <span class="select-option">스타일: </span> -->
										</c:if>
									</div>
								</div>
								
								
								<!-- Button trigger modal -->
								<button type="button" class="btn btn-primary delete-btn" data-bs-toggle="modal" data-bs-target="#exampleModal">
								  <i style="color:#000000;" class="fas fa-times"></i>
								</button>
								
								<!-- Modal -->
								<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-centered">
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
								        <button type="submit" value="delete" formaction="/deleteCart" style="background-color: #000000; border: #000000; color:white;" class="btn btn-primary btn-delete">확인</button>
								      </div>
								    </div>
								  </div>
								</div>
								
								
								<!-- Button trigger modal  옵션변경 모달-->
								<!-- <button style="background-color: transparent; color:#6c6c6c; border:none; text-decoration: underline;" type="button" class="btn btn-primary change-btn" data-bs-toggle="modal" data-bs-target="#exampleModal2"> -->
								<button style="background-color: transparent; color:#6c6c6c; border:none; text-decoration: underline;" type="button" class="btn btn-primary change-btn" onclick="showModal(this.form)">
								  옵션변경
								</button>
								
								<!-- Modal -->
								<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-centered">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel"></h5>
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="reload()"></button>
								      </div>
								      <div class="modal-body updown">
								        	<span>수량 : </span><span id="changeAmount">${cartList.amount }</span> &nbsp;
								        	<button type="button" onclick="up(this.form)">
								        		<i class="fas fa-arrow-up arrow up"></i>
								        	</button>
								        	
								        	<button type="button" onclick="down(this.form)">
								        		<i class="fas fa-arrow-down arrow down"></i>
								        	</button>
								      </div>
								      <div class="modal-footer">
								        <!-- <button type="button" style=" background-color: #d1d1d1; border: #d1d1d1; color:black;" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
								        <button type="button" style="background-color: #000000; border: #000000; color:white;" class="btn btn-primary">확인</button> -->
								      </div>
								    </div>
								  </div>
								</div>
							
								
							</div>
						</div>	
					</form>
				</c:forEach>
			</c:if>
			</div>
			
			<c:if test="${!empty cartList }">
			<c:set var="sum" value="0"/>
			<div class="product-checkout">
				<strong class="tit">주문예정금액</strong>
				<div class="info-price">
					<span class="item-price">
						<span class="label">상품 금액</span>
						<c:forEach var="cartList" items="${cartList }" >
							<c:set var="sum" value="${sum + (cartList.proPrice * cartList.amount) }" />
						</c:forEach>
						<span class="price"><strong><c:out value="${sum }"/>원</strong></span> 
					</span>
					<span class="delivery-price">
						<span class="label">예상 배송비</span>
						<span class="price"><strong>0원</strong></span>
					</span>
				</div>
				<div class="total-price">
					<span class="label">총 결제 예정 금액</span>
					<span class="price sale total"><strong><c:out value="${sum }"/>원</strong></span>
				</div>
				<a class="btn-link xlarge width-max btn-order indian-red" href="order">주문하기</a>
			</div>
			</c:if>
		</div>	
	</article>
	
	<!-- Footer -->
  	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>