<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Register Trainer Main Page</title>

        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../resources/trainer/css/RegisterTrainerMainStyles.css" rel="stylesheet" />
    </head>
    <style>
    	video {max-width: 80%; display: block; margin: 20px auto;}
    </style>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script>
	    $(function(){
	    	$('#decreaseQuantity').click(function(e){
		    	e.preventDefault();
		    	var stat = $('#numberUpDown').text();
		    	var num = parseInt(stat, 10);
		    	var count = $('#count').text();
		    	num--;
		    	var total = count * num * 15000;
		    	console.log(total);
		    	if(num<=0){
		    	alert('더이상 줄일수 없습니다.');
		    	num =1;
	    	}
	    	$('#numberUpDown').text(num);
	    	});
	    	
	    	$('#increaseQuantity').click(function(e){
		    	e.preventDefault();
		    	var stat = $('#numberUpDown').text();
		    	var num = parseInt(stat, 10);
		    	var count = $('#count').text();
		    	num++;
		    	var total = count * num * 15000;
		    	console.log(total);
		    	if(num>9){
			    	alert('더이상 늘릴수 없습니다.');
			    	num=8;
	    		}
	    		$('#numberUpDown').text(num);
	    	});
	    });
    </script>
    
    <body id="page-top">   
    <!-- Masthead-->
    <header class="masthead bg-primary text-white text-center">
        <div class="container d-flex align-items-center flex-column">
            <!-- Masthead Avatar Image-->
            <img class="masthead-avatar mb-5" src="../resources/trainer/img/avataaars.svg" alt="" />
            <!-- Masthead Heading-->
            <h2 class="masthead-heading text-uppercase mb-0">FITIN.ZIP의 트레이너가 되어보세요!</h2>
        </div>
    </header>
    
    <!-- Portfolio Section-->
    <section class="page-section portfolio" id="portfolio"> 
        <div class="container">
            <!-- Portfolio Section Heading-->
            <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">언제, 어디서든 트레이너와 닿을 수 있도록</h2>

            <!-- Icon Divider-->
            <div class="divider-custom">
                <div class="divider-custom-line"></div>
                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                <div class="divider-custom-line"></div>
            </div>
            <div style="text-align: center; padding: 2rem 2rem 3rem">
            	<h2 style="padding: 2rem">FITIN.ZIP은 어떤 곳이죠?</h2>
				<p>수업은 온라인으로 진행되지만 일방향으로 진행되는 VOD수업이 아닌, 쌍방향으로 진행하는 실시간 라이브 수업이에요.</p>
				<p> 오프라인PT처럼 피드백이 오가며 수업이 진행되는 온라인 그룹PT입니다.</p>
            </div>

             <div>
		     	<video controls loop muted autoplay>
				   <source src="../resources/trainer/video/강사등록하기영상.mp4" type="video/mp4">
				</video>
             </div>

			 <div style="text-align: center; padding: 2rem 2rem 3rem">
               	<p>온라인 수업에 대한 걱정과 부담으로 시작하지 못하고 계셨다면 FITIN.ZIP에서 시작해 보세요!</p>
               	<p>촬영 장비 지원부터 수업 가이드 지원, 회원 모객까지 편하게 진행할 수 있도록 도와드릴게요.</p>
               	<p>강사님께서는 화면을 뚫고 나오는 열정과 알찬 강의만 준비해 주세요.</p>
             </div>
                
             <div class="css-tgvm6-root-section" style="text-align: center; padding: 2rem 2rem 3rem">
             	<h2>FITIN.ZIP 트레이너가 되는 과정</h2>
             	<div style="padding: 2rem 2rem 1rem">
             		<svg xmlns="http://www.w3.org/2000/svg" width="350" height="431"> 
		                <g transform="translate(2 6)">
		            		<circle cx="6.5" cy="6.5" r="6.5" fill="#FFF" stroke="#FC5E5E" stroke-width="4"></circle>
		            		<path fill="#FFF" stroke="#FC5E5E" stroke-dasharray="1" stroke-linecap="square" d="M7 12v412"></path>
		            		<circle cx="7" cy="117" r="4" fill="#FC5E5E"></circle>
		            		<circle cx="7" cy="227" r="4" fill="#FC5E5E"></circle>
		            		<circle cx="7" cy="337" r="4" fill="#FC5E5E"></circle>
		          		</g>
		          
				        <g fill="#2A282D">
				          	<text font-family="NotoSansCJKkr-Medium, Noto Sans CJK KR" font-size="16" font-weight="400" letter-spacing="-.3" transform="translate(39)">
				          		<tspan x=".32" y="17">지원하기</tspan>
				          	</text>
				          	<text font-family="NotoSansCJKkr-Regular, Noto Sans CJK KR" font-size="14" letter-spacing="-.1" transform="translate(39)">
				          		<tspan x="0" y="45">온라인으로 간편하게 지원하세요.</tspan>
				          	</text>
				        </g>
		          
				        <g fill="#2A282D">
					        <text font-family="NotoSansCJKkr-Regular, Noto Sans CJK KR" font-size="14" letter-spacing="-.1" transform="translate(39 110)">
					          	<tspan x="0" y="45">강사님의 지원서를 확인합니다.</tspan>
					        </text>
					        <text font-family="NotoSansCJKkr-Medium, Noto Sans CJK KR" font-size="16" font-weight="400" letter-spacing="-.3" transform="translate(39 110)">
					          	<tspan x=".74" y="17">지원서 확인</tspan>
					        </text>
				        </g>
				        
				        <g fill="#2A282D">
				          	<text font-family="NotoSansCJKkr-Regular, Noto Sans CJK KR" font-size="14" letter-spacing="-.1" transform="translate(39 220)">
				          		<tspan x="0" y="43">원하는 클래스를 만들고 멤버를 기다립니다.</tspan>
				          	</text>
				          	<text font-family="NotoSansCJKkr-Medium, Noto Sans CJK KR" font-size="16" font-weight="400" letter-spacing="-.3" transform="translate(39 220)">
				          		<tspan x=".6" y="17">클래스 개설</tspan>
				          	</text>
				        </g>
				          
		          		<g fill="#2A282D">
		          	  		<text font-family="NotoSansCJKkr-Regular, Noto Sans CJK KR" font-size="14" letter-spacing="-.1" transform="translate(39 330)">
		          				<tspan x="0" y="43">클래스를 진행하고 매달 수익금을 받아가세요.</tspan>
		          			</text>
		          			<text font-family="NotoSansCJKkr-Medium, Noto Sans CJK KR" font-size="16" font-weight="400" letter-spacing="-.3" transform="translate(39 330)">
		          				<tspan x=".6" y="17">클래스 진행</tspan>
		          			</text>
		          		</g>
		            </svg>
		         </div>
		     </div>
		</div>
    </section>
    <!-- About Section-->
    <section class="page-section bg-primary text-white mb-0" id="about">

	    <!-- About Section Heading-->
	    <h4 class="page-section-heading text-center text-uppercase text-white">지금 강사로 등록하고 수익을 받아가세요!</h4>
	    
	    <!-- Icon Divider-->
	    <!-- <div class="divider-custom divider-light">
	        <div class="divider-custom-line"></div>
	        <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
	        <div class="divider-custom-line"></div>
	    </div> -->

	    <!-- About Section Button-->
		  
	    <div class="text-center mt-4">
	        <a class="btn btn-xl btn-outline-light" href="/registerForm" style="margin-top: 40px;">
	            <i class="fas fa-download mr-2"></i>
	         	강사 지원하기
	        </a>
	     </div>
	     
    </section>
        

    <!-- Footer--> <!-- 세부분으로 나눈 것을 하나로 합치기 -->
    <footer class="footer text-center">
        <div class="container">
            <div class="row1">  
                <!-- Footer About Text-->
                <!-- <div class="">
                    <h4 class="text-uppercase mb-4">풋터</h4> -->
                    <!-- <p class="lead mb-0">
                       	
                    </p> -->
            <div style="display:inline-block; width: 370px; vertical-align: top;">
		  	<h3 style="font-size: 18px; color: white; margin-bottom: 15px;">고객센터</h3>
		    <a href="https://open.kakao.com/o/sAQYcE6c" style="color: black;border: 1px solid #ffffff52;background-color: white;padding: 10px 65px 10px 65px;border-radius: 5px;">
		    	<img alt="카카오톡" src="https://img.ficle.io/www/common/icon/ic_kk_type4.png"
		    		style="padding-bottom: 1px;">
		    	문의하기
		    </a>
		    <p style="color:#ababab; margin-top:5px;">오전 11시 ~ 오후 6시 (주말, 공휴일 )</p>
		  </div>
		  <div style="display: inline-block; border: 0.5px solid #ffffff52; height: 122px;"></div>
		   <div style="display:inline-block;color: #ffffff52;vertical-align: top;margin-top: 32px;">
		  	<a href="#" style="margin-right: 20px; margin-left: 65px; color: white; text-decoration: none;">
		  		<span style="color: #ffffff52;">
		  			<i class="fab fa-instagram fa-3x"></i>
		  		</span>
		  	</a>
		  	<a href="#" style="margin-right: 25px; color: white; text-decoration: none;">
		  		<span style="color: #ffffff52;">
		  			<i class="fab fa-facebook-square fa-3x"></i>
		  		</span>
		  	</a>
		  	<a href="#" style="margin-right: 25px; color: white; text-decoration: none;">
		  		<span style="color: #ffffff52;">
		  			<i class="fab fa-twitter-square fa-3x"></i>
		  		</span>
		  	</a>
		  	<a href="#" style="margin-right: 25px; color: white; text-decoration: none;">
		  		<span style="color: #ffffff52;">
		  			<i class="fab fa-blogger fa-3x"></i>
		  		</span>
		  	</a>
		  </div> 
		  <div>
		  	<h3 style=" display: inline-block; margin-right: 20px; margin-top: 60px"><a href="/" style="color: white; text-decoration: none;">FITIN.ZIP</a></h3>
		  	<p style="display: inline-block; color: #ababab; margin-right: 5px;">회사소개</p>
		  	<p style="display: inline-block; color: #ababab; margin-right: 5px;">이용약관</p>
		  	<p style="display: inline-block; color: #ababab;">개인정보취급방침</p>
		  </div>
		  <div style="font-size: 13px; color: #ffffff66;">
		  	<p>사업자등록번호 000-00-00000 | 통신판매번호 2021-서울서초-0000 | 대표이사 김피트  | 개인정보관리책임자 김비트  | 서울특별시 서초구 서초4동 강남대로 </p>
		  	<p>Copyright © FITINZIPCOMPANY Co. All rights reserved. Server : 000.00.00.000</p>
		  </div>
                </div>
            </div>
        </div>
    </footer>
    
    <!-- Copyright Section-->
    <!-- <div class="copyright py-4 text-center text-white">
        <div class="container"><small>Copyright © Your Website 2021</small></div>
    </div> -->
    
    <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes)-->
    <div class="scroll-to-top d-lg-none position-fixed">
        <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top"><i class="fa fa-chevron-up"></i></a>
    </div>

     <!-- Bootstrap core JS-->
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
     <!-- Third party plugin JS-->
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
     <!-- Contact form JS-->
     <script src="../resources/trainer/js/jqBootstrapValidation.js"></script>
     <script src="../resources/trainer/js/contact_me.js"></script>
     <!-- Core theme JS-->
     <script src="../resources/trainer/js/RegisterTrainerMainscripts.js"></script>
    
     </body>
</html>
