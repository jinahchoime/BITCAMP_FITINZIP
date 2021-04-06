<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="area03" class="content_area">
	<div class="maintxt2">
		수강후기
		<a href="javascript:;" class="btn_text2 font15 maincolor1 fr mt10" id="modal_btn" onclick='reviewRrite("${member.id}")'>리뷰쓰기</a>
		
		<!-- 여기부터 모달모달~~ -->
		<div class="modal">					
			<div class="layout_popup pop_w660">
				<div class="pop_wrap">
					<div data-adarea="피클_팝업닫기" class="close adClick">
						<a href="javascript:;">
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
	<div class="table_basic_list list3 review_wrap">
		<c:if test="${empty review }">
			<span>작성된 후기가 없습니다.</span>
		</c:if>
		<c:if test="${not empty review }">
			<ul>
				<c:forEach var="review" items="${review }">
					<li>
						<div class="leftbox">
							<div class="review_nm">
								<div class="login_thum middle">
									<span>
										<!---->
									</span>
								</div>
								<span class="middle">${review.nickName}</span>
								<div class="star_group small ml5">
									<c:forEach begin="1" end="${review.star}">
									    <span class="on">1</span>
									</c:forEach>
								</div>
							</div>
							<div class="review_txt">
								${review.reviewContent}
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
		</c:if>	
		
		
		<div style="display: block; text-align: center;">		
			<c:if test="${paging.startPage != 1 }">
				<a href="/boardList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<b>${p }</b>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<a href="/getClassDetail?clsCode=${detail.clsCode}&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a href="/getClassDetail?clsCode=${detail.clsCode}&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
			</c:if>
		</div>
		
		
																					
	</div>
</div>