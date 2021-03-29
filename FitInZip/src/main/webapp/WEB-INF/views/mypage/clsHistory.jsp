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
				
				
				for(var i=0; i<returnValue.length; i++){
					//사이날짜 배열 넣기
					//시작날짜
					var startDate = new Date(returnValue[i].startDate).getFullYear() + "-" + (new Date(returnValue[i].startDate).getMonth() + 1) + "-" + new Date(returnValue[i].startDate).getDate();
					//끝날짜
					var endDate= new Date(returnValue[i].endDate).getFullYear() + "-" + (new Date(returnValue[i].endDate).getMonth() + 1) + "-" + new Date(returnValue[i].endDate).getDate();
					var weekName = new Array('일','월','화','수','목','금','토');
					
					
					
					/* 지금클래스 종료클래스 나누기  */
					var compareeday = new Date(returnValue[i].endDate); //끝날짜
					var comparesday = new Date(returnValue[i].startDate); //시작날짜
					compareeday.setDate(compareeday.getDate() + 1); //날짜 하루 더하기
					
					if(today.getTime() < compareeday.getTime()){
						//오늘날짜보다 이전
						var button = "";
						/*요일 구하기*/
						var getYo = new Date().getDay();
						var todayYo = weekName[getYo];
						var yoil = returnValue[i].yoil; 
						
						console.log(todayYo);
						console.log(yoil);
						
						var year = new Date().getFullYear();
						var month = new Date().getMonth();
						var date = new Date().getDate();
						var hours = new Date(returnValue[i].startTime).getHours(); //시작시간
						var endhours = new Date(returnValue[i].endTime).getHours(); //끝시간
						var miunutes = new Date(returnValue[i].startTime).getMinutes(); //시작 분
						var endmiunutes = new Date(returnValue[i].endTime).getMinutes(); //끝 분 
						
						if(todayYo == yoil){
							var compareTime = new Date(year, month, date, hours, miunutes); // 시작 시간 date 객체
							console.log(compareTime);
							
							var endcompareTime = new Date(year, month, date, endhours, endmiunutes); // 끝 시간 date 객체
							console.log(endcompareTime);
							
							if(compareTime - 10 && (new Date().getTime() < endcompareTime.getTime())){
								//시작시간 10분 전이면서 지금 시간이 끝시간 전이면 입장버튼 활성화
								button = '<input type="button" class="maincolor1" value="입장">';
							}else{
								button = '<input type="button" class="maincolor1" value="입장" disabled>';
							}
						}else{
							button = '<input type="button" class="maincolor1" value="입장" disabled>';
						} 
						
							dispHtml1 = text(returnValue[i], dispHtml1, button);
						    $('#content').html(dispHtml1); 
						}else if(today.getTime() > compareeday.getTime()){
							dispHtml2 = text(returnValue[i], dispHtml2, button);
						    $('#end_content').html(dispHtml2);
						}
						
					
				}
				
				function text(value, dispHtml, button){
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
					dispHtml +=  button;
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