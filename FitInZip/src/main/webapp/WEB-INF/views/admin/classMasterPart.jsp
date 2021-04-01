<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty bbsCls }">
	<tr>
		<td colspan="5" class="text-center">강사 신청 목록이 없습니다.</td>
	</tr>
</c:if>

<c:if test="${not empty bbsCls }">
	<c:forEach var="bbsCls" items="${bbsCls }">
		<tr>
			<td style="width: 120px;">${bbsCls.clsCode }</td>
			<td id="bbsClsName" style="width: 150px;">${bbsCls.name }강사님</td>
			<td style="width: 120px;">${bbsCls.commonName }</td>
			<td>${bbsCls.clsName }</td>
			<td>${bbsCls.startDate }~${bbsCls.endDate }/${bbsCls.yoil }</td>
			<td style="width: 150px;">${bbsCls.clsStatus }</td>
			<c:if test="${bbsCls.clsStatus eq '승인대기중'}">
				<td class="theadWidth">
					<!-- <button id="button1" onclick="changeSt()">승인</button> --> <!-- Button trigger modal -->
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#exampleModal2"
						onclick="changeClsModal(this);"
						style="BACKGROUND: orangered; border-color: white; height: 25px; font-size: 12px; line-height: 12px;">
						승 인</button>
				</td>
			</c:if>
			<c:if test="${bbsCls.clsStatus != '승인대기중'}">
				<td class="theadWidth">&nbsp </td>
			</c:if>
		</tr>
	</c:forEach>
</c:if>
<tr>
</tr>