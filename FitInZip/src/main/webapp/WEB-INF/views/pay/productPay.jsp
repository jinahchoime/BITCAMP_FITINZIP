<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FITINZIP | 결제</title>
<link rel="stylesheet" type="text/css"
	href="../resources/product/css/productPay.css" />
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


</head>

<body>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<jsp:include page="../nav.jsp"></jsp:include>

	<section class="order-checkout">
		<article class="contents">
			<div class="order-wrap">
				<h2 class="contents-title">
					<span class="title">주문결제</span>
				</h2>
				<div class="order-tab-wrap">
					<div class="order-tab reservations-customer" id="block">
						<div class="header">
							<h5 class="tit">주문고객</h5>
						</div>
						<div id="orderinfo-review" class="body view">
							<div class="order-complete">
								<div class="uk-grid uk-margin-bottom">
									<div class="uk-width-7-10">
										<dl>
											<dd class="uk-margin-small-bottom">${sessionScope.member.name }</dd>
										</dl>
										<dl>
											<dd class="uk-margin-small-bottom">${sessionScope.member.phone }</dd>
										</dl>
										<dl>
											<dd class="uk-margin-small-bottom">${sessionScope.member.id }</dd>
										</dl>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="order-tab" id="block">
						<div class="header">
							<h5 class="tit">배송지 정보</h5>
						</div>
						<div class="delivery-info">
							<div id="shipping-review" class="body view">
								<div class="order-complete">
									<div class="uk-grid">
										<div class="uk-width-7-10">
											<dl>
												<dd class="uk-margin-small-bottom text-box">
													<p>(${sessionScope.postcode }) ${sessionScope.address }
														${sessionScope.detailAddress }</p>
													<p id="msg">배송메모: ${sessionScope.directMsg }</p>
												</dd>
											</dl>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="order-tab reservations-order" id="block">
						<div class="header">
							<h5 class="tit">결제수단 선택</h5>
						</div>
						<div class="payment-review">
							<input type="hidden" name="장바구니 각 넘버">
							<div class="body">
								<ul class="order-field-container uk-grid">
									<li
										class="order-field-list uk-width-small-1-1 uk-width-medium-1-1">
										<div class="payment-method-list">
											<div class="payment-method-item">
												<!-- <form action="/kakaoPay" method="post"> -->
												<button id="kakao" class="payMethod">
													<h6 class="payment-method-item-title">
														<img style="width: 60px;"
															src="../resources/product/img/icon_kakaopay_100.jpg"
															alt="카카오페이"> 카카오페이
													</h6>
												</button>
											</div>
											<div class="payment-method-item">
												<button id="card" class="payMethod">
													<h6 class="payment-method-item-title">신용카드</h6>
												</button>
											</div>
										</div>
									</li>
									<li
										class="order-field-list uk-width-small-1-1 uk-width-medium-1-1 uk-margin-bottom-remove">
										<form name="checkout-agree-form">
											<div class="input-form-group">
												<span class="input-checkbox"> <input type="checkbox"
													id="isCheckoutAgree"> <label for="isCheckoutAgree">
														<i class="icon-checkbox"></i> <span
														class="label font-size-s">위 주문의 상품, 가격, 배송정보에
															동의합니다.</span>
												</label>
												</span>
											</div>
										</form>
									</li>
								</ul>
							</div>
							<div class="footer">
								<form method="POST"
									class="uk-width-small-1-1 uk-width-medium-1-1" action="">
									<button type="submit" id="money" onclick="pay()"
										class="button xlarge width-max">
										<c:set var="sum" value="0" />
										<c:forEach var="cartList" items="${cartList }">
											<c:set var="sum" value="${sum + cartList.proPrice }" />
										</c:forEach>
										<span class="price sale total" id="pay"><strong
											style="font-size: 17px;"><c:out value="${sum }" /> 원
												결제하기</strong></span>
									</button>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div class="order-tab-wrap order_tab_wrap order_tab_wrap--right">
					<div class="order-tab product-checkout checkout">
						<div class="header">
							<h5 class="tit">
								<strong>주문내역</strong>
							</h5>
						</div>
						<div id="order-summary" class="body view">
							<c:forEach var="cartList" items="${cartList }">
								<div class="cart-order_list">
									<dl class="order-list">
										<dt class="image-wrap">
											<img src="${cartList.proImg }"
												style="width: 120x; height: 120px;" alt="상품이미지">
										</dt>
										<dd class="order-info">
											<a class="tit">${cartList.proName }</a>
											<div class="">옵션</div>
											<div class="current-option-wrap">
												<input type="hidden" name="옵션"> <span class="qty"
													id="amount">수량 : ${cartList.amount }</span>
											</div>
											<span class="price-wrap"> <strong class="retail-price">${cartList.proPrice }
													원</strong>
											</span>
										</dd>
									</dl>
								</div>
							</c:forEach>

							<div class="uk-width-1-1 info-price">
								<span class="item-price"> <span class="label">상품
										금액</span> <c:set var="sum" value="0" /> <c:forEach var="cartList"
										items="${cartList }">
										<c:set var="sum" value="${sum + cartList.proPrice }" />
									</c:forEach> <span class="price"><strong><c:out
												value="${sum }" /> 원</strong></span>
								</span> <span class="delivery-price"> <span class="label">배송비</span>
									<span class="price"><strong>0 원</strong></span>
								</span>
								<div class="total-price">
									<span class="label">총 결제 예정 금액</span>
									<c:set var="sum" value="0" />
									<c:forEach var="cartList" items="${cartList }">
										<c:set var="sum" value="${sum + cartList.proPrice }" />
									</c:forEach>
									<span class="price sale total"><strong><c:out
												value="${sum }" /> 원</strong></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</article>
	</section>
	
	<a href="/testtest">으아아</a>



	<!-- 임시 div -->
	<div style="height: 600px;"></div>


	<!-- Footer -->
	<jsp:include page="../footer.jsp"></jsp:include>

