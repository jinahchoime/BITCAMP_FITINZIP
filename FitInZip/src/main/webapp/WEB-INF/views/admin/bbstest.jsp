<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section>
  <!--for demo wrap-->
  <h1 class="title1" style="padding-top: 25px; padding-bottom: 15px;">강사 가입 승인 요청 LIST</h1>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr style="text-align: center;">
          <th>아이디</th>
          <th>이름</th>
          <th>성별</th>
          <th>생년월일</th>
          <th>승인여부</th>
          <th class="theadWidth">&nbsp</th>
          
        </tr>
      </thead>
    </table>
  </div>
  <div class="tbl-content h700" >
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody>
     	<c:if test="${empty bbs1 }">
     		<tr>
     		 	<td colspan="5" class="text-center">강사 신청 목록이 없습니다.</td>
     		</tr>
     	</c:if>
     	
     	<c:if test="${not empty bbs1 }">
     		<c:forEach var="bbs1" items="${bbs1 }">
     		<tr>
     		 	<td>${bbs1.id }</td>
     		 	<td>${bbs1.name }</td>
     		 	<td>${bbs1.gender }</td>
     		 	<td>${bbs1.birth }</td>
     		 	<td>${bbs1.commonName }</td>
     		 	<c:if test="${bbs1.commonName eq '승인대기중'}">
     		 	<td class="theadWidth">
     		 	<!-- <button id="button1" onclick="changeSt()">승인</button> -->
     		 	<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="changeSt(this);"
				style="
    			BACKGROUND: orangered;
    			border-color: white;
    			height: 25px;
   				font-size: 12px;
				line-height: 12px;">
  				승 인
				</button>
     		 	</td>
     		 	</c:if>
     		</tr>
     		</c:forEach>
     	</c:if>
     	<tr>
     	</tr>
      </tbody>
 
    </table>
  </div>
</section>
