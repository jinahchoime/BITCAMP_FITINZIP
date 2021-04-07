<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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


<div class="num" style="display: block; text-align: center;">		
	<c:if test="${paging.startPage != 1 }">
		<a onclick="paging('${paging.startPage - 1 }','${paging.cntPerPage}')">	
			<i class="fas fa-chevron-left"></i>
		</a>
	</c:if>
	<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
		<c:choose>
			<c:when test="${p == paging.nowPage }">
				<a class="on">${p }</a>
			</c:when>
			<c:when test="${p != paging.nowPage }">
				<a onclick="paging('${p }','${paging.cntPerPage}')">${p }</a>
			</c:when>
		</c:choose>
	</c:forEach>
	<c:if test="${paging.endPage != paging.lastPage}">
		<a onclick="paging('${paging.endPage + 1 }','${paging.cntPerPage}')">				
			<i class="fas fa-chevron-right"></i>
		</a>
	</c:if>
	</div>
	
	
																				
</div>
