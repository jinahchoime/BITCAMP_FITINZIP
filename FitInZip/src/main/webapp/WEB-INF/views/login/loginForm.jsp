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
		$(function() {
			$("#loginEmail").on("click", function() {
				alert("클릭");
				var self = this;

	            firebase.auth().signInWithEmailAndPassword(self.userEmail, self.userPassword).then(function(res) {
	                self.goLogin(1, res.user['uid']);

	            }).catch(function(error) {
	                //console.log(error);
	                if(error.code == 'auth/wrong-password') {
	                    self.showErrorMsg('userPassword', '비밀번호를 잘못 입력하셨습니다. 다시 입력해주세요.');
	                } else if(error.code == 'auth/user-not-found') {
	                    self.showErrorMsg('userEmail', '가입된 아이디가 없습니다. 다시 확인해주세요.');
	                } else if(error.code == 'auth/invalid-email') {
	                    self.showErrorMsg('userEmail', '잘못된 이메일입니다. 다시 확인해주세요.');
	                }
	            })
			})
		}
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
							url: "/kakaoLogin",
							method: "post",
							data: { "id" : id,
									"nickname" : nickname,
									"gender" : gender
									},
							dataType: "json"
						}).then(function (isFirst) {
							/* alert("가입여부 : " + isFirst); */
							if (isFirst == 1) {
								alert("로그인되었습니다");
								location.href="/";
							} else {
								/* 추가정보 가입페이지로 이동 */
								document.write(''
										+ '<form action="/kakaoAdd" id="kakao" method="post">'
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
						<p>FITIN.ZIP에서 당신의 목적에 맞는 트레이너들과<br>실시간으로 호흡하며 운동해보세요!</p>
					</div>
					<article>
						<div data-adarea="피클_이메일입력" class="form-box-input adClick">
							<input type="text" name="userEmail" required="required" placeholder="이메일 입력" class>
							<div class="myform_box">
								<span class="clear"></span>
							</div>
							<div class="info-msg">
								<label class="error">
									<span class="msg-box error" style="display: none;"></span>
								</label>
							</div>
						</div>
						<div data-adarea="피클_비밀번호입력" class="form-box-input adClick">
							<input type="password" name="userPassword" id="userPassword" required="required" placeholder="비밀번호 입력" maxlength="20" class>
							<div class="myform_box">
								<span class="clear"></span>
							</div>
							<div class="info-msg">
								<label class="error">
									<span class="msg-box error" style="display: none;"></span>
								</label>
							</div>
						</div>
						<a href="javascript:;" data-adarea="피클_로그인" class="btn_basic full mt5 adClick" id="loginEmail">로그인</a>
						<a href="javascript:kakaoLogin();" class="btn_basic full big icn-social kk mt15 adClick">카카오톡으로 시작하기</a>
					</article>
					<div class="last-box mt40">
						<div class="gray7 mt30">
							아직 계정이 없으신가요?
							<a href="joinMain" data-adarea="피클_가입하기" class="ml10 black bold adClick">이메일로 회원가입</a>
						</div>
					</div>
				</div>
			</section>
		</section>
	</div>
</div>
</body>
</html>