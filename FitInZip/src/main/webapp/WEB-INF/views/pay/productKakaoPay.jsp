<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오페이 결제창</title>
<style>
#kakaoPay {
	background: transparent;
	outline: none;
	border: none;
	margin: 180px auto;
    display: inherit;
    width: 240px;
}


</style>
<link rel="stylesheet" type="text/css" href="../resources/product/css/productKakaoPay.css" />
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
function kakaopay(){
	
	var phone = ${sessionScope.member.phone};
	
	 IMP.init('imp09300600');
	 IMP.request_pay({
	     pay_method: 'kakao',
	     merchant_uid: 'merchant_' + new Date().getTime(),
	     name: 'FITINZIP',
	     amount: <%= session.getAttribute("totalPrice") %>, 
	     buyer_tel: phone,
	 }, function(rsp) {
	     if (rsp.success) {
	         var msg = '결제가 완료되었습니다.';
	         msg += '고유ID : ' + rsp.imp_uid;
	         msg += '상점 거래ID : ' + rsp.merchant_uid;
	         msg += '결제 금액 : ' + rsp.paid_amount;
	         msg += '카드 승인번호 : ' + rsp.apply_num;
	
	         window.close();	
	         opener.location.href = "/productPayFin";
	         
	     } else {
	         var msg = '결제에 실패하였습니다.';
	         msg += '에러내용 : ' + rsp.error_msg;
	     }
	     alert(msg);
	 });
}


</script>
</head>
<body>

	<button type="button" id="kakaoPay" value="카카오페이" onclick="kakaopay()">
		<img id="kakao-img" src="../resources/product/img/payment_icon_yellow_large.png">
	</button>
	
</body>
</html>