<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Toastr -->
<link href="/resources/login/css/toastr.css" rel="stylesheet">
<script src="/resources/class/js/toastr.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/login/css/emailJoin.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 년도 선택하는 스크립트 -->
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
	
	// 이메일 유효성 검사
	var e_RegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 비번 유효성 검사 (4~12자의 영문 대소문자와 숫자로만 입력)
	var re = /^[a-zA-Z0-9]{4,12}$/;
	// 이름 유효성검사 정규식
	var n_RegExp = /^[가-힣]{2,15}$/;
	// 핸드폰 번호 유효성 검사 
	var regPhone = /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g;

	

	$(function(){
		
		
		
		// 아이디 중복 검사
		$("#id").blur(function() {
			var id = document.getElementById("id").value;
			
			$.ajax({
				url: "/emailCheck",
				type: "POST",
				async: false,
				datatype: "json",
				data: {"id" : id},
				success : function(result) {
				if(result == true) {
					$("#idMsg").text("이미 사용중인 아이디입니다");
					$("#idMsg").css("display", "flex");
					$("#id").addClass("orange_border");
						return;
					} else {
						if (!id) {
							$("#idMsg").text("아이디를 입력해주세요");
							$("#idMsg").css("display", "flex");
						 	$("#id").addClass("orange_border");
						 	
						} else if (!e_RegExp.test(id)) {
							$("#idMsg").text("올바른 이메일 형식이 아닙니다");
							$("#idMsg").css("display", "flex");
						 	$("#id").addClass("orange_border");
						 	
						} else {
						 	$("#idMsg").text("");
							$("#idMsg").css("display", "none");				
							$("#id").removeClass("orange_border");
					   	}
				   	}
			   	}
		   	});
		});
		
		
		// 비밀번호 유효성 검사
		$("#password").blur(function() {	
			var password = document.getElementById("password").value;
			
			if (!password) {
				$("#passwordMsg").text("비밀번호를 입력해주세요");
				$("#passwordMsg").css("display", "flex");
			 	$("#password").addClass("orange_border");
			 	
			} else if (!re.test(password)) {
				$("#passwordMsg").text("4~12자의 영문 대소문자와 숫자로만 입력해주세요");
				$("#passwordMsg").css("display", "flex");
			 	$("#password").addClass("orange_border");
			 	
			} else {
			 	$("#passwordMsg").text("");
				$("#passwordMsg").css("display", "none");						
				$("#password").removeClass("orange_border");
		   	}
			
		});
		
		// 비밀번호 일치하는지 검사
		$("#passwordCheck").blur(function() {			
			var passwordCheck = document.getElementById("passwordCheck").value;
			
			if (!passwordCheck) {
				$("#passwordCheckMsg").text("비밀번호를 입력해주세요");
				$("#passwordCheckMsg").css("display", "flex");
			 	$("#passwordCheck").addClass("orange_border");
			 	
			} else if (passwordCheck != document.getElementById("password").value) {
				$("#passwordCheckMsg").text("비밀번호를 동일하게 다시 입력해주세요");
				$("#passwordCheckMsg").css("display", "flex");
			 	$("#passwordCheck").addClass("orange_border");
			 	
			} else {
			 	$("#passwordCheckMsg").text("");
				$("#passwordCheckMsg").css("display", "none");						
				$("#passwordCheck").removeClass("orange_border");
		   	}
			
		});
		
		
		
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
		
	
		
		
		
		// 성별체크
		$(".circle-check2").click(function() {		
			$("#sendData").removeClass("btn_disabled");
			$("#sendData").attr("disabled", false);
		});
		
		
		
		
		
		// 회원가입 처리
		$("#sendData").on("click", function() {
			let formData = new FormData(this.form);
			
		    var id = document.getElementById("id").value;
		
		    let options = {
				method: "POST",
				body: new URLSearchParams(formData) 	
			}
			
			fetch("/emailJoin", options)
			  .then(async function (response) {
				  let result = await response.json();
				  alert("가입이 완료되었습니다.");
				  location.href="/welcome";
			  })
			  .catch(err => toastr.show('입력하신 정보를 확인해주세요.'));
		})
	});
