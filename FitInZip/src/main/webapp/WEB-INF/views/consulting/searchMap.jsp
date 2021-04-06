<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Collapsible sidebar using Bootstrap 4</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"
	type="text/javascript"></script>

<!-- bbs -->
<link rel="stylesheet" href="../resources/admin/css/bbs.css">
<link href="../resources/admin/js/bbs.js">

<!-- MainSidebar -->
<link rel="stylesheet" href="../resources/admin/css/style5.css">

<!-- Bootstrap CSS CDN -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">

<!-- Font Awesome JS -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
	integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
	crossorigin="anonymous"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
	integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"
	integrity="sha384-SR1sx49pcuLnqZUnnPwx6FCym0wLsk5JZuNx2bPPENzswTNFaQU1RDvt3wT4gWFG"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.min.js"
	integrity="sha384-j0CNLUeiqtyaRmlzUHCPZ+Gy5fQu0dQ6eZ/xAww941Ai1SxSY+0EQqNXNE6DZiVc"
	crossorigin="anonymous"></script>

<!-- Popper.JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
	integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
	crossorigin="anonymous"></script>
<!-- Bootstrap JS -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
	integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
	crossorigin="anonymous"></script>
<!-- MainSidebar -->
<link rel="stylesheet" href="../resources/admin/css/style5.css">


<style type="text/css">
.modal-backdrop {
	background-color: transparent !important;
	position: absolute;
	z-index: -1;
}
<<<<<<< HEAD

.theadWidth {
	width: 100px;
}

=======
.theadWidth {
	width: 100px;
}
>>>>>>> 1c0b6435157934064c967972c78c275ffb3c54e4
.title1 {
	text-align: center;
	font-weight: 800;
	font-size: 20px;
	color: #fff;
	text-transform: uppercase;
}
</style>
<title>주소검색</title>
</head>
<body>
		<div class="wrapper">
				<!-- Sidebar Holder -->
				<jsp:include page="../admin/mainSideBar.jsp"></jsp:include>
			
				<!-- Page Content Holder -->
				<div id="content" style='padding-top: 20px' id="navconvert">
				<!-- NavBar -->
				<jsp:include page="../admin/mainNavBar.jsp"></jsp:include>
		
				<form style="background-color:#3a3d3a; width:1200px; height:700px; margin: 0 auto;padding: 46px;">
					<h4 style="color:white; font-weight:bold; text-align: center; border-bottom: 1px solid white; padding-bottom: 14px;">주소관리</h4>
					<input type="text" id="sample5_address" placeholder="주소" name="addr" 
						style="width: 90%; padding: 6px;margin-right: 5px; margin-top: 10px;border-radius: 5px;">
					<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색" id="btn" 
					style="padding: 7px; background-color: rgba(255,255,255,0.3); border-radius: 5px; border: none; color: white; box-shadow: none;"><br>
					<!-- type: hidden 부분 없으면 넘어가는지 확인해보기  -->
					<input type="hidden" value="" name="la" id="la">
					<input type="hidden" value="" name="ma" id="ma">
					<div id="map" style="width: 100%; height:370px; margin-top:30px; display:block;
					margin-bottom:20px; border:1px solid black;"></div>
				    <input type="button" onclick="send()" value="저장하기" 
				    	style="padding: 7px;background-color: rgba(255,255,255,0.3);border-radius: 5px;border: none;color: white;box-shadow: none;width: 100%;margin-top: 15px;">
				</form>
			</div>
		</div>



	<script type="text/javascript">
        $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').toggleClass('active');
                $(this).toggleClass('active');
            });
        });
    </script>
	
	
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
		var latitude1 = "";
		var hardness1 = "";
		
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
			    			var ps = marker.getPosition();
			    			latitude1 = ps.La;
			    			hardness1 = ps.Ma;
			    			console.log("la : " + latitude1 + "ma : "+ hardness1);
			    		}
			            
			        });
			    }
			}).open();
		}
		
		
		function send(){
			$.ajax("/checkMap",{
				type: "get",
				dataType: "json",
				data : {latitude : latitude1, hardness : hardness1, mapAddr : mapAddr1},
				success : function(returnValue){
					console.log(returnValue);
					alert("장소가 추가되었습니다.")
					window.open("/consulting", "_blank");
				},
				error : function () {
					alert("실패")
				}
			})
			
	    }
		
	</script>
</body>
</html>