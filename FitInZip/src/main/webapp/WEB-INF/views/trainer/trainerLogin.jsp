<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
    <title>FITIN.ZIP Login Page</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">

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
      }
    </style>

  
    
    <script>	
    	 function trainerCheck() {
    		var id = document.getElementById("id").value;
    		var pwd = document.getElementById("password").value;
    		
    		if(id.length == 0) {
    			alert("아이디가 입력되지 않았습니다.");
    			return false;
    		}
    		if(pwd.length == 0) {
    			alert("비밀번호가 입력되지 않았습니다.");
    			return false;
    		}
    		
    		return true;
    	}
	</script>
 
 
  </head>
  <link href="../resources/trainer/css/TrainerLoginSignin.css" rel="stylesheet">
  <body class="text-center" style="background-color: #f5f5f5;">
    
  <main class="form-signin">
  
  
	  <form id="loginForm" method="post" style="width: 300px; margin: 0 auto; margin-top: 200px;">
	    <img class="mb-4" src="../resources/trainer/img/login_icon.png" alt="" width="100" height="80">
	    <h1 class="h3 mb-3 fw-normal">Trainer Login</h1>
	    <label for="inputEmail" class="visually-hidden">아이디(이메일주소)</label>
	    	<input type="text" id="id" name="id" class="form-control" placeholder="Email address" required autofocus>
	    <label for="inputPassword" class="visually-hidden">비밀번호</label>
	    	<input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
	    <button class="w-100 btn btn-lg btn-primary" type="button" value="로그인" id="loginBtn" style="margin-top: 20px">로그인</button>
	    	 
	    <p class="mt-5 mb-3 text-muted">&copy; 2021</p>
	  </form>
 
  <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js""></script>
  <script>
		$(function() {
			$('#loginBtn').click(function() {
				trainerCheck();
			});
		});
		
		function trainerCheck() {
	   		var id = document.getElementById("id").value;
	   		var pwd = document.getElementById("password").value;
	   		
	   		if(id.length == 0) {
	   			alert("아이디가 입력되지 않았습니다.");
	   			return false;
	   		}
	   		if(pwd.length == 0) {
	   			alert("비밀번호가 입력되지 않았습니다.");
	   			return false;
	   		}
	   		if(pwd.length > 0 && id.length > 0) {
	   			var json = {
					'id' : $("#id").val(), 
					'password' : $( "#password" ).val()
					
				};
			
				$.ajax("/trainerLogin", {
					type : "post",
					data : json,
					dataType: "json",
					success : function(data) {						
						//alert("date는~" + data);
						//alert("role: " + data.role);
						//alert("data.id: " + data.id);
						//alert("id: " + id);
						//alert("데이터개수: " + data.length());
						if(data.role === 'RL01') {
							alert("강사로 가르아~");
							location.href = "/trainerMainPage";
						} else if(data.role === 'RL02') {
							alert("관리자로 가르아~");
							location.href = "/registerTrainerMainPage";
						} else {
							alert("아이디 또는 비밀번호가 일치하지 않습니다.");
						}
			                       
			         },
			         error : function(error) { //404 500등 오류 발생시 
			         	alert("아이디 또는 비밀번호가 일치하지 않습니다.");
			         
			         }	
				});
			 };
	   	}

	</script>	
 
</main>

  </body>
</html>
