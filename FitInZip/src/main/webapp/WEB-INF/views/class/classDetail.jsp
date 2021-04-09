<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Toastr -->
<link href="/resources/class/css/toastr.css" rel="stylesheet">
<script src="/resources/class/js/toastr.js"></script>

<link rel="stylesheet" type="text/css" href="/resources/class/css/classDetail.css">
<link rel="stylesheet" type="text/css" href="/resources/class/css/review.css">
<link rel="stylesheet" type="text/css" href="/resources/class/css/reviewModal.css">
<script>

	$(function(){
		$(".close").click(function(){
			$(".modal").fadeOut();
		});

	});

	function reviewRrite(id){
		if (id == "") {
			toastr.show('수강후기를 작성하려면 로그인이 필요합니다.');
		} else {			
			$(".modal").fadeIn();
			
		}
	};
	
	var toastr = new Toastr({
		position:'topCenter',
		animation:'slide',
		timeout: 2500
	});
	
	// 모르겠다 자바스크립트랑 제이쿼리란... ㅅㅂ
	

	$(function(){
		$("#review_btn").on("click", function() {
			alert("클릭");
			let formData = new FormData(this.form);
			let options = {
				method: "POST",
				body: new URLSearchParams(formData) 	
			}
			
			fetch("/insertReview", options)
			  .then(async function (response) {
				  let result = await response.json();
				  alert("리뷰가 작성되었습니다.");
				  location.href="/getClassDetail?clsCode=" + "${detail.clsCode}";
			  })
			  .catch(err => alert("오류가 발생 : " + err));
		});
		
		
		/* $("#wish_btn").on("click", function() {
			changeHeart();
		});	 */	
		
	});
	
	
	
	function changeHeart(id) {
		if (id == "") {
			toastr.show('위시클래스에 추가하려면 로그인이 필요합니다');
		} else {		
			
			var data = {};
	         data["clsCode"] = "${detail.clsCode}";
	           data["memId"] = "${member.id}";
			  
			
			
			$.ajax({
				type: "POST",
				url: "/clickWish",
				dataType: "json",
				data: data,
				error : function(){
	                Rnd.alert("통신 에러","error","확인",function(){});
	            },
	            success : function(result) {
	                if (result == -1){
	                    Rnd.alert("좋아요 오류","error","확인",function(){});
	                }
	                else {
	                    if (result == 1){
	                    	// 좋아요 누름
	                    	alert("result = 1");
	                        $("#btn_like").attr("style","color: #FF0066");
	                        
	                        toastr.show('위시클래스에 추가되었습니다.');
	                    }
	                    else if (result == 0){
	                    	// 좋아요 취소
	                    	alert("result = 0")
	                        $("#btn_like").attr("style","color: gray");
	                    }
	                }
	            }
			})
		}
	};
	
	function paging(nowPage, cntPerPage) {
	//	alert("두번째  파라미터 (nowPage) : " + nowPage +
	//		  "\n세번째  파라미터 (cntPerPage) : " + cntPerPage);
		$.ajax({
			url:"/reviewPaging",
			type : "post",
			data: {"clsCode" : "${detail.clsCode}", "nowPage" : nowPage, "cntPerPage" : cntPerPage},
			success : function(data){
                /* console.log(data); */
                /* alert("data : " + data); */
                $('#review_wrap').html(data); // 성공 시, body부분에 data라는 html 문장들을 다 적용시킵니다. 
            },
            error : function(data){
                alert('error');
            } // error
		})
	};
	
	
	// 토글
	 $(document).on('click','.table_basic_list ul li', function() {
        $(this).toggleClass('on').siblings().removeClass('on');
        $(this).find('.bottombox').slideToggle();
        $(this).siblings().find('.bottombox').slideUp();
    });
	
	
