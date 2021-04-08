<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/login/css/toastr.css" rel="stylesheet">
<script src="/resources/class/js/toastr.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/login/css/kakaoJoin.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	window.onload = function(){
		var start_year = "1930"; /* 시작할 년도 */
		var today = new Date();
		var today_year = today.getFullYear();
		var index = 0;
		for(var y = today_year; y >= start_year; y--) { /* start_year ~ 현재 년도 */
			document.getElementById('select_year').options[index] = new Option(y, y);
			index++;
		}
		index=0;
		
		for(var m = 1; m <= 12; m++) {
			document.getElementById('select_month').options[index] = new Option(m, m); 
		index++;
		}
			
		lastday();
	}
	function lastday() { /* 년과 월에 따라 마지막 일 구하기 */
		var Year = document.getElementById('select_year').value;
		var Month = document.getElementById('select_month').value;
		var day = new Date (new Date (Year, Month, 1) - 86400000).getDate();
		var dayindex_len=document.getElementById('select_day').length;
		if(day > dayindex_len) {
			for (var i = (dayindex_len + 1); i <= day; i++){
				document.getElementById('select_day').options[i-1] = new Option(i, i);
			}
		}
		else if (day < dayindex_len) {
			for (var i = dayindex_len; i >= day; i--){
				document.getElementById('select_day').options[i] = null;
			}
		}
		
		birth();
	}
	
	function birth() {
		var Year = document.getElementById('select_year').value;
		var Month = document.getElementById('select_month').value;
		var day = document.getElementById('select_day').value;
		if (Month < 10) { Month = "0" + Month; }
		if (Month < 10) { day = "0" + day; }
		document.getElementById('birth').value = Year + Month + day;
	}
	
</script>

<script>
	var toastr = new Toastr({
		position:'topCenter',
		animation:'slide',
		timeout: 2500
	});
	
	// 이름 유효성검사 정규식
	var n_RegExp = /^[가-힣]{2,15}$/;
	// 핸드폰 번호 유효성 검사 
	var regPhone = /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g;


	$(function(){
		
		// 이름 유효성 검사
		$("#name").blur(function() {		
			var name = document.getElementById("name").value;
			
			if (!name) {
				$("#nameMsg").text("이름을 입력해주세요");
				$("#nameMsg").css("display", "flex");
			 	$("#name").addClass("orange_border");
			 	
			} else if (!n_RegExp.test(name)) {
				$("#nameMsg").text("이름을 한글로 입력해주세요");
				$("#nameMsg").css("display", "flex");
			 	$("#name").addClass("orange_border");
			 	
			} else {
			 	$("#nameMsg").text("");
				$("#nameMsg").css("display", "none");						
				$("#name").removeClass("orange_border");
		   	}
			
		});
		
		
		// 닉네임 유효성 검사
		$("#nickname").blur(function() {		
			var nickname = document.getElementById("nickname").value;
			
			if (!nickname) {
				$("#nicknameMsg").text("사용하실 닉네임을 입력해주세요");
				$("#nicknameMsg").css("display", "flex");
			 	$("#nickname").addClass("orange_border");	
			} else {
			 	$("#nicknameMsg").text("");
				$("#nicknameMsg").css("display", "none");						
				$("#nickname").removeClass("orange_border");
		   	}
			
		});
		
		// 휴대폰 번호 유효성 검사
		$("#phone").blur(function() {		
			var phone = document.getElementById("phone").value;
			
			if (!phone) {
				$("#phoneMsg").text("휴대폰번호를 입력해주세요");
				$("#phoneMsg").css("display", "flex");
			 	$("#phone").addClass("orange_border");
			 	
			} else if (!regPhone.test(phone)) {
				$("#phoneMsg").text("잘못된 휴대폰 번호입니다");
				$("#phoneMsg").css("display", "flex");
			 	$("#phone").addClass("orange_border");
			 	
			} else {
			 	$("#phoneMsg").text("");
				$("#phoneMsg").css("display", "none");						
				$("#phone").removeClass("orange_border");
		   	}
			
		});
		
		
		
		
		
		$("#sendData").on("click", function() {
			
			var id = $("#id").val();
			var name = $("#name").val();
			var nickname = $("#nickname").val();
			var phone = $("#phone").val();
			var gender = $("#gender").val();
			var birth = $("#birth").val();
	
			var kakaoInfo = {
					"id" : id,
					"name" : name,
					"nickname" : nickname,
					"gender" : gender,
					"phone" : phone,
					"birth" : birth
			}
			
			console.log(kakaoInfo);
			
			let options = {
				method: "POST",
				body: new URLSearchParams(kakaoInfo) 	
			}
			
			fetch("/kakaoJoin", options)
			  .then(async function (response) {
				  let result = await response.json();
				  alert("dasd" + result);
				  alert("가입이 완료되었습니다.");
				  location.href="/welcome";
			  })
			  .catch(err => toastr.show('입력하신 정보를 확인해주세요.'));
		});
		
	});
