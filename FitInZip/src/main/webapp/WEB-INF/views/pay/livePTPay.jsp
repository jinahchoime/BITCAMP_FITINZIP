<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<meta charset="UTF-8">
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no,user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <meta name="naver-site-verification" content="114a8942a1df74aa238c3e1fcab3eb7a2010a837">
    <meta name="google-site-verification" content="sDJaFVUVSKXtQwYOMjBZWvIhJvJxfoZfpa-Z1ggX4BU">
   
    <title>FITIN.ZIP 결제페이지</title>
    

    <script type="text/javascript" async="" src="https://www.googletagmanager.com/gtag/js?id=G-8JW0LD87R5&amp;l=dataLayer&amp;cx=c"></script>
    <script type="text/javascript" async="" src="https://www.googleadservices.com/pagead/conversion_async.js"></script>
    <script type="text/javascript" async="" src="https://www.googletagmanager.com/gtag/js?id=AW-936821621&amp;l=dataLayer&amp;cx=c"></script>
    <script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
   
    
    <script type="text/javascript" src="//www.bravecompany.net/js/common.js"></script>
    <script src="https://unpkg.com/core-js-bundle@3.1.4/index.js"></script>
    <script src="https://unpkg.com/regenerator-runtime@0.13.3/runtime.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.34/browser.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.16"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue-awesome-swiper"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

  
    <!-- Firebase -->
    <script src="https://www.gstatic.com/firebasejs/8.0.0/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.0.0/firebase-auth.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.0.0/firebase-analytics.js"></script>

   <!-- Custom styles for this template-->
    <link href="../resources/class/css/clsPayment.css" rel="stylesheet">
    <script src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/936821621/?random=1617621176378&amp;cv=9&amp;fst=1617621176378&amp;num=1&amp;userId=undefined&amp;bg=ffffff&amp;guid=ON&amp;resp=GooglemKTybQhCsO&amp;eid=2505059651&amp;u_h=1080&amp;u_w=1920&amp;u_ah=1040&amp;u_aw=1920&amp;u_cd=24&amp;u_his=16&amp;u_tz=540&amp;u_java=false&amp;u_nplug=3&amp;u_nmime=4&amp;gtm=2oa3o0&amp;sendb=1&amp;ig=1&amp;data=event%3Dgtag.config&amp;frm=0&amp;url=https%3A%2F%2Fwww.ficle.io%2Fplay%2Fplay_buy&amp;ref=https%3A%2F%2Fwww.ficle.io%2Fplay%2Fplay_apply%2F270&amp;tiba=%ED%94%BC%ED%81%B4%EB%9D%BC%EC%9D%B4%EB%B8%8C%20%7C%20%ED%94%BC%EB%93%9C%EB%B0%B1%EC%9E%88%EB%8A%94%20%EB%9D%BC%EC%9D%B4%EB%B8%8C%20%ED%94%BC%ED%8A%B8%EB%8B%88%EC%8A%A4%EC%88%98%EC%97%85&amp;hn=www.googleadservices.com&amp;async=1&amp;rfmt=3&amp;fmt=4"></script>


	<script type="text/javascript"></script>
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	
<script>
	function comma(str) {
	    str = String(str);
	    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	}

 $(function(){
		$('#couponBtn').click(function(){
			console.log("쿠폰버튼눌렀다.");
			var selectVal = document.getElementById("coupon").value;
			console.log("쿠폰?:" + document.getElementById("coupon").value);

		 $.ajax("/clsPay", {
			data: {'selectVal': selectVal},
			dataType: "json",
			type: "get",
			
			success: function(data) {
				alert("쿠폰이 적용되었습니다.");
				//console.log(data.discountPrice);
				var dp = comma(data.discountPrice);
				console.log("dp: " + dp);
				
				var fp = comma(data.finalPrice);
				console.log("fp: " + fp);
				
				
				$('#finalPrice').empty();
				
				var html = "";
				

				html += '<div class="price_area mt50"><div class="column1"> <div class="txt">상품금액</div> <div class="num"><b>${detail.totalPrice}</b>원</div></div>';
                html += '<div class="column1"> <div class="txt">배송비</div> <div class="num"><b>0</b>원</div></div>';   
                html += '<div class="column1"> <div class="txt">할인금액</div><div class="num"><b>';
				html += dp;
				html += '</b>원</div></div></div>';
				html += '<div class="price_area total_price"> <div class="column1"> <div class="txt">총 결제금액</div><div class="num" style="display: flex; margin-right: -63px;"><b><strong>';
				
				html += '<div id="totalfinalPrice">' + fp + '</div>';
				html += '</strong></b>원</div></div></div>';

				$('#finalPrice').append(html);
				
			}, fail: function() {
				alert("쿠폰 적용에 오류가 발생했습니다.");
			} 

		}); 
		});
		
	 	});
 
 

 
</script>
	<!-- 아임포트 카드결제 -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
//콤마풀기
function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}

