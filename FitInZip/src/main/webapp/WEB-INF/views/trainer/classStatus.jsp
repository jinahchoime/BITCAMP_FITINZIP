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
	
	#class_list {
		width: 100%;
		list-style: none;
		font-size: 1em;
		table-layout: fixed;
	}
	
	.items_border {
		border-top: 2px solid black;
		width: 100%;
	}
	
	th {
		text-align:center;
		width:100px;
	}
	
	.classCode {
		text-align: center;
	}
	
	.status {
		text-align: center;
	}
	
	#page_number{
		width: 100%;
		box-sizing: border-box;
		display: flex;
	}
	
	.paging { 
		list-style: none;
		width: 100%;
		text-align: center;
		vertical-align: middle;
	}
	.paging li {
		float: left;
		margin-right: 8px;
		text-align: center;
	}
	.paging li a {
		text-decoration: none;
		display: block;
		padding: 3px 7px;
		border: 1px solid #00B3DC;
		font-weight: bold;
		color: black;
	}
	.paging .disable {
		border: 1px solid silver;
		padding: 3px 7px;
		color: silver;
	}
	.paging .now {
		border: 1px solid #ff4aa5;
		padding: 3px 7px;
		background-color: #ff4aa2;
	}
	.paging li a:hover {
		background-color: #00B3DC;
		color: white;
	}
	
	#register {
		width: 70px;
		height: 30px;
		right: 0px;
	}
	
	.page {
		text-align: center;
	}

</style>
<script type="text/javascript">
	$(function(){
		
		$("#register").on("click", function(){
			self.location = "classRegister";
		});
		
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
			<table id="class_list">
			<thead>
				<tr>
					<th>강의 코드</th>
					<th>강의 제목</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="i" items="${list }">
				<tr class="items_border">
					<td class="classCode">${i.clsCode }</td>
					<td>${i.clsName }</td>
					<td class="status">
					<c:if test="${i.clsStatus == 'CS00' }">
							<form action="modifyClass">
								<input type="hidden" name="clsCode" value="${i.clsCode }">
								<input type="hidden" name="pageNum" value="${pageMaker.crt.pageNum }">
								<input type="hidden" name="amount" value="${pageMaker.crt.amount }">
								<input class="mod" type="submit" value="수정">
							</form>
					</c:if>
					<c:if test="${i.clsStatus == 'CS01' }">
					승인완료
					</c:if>
					<c:if test="${i.clsStatus == 'CS02' }">
					승인거부
					</c:if>
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="3" class="page">
					<div id="page_number">
						<ul class="paging">
							<c:if test="${pageMaker.prev }">
								<li class="paginate_button previous">
									<a href="${pageMaker.startPage - 1 }">Prev</a>
								</li>
							</c:if>
							
							<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
								<li class="paginate_button ${pageMaker.crt.pageNum == num ? "active":"" }"><a href="${num }">${num }</a></li>
							</c:forEach>
							
							<c:if test="${pageMaker.next }">
								<li class="paginate_button next">
									<a href="${pageMaker.endPage + 1 }">Next</a>
								</li>
							</c:if>
						</ul>
					</div>
				</td>
			</tr>
			</tbody>
			</table>
			<form id="actionForm" action="classStat" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.crt.pageNum }">
					<input type="hidden" name="amount" value="${pageMaker.crt.amount }">
				</form>
				
			<input type="button" id="register" value="등록">
			
		</div>
		<div class="item4">
			<div>
				<h1>그리드 풋터</h1>
			</div>
		</div>
	</div>
	
</body>
</html>