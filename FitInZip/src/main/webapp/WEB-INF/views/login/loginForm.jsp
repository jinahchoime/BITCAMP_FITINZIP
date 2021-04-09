<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" type="text/css" href="/resources/login/css/login.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/fa609ec6e5.js" crossorigin="anonymous"></script>
<script src="http://developer.kakao.com/sdk/js/kakao.js"></script>



<script>

	
	
	//이메일 유효성 검사
	var e_RegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;


	$(function(){
		
		var toastr = new Toastr({
			position:'topCenter',
			animation:'slide',
			timeout: 2500
		});
		
		// 아이디 중복 검사
		$("#id").blur(function() {
			var id = document.getElementById("id").value; 	
			
			if (!e_RegExp.test(id)) {
				$("#idMsg").text("아이디는 이메일형식으로 입력해주세요");
				$("#idMsg").css("display", "flex");
			 	$("#id").addClass("orange_border");
			 	
			} else {
			 	$("#idMsg").text("");
				$("#idMsg").css("display", "none");				
				$("#id").removeClass("orange_border");
					 
		   	}
		});
		
		
		
		
		
		
		$("#loginBtn").on("click", function() {

			let formData = new FormData(this.form);
			
			let options = {
				method: "POST",
				body: new URLSearchParams(formData) 	
			}
			
			fetch("/emailLoginCheck", options)
			  .then(async function (response) {
				  console.log(response);
				  let result = await response.json();
				  console.log(result);
				  
				  if (result == true) {
					  /* alert("로그인 완료"); */
					  /* alert("이전페이지 : " + document.referrer); */
					  /* window.history.go(-1); */
					  location.href = document.referrer;
					  
				  } else {
					  toastr.show('아이디 또는 비밀번호를 확인해주세요.');
				  }
				  				  
				  
			  })
			  .catch(err => alert("오류가 발생 : " + err));
		})
	});
</script>

<script>
	//e1abbefa9eea8cd3c5624e569d66bfa7
	window.Kakao.init("e1abbefa9eea8cd3c5624e569d66bfa7");
	
	function kakaoLogin() {
		window.Kakao.Auth.login({
			scope:'profile, account_email, gender',
			success: function(authObj) {
				console.log(authObj);
				window.Kakao.API.request({
					url:'/v2/user/me',
					success: res => {
						const kakao_account = res.kakao_account;
						console.log(kakao_account);
						var id = kakao_account.email;
						var nickname = kakao_account.profile.nickname;
						var gender = kakao_account.gender;
						
						$.ajax({
							url: "/kakaoLoginCheck",
							method: "post",
							data: { "id" : id,
									"nickname" : nickname,
									"gender" : gender
									},
							dataType: "json"
						}).then(function (isJoin) {
							/* alert("가입여부 : " + isFirst); */
							if (isJoin == true) {
								/* alert("로그인되었습니다"); */
								location.href = document.referrer;
							} else {
								/* 추가정보 가입페이지로 이동 */
								document.write(''
										+ '<form action="/kakaoJoinForm" id="kakao" method="post">'
										+ '<input type="hidden" id="id" name="id" value=' + id + '>'
										+ '<input type="hidden" id="nickname" name="nickname" value=' + nickname + '>'
										+ '<input type="hidden" id="gender" name="gender" value=' + gender + '>'
										+ '</form>');
								document.getElementById("kakao").submit();
							}
						})
					}
				});
			}
		});
	};
</script>

</head>
<body>

	<!-- Navigation -->
	<jsp:include page="../nav.jsp"></jsp:include>

	<div id="container">
		<div class="contents clearfix" id="contents">
			<section id="viewArea">
				<section class="join_wrap">
					<div class="contents">
						<div class="page_title">
							<h2>로그인</h2>
							<p>
								FITIN.ZIP에서 당신의 목적에 맞는 트레이너들과<br>실시간으로 호흡하며 운동해보세요!
							</p>
						</div>
						<article>
							<form>
								<div class="form-box-input adClick" data-adarea="피클_이메일입력">
				                    <input type="text" name="id" id="id" required="required" placeholder="이메일 입력">
				                </div>
				                <div id="idMsg" class="error_next_box" style="display:none; margin-top: 5px; margin-bottom: 5px;">아이디 에러</div>
				                
				                <div class="form-box-input adClick" data-adarea="피클_비밀번호입력">
				                    <input type="password" name="password" id="userPassword" placeholder="비밀번호 입력">			                   
				                </div>
				                <input type="button" id="loginBtn" class="btn_basic full mt15 adClick" value="로그인">
				          
			                </form>

							<a href="javascript:kakaoLogin();" class="btn_basic full big icn-social kk mt15 adClick">카카오톡으로 시작하기</a>
						</article>
	
						<div class="last-box mt40">
							
							<div class="gray7 mt30">
								아직 계정이 없으신가요?
								<a href="emailJoinForm" data-adarea="피클_가입하기" class="ml10 white bold adClick">이메일로 회원가입</a>
							</div>
							<div class="gray7 mt30">
								<a href="/passwordFind" data-adarea="피클_가입하기" class="ml10 gray adClick">비밀번호 재설정</a>
							</div>
						</div>
					</div>
				</section>
			</section>
		</div>
	</div>
</body>
</html>