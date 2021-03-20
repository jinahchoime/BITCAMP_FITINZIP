<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 정보수정</title>
<script type="text/javascript">
	function btn_click(frm){
		location.href="mypage/"
		frm.submit();
	}
</script>
</head>
<body>
	<table>
		<tr>
			<form method="post">
				<c:if test="${empty member}">
					<p>비어있음 아님 오류~</p>
				</c:if>
				<c:if test="${not empty member}">
					<tr>
						<th>아이디</th>
						<td><input type="text" name="id" value="${member.id }"></td>
					</tr>
					 <tr>
						 <th>우편번호</th>
						 <input type="text" name="post" value="${member.post }">
					 </tr>
					 <tr>
						 <th>도로명주소</th>
						 <input type="text" name="addr_1" value="${member.addr_1 }">
					 </tr>
					 <tr>
					 	<th>상세주소<th>
					 	<input type="text" name="addr_2" value="${member.addr_2 }">
					 </tr>
				 </c:if>
				 <input type="button" onclick="btn_click(this.form)">
			</form>
		</tr>
	</table>
</body>
</html>