function iamport(){
	 
	 var check = document.getElementById('check0').checked;
	 console.log("check:" + check);
	
	 var price = document.getElementById("totalfinalPrice").innerHTML;
	 console.log("finalPrice: " + price);
	 
	 var fp = uncomma(price);
	 console.log("fp: " + fp);
	 
	 if(check == false) {
		 alert("결제동의에 체크해주세요.");
		 return false;
	 }
	
	 
 //가맹점 식별코드
 IMP.init('imp89234237');
 IMP.request_pay({
     pg: 'inicis', // version 1.1.0부터 지원.
     pay_method: 'card',
     merchant_uid: 'merchant_' + new Date().getTime(),
     name: '<c:out value="${detail.clsName}" />',
     amount: fp, //판매 가격
     buyer_name: '<c:out value="${member.name}"/>'

 }, function(rsp) {
     if (rsp.success) {
         var msg = '결제가 완료되었습니다.';
         msg += '고유ID : ' + rsp.imp_uid;
         msg += '상점 거래ID : ' + rsp.merchant_uid;
         msg += '결제 금액 : ' + rsp.paid_amount;
         msg += '카드 승인번호 : ' + rsp.apply_num;
         location.href="/clsPayConfirm"
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
</head>

<body>
	<div id="container">
    <div class="contents clearfix" id="contents">

<!-- 결제 -->
        <div id="viewArea" class="column_left_wrap">
            <div class="contents_wrap">
                <div class="wad_apply_area">
                    <div class="wad_apply">               
                        <div class="tag_area"></div>
                        <p>${detail.clsName}</p>
                        <div id="finalPrice">
	                        <div class="price_area mt50">
	                            <div class="column1">
	                                <div class="txt">상품금액</div>
	                                <div class="num"><b><fmt:formatNumber value="${detail.totalPrice}" /></b>원</div>
	                            </div>
	                            <div class="column1">
	                                <div class="txt">배송비</div>
	                                <div class="num"><b>0</b>원</div>
	                            </div>
	                            <div class="column1">
	                                <div class="txt">할인금액</div>
	                                <div class="num">
	                                <b>
	                                0</b>원
	                                </div>
	                            </div>
	                        </div>
	                        <div class="price_area total_price">
	                            <div class="column1">
	                                <div class="txt">총 결제금액</div>
	                                <div class="num" style="display: flex; margin-right: -63px;">
	                                	<b>
	                                     	<strong><div id="totalfinalPrice"><fmt:formatNumber value="${detail.totalPrice}" /></div></strong>
	                                	</b>원
	                                </div>
	                            </div>
	                        </div>
                        </div>
                        <div class="btn type1">
                        	<button type="button" onclick="iamport()" class="adClick" style="margin-bottom: 15px;display: block; text-align: center; width: 280px; height: 60px; line-height: 60px; font-size:18px; color:#fff; background: linear-gradient(to right, DarkOrange, #FF3399); border-radius: 5px !important;font-weight:700; -webkit-transition: all .3s; transition: all .3s;">카드결제</button>
                        </div>
                        <div class="agree_box mt10"><input type="checkbox" id="check0" name="checkAgreement"><label for="check0"><span class="font12 gray4">위 주문정보를 확인하였으며, 회원 본인은 결제에 동의합니다.</span></label></div>                   
                    </div>
                </div>
                <div class="contents_wrap_type2">
                    <div class="sub_title line">
                        <h3>신청 강좌 정보</h3>
                    </div>
                    <div class="table_basic_board board1 none">
                        <table>
                            <colgroup>
                                <col width="*">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td class="type_diff">
                                        <div class="list_img"><img src="https://ficle-live.s3.ap-northeast-2.amazonaws.com/origin/program/2021-02-04/1612438885971365399.png" alt="클래스썸네일"></div> <a href="javascript:;">
                                            <div class="list_txt full">
                                                <dl class="prod_infor">
                                                    <dt>
                                                        <div class="play_tch"><span>${detail.commonName }</span> <span>${detail.name}</span></div>
                                                       ${detail.clsName}
                                                    </dt>
                                                </dl>
                                                <p>기간 : ${detail.year}.${detail.startMonth}.${detail.startDay} ~ ${detail.endDate} </p>
                                                <p> ${detail.yoil} ${detail.pm} ${detail.startTime} ~ ${detail.endTime} (총 ${detail.lapse}회)</p>
                                                <div class="prod_prc"><fmt:formatNumber value="${detail.totalPrice}"/></div>
                                            </div>
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="sub_title line">
                        <h3>할인쿠폰</h3>
                    </div>
                    <div class="column_wrap">
                        <div class="myaccount">
                            <p>할인쿠폰을 사용하고 할인을 받아보세요!</p>
                            <dl>
                                <dd>
                                    <div class="btn_search flat">
                                    <select name="coupon" id="coupon" class="option_type" style="width: 608px;">                                         
                                        <c:if test="${empty cpList }">
                                        	<option value="">쿠폰을 선택하세요</option>
                                        </c:if>
                                        <c:if test="${not empty cpList }">
                                       		 <option value="">쿠폰을 선택하세요</option>
                                        	<c:forEach var="cpList" items="${cpList }" >
                                        		<option id="couponOption" value="${cpList.couponCode }">${cpList.couponName }: ${cpList.discountPrice }원 (${cpList.couponStartDate }~${cpList.couponEndDate })</option>
                                     		</c:forEach>
                                     	</c:if>
                                        </select> <button type="button"><a class="adClick btn_basic type1" id="couponBtn">적용하기</a></button></div>
                                    <!---->
                                </dd>
                            </dl>
                        </div>
                    </div>
                    <div class="layout_h60"></div>
                    <div class="sub_title line">
                        <h3>결제방법</h3>
                    </div>
                    <div class="column_wrap mb100">
                        <div class="myaccount">
                            <div class="form-box-input mb0">
                                <div class="chk-box on"><input type="radio" id="method" name="method" checked="checked" class="circle-check2" value="1"> <label for="ml"><i></i><span class="font15 bold black">신용카드/체크카드</span></label></div>
                            </div>
                        </div>
                    </div>
                    <div style="height: 200px;"></div>
                    <div style="height: 100px;"></div>
                </div>
            </div>
        </div>

    </div>
</div>



            
</body>

</html>