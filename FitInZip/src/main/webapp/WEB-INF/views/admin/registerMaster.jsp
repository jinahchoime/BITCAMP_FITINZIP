<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	type="text/javascript"></script>

<!-- Bootstrap CSS CDN -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">
<!-- bbs -->
<link rel="stylesheet" href="../resources/admin/css/bbs.css">
<link href="../resources/admin/js/bbs.js">

<!-- MainSidebar -->
<link rel="stylesheet" href="../resources/admin/css/style5.css">


<!-- Font Awesome JS -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
	integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
	crossorigin="anonymous"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
	integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
	integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
	integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc"
	crossorigin="anonymous"></script>

<!-- Popper.JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
	integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
	crossorigin="anonymous"></script>
<!-- Bootstrap JS -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
	integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
	crossorigin="anonymous"></script>
<!-- MainSidebar -->
<link rel="stylesheet" href="../resources/admin/css/style5.css">


<style type="text/css">
.modal-backdrop {
	background-color: transparent !important;
	position: absolute;
	z-index: -1;
}

.theadWidth {
	width: 100px;
}

.title1 {
	text-align: center;
	font-weight: 800;
	font-size: 20px;
	color: #fff;
	text-transform: uppercase;
}

.h700 {
	height: 700px;
}


.dropbtn {
    background-color: #6c757d00;
    color: white;
    padding: 5px;
    font-size: 14px;
    border: none;
    cursor: pointer;
    border-radius:8px;
    font-family: 'Roboto', sans-serif;
    font-weight: 900;
}

.dropbtn2{
    background-color: #6c757d00;
    color: black;
    padding: 5px;
    font-size: 14px;
    border: none;
    cursor: pointer;
    font-family: 'Roboto', sans-serif;
    font-weight: 900;
    padding-left: 80px;
    padding-right: 80px;
    width:230px;

}


/* Dropdown button on hover & focus */
.dropbtn:hover, .dropbtn:focus {
    background-color: #ff4500;
}

.dropbtn2:hover, .dropbtn2:focus {
    background-color: #ff4500;
    color: white;
    width:230px;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
    position: relative;
    display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
}

/* Links inside the dropdown */
.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {background-color: #f1f1f1}

/* Show the dropdown menu (use JS to add this class to the .dropdown-content container when the user clicks on the dropdown button) */
.show {display:block;}

</style>



</head>

<body>


	<div class="wrapper">
		<!-- Sidebar Holder -->
		<jsp:include page="mainSideBar.jsp"></jsp:include>

		<!-- Page Content Holder -->
		<div id="content" style='padding-top: 20px' id="navconvert">
			<!-- NavBar  -->
			<jsp:include page="mainNavBar.jsp"></jsp:include>


			<div>
				<!-- 가입승인게시판 -->
				<section>
					<!--for demo wrap-->
					<h1 class="title1" style="padding-top: 25px; padding-bottom: 15px;">강사
						가입 승인 요청 LIST</h1>
					<div class="tbl-header">
						<table cellpadding="0" cellspacing="0" border="0">
							<thead>
								<tr style="text-align: center;">
									<th>아이디</th>
									<th>이름</th>
									<th>성별</th>
									<th>생년월일</th>
									<th>승인여부</th>
									<th class="theadWidth">
										<div class="dropdown">
											<button onclick="myFunction()" class="dropbtn">정렬 ▼</button>
											<div id="myDropdown" class="dropdown-content">
												<button onclick="allList()" class="dropbtn2">전체조회</button>	
												<button onclick="allList('RS00')" class="dropbtn2">승인대기중</button>	
												<button onclick="allList('RS01')" class="dropbtn2">승인완료</button>	
												<button onclick="allList('RS02')" class="dropbtn2">승인거절</button>	
											</div>
										</div>
									</th>

								</tr>
							</thead>
						</table>
					</div>
					<div class="tbl-content h700">
						<table cellpadding="0" cellspacing="0" border="0">
							<tbody id="getList">
								<%@ include file="registerMasterPart.jsp"%>
							</tbody>

						</table>
					</div>
				</section>
			</div>


		</div>
	</div>




	<script type="text/javascript">
		$(document).ready(function() {
			$('#sidebarCollapse').on('click', function() {
				$('#sidebar').toggleClass('active');
				$(this).toggleClass('active');
			});
		});
	</script>
	<script>
		function changeSt(btn) {
			let id = btn.parentElement.parentElement.firstElementChild.textContent;
			$.ajax({
				url : "bbs1Modal",
				type : "GET",
				dataType : "json",
				data : {
					id : id
				},
				success : function(data) {
					data.forEach(function(element) {
						makeModalData(element);
					})

				},
				error : function() {
					alert("짜쓰~" + error);
				}
			});

			function makeModalData(data) {
				$('#exampleModalLabel').html(data.name+" 강사님");
				$('#modalBody').html(data.id);
				$('#modalBody2').html(data.phone);
				$('#modalBody3').html(data.gender);
				$('#modalBody4').html(data.birth);
				$('#modalBody5').html(data.trainerIntro);
				$('#modalBody6').html(data.career);
				$('#modalBody7').html(data.questionFirst);
				$('#modalBody8').html(data.questionSecond);
				$('#modalBody9').html(data.registerDate);
			}
		}

		function approveTrainer() {
			let id = document.getElementById('modalBody').value;
			let btnId = document.getElementById('btnResult1').innerHTML

			$.ajax({
				url : "approveTrainer",
				type : "post",
				dataType : "json",
				data : {
					id : id,
					btnId : btnId
				},
				success : function(data) {
					console.log("승인이 완료 되었습니다.");
					window.location.href = "registerMaster";

				},
				error : function() {
					alert("실패 : " + error);
				}
			});
		}

		function rejectTrainer() {
			let id = document.getElementById('modalBody').value;
			let btnId = document.getElementById('btnResult2').innerHTML

			$.ajax({
				url : "rejectTrainer",
				type : "post",
				dataType : "json",
				data : {
					id : id,
					btnId : btnId
				},
				success : function(data) {
					console.log("승인이 거절 되었습니다.");
					window.location.href = "registerMaster";

				},
				error : function() {
					alert("실패 : " + error);
				}
			});
		}
	
		function allList(key){
			
			
			$.ajax({
				url : "allListRM",
				type : "post",
				data : {key : key},
				success : function(data) {
					console.log(data);
					$('#getList').html(data);
				},
				error : function() {
					alert("실패 : ");
				}
			});
		}
	</script>
<script>
/* When the user clicks on the button,
toggle between hiding and showing the dropdown content */
function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}

// Close the dropdown menu if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {

    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}


</script>


	<!-- modal창 설정  -->
	<div class="modal fade" id="exampleModal" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">님</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
				<%@ include file="listModalRM.jsp"%>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btnResult1"
						onclick="approveTrainer();">승인완료</button>
					<button type="button" class="btn btn-secondary" id="btnResult2"
						onclick="rejectTrainer();">승인거부</button>

				</div>
			</div>
		</div>
	</div>
	<!-- modal창 설정 끝 -->

</body>
</html>
