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
		$.ajax("/clsdata",{
			type: "get",
			dataType: "json",
			success : function(returnValue){
				console.log(returnValue);
				
				var today = new Date();
				var dispHtml1 = '';
				var dispHtml2 = '';
				
				console.log((new Date()).getTime());
				
				for(var i=0; i<returnValue.length; i++){
					var compareday = new Date(returnValue[i].endDate);
					var compareTime = new Date(returnValue[i].endTime);
					if(today.getTime() < compareday.getTime() || today.getTime() < compareTime.getTime()){
						dispHtml1 = text(returnValue[i], dispHtml1);
					    $('#content').html(dispHtml1);
					}else if(today.getTime() > compareday.getTime() || today.getTime() > compareTime.getTime()){
						dispHtml2 = text(returnValue[i], dispHtml2);
					    $('#end_content').html(dispHtml2);
					}
				}
				
				
				function text(value, dispHtml){
					dispHtml += '<tr><td class="type_diff"> <div class="list_img">';
					dispHtml += '<img src="https://ficle-live.s3.ap-northeast-2.amazonaws.com/origin/program/2021-03-08/1615190947042146270.png" alt="클래스썸네일"></div>';
					dispHtml += '<a href="/play/play_apply/293" target="_blank"><div class="list_txt full"><dl class="prod_infor"><dt>';
					dispHtml += '<div class="play_tch"><span>';
					dispHtml +=  value.commonName;
					dispHtml += '</span></div>';
					dispHtml +=  value.clsName;
					dispHtml +=  '</dt><dd class="mt5"><div>';
					dispHtml +=  new Date(value.startTime).getHours();
					dispHtml +=  '~' + new Date(value.endTime).getHours() + "시  ";
					dispHtml +=  returnValue[i].yoil + "요일";
					dispHtml +=  '</div>';
					dispHtml +=  new Date(value.startDate).getFullYear() + "년 " + (new Date(value.startDate).getMonth() + 1) + "월 " + new Date(value.startDate).getDate()+ "일";
					dispHtml +=  '~' + new Date(value.endDate).getFullYear() + "년 " + (new Date(value.endDate).getMonth() + 1) + "월 " + new Date(value.endDate).getDate()+ "일";
					dispHtml +=  '</dd></dl></div></a></td>';
					dispHtml +=  '<td class="black"><b>';
					dispHtml +=  '<input type="button" class="maincolor1" value="입장">';
					dispHtml +=  '</b>';
					dispHtml += '</td></tr>';
					
					return dispHtml;
				}
	               
			}/*success 끝*/,
			error : function () {
				alert("실패");
			}
		})
	})
</script>
</head>
<body>
	<!-- Navigation -->
    <jsp:include page="../nav.jsp"></jsp:include>
    
    <!-- Content  -->
    <div style="height: 1000px; margin: 0 auto; width: 1200px">
    	<!-- 마이페이지 메뉴  -->
		<jsp:include page="mypageMenu.jsp"></jsp:include>
		
		<!-- 클래스 내역 -->
		<jsp:include page="cls.jsp"></jsp:include>
	</div>
	
	<!-- Footer -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>