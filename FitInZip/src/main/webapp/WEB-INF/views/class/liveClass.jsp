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
	<div id="live_list" class="contents_wrap pt80">
	<div class="play_list_wrap">
	<div class="play_list_area mt20">
	<div class="play_list_type1">
		<c:if test="${empty classList }">
			<span>해당 조건에 개설된 수업이 없습니다.</span>
		</c:if>
		<c:if test="${not empty classList }">
			<ul>
				<c:forEach var="cls" items="${classList }">
					<li>
						<div class="play_box">
							<a href="/play/play_apply/203" data-adarea="피클_상품보기" class="adClick">
								<div class="play_thum">
									<div>
										<img src="https://ficle-live.s3.ap-northeast-2.amazonaws.com/origin/program/2021-02-10/1612949934294525669.png" alt="이미지" style="width: 100%;">
									</div>
									<div class="play_label"></div>
								</div>
							</a>
							<div class="play_info">
								<a href="/play/play_apply/203" data-adarea="피클_상품보기" class="adClick">
									<div class="play_tch">
										<span>${cls.commonName}</span>
										<span>· ${cls.name}</span>
									</div>
									<div class="play_tit">
										<p><br>${cls.clsName}</p>
										<div class="play_date2">첫 수업일 ${cls.startDate}(${cls.startYoil})</div>
										<div class="play_date2">매주 ${cls.yoil} ${cls.pm} ${cls.startTime} </div>
										<!---->
										<div class="play_num">
											<b class="maincolor1">신청한 인원</b>
											 / ${cls.maxMem}명&nbsp;&nbsp;
											 <span class="label small2 round on">2명 남았어요!</span>
											 <span class="label small2 round end4" style="display: none;">모집이 마감 됐어요</span>
										</div>
										<div class="play_price">
											<span class="cost">
											${cls.totalPrice}
											</span>
											<div class="ct_cost">(회당 ${cls.perPrice}원/${cls.lapse}회)</div>
										</div>
									</div>
								</a>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</c:if>
	</div>
	</div>
	</div>
	</div>
	</div>
</body>
</html>