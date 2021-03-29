<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	$(function(){
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
				  alert("가입이 완료되었습니다.");
				  location.href="/";
			  })
			  .catch(err => alert("오류가 발생 : " + err));
			
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
			        	<input type="checkbox" id="agreeA" name="agreeA" ref="agreeA">
		        		<label for="agreeA">
			        		<span>
					        	<a href="/policy/agreement" target="_blank" class="btn_text">이용약관</a> 및
								<a href="/policy/policy_personal" target="_blank" class="btn_text">개인정보 처리방침</a> 동의
							</span>
						</label>
					</div>
		        	<div class="fl flat">
		        		<input type="checkbox" id="agreeB" name="agreeB" ref="agreeB" @change="selectAllowSMS">
		        		<label for="agreeB">
		        			<span>이벤트 및 할인 소식 SMS수신 동의(선택)</span>
			        	</label>
			        </div>
			    </article>
			    <form>
					<article>
						<div data-adarea="이름" class="form-box-input adClick">
							<input type="text" name="name" id="name" placeholder="이름 입력(가입 후 변경이 불가합니다 )" class>
						</div>
						<div data-adarea="닉네임" class="form-box-input adClick">
							<input type="text" name="nickname" id="nickname" placeholder="닉네임 입력(활동시 닉네임이 사용됩니다)" class>
						</div>
						<div data-adarea="연락처" class="form-box-input adClick">
							<input type="text" name="phone" id="phone" placeholder="휴대폰번호 입력" class>
						</div>
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
