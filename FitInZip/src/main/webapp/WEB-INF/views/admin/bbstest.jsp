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
  <div class="tbl-content">
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
     		 	<td class="theadWidth">
     		 	<!-- <button id="button1" onclick="changeSt()">승인</button> -->
     		 	<!-- Button trigger modal -->
				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" onclick="changeSt(this);">
  				승인
				</button>
     		 	</td>
     		</tr>
     		</c:forEach>
     	</c:if>
     	<tr>
     	</tr>
      </tbody>
 
    </table>
  </div>
</section>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">님</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <h5 id="modalBody"></h5>
        <h5 id="modalBody2"></h5>
        <h5 id="modalBody3"></h5>
        <h5 id="modalBody4"></h5>
        <h5 id="modalBody5"></h5>
        <h5 id="modalBody6"></h5>
        <h5 id="modalBody7"></h5>
        <h5 id="modalBody8"></h5>
        <h5 id="modalBody9"></h5>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary">승인완료</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">승인거부</button>
      </div>
    </div>
  </div>
</div>
