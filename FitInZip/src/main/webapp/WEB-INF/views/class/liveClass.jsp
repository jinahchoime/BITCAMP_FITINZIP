<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="/resources/class/css/liveClass.css">
</head>
<body>

	<jsp:include page="../nav.jsp"></jsp:include>

	<div id="container">
		<c:if test="${empty classList }">
			<tr>
				<td colspan="5" class="center">해당 조건에 개설된 수업이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${not empty classList }">
			<c:forEach var="class" items="${classList }">
				<div class="play_box">
					<a href="/play/play_apply/203" data-adarea="피클_상품보기" class="adClick">
						<div class="play_thum">
							<div>
								<img src="" alt="이미지" style="width: 100%;">
							</div>
							<div class="play_label"></div>
						</div>
					</a>
					<div class="play_info">
						<a href="/play/play_apply/203" data-adarea="피클_상품보기" class="adClick">
							<div class="play_tch">
								<span>카테고리</span>
								<span>${class.name}</span>
							</div>
							<div class="play_tit">
								<p>클래스 네임</p>
								<div class="play_date2">첫 수업일</div>
								<div class="play_date2">요일 / 시간</div>
								<!---->
								<div class="play_num">
									<b class="maincolor1">신청한 인원</b>
									 / 수강최대인원&nbsp;&nbsp;
									 <span class="label small2 round on">2명 남았어요!</span>
									 <span class="label small2 round end4" style="display: none;">모집이 마감 됐어요</span>
								</div>
								<div class="play_price">
									<span class="cost">
									120,000
									</span>
									<div class="ct_cost">(회당 10,000원/12회)</div>
								</div>
							</div>
						</a>
					</div>
				</div>
			</c:forEach>
		</c:if>
	</div>
</body>
</html>