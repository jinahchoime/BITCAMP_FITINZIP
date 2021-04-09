<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Sidebar Holder -->
<nav id="sidebar">
	<div class="sidebar-header" id="injecthover">
		<a href ="/adminMain">
		<h3 class="text-center" style="
    	height: 99px;
    	padding-top: 34px;
    	font-size: 39px">FitIn.Zip</h3>
		</a>
	</div>

	<ul class="list-unstyled components">
		<li class="active">
		<li><a href="#homeSubmenu" data-toggle="collapse"
			aria-expanded="false" class="dropdown-toggle">승인</a></li>
		<ul class="collapse list-unstyled" id="homeSubmenu">
			<li><a href="/registerMaster">가입 신청</a></li>
			<li><a href="/classMaster">강의 신청</a></li>
		</ul>
		</li>

		<li><a href="#pageSubmenu" data-toggle="collapse"
			aria-expanded="false" class="dropdown-toggle">통계 </a></li>
		<ul class="collapse list-unstyled" id="pageSubmenu">
			<li><a href="/subMainPrice">물적통계</a></li>
			<li><a href="#">인적통계</a></li>
		</ul>
		</li>

		<li><a href="#admin" data-toggle="collapse" aria-expanded="false"
			class="dropdown-toggle">관리 </a></li>
		<ul class="collapse list-unstyled" id="admin">
			<li><a href="/searchMap">주소추가</a></li>
		</ul>
		</li>
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
