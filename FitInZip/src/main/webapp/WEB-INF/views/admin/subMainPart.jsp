<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${empty subBBS }">
	<tr>
		<td colspan="5" class="text-center">데이터가 없습니다.</td>
	</tr>
</c:if>

<c:if test="${not empty subBBS }">
	<c:forEach var="subBBS" items="${subBBS }">
		<tr>
			<td style="width: 120px;">${subBBS.commonName }</td>
			<td style="width: 120px;">${subBBS.trainerId }</td>
			<td style="width: 250px;">${subBBS.clsName }</td>
			<td style="width: 120px;">${subBBS.memId }</td>
			<td style="width: 120px;">${subBBS.gender }</td>
			<td style="width: 120px;">${subBBS.birth }</td>
			<td style="width: 120px;">${subBBS.payDate }</td>
		</tr>
	</c:forEach>
</c:if>