</script>

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
														<b><fmt:formatNumber value="${detail.totalPrice}"/></b>원
													</span>
													<div class="ct_cost">(회당 ${detail.perPrice}원/${detail.lapse}회)</div>
												</div>
												<div class="price right">
												<span class="middle" id="wish_btn" style="cursor: pointer;" onclick='changeHeart("${member.id}")'>
													<a class="btn_share ml10 adClick">
													
														<c:choose>
															<c:when test="${isWish == 1}"> <!-- isWish가 1이면 빨간 하트-->
														        <i id="btn_like" class="fas fa-heart fa-2x" style="color: #FF0066"></i>
														    </c:when>
															<c:otherwise> <!-- isWish가 0이면 빈하트-->
														        <i id="btn_like" class="fas fa-heart fa-2x" style="color: gray"></i>
														    </c:otherwise>
														</c:choose>		
														
													</a>
													<p class="font13 black" style="margin-bottom: 0px;">wish</p>
												</span>
												</div>
											</div>
											<div>
											
											<c:if test="${detail.reminder > 0}">
												<a data-adarea="피클_클래스 신청하기" class="btn_basic full big2 radius mainback1 mt0 relative adClick" style="cursor:pointer;" href="/livePTPay">
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
											<img src="${detail.titleFileName }" alt="이미지">
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
																	<p>${detail.yoil}
																		<small>(${detail.startTime} ~ ${detail.endTime})</small>
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
																<img src="${detail.memFileName}" alt="강사이미지">
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
												<a href="javascript:;" class="btn_text2 font15 maincolor1 fr mt10" id="modal_btn" onclick='reviewRrite("${member.id}")'>리뷰쓰기</a>
												
												<!-- 여기부터 모달모달~~ -->
												<div class="modal">					
													<div class="layout_popup pop_w660">
														<div class="pop_wrap">
															<div data-adarea="피클_팝업닫기" class="close adClick">
																<a>
																	<img src="https://img.ficle.io/www/common/icon/btn_pop_close.png" alt="닫기">
																</a>
															</div>
															<div class="contents_w">
																<div class="pop_cont_wrap">
																	<div class="layout_w100">
																		<div class="tit">리뷰작성</div>
																	</div>
																	<div class="layout_w100">
																		<form>
																			<div class="write_area">
																				<p class="maintxt" style="margin: 0;">${detail.clsName}</p>
																				<span class="subtxt1">with. ${detail.name}</span>
																			</div>
																			<div class="write_area">
																				<span class="subtxt2" style="position: relative; top: -52px;">클래스는 어떠셨나요?</span>
																				<div class="rating" style='display: inline-block; position: relative; top: -27px;'>
																					<input type="radio" id="star5" name="star" value="5"/><label class = "full" for="star5"></label>
																				    <input type="radio" id="star4" name="star" value="4"/><label class = "full" for="star4"></label>
																				    <input type="radio" id="star3" name="star" value="3"/><label class = "full" for="star3"></label>
																				    <input type="radio" id="star2" name="star" value="2"/><label class = "full" for="star2"></label>
																				    <input type="radio" id="star1" name="star" value="1"/><label class = "full" for="star1"></label>
																				</div>
																			</div>
																			<div class="btn_search cont" style="position: relative; top: -50px;">
																				<textarea id="contents" name="reviewContent" placeholder="클래스를 참여하며 느꼈던 점들을 작성해주세요. 다른분들께 큰 도움이 됩니다 :)" style="resize: none;"></textarea>
																			</div>
																			<div class="btn_wrap flat mt40">
																				<input type="hidden" name="trainerId" value="${detail.trainerId}">
																				<input type="hidden" name="clsCode" value="${detail.clsCode}">
																				<input type="hidden" name="memId" value="${member.id}">
																			
																				<input type="button" id="review_btn" class="adClick review_btn type4" style="position: relative; top: -20px;" value="리뷰등록">
																			</div>
																		</form>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												
												<!-- 모달 끝 -->
											</div>
											<div id="review_wrap">
											<!-- 리뷰 -->
											<%@ include file="review.jsp"%>
											</div>
										</div>
										
										
										
										<div id="area04" class="content_area">
											<div class="maintxt2">FAQ</div>
											<div class="table_basic_list list2">
												<ul>
													<li class>
														<div class="topbox">
															<span class="num">1</span>
															<p>
																<span class="tit">OO이 아픈데 운동을 얼마나 하면 나아질까요? </span>
															</p>
														</div>
														<div class="bottombox" style="display: none;">사실, 누구도 장담할 순 없습니다. 치료와 운동 이전에 평소에 증상을 악화시키는 습관을 제거해주시는 게 1번입니다.</div>
													</li>
													<li class>
														<div class="topbox">
															<span class="num">1</span>
															<p>
																<span class="tit">교정운동을 하면서 통증이 발생하는데 어떻게 해야할까요? </span>
															</p>
														</div>
														<div class="bottombox" style="display: none;">통증이 나타난다고 무조건 나쁜 상태인 것은 아닐 수도 있습니다. 정상적인 체형분석과정을 통한 솔루션이라면 교정이 되는 과정에서 불편감이나 통증이 일시적으로 증가할 수도 있습니다. 단, 꼭 전문가와 정기적인 확인/피드백 과정이 필요합니다.</div>
													</li>
													<li class>
														<div class="topbox">
															<span class="num">1</span>
															<p>
																<span class="tit">얼마나 자주 운동해야 할까요? </span>
															</p>
														</div>
														<div class="bottombox" style="display: none;">운동의 강도와 빈도는 사람에 따라 굉장히 많은 차이를 보입니다. 평소 생활패턴이 너무 안좋으신 분들은 엄청난 강도와 빈도로 해도 제자리인 경우도 있지요. 가벼운 정도라면 매일 하셔도 되지만 몸이 변하고 있는지 중간 점검이 꼭 필요합니다!</div>
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
	<!-- Footer -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>