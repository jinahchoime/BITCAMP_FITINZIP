<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">

	function card() {
		var phone = ${sessionScope.member.phone};
		 IMP.init('imp89234237');
		 IMP.request_pay({
		     pg: 'inicis', // version 1.1.0부터 지원.
		     pay_method: 'card',
		     merchant_uid: 'merchant_' + new Date().getTime(),
		     name: 'FITINZIP',
		     amount: 1400, //판매 가격
		     buyer_email: 'p.hayan90@gmail.com',
		     buyer_name: '박하얀',
		     buyer_tel: phone,
		     buyer_addr: '경기도 의왕시 덕장로76',
		     buyer_postcode: '123-456'
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
		           go();
		         })
		        	
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
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	
	<input type="button" value="신용카드" onclick="card()">

</body>
</html>