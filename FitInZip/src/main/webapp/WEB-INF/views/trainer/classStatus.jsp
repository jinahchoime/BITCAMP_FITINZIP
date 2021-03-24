<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스 등록 현황</title>
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
</head>
<body>
	
	<div class="grid-container">
		<div class="item1">
			<div>
				<h1>그리드 헤더</h1>
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
		<div class="item3"></div>
		<div class="item4">
			<div>
				<h1>그리드 풋터</h1>
			</div>
		</div>
	</div>
	
</body>
</html>