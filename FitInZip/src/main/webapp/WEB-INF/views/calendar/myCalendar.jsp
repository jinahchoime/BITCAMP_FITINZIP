<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>캘린더</title>
<script charset="UTF-8" src="https://cdn.jsdelivr.net/npm/fullcalendar@5.6.0/main.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
<script src="https://unpkg.com/tippy.js@6"></script>
<link rel="stylesheet" type="text/css" href="${path }/resources/calendar/css/main.min.css">
<link href="../resources/mypage/css/mypage.css" rel="stylesheet"></link>
<link href="../resources/mypage/css/cls.css" rel="stylesheet"></link>
<script type="text/javascript">
	

document.addEventListener('DOMContentLoaded', function() {
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
   		initialView: 'dayGridMonth',
   		
   		// 마우스 호버 효과 적용
       	eventDidMount: function(arg) {
       		tippy(arg.el, {
                content:  arg.event.title,
            });
	    },
   		
   		// 사용자 정의 버튼 생성
        customButtons: {
            myCustomButton: {
              text: '출석하기',
              click: function() {
				var date    = new Date();
				var year    = date.getFullYear();
				var month = date.getMonth() + 1;
				var day     = date.getDate();
				
				var last   = new Date( year, month ); 
				last   = new Date( last - 1 ); 
				var lastD = last.getDate();
				var thisMonth = {"lastday" : lastD}; 
            	/* console.log("마지막 날 : " + lastD);
            	console.log("마지막 날 : " + JSON.stringify(thisMonth)); */
            	
                $.ajax({
                	url: 'setAttendance',
                	dataType: 'json',
                	data: thisMonth,
                	type: 'POST',
                	success:function(result) {
                		alert(JSON.stringify(result));
                		if(result.result == 'overlap'){
                			alert("이미 출석하셨습니다");
                		}else{
                			alert("출석체크 완료!");
                			
                			if(result.coupon == 'issue'){
                				alert("이번 달 출석을 완료하여 쿠폰이 발행되었습니다!");
                			}
                			
                			calendar.refetchEvents();
                		}
					}
				});
              }
            }
         },
         // 버튼 등의 기능을 배치할 위치 지정
         headerToolbar: {
        	    left: 'prev,next today',
        	    center: 'title',
        	    right: 'myCustomButton'
       	},
       	
       	showNonCurrentDates: false,
       	
       	
       	
       	// google 캘린더 api 적용
		googleCalendarApiKey : '${key}',
		buttonText: { today : "오늘", month : "월별", week : "주별", day : "일별", }, 
		eventSources : 
			[ 
				{ googleCalendarId : '${holiday}',
					className : 'ko_event',
					color : '#d40000'
				},
				{ events:function(info, successCallback, failureCallback){
					$.ajax({
		            	url: 'getClsInfo',
		            	dataType: 'json',
		            	success:function(result) {
		            		
		            		var events = [];
		            		
		                    	if(result!=null){
		                    		
		                    		$.each(result, function(index, element){
		                    			var week = ['일', '월', '화', '수', '목', '금', '토'];
		                    			var getDay = element.yoil.split(',');
		                    			
		                    			var startClass = element.startDate;
		                    			var endClass = element.endDate;
		                    			
		                    			var classDates = getDateRangeData(startClass, endClass);
		                    			//console.log("classDates : " + classDates)
		                    			
		                    			for(step = 0; step <= classDates.length; step++){
		                    				// dayOfWeek : '월', '화', ..
		                    				var dayOfWeek = week[new Date(classDates[step]).getDay()];
		                    				for(let c = 0; c < getDay.length; c++){
		                    					//console.log("getDay : " + getDay[c]);
		                    					//console.log("dayOfWeek : " + dayOfWeek);
		                    					
		                    					if(getDay[c] == dayOfWeek){
		                    						events.push({
		        	                    				start: classDates[step],
		        	                    				backgroundColor: '#3366ff',
		        	                    				title: element.clsName + ""
		        	                    			});
		                    					}
		                    				}
		                    				
		                    			}
		                    			
		                    		});
		                    		
		                         	console.log(events);
		                    	}
		                    	successCallback(events);
							}
						});
				} }	
    		],
			
			// db에서 데이터를 가져와 캘린더에 출석 정보 표시
	    	events:function(info, successCallback, failureCallback){
	        	$.ajax({
	            	url: 'getAttendance',
	            	dataType: 'json',
	            	success:function(result) {
	            		
	            		var events = [];
	            		
	                    	if(result!=null){
	                            
	                    		$.each(result, function(index, element){
	                    			var startdate = element.attendDate;
	                    			
	                    			events.push({
	                    				customHtml: "<img src='resources/calendar/img/bg_etc.png' style='width:100%; height:100%;'>",
	                    				start: startdate,
	                    				display: 'background',
	                    				backgroundColor: '#FFFFFF'
	                    			});
	                    		});
	                    		
	                         	console.log(events);
	                    	}
	                    	successCallback(events);
						}
					});
				},
				
				// 출석 도장 출력
		        eventContent: function(eventInfo) {
		        	console.log(eventInfo);
		        	if(eventInfo.event.extendedProps.customHtml	 == "<img src='resources/calendar/img/bg_etc.png' style='width:100%; height:100%;'>"){
		            	return { html: eventInfo.event.extendedProps.customHtml }
		        	}
		        }
			
		});
			calendar.render();
	});
	
	function getDateRangeData(param1, param2){  //param1은 시작일, param2는 종료일이다.
		var res_day = [];
	 	var ss_day = new Date(param1);
	   	var ee_day = new Date(param2);    	
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

</script>
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
	<!-- Navigation -->
    <jsp:include page="../nav.jsp"></jsp:include>
    
    <!-- Content  -->
    <div style="min-height: 858px; margin: 0 auto; width: 1200px">
    	<!-- 마이페이지 메뉴  -->
		<jsp:include page="../mypage/mypageMenu.jsp"></jsp:include>
		
		<!-- 주문내역 -->
		<div class="item3 mt200 ml10" style="display: inline-block; width: 910px;"><div id='calendar'></div></div>
	</div>
	
	<!-- Footer -->
    <jsp:include page="../footer.jsp"></jsp:include>
    
</body>
</html>