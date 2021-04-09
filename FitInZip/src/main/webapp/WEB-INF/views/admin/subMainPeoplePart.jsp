<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${empty subPeopleBBS }">
	<tr>
		<td colspan="5" class="text-center">데이터가 없습니다.</td>
	</tr>
</c:if>

<c:if test="${not empty subPeopleBBS }">
	<c:forEach var="subPeopleBBS" items="${subPeopleBBS }">
		<tr>
			<td style="width: 120px;">${subPeopleBBS.id }</td>
			<td style="width: 120px;">${subPeopleBBS.name }</td>
			<td style="width: 120px;">${subPeopleBBS.gender }</td>
			<td style="width: 120px;">${subPeopleBBS.birth }</td>
			<td style="width: 120px;">${subPeopleBBS.joinDate }</td>
			<td style="width: 120px;">${subPeopleBBS.commonName }</td>
		</tr>
	</c:forEach>
</c:if>