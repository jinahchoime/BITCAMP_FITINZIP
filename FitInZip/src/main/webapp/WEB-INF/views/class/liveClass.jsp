<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/class/css/liveClass.css">
<link rel="stylesheet" type="text/css" href="/resources/class/css/swiper.css">

<script>
	$(document).ready(function() {
		var height = $(".swiper-container").height(); //공지사항의 높이값을 구해주고~~
		var num = $(".swiper-slide").length; // 공지사항의 개수를 알아볼수 있어요! length라는 것으로!
		var max = height * num; // 그렇다면 총 높이를 알 수 있겠죠 ?
		var move = 0; // 초기값을 설정해줍니다.
		function noticeRolling() {
			move += height + 20; // 여기에서 += 이라는 것은 move = move + height 값이라는 뜻을 줄인 거에요.
			$(".swiper-wrapper").animate({
				"top" : -move
			}, 400, function() { // animate를 통해서 부드럽게 top값을 올려줄거에요.
				if (move >= max) { // if문을 통해 최대값보다 top값을 많이 올렸다면 다시 !
					$(this).css("top", 0); // 0으로 돌려주고~
					move = 0; // 초기값도 다시 0으로!
				};
			});
		};
		noticeRollingOff = setInterval(noticeRolling, 2500); // 자동롤링답게 setInterval를 사용해서 1000 = 1초마다 함수 실행!!
		$(".swiper-wrapper").append($(".swiper-slide").first().clone()); // 올리다보면 마지막이 안보여서 clone을 통해 첫번째li 복사!

	});
</script>

<script>
	function category(clsCategory) {
		/* alert(clsCategory); */
		$.ajax({
			url:"/liveClassMain",
			type : "post",
			data: {"clsCategory" : clsCategory},
			success : function(data){
                /* console.log(data); */
                /* alert("data : " + data); */
                $('#live_list').html(data); // 성공 시, body부분에 data라는 html 문장들을 다 적용시킵니다. 
            },
            error : function(data){
                alert('error');
            } // error
		})
	};
</script>


</head>
<body>

	<jsp:include page="../nav.jsp"></jsp:include>

	<div id="container">
		<div class="contents clearfix" id="contents">
			<section id="viewArea">
				<div class="content_area pd0" v-cloak>
					<div class="topbnr_area_wrap">
						<div class="topbnr_subtitle" style="width: 600px;">
							이제는 집에서<br> <strong>[&nbsp;
								<div class="main_txt_rolling swiper-container" id="maintxt_roll" style="display: inline-block; width: 305px;">
									<ul class="swiper-wrapper">
										<li class="swiper-slide">온라인 PT</li>
										<li class="swiper-slide">갓성비 PT</li>
										<li class="swiper-slide">언택트 PT</li>
									</ul>
								</div>]
							</strong> 를<br>받아보세요
						</div>
					</div>
				</div>
			</section>
		</div>
		
		<%@ include file="category.jsp"%>
		<div id="live_list" class="contents_wrap pt80">
		
			<%@ include file="liveClassContent.jsp"%>

		</div>
	</div>
</body>
</html>