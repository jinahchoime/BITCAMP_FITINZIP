<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 컨설턴팅</title>

<style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
<style>
	* {
	font-family: 'Noto Sans KR', sans-serif;
	}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
<body>
	<!-- Navigation -->
    <jsp:include page="../nav.jsp"></jsp:include>
    
    <!-- Content  -->
    <div id="content" style="height: 1800px; margin: 70px auto; width: 1200px">
	  	<div id="box_img">
	  		<img alt="이미지" src="https://res.cloudinary.com/peloton-cycle/image/fetch/dpr_1.0,f_auto,h_380,q_auto:best/https://images.ctfassets.net/6jnflt57iyzx/13jQUcX99wbQZBfW0pbeLg/677fa0b75c9af8c878f92275b882de62/ShowroomBanner_2020.jpg"
	  		style="width: 1200px;">
	  		<h3 style="z-index: 100; display: inline-block; position: absolute; top: 203px; left: 800px; color: white">1:1 CONSULTING</h3>
	  	</div>
  		
	  	<h2 style="text-align: center; margin-top:120px; margin-bottom: 55px; padding-bottom: 30px; width: 100%; border-bottom: 1px solid #ccc;">LOCATION</h2>
		<div id="map" style="width:100%; height:350px;"></div>
		
		<h2 style="text-align: center; margin-top: 120px; margin-bottom: 110px; padding: 25px; width: 100%; border-bottom: 1px solid #ccc;">NOTICE</h2>
		<div id="notice" style="display: flex; margin: 0 auto; width: 1000px;">
			<div id="notice_txt" style="margin-right: 200px;">
				<span style="color:orange;text-align: center; margin-bottom: 50px; width: 380px; height: 80px; display: block;">
					<i class="fas fa-exclamation-circle fa-5x"></i>
				</span>
				<div style="display: bloack; width: 380px; height: 207px; text-align: center;">
					<h4>오시기 전에<br> 공지사항을 읽어주세요!</h4>
					<span>
						<br>
						30분 전에 방문 해 주세요.<br>
						방문하려면 현지 쇼룸에 문의하세요<br>
						최대 2명까지 예약가능 합니다.<br>
						<br>
						쇼룸에 정책에 따라 주세요.
					</span>
				</div>
			</div>
			
			<div id="notice_icon">
				<div style="color:gray; margin-bottom: 20px;">
					<i class="fas fa-head-side-mask fa-3x" style="margin-right: 20px;"></i>
					<p style="display: inline-block;">마스크를 착용해야 합니다</p>
				</div>
				<div style="color:gray; margin-bottom: 20px;">
					<i class="fas fa-hands-wash fa-3x" style="margin-right: 20px;"></i>
					<p style="display: inline-block;">손을 꼭 씻도록 합니다</p>
				</div>
				<div style="color:gray; margin-bottom: 20px;">
					<i class="fas fa-people-arrows fa-3x" style="margin-right: 20px;"></i>
					<p style="display: inline-block;">사람간의 간격을 유지합니다</p>
				</div>
				<div style="color:gray; margin-bottom: 20px;">
					<i class="fas fa-spray-can fa-3x" style="margin-right: 20px;"></i>
					<p style="display: inline-block;">매장은 소독을 통해 청결을 유지합니다</p>
				</div>
				<div style="color:gray; margin-bottom: 20px;">
					<i class="fas fa-credit-card fa-3x" style="margin-right: 20px;"></i>
					<p style="display: inline-block;">신용카드 결제만 받습니다.</p>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Footer -->
    <jsp:include page="../footer.jsp"></jsp:include>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=42d81b928e716a630ed23f5e7f1d07e8"></script>
	<script>
		var arr = new Array();
		<c:forEach items="${maplist }" var="map">
			arr.push({
					addr: "${map.mapAddr}",
					latitude : "${map.latitude}",
					hardness : "${map.hardness}"
				});
		</c:forEach>
	</script>
	<script>

	var mapContainer = document.getElementById('map'), // 지도의 중심좌표
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.546602560578286, 126.96490619997053), // 지도의 중심좌표
	        level: 9 // 지도의 확대 레벨
	    }; 
	
	/* var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다 */
	
	
	console.log("length : " + arr.length)
	
	var markers = new Array(arr.length);
	var contents = new Array(arr.length);
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
	for (var i = 0; i < arr.length; i++) {
		
		
		var la = parseFloat(arr[i].latitude);
		var ma = parseFloat(arr[i].hardness);
		
		var marker = new kakao.maps.Marker({
		    map: map, 
		    position: new kakao.maps.LatLng(ma, la)
		})
		
		markers[i] = marker;
		
		var content = '<div class="wrap">' + 
	        '    <div class="info">' + 
	        '        <div class="title">' + 
	        '            피트인.zip' + 
	        '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
	        '        </div>' + 
	        '        <div class="body">' + 
	        '            <div class="img">' +
	        '                <img src="https://res.cloudinary.com/peloton-cycle/image/fetch/dpr_1.0,f_auto,q_auto:best,w_800/https://images.ctfassets.net/6jnflt57iyzx/6t5BLoYNeBd0ewmFUKl7GZ/a954095d1ff4db368673f59691390a71/Tread_Plus_Mobile.png" width="73" height="70">' +
	        '           </div>' + 
	        '            <div class="desc">' + 
	        '                <div class="ellipsis">' +
	        				arr[i].addr +
	        				'</div>' + 
	        '                <div class="jibun ellipsis">(우) 06611 (지번) 강남대로 459</div>' + 
	        '                <div><a href="http://localhost:8080/" target="_blank" class="link">홈페이지 바로가기</a></div>' + 
	        '            </div>' + 
	        '        </div>' + 
	        '    </div>' +    
	        '</div>';
		
		contents[i] = content;
		
		// 마커 위에 커스텀오버레이를 표시합니다
		// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
		var overlay = new kakao.maps.CustomOverlay({
		    content: contents[i],
		    map: map,
		    position: markers[i].getPosition()       
		});
		
		// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
		kakao.maps.event.addListener(markers[i], 'click', function() {
		    overlay.setMap(map);
		});
	}
	
	
	// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
	function closeOverlay() {
	    overlay.setMap(null);     
	}
	</script>
</body>
</html>