<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/login/css/login.css">
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@2/dist/email.min.js"></script>

<script>

	function send_email() {
		alert("클릭");
		var result = Math.floor(Math.random() * 1000000)+100000;
		if(result>1000000){
		   result = result - 100000;
		}
	
		var id = document.getElementById("id").value;
			
		emailjs.init("user_SzATa28ZotYtobcKfQUOJ");
		
		var templateParams = {
				     id : id, // 안녕하세요 ㅁㅁ님  // 이 이메일로 전송을 하게 됩니다.
	        newPassword : result //저같은 경우엔 result에 난수 6자리를 넣어 인증번호를 전송하도록 하였습니다.
		};
		
		emailjs.send("service_1wzu19l", "template_a8voq5f", templateParams) //이를 전송합니다.
		.then(function(response){
			alert("메일을 전송하였습니다."); 
			passwordUpdate(id, result);
			
		}, function(error){
			alert("메일 전송 실패!"); 
		})
	};

	
	function passwordUpdate(id, newPassword) {
		
		alert(id + newPassword);
	
		$.ajax({
			url:"/passwordUpdate",
			type: "POST",
			data: { "id" : id, "password" : newPassword },
			success : function(data) {
				alert("성공했나");
				location.href="/";
			},
			error : function(data) {
				alert('error');
			}
		})
	};
	
	
	


</script>



</head>
<body>
	<jsp:include page="../nav.jsp"></jsp:include>
	<div class="join_wrap" id="viewArea">
	    <div class="contents">
	        <div class="page_title">
	            <h2>비밀번호 재설정</h2>
	            <p>비밀번호를 잊으셨나요?<br>입력하신 이메일 주소로 비밀번호 재설정 메일이 발송돼요.</p>
	        </div>
	        <article class="last-box">
	            <div class="form-box-input">
	                <input type="text" name="id" id="id" placeholder="이메일 입력">
	            </div>
	            <!--div class="form-box-input">
					<input type="text" name="idfind_call" id="idfind_call" placeholder="휴대폰번호 입력" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');" maxlength="11">
					<div class="myform_box">
						<span class="clear"></span>
					</div>
					<div for="idfind_call" class="info-msg">
						<label id="findcall-error" class="callerror" for="idfind_call"><span class="msg-box iderror">휴대폰번호를 입력해주세요.</span></label>
					</div>
				</div-->
	            <a href="javascript:;" class="btn_basic full mt15" style='margin-bottom:130px;' onclick="send_email()">이메일로 비밀번호 찾기</a>
	        </article>
	    </div>
	</div>
	<!-- Footer -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>