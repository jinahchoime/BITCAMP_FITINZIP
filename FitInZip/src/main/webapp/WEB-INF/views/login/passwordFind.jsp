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
	var toastr = new Toastr({
		position:'topCenter',
		animation:'slide',
		timeout: 2500,
		theme: 'orange'
	});
	
	
	function passwordFind() {
		var id = document.getElementById("id").value;
		
		$.ajax({
			url: "/emailCheck",
			type: "POST",
			async: false,
			datatype: "json",
			data: {"id" : id},
			success : function(result) {
				if(result == true) {
					alert(" 패스워드 파인드에서 성공으로 옴")
					sendEmail();	
				} else {
					toastr.show('가입하신 정보가 없습니다.');
				}				
			}
		})	
	};
	
	
	function sendEmail() {
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
			
			passwordUpdate(id, result);
			
		}, function(error){
			alert("메일 전송 실패!"); 
		})
	}

	
	function passwordUpdate(id, newPassword) {
		
		alert(id + newPassword);
	
		$.ajax({
			url:"/passwordUpdate",
			type: "POST",
			data: { "id" : id, "password" : newPassword },
			success : function(data) {
				toastr.show('메일로 임시비밀번호를 발급해드렸습니다.');
				history.back;
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
	            <div id="idMsg" class="error_next_box" style="display:none; margin-top: 5px; margin-bottom: 5px;">아이디 에러</div>
	             
	            <a href="javascript:;" class="btn_basic full mt15" style='margin-bottom:130px;' onclick="passwordFind()">이메일로 비밀번호 찾기</a>
	        </article>
	    </div>
	</div>
	<!-- Footer -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>