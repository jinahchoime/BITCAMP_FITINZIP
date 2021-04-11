<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
 
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

<style>
	button: disabled { background: #fee; border: 0;}
</style>
	<script type="text/javascript"></script>
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  	<script>	

	 $(function() {
		$.ajax("/classData", {
			contentType: "application/json; charset=UTF-8;",
			
			success: function(data) {
				//alert("성공");
				var html = "";
				var button = "";
				console.log(data);
				
				if(data.length == 0) {
					alert("데이터가 없습니다.");
					html  += '<tr> <td colspan="2" class="none">진행중인 클래스가 없습니다.</td></tr>';
					$('#tableList').html(html);
				}
				
				for(var i = 0; i < data.length; i++) {
					var Now = new Date();
					var nowYear = Now.getFullYear();
					var nowMonth = Now.getMonth(); // 월
					var nowDay = Now.getDate(); // 일
					var nowHour = Now.getHours(); // 시
					var nowMins = Now.getMinutes(); // 분
					
					var week = new Array('일', '월', '화', '수', '목', '금', '토'); //요일
					var days = week[Now.getDay()]; //오늘 요일
					
					var yoil = (data[i].yoil).split(','); //클래스 요일
					console.log("요일: " + yoil);
					
					for(var j = 0; j < (data[i].yoil).split(',').length; j++) {
						var clsYoil = yoil[j]; //클래스 요일
						/* var clsStartYear = new Date(data[i].startDate).getFullYear();//클래스 시작 년
						var clsEndYear = new Date(data[i].endDate).getFullYear(); //클래스 끝 년
						var clsStartMonth = new Date(data[i].startDate).getMonth(); //클래스 시작 달
						var clsEndMonth = new Date(data[i].endDate).getMonth(); //클래스 끝 달
						var clsStartDate = new Date(data[i].startTime).getDate(); //클래스 시작일
						var clsEndDate = new Date(data[i].endDate).getDate(); //클래스 종료일 */
						var clsStartHour = new Date(data[i].startTime).getHours(); //클래스 시작시간
						var clsEndHour = new Date(data[i].endTime).getHours(); //클래스 끝 시간
						var clsStartMin = new Date(data[i].startTime).getMinutes(); //클래스 시작 분
						var clsEndMin = new Date(data[i].endTime).getMinutes(); //클래스 끝 분
						console.log("clsStartHour: " + clsStartHour);
						console.log("clsEndHour: " + clsEndHour);
						console.log("clsStartMin: " + clsStartMin);
						console.log("clsEndMin: " + clsEndMin);
						console.log("nowMonth: " + nowMonth);
						
						
						function pluszero(time){
						    var time = time.toString(); // 시간을 숫자에서 문자로 바꿈
						    if(time.length < 2){ //2자리 보다 작다면
						        time = '0' + time; //숫자앞 0을 붙여줌
						        return time; //값을 내보냄
							} else {
						    return time; //2자리라면 값을 내보냄
							}
						}
						/* clsStartYear = pluszero(clsStartYear);
						clsEndYear = pluszero(clsEndYear);
						clsStartMonth = pluszero(clsStartMonth); //만들었던 함수 적용
						clsEndMonth = pluszero(clsEndMonth);
						clsStartDate = pluszero(clsStartDate);
						clsEndDate = pluszero(clsEndDate); */
						nowYear = pluszero(nowYear);
						nowMonth = pluszero(nowMonth);
						nowDay = pluszero(nowDay);
						clsStartHour = pluszero(clsStartHour);
						clsEndHour = pluszero(clsEndHour);
						clsStartMin = pluszero(clsStartMin);
						clsEndMin = pluszero(clsEndMin); 
					
						
						
						if(clsYoil == days) {
							var compareTime = new Date(nowYear, nowMonth, nowDay, clsStartHour, clsStartMin); //시작시간
							var endCompareTime = new Date(nowYear, nowMonth, nowDay, clsEndHour, clsEndMin); // 끝나는시간
							console.log("endCompareTime: " + endCompareTime);
							//시작시간 15분 전
							var finalTime = compareTime.setMinutes(compareTime.getMinutes() - 15);
			
							//지금 시간이 시작시간 15분 전보다 덜남거나 끝나는 시간이 지금 시간보다 이전일 때
							if((finalTime <= new Date().getTime()) && (new Date().getTime() < endCompareTime.getTime())) {
								console.log("new Date().getTime(): " + new Date().getTime());
								console.log("endCompareTime.getTime(): " + endCompareTime.getTime());
								//버튼 활성화
								button = '<button type="button" class="btn btn-primary" id="cls_button" onclick="meet(\'' + data[i].meetUrl + '\')">시작</button>';
								console.log("url1:" + data[i].meetUrl);
								break;
							} else {
								//버튼 비활성화
								button = '<button type="button" class="btn btn-primary" onclick="meet(\'' + data[i].meetUrl + '\')" id="cls_button" disabled>시작 </button>';
								
							}
							
						} else {
							button = '<button type="button" class="btn btn-primary" onclick="meet(\'' + data[i].meetUrl + '\')" id="cls_button" disabled>시작 </button>';
							
						}
					
					}
					html += '<tr><td class="type_diff"><div class="list_img"><img src="' + data[i].thumbnailFileName +'" alt="클래스썸네일">';
 					html += '</div><div class="list_txt full"> <dl class="prod_infor"> <dt style="margin-bottom: 70px; margin-top: 10px;"> <div class="play_tch" style="margin-bottom: 5px;">';
 					html += '<span>' + data[i].clsCategory + '</span> <div class="clsName" style="margin-top: 20px;">';
 					html +=  data[i].clsName + '</div></dt> <dd class="mt5" style="font-size: 14px; margin-bottom: 20px;"> <div style="margin-bottom: 10px;">' + data[i].startDate;
 					html += '~' + data[i].endDate + '</div>' + data[i].yoil;
 					html += clsStartHour + ':' + clsStartMin + '~' + clsEndHour + ':' + clsEndMin + '</dd>';
 					html += '<dd style="color: black; font-weight: 400; font-size: 12px; font-weight: bold;">'; 
 					
 					for(var j = 0; j < data[i].list.length; j++) {
 						html += data[i].list[j] + ' ';	
					};
					
 					html += '</dd></dl></div></a></td><td>';
 					html += button;
 					html += '</td> </tr>'; 					
				}
				$('#tableList').html(html);
				
			}, error: function() {
				alert("에러 발생");
			}
		});
		
		
	});
	  
	function meet(url){
		location.href = url;
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
                    <!-- <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button> -->

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
					<div id="viewArea" class="column_right" style="text-align: center; margin-top: 15%;">
				    	
				    	<div id="signout">
				    	<img src="../resources/trainer/img/trainerSignout.png" style="width:200px; height:200px;">
					<div id="content">
						<p style="font-size: 20px; margin-bottom: 40px;">강사님! 회원탈퇴는 FITIN.ZIP 관리자(8282)에게 직접 연락해주세요.</p>
					</div>
					<button type="submit" onclick="history.back(-1)" class="btn btn-primary">뒤로가기</button>
					</div>
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
		  				<p>Copyright © FITINZIPCOMPANY Co. All rights reserved. Server : 000.00.00.000</p>
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


</body>

</html>