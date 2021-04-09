<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>FITIN.ZIP</title>
  
  <!-- Bootstrap core CSS -->
  <link href="../resources/main/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../resources/main/css/one-page-wonder.min.css" rel="stylesheet">
  
  <!-- 한글 폰트 -->
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
  
  <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

<style>
	* {
		font-family: 'Noto Sans KR', sans-serif;
	}
	
</style>
</head>

<body>

  <!-- Navigation -->
  <jsp:include page="nav.jsp"></jsp:include>
  
  <header class="masthead text-center text-white">
    <div class="masthead-content">
      <div class="container">
        <h1 class="masthead-heading mb-0" style="font-size: 84px;">We bring offline to online</h1>
        <h2 class="masthead-subheading mb-0" style="font-size:55px; font-weight: normal; margin-top: 30px;">헬스장 대신,<br> 이젠 집에서 라이브로 PT 받으세요</h2>
        <a href="#" class="btn btn-primary btn-xl rounded-pill mt-5">둘러보기</a>
      </div>
    </div>
  </header>

  <section>
    <div class="container">
      <div class="row align-items-center" style="margin:180px 0">
        <div class="col-lg-6 order-lg-2">
          <div class="p-5">
            <img class="img-fluid rounded-circle" src="../resources/main/img/img_main_cont1.png" alt="">
          </div>
        </div>
        <div class="col-lg-6 order-lg-1" data-aos="fade-right" style="padding-right: 0px;">
          <div class="p-5">
            <h4 class="display-4" style="font-size: 35px;">헬스장 프로그램을 그대로! 집에서 받는 라이브 피트니스</h4>
            <p>헬스장에 가고 싶지만 갈 수 없는 많은 이유들..
              이제는 헬스장 대신, 집에서 라이브로 PT 받으세요!
              집에서도 운동에 몰입할 수 있는<br> 현장감을 경험할 수 있어요.</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section>
    <div class="container">
      <div class="row align-items-center" style="margin:180px 0">
        <div class="col-lg-6">
          <div class="p-5">
            <img class="img-fluid rounded-circle" src="../resources/main/img/img_main_cont2.png" alt="">
          </div>
        </div>
        <div class="col-lg-6">
          <div class="p-5" data-aos="fade-left" style="padding-right: 0px; text-align: right;">
            <h4 class="display-4" style="font-size: 35px;">
            	전문가의 실시간 피드백이 있는 프리미엄 퍼스널 트레이닝</h4>
            <p>영상을 보고 혼자서 따라하는 기존 홈트는
              제대로 하고 있는건지 알 수 없어 효과가 없거나 다치기 십상이죠.
              <br>피트인.zip은 현장에서 하는 PT처럼 전문 강사님에게
              <br>실시간으로 정확한 피드백을 받을 수 있어요.</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section>
    <div class="container">
      <div class="row align-items-center" style="margin:180px 0">
        <div class="col-lg-6 order-lg-2">
          <div class="p-5">
            <img class="img-fluid rounded-circle" src="../resources/main/img/img_main_cont3.png" alt="">
          </div>
        </div>
        <div class="col-lg-6 order-lg-1">  
          <div class="p-5" data-aos="fade-right" style="padding-right: 0px;">
            <h4 class="display-4" style="font-size: 30px;">
            의지가 약한 홈트족을 위해 <br>책임감과 경쟁심 자극</h4>
            <p>약속된 시간에 수업에 참여해야 한다는 책임감,<br>
              수업에 제대로 참여하는 지 누군가 지켜본다는 압박감,<br>
              나보다 열심히 수업에 참여하는 다른 분들과의 경쟁심을 통해<br>
              운동 의지를 최대로 끌어올릴 수 있어요.</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <jsp:include page="footer.jsp"></jsp:include>

  <!-- Bootstrap core JavaScript -->
  <script src="../resources/main/vendor/jquery/jquery.min.js"></script>
  <script src="../resources/main/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
  <script>
    AOS.init({
        easing: 'ease-out-back',
        duration: 1000
    });
	</script>  
</body>
	
</html>
