<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${empty bbs1 }">
	<tr>
		<td colspan="5" class="text-center">강사 신청 목록이 없습니다.</td>
	</tr>
</c:if>

<c:if test="${not empty bbs1 }">
	<c:forEach var="bbs1" items="${bbs1 }">
		<tr>
			<td id="bbsId">${bbs1.id }</td>
			<td id="bbsName">${bbs1.name }</td>
			<td id="bbsGender">${bbs1.gender }</td>
			<td id="bbsBirth">${bbs1.birth }</td>
			<td id="bbsStatus">${bbs1.commonName }</td>
			<c:if test="${bbs1.commonName eq '승인대기중'}">
				<td class="theadWidth">
					<!-- <button id="button1" onclick="changeSt()">승인</button> --> <!-- Button trigger modal -->
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#exampleModal"
						onclick="changeSt(this);"
						style="BACKGROUND: orangered; border-color: white; height: 25px; font-size: 12px; line-height: 12px;">
						승 인</button>
				</td>
			</c:if>
				<c:if test="${bbs1.commonName != '승인대기중'}">
								<td class="theadWidth">&nbsp </td>
							</c:if>
		</tr>
	</c:forEach>
</c:if>