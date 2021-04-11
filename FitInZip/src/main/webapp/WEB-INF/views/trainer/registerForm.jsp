<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
    
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.80.0">
    <title>Register Trainer Form</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/checkout/">

    <!-- Bootstrap core CSS -->
	<link href="../resources/trainer/css/TrainerLoginBootstrap.min.css" rel="stylesheet">
	   
    
	<style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
    </style>
	
 	<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
    <script>
    	$(function() {
    		$("#memOriName").on('change', function(){
    		readURL(this);
          });
      });

      function readURL(input) {
          if (input.files && input.files[0]) {
          var reader = new FileReader();

          reader.onload = function (e) {
               $('#blah').attr('src', e.target.result);
               $('#blah').css({'border-radius': '50%', 'object-fit': 'cover'});
              }

            reader.readAsDataURL(input.files[0]);
          }
      }
      
      function registerInfo(frm) {
    	  var id = document.getElementById("id").value;
    	  var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; 

    	  if(!regex.test(id)) {
    		  alert("아이디는 이메일 형식으로 입력해주세요.");
    		  return false;
    	  }
    	  
      	  var password = document.getElementById("password").value;
      	  var pattern1 = /[0-9]/;
          var pattern2 = /[a-zA-Z]/;
          var pattern3 = /[~!@\#$%<>^&*]/;
      	  
      	  if(!pattern1.test(password)||!pattern2.test(password)||!pattern3.test(password)||password.length<8||password.length>17){
             alert("비밀번호엔 영문과 숫자, 특수문자를 모두 입력하여 8자 이상 16자 이하로 만들어주세요.");
             return false;
         } 
      	 
    	  if(document.getElementById("name").value.length == 0) {
    		  alert("이름을 입력해주세요.");
    		  return false;
    	  }
    	  if(document.getElementById("nickname").value.length == 0) {
    		  alert("별명을 입력해주세요.");
    		  return false;
    	  }
    	  
    	  var phoneRule = /^\d{3}-\d{3,4}-\d{4}$/;
    	  var phone = document.getElementById("phone").value;
    	  if(phone.length == 0) {
    		  alert("핸드폰번호를 입력해주세요.");
    		  return false;
    	  }
    	  if(!phoneRule.test(phone)) {
    		  alert("핸드폰은 000-0000-0000의 형식으로 작성해주세요.");
    		  return false;
    	  }
    	  
    	  var birth = document.getElementById("birth").value; 
    	   if(birth.length == 0) {
    		  alert("생년월일을 입력해주세요.");
    		  return false;
    	  } 
    	  if(!pattern1.test(birth)) {
    		  alert("생년월일은 숫자만 적어주세요.");
    		  return false;
    	  }
    	  
    	  if(document.getElementById("memOriName").value.length == 0) {
    		  alert("프로필 사진을 넣어주세요.");
    		  return false;
    	  }

    	  if(document.getElementById("question1").value.length == 0) {
    		  alert("질문1에 대답해주세요.");
    		  return false;
    	  } 
    	  if(document.getElementById("question2").value.length == 0) {
    		  alert("질문2에 대답해주세요.");
    		  return false;
    	  }
    
      	alert("강사 신청이 완료되었습니다. 강사 등록 확정은 이메일로 안내해드리겠습니다.");
 		frm.action="/registerForm"     	/* location.href = "/registerForm"  */
 		frm.submit();
      	
      }
      
    
      $(document).ready(function(){
      	//아이디 중복체크
      	$("#id").blur(function(){
      		var id = $('#id').val();
      		console.log("id:"+id );
      			$.ajax({
      				url:'${pageContext.request.contextPath}/registerForm/idCheck?id='+id,
      				type:'get',
      				success:function(data){
      					console.log("1=중복, 0=중복x /" + data);
      				
      					if(data == 1) {
      						$("#id_check").text("사용중인 아이디입니다.");
      						$("#id_check").css("color", "red");
      						$("#reg_submit").attr("disabled", true);
      					} else if (id === "") { 
      						$('#id_check').text('아이디를 입력해주세요.');
      						$('#id_check').css('color', 'red');
      						$("#reg_submit").attr("disabled", true);
      					} else {	
      						$("#id_check").text("");
      						$("#reg_submit").attr("disabled", false);
      					}
      					
      				
      				}, error : function() {
      					console.log("오류");	
      				}
      				
      			});	
      		});
      });
      
      
  </script>


    <!-- Custom styles for this template -->
    <link href="resources/trainer/css/form-validation.css" rel="stylesheet">
    
    <!-- 에디터 -->
	<script src = "../resources/trainer/ckeditor/ckeditor.js"></script>
  </head>
    
  <body class="bg-light">
  	<div class="container">
	  <main>
	    <div class="py-5 text-center">
	      <img class="d-block mx-auto mb-4" src="../resources/trainer/img/login_icon.png" alt="" width="72" height="57">
	      <h2>강사 등록하기</h2>
	      <p class="lead">트레이너님의 정보 확인을 위해 아래 내용을 모두 작성해주세요.</p>
	    </div>
	
	    <div class="row g-3">  
	      <div class="col-md-7 col-lg-8" style="width: 620px; margin: 0 auto;">
	        <h4 class="mb-3" style="text-align: center; padding-bottom: 20px;">온라인 지원서</h4>
	        <form class="needs-validation" method="post" enctype="multipart/form-data"> 
         
	            <div class="col-12">
	            	<label for="id" class="form-label">아이디(이메일주소)</label>
	              	<input type="text" class="form-control" name="id" id="id" placeholder="hong@naver.com" required>
	              	<div class="check_font" id="id_check">
	              	
	             	</div>
	            </div>
          
	           	<div class="col-12">
	            	<label for="password" class="form-label" style="margin-top: 10px">비밀번호</label>
	              	<input type="text" class="form-control" name="password" id="password" placeholder="" required>
	            </div>
          
	            <div class="col-12">
	            	<label for="name" class="form-label" style="margin-top: 10px">이름</label>
	              	<input type="text" class="form-control" name="name" id="name" placeholder="홍길동" value="" required>
	            </div>
	            
	            <div class="col-12">
	            	<label for="name" class="form-label" style="margin-top: 10px">별명</label>
	              	<input type="text" class="form-control" name="nickname" id="nickname" placeholder="홍씨" value="" required>
	            </div>

	            <div class="col-12">
	            	<label for="phone" class="form-label" style="margin-top: 10px">핸드폰번호</label>
                	<input type="text" class="form-control" name="phone" id="phone" placeholder="010-1234-5678" required>
	            </div>
	       
            	<label for="gender" class="form-label" style="margin-top: 10px">성별</label>
            	<div class="form-check">
	              	<input id="male" value="male" name="gender" type="radio" class="form-check-input" checked required>
	              	<label class="form-check-label" for="credit">남자</label>
            	</div>
            	<div class="form-check">
	              <input id="female" value="female" name="gender" type="radio" class="form-check-input" required>
	              <label class="form-check-label" for="debit">여자</label>
            	</div>
           
	            <div class="col-12">
	            	<label for="birth" class="form-label"style="margin-top: 15px">생년월일 </label>
	              	<input type="text" class="form-control" name="birth" id="birth" placeholder="19900101" required>
	            </div>
				
				<div class="file1" style="margin-top: 15px; margin-bottom: 25px;">
	          	<label for="profile" class="form-label">프로필사진</label>
	          	<input type="file" id="memOriName" name="memberOriName" value="사진" accept=".jpg,.jpeg,.png,.gif">
	          		<img id="blah" src="../resources/trainer/img/profileImg.png" onerror="../resources/trainer/img/profileImg.png"   width="300px" height="300px" style="margin-top: 20px; ">
	          	</div> 
				
				<div class="mb-3">
					<label for="content" style="margin-top: 20px; margin-bottom: 10px;">강사소개</label>
					<textarea id="editor" name = "trainerIntro"></textarea>
					<script type="text/javascript">CKEDITOR.replace('editor');</script>
				</div>
				
				<div class="mb-3">
					<label for="content" style="margin-top: 15px; margin-bottom: 10px;">자격 및 경력</label>
					<textarea id="editor2" name = "career"></textarea>
					<script type="text/javascript">CKEDITOR.replace('editor2');</script>
				</div>
				
	            <div class="col-12">
	            	<label for="address" class="form-label" style="margin-top: 10px">강의하는 곳의 Wi-Fi가 잘 갖추어져 있나요?</label>
	              	<input type="text" class="form-control" name="question1" id="question1" placeholder="네/아니오" required>
	            </div>
	
	            <div class="col-12">
	            	<label for="address2" class="form-label" style="margin-top: 25px;">사용중인 핸드폰 기종을 적어주세요.</label>
	              	<input type="text" class="form-control" name="question1" id="question2" placeholder="아이폰12" required>
	            </div>
				<button class="w-100 btn btn-lg btn-primary" type="button" id="reg_submit" style="margin-top:40px" onclick="registerInfo(this.form)">강사신청하기</button>	          
	        </form>
	      </div>
	    </div>
	  </main>
	
	  <footer class="my-5 pt-5 text-muted text-center text-small">
	    <p>사업자등록번호 000-00-00000 | 통신판매번호 2021-서울서초-0000 | 대표이사 김피트  | 개인정보관리책임자 김비트  |</p>
        <p> 서울특별시 서초구 서초4동 강남대로 </p>
		<p>Copyright © FITINZIPCOMPANY Co. All rights reserved. Server : 000.00.00.000</p>
	  </footer>
	</div>
	
	
        <script src="../resources/trainer/js/login_bootstrap.bundle.min.js"></script>

      <!-- <script src="../resources/trainer/js/form-validation.js"></script> -->
		

  </body>
 	
</html>
