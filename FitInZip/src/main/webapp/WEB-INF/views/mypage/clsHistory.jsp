<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클래스내역</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="../resources/mypage/css/mypage.css" rel="stylesheet"></link>
<link href="../resources/mypage/css/cls.css" rel="stylesheet"></link>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<script type="text/javascript">
	$(function(){
		/* 현재클래스 인덱스값 */
		var startIndex1 = 1;//인덱스 초기값
		var searchStep1 = 3; //3개씩 로딩 
		
		/* 종료클래스 인덱스값 */
		var startIndex2 = 1;//인덱스 초기값
		var searchStep2 = 3;//3개씩 로딩 
		
		nowClsView(startIndex1);
		
		$('#endBtn').click(function(){
			endClsView(startIndex2)
		})
		
		$('#nowBtn').click(function(){
			nowClsView(startIndex1);
		})
		
		var button = '';
		function nowClsView(index){
			var dispHtml1 = '';
			let _endIndex = index+searchStep1-1;
			$.ajax("/nowClsdata",{
				type: "get",
				dataType: "json",
				data : {startIndex:index, endIndex:_endIndex},
				success : function(returnValue){
					console.log(returnValue);
					for(var i =0; i<returnValue.length; i++){
						button = '<input type="button" class="maincolor1" value="입장">';
						dispHtml1 = text(returnValue[i], dispHtml1, button)
					}
					var moreBtn = '<button id="nowSearchMoreNotify" class="btn_basic type5 adClick mt50" style="display:'
						 +' inherit; margin: 0 auto;">더보기</button>';
					if(returnValue.length > 3){
						$('#content').html(''); 
						$('#moreBtn').html('');
					    $('#content').html(dispHtml1); 
					    $('#moreBtn').html(moreBtn); 
					}else{
						$('#content').html(''); 
					    $('#content').html(dispHtml1); 
					}
				}/*success 끝*/,
				error : function () {
					alert("실패");
				}
			})/* ajax 끝 */
			
			
		}
		/////////////////////////
		
		function endClsView(index){
			var dispHtml2 = '';
			let _endIndex = index+searchStep2-1;
			$.ajax("/endClsdata",{
				type: "get",
				dataType: "json",
				data : {startIndex:index, endIndex:_endIndex},
				success : function(returnValue){
					console.log(returnValue);
					for(var i =0; i<returnValue.length; i++){
						button = '<input type="button" class="maincolor1" value="입장" disabled>';
						dispHtml2 = text(returnValue[i], dispHtml2, button)
					}
					var moreBtn = '<button id="endSearchMoreNotify" class="btn_basic type5 adClick mt50" style="display:'
						 +' inherit; margin: 0 auto;">더보기</button>';
					if(returnValue.length > 3){
						$('#content').html(''); 
						$('#moreBtn').html('');
					    $('#content').html(dispHtml2); 
					    $('#moreBtn').html(moreBtn); 
					}else{
						$('#content').html(''); 
					    $('#content').html(dispHtml2); 
					} 
					
				}/*success 끝*/,
				error : function () {
					alert("실패");
				}
			})/* ajax 끝 */
			
		}
		
		//////////////////
		function text(value, dispHtml, button){
			dispHtml += '<tr><td class="type_diff"> <div class="list_img">';
			dispHtml += '<img src="https://ficle-live.s3.ap-northeast-2.amazonaws.com/origin/program/2021-03-08/1615190947042146270.png" alt="클래스썸네일"></div>';
			dispHtml += '<a href="/getClassDetail?clsCode='+value.clsCode+'" target="_blank"><div class="list_txt full"><dl class="prod_infor"><dt>';
			dispHtml += '<div class="play_tch"><span>';
			dispHtml +=  value.commonName;
			dispHtml += '</span></div>';
			dispHtml +=  value.clsName;
			dispHtml +=  '</dt><dd class="mt5"><div>';
			dispHtml +=  new Date(value.startTime).getHours();
			dispHtml +=  '~' + new Date(value.endTime).getHours() + "시  ";
			dispHtml +=  value.yoil + "요일";
			dispHtml +=  '</div>';
			dispHtml +=  new Date(value.startDate).getFullYear() + "년 " + (new Date(value.startDate).getMonth() + 1) + "월 " + new Date(value.startDate).getDate()+ "일";
			dispHtml +=  '~' + new Date(value.endDate).getFullYear() + "년 " + (new Date(value.endDate).getMonth() + 1) + "월 " + new Date(value.endDate).getDate()+ "일";
			dispHtml +=  '</dd></dl></div></a></td>';
			dispHtml +=  '<td class="black"><b>';
			dispHtml +=  button;
			dispHtml +=  '</b>';
			dispHtml += '</td></tr>';
			
			return dispHtml;
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
		
		<!-- 클래스 내역 -->
		<jsp:include page="cls.jsp"></jsp:include>
	</div>
	
	<!-- Footer -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>