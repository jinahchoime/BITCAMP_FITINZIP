<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소검색</title>
</head>
<body>
	<form>
		<input type="text" id="sample5_address" placeholder="주소" name="addr">
		<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색" id="btn"><br>
		<input type="hidden" value="" name="la" id="la">
		<input type="hidden" value="" name="ma" id="ma">
		<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
		 <input type="button" onclick="send()" value="보내기">
	</form>
	
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=42d81b928e716a630ed23f5e7f1d07e8&libraries=services"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		mapOption = {
		    center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
		    level: 5 // 지도의 확대 레벨
		};
		
		//지도를 미리 생성
		var map = new daum.maps.Map(mapContainer, mapOption);
		//주소-좌표 변환 객체를 생성
		var geocoder = new daum.maps.services.Geocoder();
		//마커를 미리 생성
		var marker = new daum.maps.Marker({
		position: new daum.maps.LatLng(37.537187, 127.005476),
		map: map
		});
		
		var coords;
		var addr;
		var mapAddr1 = "";
		
		function sample5_execDaumPostcode() {
			new daum.Postcode({
			    oncomplete: function(data) {
			    	addr = data.address; // 최종 주소 변수
			    	
			        // 주소 정보를 해당 필드에 넣는다.
			        document.getElementById("sample5_address").value = addr;
			        // 주소로 상세 정보를 검색
			        geocoder.addressSearch(data.address, function(results, status) {
			            // 정상적으로 검색이 완료됐으면
			            if (status === daum.maps.services.Status.OK) {
							
			                var result = results[0]; //첫번째 결과의 값을 활용
			
			                // 해당 주소에 대한 좌표를 받아서
			                coords = new daum.maps.LatLng(result.y, result.x);
			                // 지도를 보여준다.
			                mapContainer.style.display = "block";
			                map.relayout();
			                // 지도 중심을 변경한다.
			                map.setCenter(coords);
			                // 마커를 결과값으로 받은 위치로 옮긴다.
			                marker.setPosition(coords)
			            }
			            
			            if(addr != null){
			    			mapAddr1 = document.getElementById("sample5_address").value;
			    			console.log("mapAddr1 : " + mapAddr1);
			    		}
			            
			        });
			    }
			}).open();
		}
		
		console.log("mapAddr1 : " + mapAddr1);
		
		var ps = marker.getPosition();
		var latitude1 = ps.La;
		var hardness1 = ps.Ma;
		
		
		function send(){
			alert("실행!");
			$.ajax("/checkMap",{
				type: "get",
				dataType: "json",
				data : {latitude : latitude1, hardness : hardness1, mapAddr : mapAddr1},
				success : function(returnValue){
					alert("성공");
					console.log(returnValue);
					location.href="/consulting"
				},
				error : function () {
					alert("실패")
				}
			})
			
	    }
		
	</script>
</body>
</html>