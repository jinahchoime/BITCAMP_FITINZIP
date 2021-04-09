<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery -->
<!-- <script src="https://code.jquery.com/jquery-3.6.0.js" type="text/javascript"></script> -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- <script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script> -->


<!-- bbs -->
<link rel="stylesheet" href="../resources/admin/css/bbs.css">
<link rel="stylesheet" href="../resources/admin/js/bbs.js">


<!-- MainSidebar -->
<link rel="stylesheet" href="../resources/admin/css/style5.css">
 
 
<script>

	function changeSt(btn){
		let id = btn.parentElement.parentElement.firstElementChild.textContent;
	
		
		$.ajax({
			url: "bbs1Modal",
			type: "GET",
			dataType: "json",
			data: {send:id},
			success: function(data){
	
			
			},
			error: function (){
	
				}
		});
		
	}

</script>
<style>
.theadWidth {
 width:100px;
}

.title1{
  text-align: center;
  font-weight: 800;
  font-size: 20px;
  color: #fff;
  text-transform: uppercase;
}

</style>

</head>
<body>
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

</body>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">님</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" name="btnResult">승인완료</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" name="btnResult">승인거부</button>
      </div>
    </div>
  </div>
</div>

</html>