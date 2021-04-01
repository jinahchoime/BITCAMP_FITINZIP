<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FITINZIP | 주문</title>
<link rel="stylesheet" type="text/css" href="../resources/order/css/order.css"/>

</head>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
    


    
    
    //배송메모
  	function deli(val) {
    	var $value = $(val);
    	var $direct = $('input[name=direct]');
    	
    	if($value.val() == 'directMsg') {
    		$direct.attr('readonly', false);
    		$direct.val('');
    	} else {
    		$direct.attr('readonly', true);
    		$direct.val($value.val());
    	}
    }
  
 
</script>
<body>
	<jsp:include page="../nav.jsp"></jsp:include>
	
	<section class="wrapper">
		<!-- <form action="/productPay"> -->
		<section class="order-checkout">
			<article class="contents">
				<form action="productPay" method="post">
				<div class="order-wrap">
					<h2 class="contents-title">
						<span class="title">주문결제</span>
						<!-- <input type="hidden" name="samedayDeliveryNotAvailable">
						<input type="hidden" name="samedayDeliveryNotAvailableMessage"> -->
					</h2>
						<div class="order_simply_tit">
						</div>
					<div class="order-tab">
						<div class="header">
							<h5 class="tit">주문고객</h5>
							<div class="body view">
								${sessionScope.member.id }<br>
								${sessionScope.member.name }<br>
								${sessionScope.member.phone }
							</div>
							<h5 class="tit">배송지 정보</h5>
						</div>
						<div class="address">
							<input type="text" name="postcode" id="postcode" placeholder="우편번호">
							<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" name="address" id="address" placeholder="주소"><br>
							<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소">
							<input type="text" name="extraAddress" id="extraAddress" placeholder="참고항목">
						</div>
						
						<select class="delivery-message" id="deliMsg" onchange="deli(this)">
							<option class="deli-msg-default" value="none">배송 메모를 선택해주세요.</option>
							<option value="배송 시 연락 부탁드립니다.">배송 시 연락 부탁드립니다.</option>
							<option value="빠른 배송 부탁드립니다.">빠른 배송 부탁드립니다.</option>
							<option value="directMsg">직접 입력</option>
						</select><br>
						<input type="text" name="direct" placeholder="직접 입력">
						<!-- 직접입력 클릭하면  input type text 나타난다 -->
						
						<div class="delivery-info">
							<h6></h6>
							<span class="label">일반배송 : 배송비 무료</span>
							<ul>
								<li>배송지역 : 전국 (일부 도서산간 지역 제외)</li>
								<li>배송기간 : 결제 후 3일 이내 (토요일, 공휴일 제외)</li>
								<li>배송안내 : 상품의 출고지 또는 물류센터 보관장소에 따라 분리 배송</li>
							</ul>
						</div>
						<div class="goCart-btn">
							<a href="cart" class="link">장바구니 바로가기</a>
						</div>
						
						<button type="submit" class="button xlarge width-max">다음 단계 진행</button> 
					</div>	
					<div class="order-tab-wrap order_tab_wrap order_tap_wrap--right">
						<div class="order-tab product-checkout checkout">
							<div class="header mini-box">
								<h5 class="tit"><strong>주문내역</strong></h5>
							</div>
							<c:forEach var="cartList" items="${cartList }">
							<div id="order-summary" class="body view">
								<div class="cart-order_list">
									<div class="order-list">
										<!-- <input type="hidden" name="productNum" value="">
										<input type="hidden" name="amount" value=""> -->
										<div class="image-wrap">
											<img style="width:120px; height:120px;" src="${cartList.proImg }" alt="상품이미지">
										</div>
										<div class="order-info">
											<a class="tit" href="">${cartList.proName }</a>
											<div class='current-option-wrap'>
												<!-- <input type="hidden" name="옵션넣어" value="옵션밸류"> -->
												<span class="opt">1kg...</span>
												<span class="qty">수량 : ${cartList.amount }</span>
												<span class="price-wrap">
													<strong class="retail-price">${cartList.proPrice } 원</strong>
												</span>
											</div>
										</div>
									</div>
									
								</div>
								
							</div>	
							</c:forEach>

								<div class="uk-width-1-1 info-price">
									<span class="item-price">
										<span class="label">상품 금액</span>
										<span class="price">
											<c:set var="sum" value="0"/>
											<c:forEach var="cartList" items="${cartList }" >
												<c:set var="sum" value="${sum + cartList.proPrice }" />
											</c:forEach>
											<strong><c:out value="${sum }"/> 원</strong>
										</span>
									</span>
									<span class="delivery-price">
										<span class="label">배송비</span>
										<span class="price">
											<strong>0 원</strong>
										</span>
									</span>
									<div class="total-price">
										<span class="label">총 결제 예정 금액</span>
										<span class="price sale total">
											<c:set var="sum" value="0"/>
											<c:forEach var="cartList" items="${cartList }" >
												<c:set var="sum" value="${sum + cartList.proPrice }" />
											</c:forEach>
											<strong><c:out value="${sum }"/> 원</strong>
										</span>
										
										
									</div>
								</div>
								
							</div>
						</div>
						
					</div>	
					</form>
			</article>
		</section>
		<!-- </form> -->
	</section>
	
	<!-- 임시 div -->
	<div style="height:800px;"></div>
	
	
	
	
	
	
	<!-- Footer -->
  	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>