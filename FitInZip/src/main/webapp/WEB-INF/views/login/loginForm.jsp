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

<!-- <script src="https://cdn.jsdelivr.net/npm/vue@2.5.16"></script>
<script src="https://cdn.jsdelivr.net/npm/vue-awesome-swiper"></script>
<script type="text/javascript" src="/resources/login/js/common.js?2021032610"></script>
<script type="text/babel" src="/resources/login/js/vue.common.js?20210326101"></script> -->

<script>
	/* new Vue({
		loginEmail: function() {
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
            });
        },
        goLogin: function(snsType, snsKey) {
            var self = this;

            var formData = new FormData();
            formData.append('snsType', snsType);
            formData.append('snsKey', snsKey.toString());
            formData.append('autoLogin', self.$refs.autoLogin && self.$refs.autoLogin.checked ? 'Y' : 'N');

            axios({
                method: 'POST',
                url: "/emailLoginCheck",
                data: formData,
                responseType: 'json'
            })
            .then(function(res) {
                if(res.data['resultCode'] == 1) {
                    if ($('input[name=ret_url]').val()) {
                        location.href = $('input[name=ret_url]').val();
                        return;
                    }
                    location.href="/";
                } else {
                    BsJs_toastPopup('가입된 정보가 없습니다.', 'error', function() {});
                    setTimeout("location.href='/member/join'",2000);
                }
            })
            .catch(function(error) {
                //console.log(error);
            });
        }
	}); */
</script>

<script>
	$(function(){
		$("#loginBtn").on("click", function() {
			alert("로그인버튼 클릭");
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
					  alert("로그인 완료");
					  /* alert("이전페이지 : " + document.referrer); */
					  
					  /* window.history.go(-1); */
					  location.href=document.referrer;
					  
				  } else {
					  alert("아이디, 비밀번호를 확인해주세요.");
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
								alert("로그인되었습니다");
								location.href="/";
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
				                    <input type="text" name="id" v-model="userEmail" ref="userEmail" required="required" placeholder="이메일 입력" :class="{ error: error.name == 'userEmail'}" @keyup="{error.name == 'userEmail' ? error.name = '': ''}">
				                    <!-- <div class="myform_box">
				                        <span class="clear"></span>
				                    </div>
				                    <div class="info-msg">
				                        <label class="error"><span class="msg-box error" v-show="error.name == 'userEmail'">{{ error.msg }}</span></label>
				                    </div> -->
				                </div>
				                <div class="form-box-input adClick" data-adarea="피클_비밀번호입력">
				                    <input type="password" name="password" id="userPassword" v-model="userPassword" required="required" placeholder="비밀번호 입력" maxlength="20" :class="{ error: error.name == 'userPassword'}" @keyup="{error.name == 'userPassword' ? error.name = '': ''}" @keyup.13="loginEmail">
				                    <!-- <div class="myform_box">
				                        <span class="clear"></span>
				                    </div>
				                    <div class="info-msg">
				                        <label class="error"><span class="msg-box error" v-show="error.name == 'userPassword'">{{ error.msg }}</span></label>
				                    </div> -->
				                </div>
				                <input type="button" id="loginBtn" class="btn_basic full mt5 adClick" value="로그인">
				                <!-- <a href="javascript:;" class="btn_basic full mt5 adClick" data-adarea="피클_로그인" id="loginEmail" :class="{ disabled: !isInputComplete}" @click="loginEmail">로그인</a> -->
			                </form>

							<a href="javascript:kakaoLogin();" class="btn_basic full big icn-social kk mt15 adClick">카카오톡으로 시작하기</a>
						</article>
						<div class="last-box mt40">
							<div class="gray7 mt30">
								아직 계정이 없으신가요?
								<a href="emailJoinForm" data-adarea="피클_가입하기"class="ml10 black bold adClick">이메일로 회원가입</a>
							</div>
						</div>
					</div>
				</section>
			</section>
		</div>
	</div>
</body>
</html>