</script>

</head>
<body>
	<!-- Navigation -->
  	<jsp:include page="../nav.jsp"></jsp:include>
  
	<section class="join_wrap">
		<div class="contents">
			<div class="page_title">
                <h2 v-if="isEmail">회원가입</h2>
				<p>실시간 소통형<br>라이브 홈트레이닝 클래스 FITIN.ZIP</p>
            </div>
            <div class="step1">
                <article>
	                <form>
	                	<div data-adarea="피클_이메일입력" class="form-box-input adClick">
	                		<input type="text" id="id" name="id" placeholder="이메일 입력">
	                	</div>
	                	<div id="idMsg" class="error_next_box" style="display:none; margin-top: 5px; margin-bottom: 5px;">아이디 에러</div>
	                	
	                	<div data-adarea="피클_비밀번호입력" class="form-box-input adClick">
	                		<input type="password" id="password" name="password" required="required" placeholder="비밀번호 입력 (영문과 숫자로만 입력해주세요)" maxlength="20" class>
	                	</div>
	                	<div id="passwordMsg" class="error_next_box" style="display:none; margin-top: 5px; margin-bottom: 5px;">비번 에러</div>
	                	
	                	<div data-adarea="피클_비밀번호확인" class="form-box-input adClick">
	                		<input type="password" id="passwordCheck" name="passwordCheck" required="required" placeholder="비밀번호 확인" maxlength="20">
	                	</div>
	                	<div id="passwordCheckMsg" class="error_next_box" style="display:none; margin-top: 5px; margin-bottom: 5px;">비번 일치 에러</div>
	                	
	                	<div data-adarea="이름" class="form-box-input adClick">
							<input type="text" name="name" id="name" placeholder="이름 입력 (가입 후 변경이 불가합니다)">
						</div>
						<div id="nameMsg" class="error_next_box" style="display:none; margin-top: 5px; margin-bottom: 5px;">이름 에러</div>
						
						<div data-adarea="닉네임" class="form-box-input adClick">
							<input type="text" name="nickname" id="nickname" placeholder="닉네임 입력 (활동시 닉네임이 사용됩니다)" class>
						</div>
						<div id="nicknameMsg" class="error_next_box" style="display:none; margin-top: 5px; margin-bottom: 5px;">닉넴 에러</div>
						
						<div data-adarea="연락처" class="form-box-input adClick">
							<input type="text" name="phone" id="phone" placeholder="휴대폰번호 입력 (' - '도 입력해주세요)">
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
							<input type="hidden" name="birth" id="birth">
							<br/>
						</div>
						<article class="col-box1 left mt20">
		                    <div class="form-box-input adClick gender" data-adarea="피클_성별">
		                        <div class="chk-box">
		                            <input type="radio" id="fl" name="gender" class="circle-check2" value="female" v-model="gender">
		                            <label for="fl"><i></i><span class="white">여자</span></label>
		                        </div>
		                        <div class="chk-box">
		                            <input type="radio" id="ml" name="gender" class="circle-check2" value="male" v-model="gender">
		                            <label for="ml"><i></i><span class="white">남자</span></label>
		                        </div>
		                    </div>
		                </article>
		                <article class="last-box mt30">
	                		<input type="button" class="btn_basic full btn_disabled" disabled id="sendData" value="가입하기">
	                	</article>
					</form>
                </article>
                
            </div>
            <div class="last-box mt40">
				<div class="gray7 mt30">
					이미 계정이 있으신가요?
					<a href="loginMain" data-adarea="피클_가입하기" class="ml10 white bold adClick">로그인</a>
				</div>
			</div>
		</div>
	</section>
	
</body>
</html>