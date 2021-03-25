<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<title>Home</title>
</head>
<script>

function testGo(){
	alert(">>ajax실행~");
	$.ajax({
		url:"goAjax",
		type:"POST",
		dataType:"json",
		data: {id :"test"},
		success: function(data){
			console.log(data);
			$(".go").val(data);
		},
		error: function (){
			console.log("실패");
			}
			
		});
	}
	
</script>

<body>
<h1>
	헬로우 월드!  
</h1>

<div>
	<form action="test">
		<input type="submit" value="테스트">
	</form>
	<form action="test22">
		<input type="submit" value="테스">
	</form>
	
	<input type="button" value="버튼" onclick="testGo()">
	<input type="text" class="go" value=""/>
</div>


</body>
</html>
