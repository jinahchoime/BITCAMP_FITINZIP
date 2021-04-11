<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>FITIN.ZIP Mainpage</title>

    <!-- Custom fonts for this template-->
    <link href="../resources/trainer/trainermainvendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="../resources/trainer/css/TrainerMain-sb-admin-2.min.css" rel="stylesheet">
    <link href="../resources/trainer/css/form-validation.css" rel="stylesheet">


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
     
    <script src = "../resources/trainer/ckeditor/ckeditor.js"></script> 
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
            	$('#profileImg').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
          	}
      	}
      	
      	function registerForm(frm) {
      		var password = document.getElementById("password").value;
        	var pattern1 = /[0-9]/;
            var pattern2 = /[a-zA-Z]/;
            var pattern3 = /[~!@\#$%<>^&*]/;
        	  
       	  	if(!pattern1.test(password)||!pattern2.test(password)||!pattern3.test(password)||password.length<8||password.length>17){
              alert("비밀번호엔 영문과 숫자, 특수문자를 모두 입력하여 8자 이상 16자 이하로 만들어주세요.");
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
      	  
      	  if(document.getElementById("memOriName").value.length == 0) {
      		  alert("프로필 사진을 넣어주세요.");
      		  return false;
      	  }
      		alert("정보 수정이 완료되었습니다!");
      		frm.action = "/changeInfo"
      		/* location.href="/trainerMainPage"; */
      		frm.submit();
      	}
      		    	
    </script>
     
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/trainerMainPageView">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">FITIN.ZIP TRAINER </div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">


            <!-- Heading -->
            <div class="sidebar-heading">
                	
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>클래스 관리</span>
                </a>
               
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                
                        <a class="collapse-item" href="/myClass">나의 클래스</a>
                        <a class="collapse-item" href="classStat">클래스 신청현황</a>
                    </div>
                </div>
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>정산내역</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                       
                        <a class="collapse-item" href="/myCalculation">건별 정산내역</a>
                        <a class="collapse-item" href="/myWithdraw">정산금액 인출하기</a>
          
                    </div>
                </div>
            </li>
            
           
            
            <li class="nav-item">
                <a class="nav-link" href="/changeInfo">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>프로필 수정</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="myReview">
                    <i class="fas fa-fw fa-table"></i>
                    <span>내 후기 보기</span></a>
            </li>



            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <!-- <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div> -->

           
        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                    <!-- Nav Item - User Information -->
                    	<li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">${member.name } 강사님</span>
                                <img class="img-profile rounded-circle"
                                    src="../resources/trainer/img/profile2_trainer.png">
                            </a>
                     <!-- Dropdown - User Information -->
	                     	<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
	                        	aria-labelledby="userDropdown">
	                            <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
	                            	<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
	                                    Logout
	                            </a>
	                         </div>
                        </li>
                    </ul>
                </nav>
               
                <!-- Begin Page Content -->
                <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row g-3" style= "margin-left: 25%">  
		        <div class="col-md-7 col-lg-8">
		        <h4 class="mb-3" style="text-align: center; padding-bottom: 20px;">정보 수정</h4>
		        <h5 style="font-size: 12px; text-align: right;"><a href="/regBreakout" style="color:darkslateblue">회원 탈퇴 요청</a></h5>
		        <form class="needs-validation" method="post" name="frm" enctype="multipart/form-data">
		        	<div class="col-12">
		            	<label for="id" class="form-label">아이디(이메일주소)</label> ${member.id }              
	            	</div>
          
		           	<div class="col-12">
		            	<label for="password" class="form-label" style="margin-top: 10px">비밀번호</label>
		              	<input type="password" class="form-control" name="password" id="password" placeholder="" required>
		            </div>
          
		            <div class="col-12" style="margin-top: 10px;">
		            	<label for="name" class="form-label" style="margin-top: 10px">이름</label> ${member.name }
		            </div>
	            
		            <div class="col-12">
		            	<label for="name" class="form-label" style="margin-top: 10px">별명</label>
		              	<input type="text" class="form-control" name="nickname" id="nickname" placeholder="홍씨" value="" required>
		            </div>
	
		            <div class="col-12">
		            	<label for="phone" class="form-label" style="margin-top: 10px">핸드폰번호</label>
	                	<input type="text" class="form-control" name="phone" id="phone" placeholder="010-1234-5678" required>
		            </div>
         	
         	
         		
         	
         	
          		<div class="file1" style="margin-left: 10px;">
	          	<label for="profile" class="form-label" style="margin-top: 20px;">프로필사진</label>
	          	<input type="file" id="memOriName" name="memberOriName" value="사진" accept=".jpg,.jpeg,.png,.gif">
	          		<img id="profileImg" src="${profileImg }" style="width:250px; height:250px;border-radius: 50%; object-fit: cover; margin-top: 20px; margin-bottom: 30px; border-radius: 50%;">
	          	</div> 
	          	
	          	
					
					<div class="mb-3" style="margin-left: 10px;">
						<label for="content" style="margin-top: 10px">강사소개</label>
						<textarea id = "editor" name = "trainerIntro">${trainerInfo.trainerIntro }</textarea>
						<script type="text/javascript">CKEDITOR.replace('editor');</script>
					</div>
					
					<div class="mb-3" style="margin-left: 10px;">
						<label for="content" style="margin-top: 10px">자격 및 경력</label>
						<textarea id = "editor2" name = "career">${trainerInfo.career }</textarea>
						<script type="text/javascript">CKEDITOR.replace('editor2');</script>
					</div>
					<button class="w-100 btn btn-lg btn-primary" type="button" value="정보수정" id="infoBtn" style="margin-top: 20px" onclick="registerForm(this.form)">정보수정</button>
         			</div>
         			
         			<input type="hidden" name="profileOriName" value="${member.memOriName } ">
         			<input type="hidden" name="profileFileName" value="${member.memFileName }">
         		
         		</form>
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <p>사업자등록번호 000-00-00000 | 통신판매번호 2021-서울서초-0000 | 대표이사 김피트  | 개인정보관리책임자 김비트  |</p>
                        <p> 서울특별시 서초구 서초4동 강남대로 </p>
		  				<p>Copyright © FITINZIPCOMPANY Co. All rights reserved. Server : 000.00.00.000</p>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

   

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">로그아웃 버튼을 누르시면 메인 페이지로 되돌아갑니다.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="/logout">Logout</a>
                </div>
            </div>
        </div>
    </div>

	<script src="../resources/trainer/js/bootstrap.bundle.min.js"></script>
    <script src="../resources/trainer/js/form-validation.js"></script>
	
    <!-- Bootstrap core JavaScript-->
    <script src="../resources/trainer/trainermainvendor/jquery/jquery.min.js"></script>
    <script src="../resources/trainer/trainermainvendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    

    <!-- Core plugin JavaScript-->
    <script src="../resources/trainer/trainermainvendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
   <!--  <script src="js/sb-admin-2.min.js"></script> -->

    <!-- Page level plugins -->
    <!-- <script src="resources/vendor/chart.js/Chart.min.js"></script> -->

    <!-- Page level custom scripts -->
  <!--   <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script> -->

</body>

</html>