<script>
	$(function(){
		var click;
		
		$("#kakao").on("click", function(){
			if($("#card").hasClass("active") === true) {
				$("#card").removeClass("active");
			}
			$(this).addClass('active');
			click = true;
		});
		
		$("#card").on("click", function(){
			if($("#kakao").hasClass("active") === true) {
				$("#kakao").removeClass("active");
			}
			
			$(this).addClass('active');
		});
		
		
		
	});




	
</script>
<script type="text/javascript">
 $(function(){
		$("#pay").click(function(){
			/* var check = $('#isCheckoutAgree').is(":checked");
			if(click != true) {
				alert("결제수단을 선택해주세요.");
				return;
			}
			
			if(click == true && check == true) {
				alert("카카오페이 결제하기");
				pay();
			} else {
				alert("상품, 가격, 할인, 배송정보에 동의해주세요");
			} */
				 
			pay();
		});
		
	}) 
</script>

<script type="text/javascript">
function pay(){
	//가맹점 식별코드
	var phone = ${sessionScope.member.phone};
	 IMP.init('imp09300600');
	 IMP.request_pay({
	     pg: 'kakao', // version 1.1.0부터 지원.
	     pay_method: 'card',
	     merchant_uid: 'merchant_' + new Date().getTime(),
	     name: '주문명:결제테스트',
	     amount: 1400, //판매 가격
	     buyer_tel: phone,
	 }, function(rsp) {
	     if (rsp.success) {
	         var msg = '결제가 완료되었습니다.';
	         msg += '고유ID : ' + rsp.imp_uid;
	         msg += '상점 거래ID : ' + rsp.merchant_uid;
	         msg += '결제 금액 : ' + rsp.paid_amount;
	         msg += '카드 승인번호 : ' + rsp.apply_num;
	         //jQuery로 HTTP 요청
	         jQuery.ajax({
	        	url: "https://www.myservice.com/payments/complete", //가맹점서버
	        	method: "POST",
	        	headers: {"Content-Type": "application/json"},
	        	data: {
	        		 imp_uid: rsp.imp_uid,
	                 merchant_uid: rsp.merchant_uid
	                 //기타 필요한 데이터가 있으면 추가 전달
	             }
	         }).done(function (data) {
	           // 가맹점 서버 결제 API 성공시 로직
	           
	         })
	        	
	     } else {
	         var msg = '결제에 실패하였습니다.';
	         msg += '에러내용 : ' + rsp.error_msg;
	     }
	     alert(msg);
	 });
}
</script>
</body>
</html>