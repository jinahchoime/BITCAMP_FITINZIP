<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰내역</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="../resources/mypage/css/mypage.css" rel="stylesheet"></link>
<link href="../resources/mypage/css/cls.css" rel="stylesheet"></link>
<script type="text/javascript">
	$(function(){
		$.ajax("/couponData",{
			type: "get",
			dataType : "json",
			success : function(returnValue){
				var count; /*미사용 쿠폰 수*/
				var dispHtml = '';
				$.each(returnValue, function(){
						count = this.unusedCount;
						var charge = this.discountPrice + "";
						dispHtml += '<ul class="clearfix" style="display: inline-block; width: 388px; margin-right: 50px;"><li style="list-style:none; margin-left: 0; width: 388px;">';
						dispHtml += '<div class="cpn_keep_img"><div class="cpn_in" style="display: table; width: 100%; height: 200px;';
						dispHtml += 'background: url(https://img.ficle.io/www/notice/bg_cpn2.png) no-repeat; background-size: 100% 100%; box-sizing: border-box;">';
						dispHtml += '<dl><dt>';
						dispHtml += '&lt;특별이벤트&gt; ';
						dispHtml += this.couponName;
						dispHtml += '</dt><dd class="cpn_price_type maincolor5">';
						if(charge.length == 5){
							charge = charge.slice(0,2) + "," +charge.slice(2,charge.length);
							dispHtml += charge + '원';
						}else if(charge.length == 4){
							charge = charge.slice(0,1) + "," +charge.slice(1, charge.length);
							dispHtml += charge + '원';
						}
						dispHtml += '</dd><dd>';
						if(this.couponStartDate == null && this.couponEndDate == null){
							dispHtml += '기한없음';
						}else{
							dispHtml += new Date(this.couponStartDate).getFullYear() + "-" + (new Date(this.couponStartDate).getMonth() + 1) + "-" + new Date(this.couponStartDate).getDate();
							dispHtml += " ~ ";
							dispHtml += new Date(this.couponEndDate).getFullYear() + "-" + (new Date(this.couponEndDate).getMonth() + 1) + "-" + new Date(this.couponEndDate).getDate();
							var remainDay = new Date(this.couponEndDate).getTime() - new Date().getTime();
							var rremainDay = remainDay / (1000*60*60*24);
							dispHtml += '<br><span class="maincolor5">';
							dispHtml += parseInt(rremainDay) + '일 남았어요!</span>';
						}
						dispHtml += '</dd><dd>다른 쿠폰과 중복사용불가</dd></dl><div class="cpn_state state1"><a>';
						dispHtml += '<p>';
						dispHtml += this.commonName;
						dispHtml += '</p></a></div></div></div></li></ul>';
				})
				if(count == "undefined" || count == null || count == ""){
					$('#piece').text(0+"장");
				}else{
					$('#piece').text(count+"장");
				}
				$('#content').html(dispHtml);
			},
			error : function(){
				alert("실패!");
			}
			
		})
		
		
	})
</script>
</head>
<body>
	<!-- Navigation -->
    <jsp:include page="../nav.jsp"></jsp:include>
    
    <!-- Content  -->
    <div style="height: 1000px; margin: 0 auto; width: 1200px">
    	<!-- 마이페이지 메뉴  -->
		<jsp:include page="mypageMenu.jsp"></jsp:include>
		
		<!-- 쿠폰 내역 -->
		<jsp:include page="coupon.jsp"></jsp:include>
	</div>
	
	<!-- Footer -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>