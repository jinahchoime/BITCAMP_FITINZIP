<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link rel="stylesheet" type="text/css" href="/resources/class/css/classDetail.css">
</head>
<body>
	<jsp:include page="../nav.jsp"></jsp:include>
	<div id="container">
		<div class="contents clearfix" id="contents">
			<div id="viewArea">
				<div>
					<div id="all" class="all_wrap" style="position: relative;">
						<div id="first_area" class="main_top pt40">
							<div class="contents_wrap">
								<div class="contents_wrap_type2">
									<div class="wad_apply_area" style="position: fixed; top: 148px; bottom: auto; right: 50%; margin-right: -560px;">
										<div class="wad_apply">
											<div class="tag_area">
												<span class="label start">${detail.startMonth}.${detail.startDay } ${detail.startYoil } 시작</span>
												<span class="label week">${detail.week}주 과정</span>
											</div>
											<div class="wad_tch">
												<span>${detail.commonName }</span>
												<span>· ${detail.name}</span>
											</div>
											<p>${detail.clsName}</p>
											<div class="tag_area">
												<span class="label text">${detail.clsTag}</span>
											</div>
											<ul class="wad_info flat mb30">
												<li>기간 : ${detail.year}.${detail.startMonth}.${detail.startDay} ~ ${detail.endDate}</li>
												<li>요일 : ${detail.yoil}</li>
												<li>시간 : ${detail.pm} ${detail.startTime} ~ ${detail.endTime}</li>
												<li>회차 : 총 ${detail.lapse}회 수업</li>
												<li>성별 : 남녀누구나</li>
												<li>
												정원 : <b class="maincolor1">${detail.join}명</b> / ${detail.maxMem}명
												</li>
											</ul>
											<div class="price_area mb30">
												<div class="price bottom">
													<!---->
													<span class="fns_price">
														<b>${detail.totalPrice}</b>원
													</span>
													<div class="ct_cost">(회당 ${detail.perPrice}원/${detail.lapse}회)</div>
												</div>
												<div class="price right">
												<span class="middle">
													<a href="javascript:;" data-adarea="피클_공유하기" class="btn_share ml10 adClick">
														<i class="fas fa-heart fa-2x"  style="color:#FF0066"></i>
													</a>
													<p class="font13 black" style="margin-bottom: 0px;">wish</p>
												</span>
												</div>
											</div>
											<div>
											
											<c:if test="${detail.reminder > 0}">
												<a href="javascript:;" data-adarea="피클_클래스 신청하기" class="btn_basic full big2 radius mainback1 mt0 relative adClick">
												클래스 신청하기
												</a>
											</c:if>
											<c:if test="${detail.reminder < 1}">
												<div class="fns_time mb5">
													<div class="time_area area diff">
														<span class="font12">
															<b class="font14 black">관심 버튼을 누르면 재모집 시 안내를 드려요.</b>
														</span>
													</div>
												</div>
												<div data-adarea="피클_마감" class="btn_basic full big2 radius mt0 bg_gray3 adClick">마감한 클래스입니다.</div>
												</c:if>	
												
											</div>
										</div>
									</div>
								</div>
								<div class="play_list_type1">
									<div class="play_box">
										<!---->
										<div class="play_grid2">
											<img src="resources/class/img/detail.png" alt="이미지">
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="layout_h80"></div>
						
						<div class="main_cont">
							<div class="contents_wrap">
							<div id="tab" class="table_basic_tab tab1" style="width: 740px; top: 0px;">
								<ul>
									<li class="on">
										<a href="javascript:;" onclick="BsJs_scroll('area01')">
											<span>클래스소개</span>
										</a>
									</li>
								</ul>
							</div>
								<div class="contents_wrap_type2">
									<div id="area01" class="content_area">
										<div class="wad_area">
											<div class="homet_program">
												<ul class="clearfix">
													<li>
														<div class="homet_box">
															<div class="center">
																<div>
																	<p>${detail.clsLevel}급</p>
																</div>
																<span>난이도</span>
															</div>
														</div>
													</li>
													<li>
														<div class="homet_box">
															<div class="center">
																<div>
																	<p>다시보기 제공</p>
																</div>
																<span>VOD</span>
															</div>
														</div>
													</li>
													<li>
														<div class="homet_box">
															<div class="center">
																<div>
																	<p>${detail.equip}</p>
																</div>
																<span>준비물</span>
															</div>
														</div>
													</li>
													<li>
														<div class="homet_box">
															<div class="center">
																<div>
																	<p>중급
																		<small>(07:00 ~ 07:50)</small>
																	</p>
																</div>
																<span>진행시간</span>
															</div>
														</div>
													</li>
												</ul>
											</div>
										</div>
										<div class="wad_area">
											<div class="subtxt2 gray5 mt10">
												${detail.clsInfo}
											</div>
										</div>
										<div class="wad_area">
											<div class="subtxt2 gray5 mt10">
												<div class="small_text">${detail.startMonth}월 ${detail.startDay}일 시작!</div>
												${detail.curriculum}
											</div>
										</div>
										<div id="area02" class="content_area">
											<div class="maintxt2">강사소개</div>
											<div class="wad_area">
												<div class="coach_wrap">
													<div class="coach_info">
														<div class="coach_img">
															<span>
																<img src="https://ficle-live.s3.ap-northeast-2.amazonaws.com/origin/program/2021-01-04/1609724756088852626.jpg" alt="강사이미지">
															</span>
														</div>
														<div class="nm">본 클래스는 ${detail.name} 선생님과 함께합니다.</div>
													</div>
													<div class="coach_txt">
														${detail.trainerIntro}
														<br>
														<br>
														<font size="3">
															<b>자격 및 경력</b>
															<br>
														</font>
														<font size="2" class="gray_text">
															${detail.career}
														</font>
													</div>
												</div>
											</div>
										</div>
										<div id="area03" class="content_area">
											<div class="maintxt2">
												수강후기
												<a href="javascript:;" class="btn_text2 font15 maincolor1 fr mt10">리뷰쓰기</a>
											</div>
											<div class="table_basic_list list3 review_wrap">
												<ul>
													<li>
														<div class="leftbox">
															<div class="review_nm">
																<div class="login_thum middle">
																	<span>
																		<!---->
																	</span>
																</div>
																<span class="middle">혜원</span>
															</div>
														</div>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>