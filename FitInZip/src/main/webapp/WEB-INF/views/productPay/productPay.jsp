<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FITINZIP | 결제</title>
</head>
<body>
	<jsp:include page="../nav.jsp"></jsp:include>
	
	<section class="content-area">
		<article class="contents">
			<div class="order-wrap">
				<h2 class="title">주문결제</h2>
					<div class="order_simply_tit">
						<strong>얼마</strong>
					</div>
				<div class="order-tab-wrap" >
					<div class="order-tab reservations-customer">
						<div class="header">
							<h5 class="tit">주문고객</h5>
							<span class="preview">주문자 아이디 </span>
							<span class="preview">주문자 번호 </span>
						</div>
						<div class="order-info"></div>
					</div>
					<div class="order-tab">
						<h5 class="tit">배송지 정보</h5>
						<span class="preview">주소 어디냐~~~~</span>
					</div>
					<div class="order-tab reservations-order">
						<div class="header">
							<h5 class="tit">결제수단 선택</h5>
						</div>
						<div class="payment-review">
							<input type="hidden" name="장바구니 각 넘버">
							<div class="body">
								<ul class="order-field-container uk-grid">
									<li class="order-field-list uk-width-small-1-1 uk-width-medium-1-1">
										<div class="payment-method-list">
											<div class="paymeny-method-item">
												<!-- 여기에 카카오페이 화면... -->
												<h6 class="payment-method-item-title">
													<img style=" " src="" alt="카카오페이">
													카카오페이
												</h6>
											</div>
											<div class="paymeny-method-item">
												<!-- 여기에 카드결제 화면... -->
												<h6 class="payment-method-item-title">
													<img style=" " src="" alt="신용카드">
													카카오페이
												</h6>
											</div>
										</div>
									</li>
									<li class="order-field-list uk-width-small-1-1 uk-width-medium-1-1 uk-margin-bottom-remove">
										<form name="checkout-agree-form">
											<div class="input-form-group">
												<span class="input-checkbox">
													<input type="checkbox" name="isCheckoutAgree">
													<label for="isCheckoutAgree">
														체크박스 아이콘..?
														<span class="label font-size-s">위 주문의 상품, 가격, 배송정보에 동의합니다.</span>
													</label>
												</span>
											</div>
										</form>
									</li>
								</ul>
							</div>
							<div class="footer">
								<form method="POST" class="uk-width-small-1-1 uk-width-medium-1-1"
								action="">
								<button type="submit" class="button xlarge width-max">
									얼마 원 결제하기
								</button>
								</form>
							</div>
						</div>
					</div>
				</div>	
				<div class="order-tab-wrap order_tab_wrap order_tab_wrap--right">
					<div class="order-tab product-checkout checkout">
					<div class="header">
						<h5 class="tit"><strong>주문내역</strong></h5>
					</div>
					<div id="order-summary" class="body view">
						<div class="cart-order_list">
							<dl class="order-list">
								<input type="hidden" name="proNum">
								<input type="hidden" name="proNum">
								<dt class="image-wrap">
									<img src="" alt="상품이미지">
								</dt>
								<dd class="order-info">
									<a class="tit">상품명</a>
									<div class="">옵션 </div>
									<div class="current-option-wrap">
										<input type="hidden" name="옵션">
										<span class="qty">수량</span>
									</div>
									<span class="price-wrap">
										<strong class="retail-price">가격 ~원</strong>
									</span>
								</dd> 
							</dl>
						</div>
						<div class="uk-width-1-1 info-price">
							<span class="item-price">
								<span class="label">상품 금액</span>
								<span class="price"><strong>가격 ~원</strong></span>
							</span>
							<span class="delivery-price">
								<span class="label">배송비</span>
								<span class="price"><strong>0 원</strong></span>
							</span>
							<div class="total-price">
								<span class="label">총 결제 예정 금액</span>
								<span class="price sale total"><strong>총 가격 원</strong></span>
							</div>
						</div>
					</div>
					</div>
				</div>	
			</div>
		</article>
	</section>
	
	
	
	
	<!-- 임시 div -->
	<div style="height:800px;"></div>
	
	
	<!-- Footer -->
  	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>