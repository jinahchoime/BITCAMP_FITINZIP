<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>클래스 등록 현황</title>
<!-- Custom fonts for this template-->
<link href="../resources/trainer/trainermainvendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link
    href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
    rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../resources/trainer/css/TrainerMain-sb-admin-2.min.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="${path }/resources/classStatusList/css/sb-admin-2.css">
<style type="text/css">
	
	#register {
		width: 70px;
		height: 35px;
	}
	
</style>
<script type="text/javascript">
	$(function(){
		
		var actionForm = $("#actionForm");
		
		$(".paginate_button a").on("click", function(e){
			e.preventDefault();
			
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		$("#selectStatus").on('change', function(e){
			
			$("#searchForm").find("option:selected").val();
			$("#searchForm").find("input[name='pageNum']").val("1");
			e.preventDefault();
			
			$("#searchForm").submit();
		});
		
	});
	
	function goRegister(){
		location.href="classRegister";
	}
</script>
</head>
<body>
	
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
                <a class="nav-link" href="/myReview">
                    <i class="fas fa-fw fa-table"></i>
                    <span>내 후기 보기</span></a>
            </li>



            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
           <!--  <div class="text-center d-none d-md-inline">
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
				
	<!-- 테이블 시작 -->
	<div class="container-fluid">
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h4>클래스 신청 현황</h4>
		</div>
		<div class="card-body">
            <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
				<div class="col-sm-12">
					<div class="row">
					<div class="col-sm-12 col-md-6">
						<div class="dataTables_filter">
	                    <form id="searchForm" action="classStat" method="get">
	                    	<select id="selectStatus" name="classStatus" class="custom-select custom-select-sm form-control form-control-sm"
	                    		style="width: 20%; margin-bottom: 10px;">
	                    		<option value="All" 
	                    			<c:out value="${pageMaker.crt.classStatus == null || pageMaker.crt.classStatus eq 'All' ? 'selected' : '' }"/>>전체</option>
	                    		<option value="CS00"
	                    			<c:out value="${pageMaker.crt.classStatus eq 'CS00' ? 'selected' : '' }" />>승인대기중
	                    		<option value="CS01"
	                    			<c:out value="${pageMaker.crt.classStatus eq 'CS01' ? 'selected' : '' }" />>승인완료</option>
	                    		<option value="CS02"
	                    			<c:out value="${pageMaker.crt.classStatus eq 'CS02' ? 'selected' : '' }" />>승인거부</option>
	                    	</select>
	                    </form>
	                    </div>
					</div>
					<div class="col-sm-12 col-md-6"></div>
                    </div>
			<table class="table table-bordered dataTable" style="table-layout: fixed;">
				<thead>
					<tr role="row">
						<th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1">강의 코드</th>
						<th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1">강의 제목</th>
						<th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1">상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="i" items="${list }">
						<tr class="items_border">
							<td class="classCode">${i.clsCode }</td>
							<td>${i.clsName }</td>
							<td class="status" style="text-align: center;">
							<c:if test="${i.clsStatus == 'CS00' }">
									<form action="modifyClass">
										<input type="hidden" name="clsCode" value="${i.clsCode }">
										<input type="hidden" name="pageNum" value="${pageMaker.crt.pageNum }">
										<input type="hidden" name="amount" value="${pageMaker.crt.amount }">
										<input type="hidden" name="classStatus" value='<c:out value="${pageMaker.crt.classStatus }"/>'> 
										<input class="btn btn-secondary btn-icon-split" style="width: 100px; height: 40px;" type="submit" value="수정">
									</form>
							</c:if>
							<c:if test="${i.clsStatus == 'CS01' }">
							승인완료
							</c:if>
							<c:if test="${i.clsStatus == 'CS02' }">
							승인거부
							</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="row">
			<div class="col-sm-12 col-md-6"></div>
			<div class="col-sm-12 col-md-6">
				<div id="dataTable_filter" class="dataTables_filter" style="text-align: right;">
					<form action="classRegister">
						<input type="hidden" name="pageNum" value="${pageMaker.crt.pageNum }">
						<input type="hidden" name="amount" value="${pageMaker.crt.amount }">
						<input type="hidden" name="classStatus" value='<c:out value="${pageMaker.crt.classStatus }"/>'> 
						<input type="submit" class="btn btn-primary btn-icon-split btn-lg" id="register" value="등록"
							style="font-size: 1.1em;">
					</form>
				</div>
			</div>
			</div>
			<div class="row">
				<div class="col-sm-12 col-md-5"></div>
				<div class="col-sm-12 col-md-7">
					<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
						<ul class="pagination" style="text-align: center;">
							<c:if test="${pageMaker.prev }">
								<li class="paginate_button page-item previous">
									<a href="${pageMaker.startPage - 1 }" class="page-link">이전</a>
								</li>
							</c:if>
							
							<c:if test="${!pageMaker.prev }">
								<li class="paginate_button page-item previous disabled">
									<a href="${pageMaker.startPage - 1 }" class="page-link">이전</a>
								</li>
							</c:if>
							
							<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
								<li class="paginate_button page-item ">
									<a href="${num }" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">${num }</a>
								</li>
							</c:forEach>
							
							<c:if test="${pageMaker.next }">
								<li class="paginate_button page-item next">
									<a href="${pageMaker.endPage + 1 }" class="page-link">다음</a>
								</li>
							</c:if>
							
							<c:if test="${!pageMaker.next }">
								<li class="paginate_button page-item next disabled">
									<a href="${pageMaker.endPage + 1 }" class="page-link">다음</a>
								</li>
							</c:if>
						</ul>
					</div>
				</div>
				
				</div>
					<form id="actionForm" action="classStat" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.crt.pageNum }">
						<input type="hidden" name="amount" value="${pageMaker.crt.amount }">
						<input type="hidden" name="classStatus" value='<c:out value="${pageMaker.crt.classStatus }"/>'> 
					</form>
				
				</div>
			</div>
		</div>
	</div>
</div>
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
	
	<!-- Bootstrap core JavaScript-->
    <script src="../resources/trainer/trainermainvendor/jquery/jquery.min.js"></script>
    <script src="../resources/trainer/trainermainvendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../resources/trainer/trainermainvendor/jquery-easing/jquery.easing.min.js"></script>
	
</body>
</html>