</script>


</head>
<body>
	<!-- Navigation -->
  	<jsp:include page="../nav.jsp"></jsp:include>
  	<section class="join_wrap" v-else>
  		<div class="contents">
			<div class="page_title">
				<h2>추가정보입력</h2>
				<p>실시간 소통형<br>라이브 홈트레이닝 클래스 피클</p>
			</div>
			<div class="kakao-add">
			    <article class="clearfix mb20">
			        <div class="fl flat">
			        	<input type="checkbox" id="agreeA" name="agreeA">
		        		<label for="agreeA">
			        		<span class="agree-txt">
					        	<a href="/policy/agreement" target="_blank" class="btn_text">이용약관</a> 및
								<a href="/policy/policy_personal" target="_blank" class="btn_text">개인정보 처리방침</a> 동의
							</span>
						</label>
					</div>
		        	<div class="fl flat">
		        		<input type="checkbox" id="agreeB" name="agreeB" ref="agreeB" @change="selectAllowSMS">
		        		<label for="agreeB">
		        			<span class="agree-txt">이벤트 및 할인 소식 SMS수신 동의(선택)</span>
			        	</label>
			        </div>
			    </article>
			    <form>
					<article>
						<div data-adarea="이름" class="form-box-input adClick">
							<input type="text" name="name" id="name" placeholder="이름 입력 (가입 후 변경이 불가합니다)">
						</div>
						<div id="nameMsg" class="error_next_box" style="display:none; margin-top: 5px; margin-bottom: 5px;">이름 에러</div>						
						
						<div data-adarea="닉네임" class="form-box-input adClick">
							<input type="text" name="nickname" id="nickname" placeholder="닉네임 입력 (활동시 닉네임이 사용됩니다)">
						</div>
						<div id="nicknameMsg" class="error_next_box" style="display:none; margin-top: 5px; margin-bottom: 5px;">닉넴 에러</div>
						
						<div data-adarea="연락처" class="form-box-input adClick">
							<input type="text" name="phone" id="phone" placeholder="휴대폰번호 입력">
						</div>
						<div id="phoneMsg" class="error_next_box" style="display:none; margin-top: 5px; margin-bottom: 5px;">폰번호 에러</div>
						
						<div data-adarea="생년월일" class="form-box-input adClick">
							<div class="btn_search type5">
								<select id="select_year" onchange="javascript:lastday();"></select>
							</div>
							<div class="btn_search type5">
								<select id="select_month" onchange="javascript:lastday();"></select>
							</div>
							<div class="btn_search type5">	
								<select id="select_day"></select>
							</div>
							<br/>
						</div>
						<input type="hidden" name="id" id="id" value="${vo.id }">
						<input type="hidden" name="gender" id="gender" value="${vo.gender }">
						<input type="hidden" name="birth" id="birth">
					</article>
					<article class="last-box mt30">
						<!-- <input class="btn_basic full" type="submit" value="회원가입"> -->
						<input class="btn_basic full" type="button" value="회원가입" id="sendData">
					</article>
				</form>
			</div>
		</div>
	</section>
</body>
</html>
