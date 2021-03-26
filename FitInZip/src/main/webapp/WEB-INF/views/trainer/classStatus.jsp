<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 등록 현황</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
	.item1 { grid-area: header; text-align: center; }
	.item2 { grid-area: menu; }
	.item3 { grid-area: main; }
	.item4 { grid-area: footer; text-align: center; }
	
	.grid-container {
		display: grid;
		grid-template-areas:
			'header header header header'
			'menu main main main'
			'menu footer footer footer';
		grid-gap: 10px;
		padding: 10px;
	}
	
	.grid-container > div {
		padding: 20px 0;
		font-size: 30px;
	}

</style>
<script type="text/javascript">
	$(function(){
		
		var actionForm = $("#actionForm");
		
		$(".paginate_button a").on("click", function(e){
			e.preventDefault();
			
			console.log('click');
			
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
	});
	
	function goRegister(){
		location.href="classRegister";
	}
</script>
</head>
<body>
	
	<div class="grid-container">
		<div class="item1">
			<div>
				<h1>강의 신청 현황</h1>
			</div>
		</div>
		<div class="item2">
			<div>
				<ul>
					<li>메뉴1</li>
					<li>메뉴2</li>
					<li>메뉴3</li>
				</ul>
			</div>
		</div>
		<div class="item3">
			<table>
			<c:forEach var="i" items="${list }">
				<tr>
					<td>${i.clsName }</td>
					<c:if test="${i.clsStatus == 'RS00' }">
						<td><button>수정</button></td>
					</c:if>
					<c:if test="${i.clsStatus == 'RS01' }">
						<td>승인완료</td>
					</c:if>
					<c:if test="${i.clsStatus == 'RS02' }">
						<td>승인거부</td>
					</c:if>
				</tr>
			</c:forEach>
			</table>
			
			<div>
				<ul>
					
					<c:if test="${pageMaker.prev }">
						<li>
							<a href="${pageMaker.startPage - 1 }">Prev</a>
						</li>
					</c:if>
					
					<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
						<li class="paginate_button ${pageMaker.crt.pageNum == num ? "active":"" }"><a href="${num }">${num }</a></li>
					</c:forEach>
					
					<c:if test="${pageMaker.next }">
						<li>
							<a href="${pageMaker.endPage + 1 }">Next</a>
						</li>
					</c:if>
					
				</ul>
				
				<form id="actionForm" action="classStat" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.crt.pageNum }">
					<input type="hidden" name="amount" value="${pageMaker.crt.amount }">
				</form>
				
				<input type="button" value="등록" onclick="goRegister()">
				
			</div>
		</div>
		<div class="item4">
			<div>
				<h1>그리드 풋터</h1>
			</div>
		</div>
	</div>
	
</body>
</html>