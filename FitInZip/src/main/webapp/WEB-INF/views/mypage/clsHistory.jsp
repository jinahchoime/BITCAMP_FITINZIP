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
					var arr = getDateRangeData(startDate, endDate);
					
					var weekName = new Array('일','월','화','수','목','금','토');
					
					
					/* 지금클래스 종료클래스 나누기  */
					var compareday = new Date(returnValue[i].endDate);
					compareday.setDate(compareday.getDate() + 1); //날짜 하루 더하기
					if(today.getTime() < compareday.getTime()){
						var button = "";
						/*요일 구하기*/
						for(var j=0; j<arr.length; j++){
							var getYo = new Date(arr[j]).getDay();
							var yo = weekName[getYo];
							var yoil = returnValue[i].yoil;
							
							/* 요일 맞음 */
							if(yo == yoil){
								if(new Date(arr[j]).getFullYear() == new Date().getFullYear() 
										&& new Date(arr[j]).getMonth() == new Date().getMonth()
											&& new Date(arr[j]).getDate() == new Date().getDate()){
									button = '<input type="button" class="maincolor1" value="입장">';
								}else{
									button = '<input type="button" class="maincolor1" value="입장" disabled>';
								}
							}else{
								button = '<input type="button" class="maincolor1" value="입장" disabled>';
							} 
						}
						
						dispHtml1 = text(returnValue[i], dispHtml1, button);
					    $('#content').html(dispHtml1);
					}else if(today.getTime() > compareday.getTime()){
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
				
				
				function getDateRangeData(startDate, endDate){ 
					
					var res_day = [];
				 	var ss_day = new Date(startDate);
				   	var ee_day = new Date(endDate);    	
				  		while(ss_day.getTime() <= ee_day.getTime()){
				  			var _mon_ = (ss_day.getMonth()+1);
				  			_mon_ = _mon_ < 10 ? '0'+_mon_ : _mon_;
				  			var _day_ = ss_day.getDate();
				  			_day_ = _day_ < 10 ? '0'+_day_ : _day_;
				   			res_day.push(ss_day.getFullYear() + '-' + _mon_ + '-' +  _day_);
				   			ss_day.setDate(ss_day.getDate() + 1);
				   	}
				   	return res_day;
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