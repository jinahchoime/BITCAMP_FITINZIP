<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 등록</title>
<script src="${path }/resources/ckeditor/ckeditor.js"></script>
</head>
<body>
	
	<h1>강의 등록 화면</h1>
	
	<div id="main-container">
		<form id="class-info">
			<div class="part1">
				<table>
					<tr>
						<td>
							<select name="cls_category">
								<option value="ct_wt">웨이트</option>
								<option value="ct_ft">피트니스</option>
								<option value="ct_yg">요오가</option>
								<option value="ct_fl">필라이트</option>
							</select>
						</td>
						<td colspan="4">
							<input type="text" name="cls_name" placeholder="제목을 입력해주세요">
						</td>
					</tr>
					<tr>
						<th>태그</th>
						<td><input type="text" name="cls_tag"></td>
					</tr>
					<tr>
						<th>시작일자</th>
						<td></td>
						<th>요일</th>
						<td><input type="text"></td>
						<th>시작 시간</th>
						<td></td>
					</tr>
					<tr>
						<th>수업 횟수</th>
						<td><input type="number" name="lapse"></td>
						<th>인원 수</th>
						<td>
							<select></select>
						</td>
					</tr>
				</table>
			</div>
			
			<div class="part2">
				<table>
					<tr>
						<th>난이도</th>
						<td>
							<select>
								<option>상</option>
								<option>중</option>
								<option>하</option>
							</select>
						</td>
						<th>소모 칼로리</th>
						<td><input type="number" name="calorie"></td>
					</tr>
					<tr>
						<th>운동장비</th>
						<td><input type="text" name="equip"></td>
					</tr>
					<tr>
						<th>강의 내용 소개</th>
						<td>
							<textarea id="cls_info" name="cls_info"></textarea>
							<script type="text/javascript">CKEDITOR.replace("cls_info")</script>
						</td>
					</tr>
					<tr>
						<th>커리큘럼 상세 정보</th>
						<td>
							<textarea id="curriculum" name="curriculum"></textarea>
							<script type="text/javascript">CKEDITOR.replace("curriculum")</script>
						</td>
					</tr>
				</table>
			</div>
			
			<div class="part3">
				
			</div>
		</form>
	</div>
	
	
	<input type="button" value="메인으로" onclick="redirect:main.jsp">
</body>
</html>