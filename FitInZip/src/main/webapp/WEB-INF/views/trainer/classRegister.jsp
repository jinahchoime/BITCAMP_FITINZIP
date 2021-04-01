<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>강의 등록</title>
<!-- Custom fonts for this template-->
<link href="../resources/trainer/trainermainvendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../resources/trainer/css/TrainerMain-sb-admin-2.min.css" rel="stylesheet">
<%-- <script src="${path }/resources/ckeditor/ckeditor.js"></script> --%>
<script src="https://cdn.ckeditor.com/4.16.0/full/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	
	$(function(){
		
		$(".startTime").blur(function(){
			console.log($(".startTime").val());
		});
		
		$(".startDate").on(function(){
			console.log($(".startDate").val());
		});
		
		$("#toList").on("click", function(){
			self.location = "classStat";
		});
		
		var actionForm = $("#actionForm");
		
		$("#toList").on("click", function(){
			actionForm.submit();
		});
		
	});
	
</script>
</head>
<body>
	
	<!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/trainerMainPage">
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
                <a class="nav-link" href="/myReview">
                    <i class="fas fa-fw fa-table"></i>
                    <span>내 후기 보기</span></a>
            </li>



            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

           
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
                                
                                <!-- <div class="dropdown-divider"></div> -->
                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->
                
                <div class="container-fluid">
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h4>강의 등록</h4>
		</div>
	<div class="card-body">
	
			<form id="class-info" action="regCls" enctype="multipart/form-data" method="post">
				<div class="card mb-4">
				<div class="card-header py-3"></div>
				<div class="card-body">
					<table class="table table-bordered dataTable" style="table-layout: fixed;">
						<tr>
							<td>
								<select name="clsCategory">
									<option>카테고리 선택</option>
									<option value="ct_wt">웨이트</option>
									<option value="ct_ft">피트니스</option>
									<option value="ct_yg">요가</option>
									<option value="ct_fl">필라테스</option>
								</select>
							</td>
							<td colspan="5">
								<input type="text" name="clsName" placeholder="제목을 입력해주세요" style="width: 100%;">
							</td>
						</tr>
						<tr>
							<th>태그</th>
							<td colspan="5"><input type="text" name="clsTag" style="width: 100%;"></td>
						</tr>
						<tr>
							<th rowspan="2" style="vertical-align: middle;">프로그램 진행 기간</th>
							<td rowspan="2" colspan="2" style="vertical-align: middle;">
								<!-- 시스템적으로 처리할 수 있는 방법에 한계가 있는 것 같아, 끝 날짜까지 받아보려 함 -->
								<input type="date" class="startDate" name="startDate"> ~
								<input type="date" name="endDate">
							</td>
							<th>시작 시간</th>
							<td colspan="2" style="text-align: center;">
								<!-- 끝 시간은 시작에서 50분 더해 줌 -->
								<input type="time" class="startTime" name="startTime" > ~
								<input type="time" class="startTime" name="endTime">
							</td>
					</tr>
					<tr>
						<th>요일</th>
						<td colspan="2" style="text-align: center;">
							<!-- validation 시 %/% 조건 확인할 것 -->
							<input type="text" name="yoil" placeholder="ex)월/수/금">
						</td>
					</tr>
					<tr>
						<th>수업 횟수</th>
						<td><input type="number" name="lapse" style="width: 100%;"></td>
						<th>회당 가격</th>
						<td><input type="number" name="perPrice" style="width: 100%;"></td>
						<th>인원 수</th>
						<td>
							<select name="maxMem">
								<option>인원 수</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10</option>
							</select>
						</td>
					</tr>
				</table>
				</div>
			</div>
			
			
			<div class="card mb-4">
				
				<div class="card-header py-3"></div>
				<div class="card-body">
				<table class="table table-bordered dataTable" style="table-layout: fixed;">
					<tr>
						<th>난이도</th>
						<td style="text-align: center;">
							<select name="clsLevel" style="width: 30%;">
								<option value="상">상</option>
								<option value="중">중</option>
								<option value="하">하</option>
							</select>
						</td>
						<th>소모 칼로리</th>
						<td>
							<input type="number" name="calorie"> kcal
						</td>
					</tr>
					<tr>
						<th>운동장비</th>
						<td colspan="3"><input type="text" name="equip" style="width: 100%;"></td>
					</tr>
					<tr>
						<th style="vertical-align: middle;">강의 내용 소개</th>
						<td colspan="3">
							<textarea id="clsInfo" name="clsInfo">수강생 여러분들이 참고할 수 있는 자세한 설명을 작성해주세요</textarea>
							<script type="text/javascript">CKEDITOR.replace("clsInfo")</script>
				</td>
			</tr>
			<tr>
				<th style="vertical-align: middle;">커리큘럼 상세 정보</th>
				<td colspan="3">
					<textarea id="curriculum" name="curriculum">강의의 상세한 커리큘럼을 작성해주세요</textarea>
					<script type="text/javascript">CKEDITOR.replace("curriculum")</script>
								</td>
							</tr>
							
							<tr>
								<td colspan="4" style="text-align: center;">
									<input type="file" name="clsFileName" placeholder="파일 선택">
									강의 주소 : <input type="text" name="meetUrl">
								</td>
							</tr>
						</table>
						
						
						</div>
						
						
						<input type="hidden" name="clsStatus" value="CS00">
						<input type="hidden" name="trainerId" value="kim">
					</div>
					
						<div style="width: 100%; text-align: center;">
							<input type="submit" class="btn btn-primary btn-icon-split" value="등록" style="margin: auto; width: 100px; height: 40px;">
							<input type="button" id="toList" class="btn btn-secondary btn-icon-split" value="취소" style="margin: auto; width: 100px; height: 40px;">
						</div>
						
				</form>
				<form action="goBack" id="actionForm">
					<input type="hidden" name="pageNum" value='${pageNum }'>
					<input type="hidden" name="amount" value='${amount }'>
				</form>
			</div>
	
		</div>
	</div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->
    
    <script src="../resources/trainer/trainermainvendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../resources/trainer/trainermainvendor/jquery-easing/jquery.easing.min.js"></script>
	
</body>
</html>