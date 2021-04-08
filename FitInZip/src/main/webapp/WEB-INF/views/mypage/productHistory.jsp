<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문조회</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="../resources/mypage/css/mypage.css" rel="stylesheet"></link>
<link href="../resources/mypage/css/cls.css" rel="stylesheet"></link>
<script type="text/javascript">
	$(function(){
		var startIndex = 1;	//인덱스 초기값
		var searchStep = 3; //3개씩 로딩 
		
		//페이지 로딩시 첫실행
		productView(startIndex);
		
		//더보기 버튼 클릭시
		$('#searchMoreNotify').click(function(){
			startIndex += searchStep;
			productView(startIndex);
		})
		
		function productView(index){
			let _endIndex = index+searchStep-1;
			$.ajax("/productData",{
				type: "get",
				dataType : "json",
				data : {startIndex:index, endIndex:_endIndex},
				success : function(returnValue){
					var dispHtml = ''
					console.log(returnValue);
					$.each(returnValue, function(){
						var year = new Date(this.payDate).getFullYear();
						var month = (new Date(this.payDate).getMonth() + 1) + "";
						var date = new Date(this.payDate).getDate() + "";
						if(month.length == 1){
							month = "0" + month;
						}
						if(date.length == 1){
							date = "0" + date;
						}
						var ordertDate =  year + "-" + month + "-" + date;
						 dispHtml += '<tr><td colspan="3" style="text-align: left; padding: 8px;">';
						 dispHtml += '<span style="padding-left: 20px">주문일자 : <b style="color:black">';
						 dispHtml += ordertDate;
						 dispHtml += '</b></span><span style="padding-left: 50px">주문번호 : ';
						 dispHtml += '<b style="color:black">';
						 dispHtml += this.orderNum;
						 dispHtml +='</b></span></td></tr>';
						 dispHtml += '<tr><td style="text-align: left; padding: 0 0 0 20px;">';
						 dispHtml += '<span style="display: inline-block; width: 100px; height: 100px; margin-bottom: 20px; margin-left: 10px;">';
						 dispHtml += '<img alt="이미지" src="';
						 dispHtml += this.proImg;
						 dispHtml += '" style="width: 100%;"></span>';
						 dispHtml += '<span style="display: inline-block;padding-left: 85px;vertical-align: middle;font-size: 15px;line-height: 20px;">';
						 dispHtml += '<a href="/orderDetail">' + this.proName + '<a>';
						 dispHtml += '</span></td><td style="font-size: 15px;">';
						 dispHtml += this.paymethod;
						 dispHtml += '<br>';
						 dispHtml += this.paidPrice;
						 dispHtml += '</td><td style="font-size: 15px;">';
						 dispHtml += '주문완료';
						 dispHtml += '</td></tr>';
					})
					$('#content').append(dispHtml);
					
					if( _endIndex > returnValue[0].count){
						$('#searchMoreNotify').remove();
					}
				},
				error : function(){
					alert("실패!");
				}
				
			})
		}
		
		
	})
</script>
</head>
<body>
	<!-- Navigation -->
    <jsp:include page="../nav.jsp"></jsp:include>
    
    <!-- Content  -->
    <div style="min-height: 858px; margin: 0 auto; width: 1200px">
    	<!-- 마이페이지 메뉴  -->
		<jsp:include page="mypageMenu.jsp"></jsp:include>
		
		<!-- 주문내역 -->
		<jsp:include page="productList.jsp"></jsp:include>
	</div>
	
	<!-- Footer -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>