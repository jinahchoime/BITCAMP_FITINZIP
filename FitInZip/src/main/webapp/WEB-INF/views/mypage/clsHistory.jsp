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
		var startIndex = 1;//인덱스 초기값
		var _endIndex = 3;
		var _endIndexes = 3;
		var searchStep = 3;//3개씩 로딩 
		
		
		var weekName = new Array('일','월','화','수','목','금','토');
		
		//첫 로딩시 현재 클래스 로딩
		clsView(startIndex, "now", _endIndex);
		$('#btn').html('<button id="searchMoreNotify" class="btn_basic type5 adClick mt50" style="display:inherit; margin: 0 auto;">더보기</button>');
		
		/* 현재 클래스 버튼 */
		$('#nowBtn').click(function(){
			$('#content').html(''); 
			$('#endBtn').css({
				'font-weight': '500',
				'color': '#ccc'
			});
			$('#nowBtn').css({
				'font-size': '24px',
				'font-weight': '700',
				'color': '#000'
			});
			let count = clsView(startIndex, "now", _endIndex);
			if(count > 3){
				$('#btn').html('<button id="searchMoreNotify" class="btn_basic type5 adClick mt50" style="display:inherit; margin: 0 auto;">더보기</button>');
            }else{
            	$('#btn').html('');
            }
		})
		
		/* 종료 클래스 버튼 */
		$('#endBtn').click(function(){
			$('#content').html(''); 
			$('#nowBtn').css({
				'font-weight': '500',
				'color': '#ccc'
			});
			$('#endBtn').css({
				'font-size': '24px',
				'font-weight': '700',
				'color': '#000'
			});
			let count = clsView(startIndex, "end", _endIndex);
			console.log(count);
			if(count > 3){
				$('#btn').html('<button id="endsearchMoreNotify" class="btn_basic type5 adClick mt50" style="display:inherit; margin: 0 auto;">더보기</button>');
            }else{
            	$('#btn').html('');
            }
		}) 
		
		$('#searchMoreNotify').click(function(e){
            e.stopPropagation();
            e.preventDefault();
            e.stopImmediatePropagation();
            
            startIndex = 1;
            _endIndex += searchStep; 
            let count = clsView(startIndex, "now",  _endIndex);
            if(_endIndex > count){
            	$('#btn').html('');
            }
		}); 
		
		$('#endsearchMoreNotify').click(function(e){
            e.stopPropagation();
            e.preventDefault();
            e.stopImmediatePropagation();
            
            startIndex = 1;
            _endIndexes += searchStep; 
            let count = clsView(startIndex, "end",  _endIndex);
            if(_endIndexes > count){
            	$('#btn').html('');
            }
		}); 
		
		/* ajax 포함된 기능  */
		function clsView(index, clsStatus,  _endIndex){
			var counting = 0;
			
			$.ajax("/clsdata",{
				type: "get",
				dataType: "json",
				data : {startIndex:index, endIndex:_endIndex, clsTimeStatus:clsStatus},
				async:false, /* 이 문장 작성해야 리턴값 넘어감 */
				success : function(returnValue){
					var dispHtml = '';
					var button = '';
					if(clsStatus == 'now'){
						button = '<input type="button" class="maincolor1" value="입장">';
					}else if(clsStatus == 'end'){
						button = '<input type="button" class="maincolor1" value="입장" disabled>';
					}
					
					for(var i =0; i<returnValue.length; i++){
						/*요일 구하기*/
						var getYo = new Date().getDay();
						var todayYo = weekName[getYo];
						var yoil = (returnValue[i].yoil).split(',');
						
						for(var j=0; j<(returnValue[i].yoil).split(',').length; j++){
							var yo = yoil[j];
							
							var year = new Date().getFullYear();
							var month = new Date().getMonth();
							var date = new Date().getDate();
							
							var hours = new Date(returnValue[i].startTime).getHours(); //시작시간
							var miunutes = new Date(returnValue[i].startTime).getMinutes(); //시작 분
							
							var endhours = new Date(returnValue[i].endTime).getHours(); //끝시간
							var endmiunutes = new Date(returnValue[i].endTime).getMinutes(); //끝 분 
							
							if(todayYo == yo){
								var compareTime = new Date(year, month, date, hours, miunutes); // 시작 시간 date 객체
								var endcompareTime = new Date(year, month, date, endhours, endmiunutes); // 끝 시간 date 객체
								
								//시작시간에서 10분 전
								var cm = compareTime.setMinutes(compareTime.getMinutes() - 10);
								
								
								if((cm <= new Date().getTime()) && (new Date().getTime() < endcompareTime.getTime())){
									//지금 시간이 시작시간 10분 전과 같으면서 시작시간이 더 앞서가고  지금 시간이 끝시간 전이면 입장버튼 활성화
									button = '<input type="button" class="maincolor1" value="입장">';
								}else{
									button = '<input type="button" class="maincolor1" value="입장" disabled>';
								}
								
							}else{
								button = '<input type="button" class="maincolor1" value="입장" disabled>';
							}
						}
						
						
						dispHtml = text(returnValue[i], dispHtml, button);
					}
					
					counting = returnValue[0].count;
					$('#content').html(dispHtml);
				}/*success 끝*/,
				error : function () {
					alert("실패");
				}
			});/* ajax 끝 */
			return counting;
		}
		
		/*콘텐츠 만들어주는 기능*/
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