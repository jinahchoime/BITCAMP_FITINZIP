<%@page import="java.util.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

	
   <!-- Jquery -->
  <script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	//날짜 유효성 검사
  $(function() {
	$( "#btnSearch" ).click(function(){
		console.log("버튼 눌렀다.");
		var dateFrom = document.getElementById('dateFrom'); //시작일 
		var dateTo = document.getElementById('dateTo'); //종료일 
		var today = new Date(); //오늘 날짜 
		
		dateFrom = new Date(dateFrom.value); 
		console.log("dateFrom: " + dateFrom);
		var fromYear = dateFrom.getFullYear(); 
		var fromMonth = ("0"+ (dateFrom.getMonth() + 1)).slice(-2); 
		var fromDay = ("0" + dateFrom.getDate()).slice(-2); 
		//날짜 지정을 하지 않았을 때 NaN이 발생하여 0으로 처리 
		if (isNaN(fromYear) || isNaN(fromMonth) || isNaN(fromDay)){
			fromYear = 0; fromMonth = 0; fromDay = 0; 
			alert("시작날짜를 입력해주세요.");
			return false;
			}
		dateFrom = fromYear +'-'+ fromMonth +'-'+fromDay; 
		console.log("dateFrom: " + dateFrom);
		
		dateTo = new Date(dateTo.value); 
		console.log("dateTo: " + dateTo);
		var toYear = dateTo.getFullYear(); 
		var toMonth = ("0"+ (dateTo.getMonth() + 1)).slice(-2);  
		var toDay = ("0" + dateTo.getDate()).slice(-2); 
		
		//날짜 지정을 하지 않았을 때 NaN이 발생하여 0으로 처리 
		if (isNaN(toYear) || isNaN(toMonth) || isNaN(toDay)){
			toYear = 0; toMonth = 0; toDay = 0; 
			alert("종료날짜를 입력해주세요.");
			return false;
			}
		dateTo = toYear +'-'+ toMonth +'-'+toDay; 
		console.log("dateTo: " + dateTo);
		
		if(dateTo < dateFrom) {
			alert("종료일은 시작일 이후로 선택해주세요.");
			return false;
		}
		
		//날짜 검색 시 ajax 이용
		var info = {
				'dateFrom' : dateFrom,
				'dateTo' : dateTo 
		}
		
		 $.ajax("/myCalculation", {
			data: info,
			type: "post",
			
			success: function(data) {
				//alert("성공!");
				$('#tableList').empty();
				
				var html = '';
				$.each(data, function(index, obj) {
					//alert("obj:" + obj["clsName"]);
					
					html = $( '<tr>' + '<td>' + obj["endDate"] + '</td> <td>'
							+ obj["clsName"] + '</td> <td>' + obj["paidPrice"] + "원" + '</td> <td>'
							+ obj["commission"] + "원" + '</td> <td>' + obj["netPrice"] + "원" + '</td>');
					$('#tableList').append(html);
					html += '</tr>';
				}); 
				
			}, 
			error: function() {
				alert("에러");
			}
		}); 
	});
	});//click() end  
		
	

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
           <!--  <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>  --> 
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

                <!-- Begin Page Content -->
                <div class="container-fluid">

                  
                   <!-- Page Heading -->
                   <!--  <h1 class="h3 mb-2 text-gray-800">건별 정산내역</h1> -->
                    <!-- <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p> -->

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                    <form action="/myCalculation" method="post">
                        <div class="card-header py-3" style="text-align: center; padding-bottom: 10px;">
                            <h6 class="m-0 font-weight-bold" style="font-size: 1.1em; padding-bottom: 20px;">나의 정산 예정일 </h6>
                            <h3 style="padding-bottom: 20px">클래스 완료일 + 1일</h3>
                         	
                         	<div id="dateType" >
                         		<input type="date" id="dateFrom" name="dateFrom"> &nbsp; ~ &nbsp; 
                         		<input type="date" id="dateTo" name="dateTo">
                         		<!-- <a href="#" class="btn btn-primary btn-icon-split" style="margin-right: -95px; margin-left: 30px;">
                                        <span class="icon text-white-50">
                                            <i class="fas fa-trash"></i>
                                        </span>
                                        <span class="text">검색하기</span>
                                    </a> -->

                                 <button class="btn btn-secondary" name="btnSearch" id="btnSearch" type="button" style="margin-right: -95px; margin-left: 30px;">Search</button>
                         	 </div>                        	 
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>정산예정일</th>
                                            <th>클래스명</th>
                                            <th>결제금액</th>
                                            <th>수수료</th>
                                            <th>정산금액</th>
                                            
                                        </tr>
                                    </thead>
                                  
                                    <tbody id="tableList">
                                    <c:if test="${empty calList }">
                                    	<tr>
                                    		<td colspan="5">데이터가 없습니다.</td>
                                    	</tr>
                                    	</c:if>
                                    	<c:if test="${not empty calList }">
                                    		<c:forEach var="cal" items="${calList }"> 
                                    			<tr>
		                                            <td>
		                                            	${cal.endDate }
													</td>
		                                            <td>${cal.clsName }</td>
		                                            <td>${cal.paidPrice }원</td>
		                                            <td>${cal.commission }원</td>
		                                            <td>${cal.netPrice }원</td>   
		                                        </tr>
                                    		</c:forEach>
                                    	</c:if> 
                                    </tbody>
                                </table>                               
                            </div>
                        </div>
                        </form>
                    </div>
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
		  				<p>Copyright © FITINZIPCOMPANY Co. All rights reserved. Server : 000.00.00.000</p>>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

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