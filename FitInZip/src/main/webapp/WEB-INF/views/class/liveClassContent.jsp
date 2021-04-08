<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div class="play_list_wrap">
		<div class="play_list_area mt20">
		
		<div class="class_title">오픈 예정 클래스
			<span class="subtxt gray5 ml5 mt-3 middle">퀄리티 높은 강의를 라이브홈PT로 만나보세요.</span>
		</div>
		
			<div class="play_list_type1">
				<c:if test="${empty classList }">
					<span>해당 조건에 개설된 수업이 없습니다.</span>
				</c:if>
				<c:if test="${not empty classList }">
					<ul>
						<c:forEach var="cls" items="${classList }">
							<li>
								<c:if test="${cls.reminder > 0}">
									<div class="play_box">
								</c:if>
								<c:if test="${cls.reminder < 1}">
									<div class="play_box end">
								</c:if>
									<a href="/getClassDetail?clsCode=${cls.clsCode}" data-adarea="피클_상품보기"
										class="adClick">
										<div class="play_thum">
											<div>
												<img src="${cls.thumbnailFileName }" alt="이미지" style="width: 100%;">
											</div>
											<div class="play_label"></div>
										</div>
									</a>
									<div class="play_info">
										<a href="/getClassDetail?clsCode=${cls.clsCode}" data-adarea="피클_상품보기" class="adClick">
											<div class="play_tch">
												<span>${cls.commonName} </span> <span>· ${cls.name}</span>
											</div>
											<div class="play_tit">
												<p>
													<br>${cls.clsName}</p>
												<div class="play_date2">첫 수업일
													${cls.startDate}(${cls.startYoil})</div>
												<div class="play_date2">매주 ${cls.yoil} ${cls.pm}
													${cls.startTime}</div>
												<!---->
												<div class="play_num">
													<b class="maincolor1">${cls.join}명</b> /
													${cls.maxMem}명&nbsp;&nbsp;
													<c:if test="${cls.reminder > 0}">
														<span class="label small2 round on">${cls.reminder}명 남았어요</span>
													</c:if>
													<c:if test="${cls.reminder < 1}">
														<span class="label small2 round end4">모집이 마감 됐어요</span>
													</c:if>
												</div>
												<div class="play_price">
													<span class="cost"> ${cls.totalPrice} </span>
													<div class="ct_cost">( 회당 ${cls.perPrice}원 / ${cls.lapse}회 )</div>
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
			
			
			<div class="class_title">진행중 클래스
				<span class="subtxt gray5 ml5 mt-3 middle">현재 진행중인 클래스입니다.</span>
			</div>
			
			
			<div class="play_list_type1">
				<c:if test="${empty ingList }">
					<span>해당 조건에 개설된 수업이 없습니다.</span>
				</c:if>
				<c:if test="${not empty ingList }">
					<ul>
						<c:forEach var="ing" items="${ingList }">
							<li>
								<c:if test="${ing.reminder > 0}">
									<div class="play_box">
								</c:if>
								<c:if test="${ing.reminder < 1}">
									<div class="play_box end">
								</c:if>
									<a href="/getClassDetail?clsCode=${ing.clsCode}" data-adarea="피클_상품보기"
										class="adClick">
										<div class="play_thum">
											<div>
												<img src="https://ficle-live.s3.ap-northeast-2.amazonaws.com/origin/program/2021-02-10/1612949934294525669.png"
													alt="이미지" style="width: 100%;">
											</div>
											<div class="play_label"></div>
										</div>
									</a>
									<div class="play_info">
										<a href="/getClassDetail?clsCode=${ing.clsCode}" data-adarea="피클_상품보기" class="adClick">
											<div class="play_tch">
												<span>${ing.commonName} </span> <span>· ${ing.name}</span>
											</div>
											<div class="play_tit">
												<p>
													<br>${ing.clsName}</p>
												<div class="play_date2">첫 수업일
													${ing.startDate}(${ing.startYoil})</div>
												<div class="play_date2">매주 ${ing.yoil} ${ing.pm}
													${ing.startTime}</div>
												<!---->
												<div class="play_num">
													<b class="maincolor1">${ing.join}명</b> /
													${ing.maxMem}명&nbsp;&nbsp;
													<c:if test="${ing.reminder > 0}">
														<span class="label small2 round on">${ing.reminder}명 남았어요</span>
													</c:if>
													<c:if test="${ing.reminder < 1}">
														<span class="label small2 round end4">모집이 마감 됐어요</span>
													</c:if>
												</div>
												<div class="play_price">
													<span class="cost"> ${ing.totalPrice} </span>
													<div class="ct_cost">( 회당 ${ing.perPrice}원 / ${ing.lapse}회 )</div>
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