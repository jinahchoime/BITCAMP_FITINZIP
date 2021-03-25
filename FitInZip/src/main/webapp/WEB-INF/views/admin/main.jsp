<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>Insert title here</title>

<link rel="stylesheet"href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"crossorigin="anonymous">
<!-- Our Custom CSS -->
<link rel="stylesheet" href="../resources/admin/css/style5.css">
<!-- Font Awesome JS -->
<script defersrc="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"crossorigin="anonymous"></script>
<script defersrc="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"crossorigin="anonymous"></script>
<!-- bbs -->
<link rel="stylesheet" href="../resources/admin/css/bbs.css">
<link rel="stylesheet" href="../resources/admin/js/bbs.js">




</head>

<body>

	<div class="wrapper">
		<!-- Sidebar Holder -->
		<nav id="sidebar">
			<div class="sidebar-header">
				
				<h3 class="text-center">오늘머신</h3>
				<h3 class="text-center">코딩하누</h3>
			</div>

			<ul class="list-unstyled components">
				<li class="active">
					<li><a href="#homeSubmenu"
					data-toggle="collapse" aria-expanded="false"
					class="dropdown-toggle">승인
					</a></li>
					<ul class="collapse list-unstyled" id="homeSubmenu">
						<li><a href="#">가입 신청</a></li>
						<li><a href="#">강의 신청</a></li>
					</ul></li>
					
					<li>
					<a href="#pageSubmenu"
					data-toggle="collapse" aria-expanded="false"
					class="dropdown-toggle">통계
					</a></li>
					<ul class="collapse list-unstyled" id="pageSubmenu">
						<li><a href="#">인적통계</a></li>
						<li><a href="#">물적통계</a></li>
					</ul></li>
					
					<li><a href="#admin"
					data-toggle="collapse" aria-expanded="false"
					class="dropdown-toggle">관리
					</a></li>
					<ul class="collapse list-unstyled" id="admin">
						<li><a href="#">주소추가</a></li>
						<li><a href="#">Home 2</a></li>
						<li><a href="#">Home 3</a></li>
					</ul></li>
				<!-- 
				<li><a href="#">About</a> 
				<li><a href="#">Portfolio</a></li>
				<li><a href="#">Contact</a></li>
				-->
			</ul>
<!-- 
			<ul class="list-unstyled CTAs">
				<li><a
					href="https://bootstrapious.com/tutorial/files/sidebar.zip"
					class="download">Download source</a></li>
				<li><a href="https://bootstrapious.com/p/bootstrap-sidebar"
					class="article">Back to article</a></li>
			</ul>
			
-->		
		</nav>

		<!-- Page Content Holder -->
		<div id="content">

			<nav class="navbar navbar-expand-lg navbar-light bg-light">
				<div class="container-fluid">

					<button type="button" id="sidebarCollapse" class="navbar-btn">
						<span></span> <span></span> <span></span>
					</button>
					<button class="btn btn-dark d-inline-block d-lg-none ml-auto"
						type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<i class="fas fa-align-justify"></i>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="nav navbar-nav ml-auto">
							<li class="nav-item active"><a class="nav-link" href="#">Page</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="#">Page</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Page</a></li>
							<li class="nav-item"><a class="nav-link" href="#">Page</a></li>
						</ul>
					</div>
				</div>
			</nav>

			<div>
			<jsp:include page="bbs.jsp"></jsp:include>
			</div>
			
			<div class="line"></div>

			<h2>Lorem Ipsum Dolor</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
				do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
				enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
				ut aliquip ex ea commodo consequat. Duis aute irure dolor in
				reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
				pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
				culpa qui officia deserunt mollit anim id est laborum.</p>

			<div class="line"></div>

			<h2>Lorem Ipsum Dolor</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
				do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
				enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
				ut aliquip ex ea commodo consequat. Duis aute irure dolor in
				reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
				pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
				culpa qui officia deserunt mollit anim id est laborum.</p>

			<div class="line"></div>

			<h3>Lorem Ipsum Dolor</h3>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
				do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
				enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
				ut aliquip ex ea commodo consequat. Duis aute irure dolor in
				reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
				pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
				culpa qui officia deserunt mollit anim id est laborum.</p>
				
		</div>
	</div>
	

	<!-- jQuery CDN - Slim version (=without AJAX) -->
	<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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

	<script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
                $(this).toggleClass('active');
            });
        });
    </script>

</body>
</html>