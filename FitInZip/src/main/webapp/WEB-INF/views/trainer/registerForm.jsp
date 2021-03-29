<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
              }

            reader.readAsDataURL(input.files[0]);
          }
      }
      
      var idPass;
      var idRegex = /^[a-zA-Z0-9]{4,12}$/;
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
	        <form class="needs-validation" action="/registerForm" method="post"> <!-- enctype="multipart/form-data" --> 
         
	            <div class="col-12">
	            	<label for="id" class="form-label">아이디(이메일주소)</label>
	              	<input type="text" class="form-control" name="id" id="id" placeholder="hong@naver.com" required>
	              	<div class="check_font" id="id_check">
	              	
	             	</div>
	            </div>
          
	           	<div class="col-12">
	            	<label for="password" class="form-label" style="margin-top: 10px">비밀번호</label>
	              	<input type="text" class="form-control" name="password" id="password" placeholder="" required>
	              	<div class="invalid-feedback">
	              	비밀번호를 적어주세요.
	              	</div>
	            </div>
          
	            <div class="col-12">
	            	<label for="name" class="form-label" style="margin-top: 10px">이름</label>
	              	<input type="text" class="form-control" name="name" id="name" placeholder="홍길동" value="" required>
	              	<div class="invalid-feedback">
	              	이름을 적어주세요.	
	              	</div>
	            </div>
	            
	            <div class="col-12">
	            	<label for="name" class="form-label" style="margin-top: 10px">별명</label>
	              	<input type="text" class="form-control" name="nickname" id="nickname" placeholder="홍씨" value="" required>
	              	<div class="invalid-feedback">
	              	별명을 적어주세요.	
	              	</div>
	            </div>

	            <div class="col-12">
	            	<label for="phone" class="form-label" style="margin-top: 10px">핸드폰번호</label>
                	<input type="text" class="form-control" name="phone" id="phone" placeholder="01012345678" required>
	              	<div class="invalid-feedback">
	                	  핸드폰번호를 적어주세요.
	                </div>
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
	              	<div class="invalid-feedback">
	              	생년월일을 입력해주세요.
	              	</div>
	            </div>
				
				<!-- <div class="file1">
	          	<label for="profile" class="form-label">프로필사진</label>
	          	<input type="file" id="memOriName" name="memOriName" value="사진" accept=".jpg,.jpeg,.png,.gif">
	          		<img id="blah" src="#" alt="프로필사진" width="300px" height="300px" style="padding-top: 20px; padding-bottom:20px;">
	          	</div> -->
				
				<div class="mb-3">
					<label for="content" style="margin-top: 10px">강사소개</label>
					<textarea id = "editor" name = "trainerIntro"></textarea>
					<script type="text/javascript">CKEDITOR.replace('editor');</script>
				</div>
				
				<div class="mb-3">
					<label for="content" style="margin-top: 10px">자격 및 경력</label>
					<textarea id = "editor2" name = "career"></textarea>
					<script type="text/javascript">CKEDITOR.replace('editor2');</script>
				</div>
			
				<!-- <label for="category" class="form-label" style="margin-top: 10px">분야</label>
	            <div class="form-check">
	            	<input id="pump_iron" name="category" value="ct_wt" type="radio" class="form-check-input" checked required>
	              	<label class="form-check-label">웨이트 트레이닝</label>
	            </div>
	            <div class="form-check">
	            	<input id="fitness" name="category" value="ct_ft" type="radio" class="form-check-input" required>
	              	<label class="form-check-label">피트니스</label>
	            </div>
	            <div class="form-check">
	            	<input id="yoga" name="category" value="ct_yg" type="radio" class="form-check-input" required>
	              	<label class="form-check-label"">요가</label>
	            </div>
	            <div class="form-check">
	            	<input id="pilates" name="category" value="ct_fl" type="radio" class="form-check-input" required>
	              	<label class="form-check-label">필라테스</label>
	            </div> -->
				
	            <div class="col-12">
	            	<label for="address" class="form-label" style="margin-top: 10px">강의하는 곳의 Wi-Fi가 잘 갖추어져 있나요?</label>
	              	<input type="text" class="form-control" name="question1" placeholder="네/아니오" required>
	            </div>
	
	            <div class="col-12">
	            	<label for="address2" class="form-label" style="margin-top: 10px">사용중인 핸드폰 기종을 적어주세요.</label>
	              	<input type="text" class="form-control" name="question2" placeholder="아이폰12" required>
	            </div>
				<input type="submit" id="reg_submit" value="강사신청하기" class="w-100 btn btn-primary btn-lg" style="margin-top:30px">
				<!-- <button class="w-100 btn btn-primary btn-lg" type="submit" style="margin-top:30px">강사 신청하기</button> -->	          
	        </form>
	      </div>
	    </div>
	  </main>
	
	  <footer class="my-5 pt-5 text-muted text-center text-small">
	    <p class="mb-1">&copy; 2021 Company Name</p>
	    <!-- <ul class="list-inline">
	      <li class="list-inline-item"><a href="#">Privacy</a></li>
	      <li class="list-inline-item"><a href="#">Terms</a></li>
	      <li class="list-inline-item"><a href="#">Support</a></li>
	    </ul> -->
	  </footer>
	</div>
	
	
        <script src="../resources/trainer/js/login_bootstrap.bundle.min.js"></script>

      <!-- <script src="../resources/trainer/js/form-validation.js"></script> -->
		

  </body>
 	
</html>
