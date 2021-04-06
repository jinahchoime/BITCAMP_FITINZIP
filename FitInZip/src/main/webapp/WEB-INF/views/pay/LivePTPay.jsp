<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no,user-scalable=0">
    <meta name="format-detection" content="telephone=no">
    <meta name="naver-site-verification" content="114a8942a1df74aa238c3e1fcab3eb7a2010a837">
    <meta name="google-site-verification" content="sDJaFVUVSKXtQwYOMjBZWvIhJvJxfoZfpa-Z1ggX4BU">
    <meta name="facebook-domain-verification" content="hi9ybbg48zcpfboij5us282gtv51oq">
    <title>FITIN.ZIP 결제페이지</title>
    
   
   
   <!--  <meta property="og:image" content="https://img.ficle.io/mobile/common/header/og_img2.png">
    <meta property="og:type" content="article">

    <link rel="shortcut icon" href="https://img.ficle.io/www/common/header/favicon.ico" type="image/x-icon"> -->

 <!--    <link rel="stylesheet" href="/css/reset.css?2021040520" type="text/css">
    <link rel="stylesheet" href="/www/css/reset.css?2021040520" type="text/css">
    <link rel="stylesheet" href="/www/css/common.css?2021040520" type="text/css">  -->

    <!-- <link rel="stylesheet" href="//www.bravecompany.net/css/swiper.min.css" type="text/css">
    <link rel="stylesheet" href="//www.bravecompany.net/css/aos.css" type="text/css"> -->
    <script type="text/javascript" async="" src="https://www.googletagmanager.com/gtag/js?id=G-8JW0LD87R5&amp;l=dataLayer&amp;cx=c"></script>
    <script type="text/javascript" async="" src="https://www.googleadservices.com/pagead/conversion_async.js"></script>
    <script type="text/javascript" async="" src="https://www.googletagmanager.com/gtag/js?id=AW-936821621&amp;l=dataLayer&amp;cx=c"></script>
    <script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
    <script src="https://connect.facebook.net/signals/config/536921446948741?v=2.9.33&amp;r=stable" async=""></script>
    <script async="" src="https://connect.facebook.net/en_US/fbevents.js"></script>
    <!-- <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/swiper.min.js"></script> -->
    <script type="text/javascript" src="//www.bravecompany.net/js/common.js"></script>
    <script src="https://unpkg.com/core-js-bundle@3.1.4/index.js"></script>
    <script src="https://unpkg.com/regenerator-runtime@0.13.3/runtime.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.34/browser.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.5.16"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue-awesome-swiper"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>

  <!--   <script type="text/javascript" src="/js/common.js?2021040520"></script>
    <script type="text/babel" src="/js/vue.common.js?20210405201"></script> -->
    <!-- <script src="/js/kakao.min.js"></script> -->
    <!-- Firebase -->
    <script src="https://www.gstatic.com/firebasejs/8.0.0/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.0.0/firebase-auth.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.0.0/firebase-analytics.js"></script>

   <!-- Custom styles for this template-->
    <link href="../resources/class/css/clsPayment.css" rel="stylesheet">
    <script src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/936821621/?random=1617621176378&amp;cv=9&amp;fst=1617621176378&amp;num=1&amp;userId=undefined&amp;bg=ffffff&amp;guid=ON&amp;resp=GooglemKTybQhCsO&amp;eid=2505059651&amp;u_h=1080&amp;u_w=1920&amp;u_ah=1040&amp;u_aw=1920&amp;u_cd=24&amp;u_his=16&amp;u_tz=540&amp;u_java=false&amp;u_nplug=3&amp;u_nmime=4&amp;gtm=2oa3o0&amp;sendb=1&amp;ig=1&amp;data=event%3Dgtag.config&amp;frm=0&amp;url=https%3A%2F%2Fwww.ficle.io%2Fplay%2Fplay_buy&amp;ref=https%3A%2F%2Fwww.ficle.io%2Fplay%2Fplay_apply%2F270&amp;tiba=%ED%94%BC%ED%81%B4%EB%9D%BC%EC%9D%B4%EB%B8%8C%20%7C%20%ED%94%BC%EB%93%9C%EB%B0%B1%EC%9E%88%EB%8A%94%20%EB%9D%BC%EC%9D%B4%EB%B8%8C%20%ED%94%BC%ED%8A%B8%EB%8B%88%EC%8A%A4%EC%88%98%EC%97%85&amp;hn=www.googleadservices.com&amp;async=1&amp;rfmt=3&amp;fmt=4"></script>

	<!-- 아임포트 카드결제 -->
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
	/* var money = ${pInfo.money}; // 결제금액 ( 서버에서 RestAPI를 통해서 결제번호로 금액변조를 방지함) 
	var point = $ {userPoint}; // 고객 맴버십 포인트 정보 
	function paymentDo() {
		$.ajax({
			type: "get",
			url: "/civ/payment/checkseat", // 최종 결제전에 마지막으로 해당 좌석이 예매가능한 상태인지 확인 요청 
			data: { 'scheduleCode': ${pInfo.scheduleCode}, // 구매하려는 스케줄 코드 
				'checkSeat': '${pInfo.checkSeat}' // 확인 좌석 
			},
			success: function(data) {
				if (data) {
					var IMP = window.IMP;
					IMP.init('imp93258645');// 아임포트 라이브러리를 통해서 가맹점정보를 불러옴 
					IMP.request_pay({
						pg: 'html5_inicis', // 웹 표준 결제 
						pay_method: $(":input:radio[name=paycard]:checked").val(), //결제수단 
						merchant_uid: mid, // 결제 고유번호 
						name: '테스트 주문', // 결제 상품 이름 
						amount: money, // 결제금액 ( RestAPI를 호출한 상태이기 때문에 금액 변조시 결제창이 뜨지 않고 오류 ) 
						buyer_tel: '${sessionScope.loginInfo.userPhone}' // 유저 전화번호 ( 필수 ) 
					}, function(rsp) { // 콜백 함수 
						if (rsp.success) { // 결제 정보를 form에 담음
							$('#checkSeat').val('${pInfo.checkSeat}'); 
							$('#merchant_uid').val(rsp.merchant_uid); 
							$('#paid_amount').val(rsp.paid_amount); 
							$('#pay_method').val(rsp.pay_method); 
							var queryString = $("#form").serialize(); 
							$.ajax({ type: "post", url: "/civ/payment/paid", //최종 결제정보를 서버로 전달 
								data: queryString, 
								success: function(data) {
									if (data == "failed") {
										alert('결제 실패'); 
									} else { // 성공시 웹소켓을 사용해서 해당 스케줄을 보고있는 사람들에게도 좌석 정보를 업데이트 
										var webSocket = new WebSocket("ws://192.168.219.101/civ/websocket/${pInfo.scheduleCode}"); 
										webSocket.onopen = () => webSocket.send(data); 
										webSocket.onclose = function(message) {
											disconnect(); 
										}; 
										function disconnect() {
											webSocket.close(); 
										} // 결제 확인창으로 이동 
										location.href = "/civ/payment/payok"; 
									} 
								} 
							}) 
						} else {
							alert('결제 실패하셨습니다.'); 
						} 
					}); 
				} else {
					alert('결제 오류'); 
				} 
			} 
		}); 
	}
 */
function iamport(){
	 
 //가맹점 식별코드
 IMP.init('imp89234237');
 IMP.request_pay({
     pg: 'inicis', // version 1.1.0부터 지원.
     pay_method: 'card',
     merchant_uid: 'merchant_' + new Date().getTime(),
     name: '주문명:결제테스트',
     amount: 1400, //판매 가격
     buyer_email: 'p.hayan90@gmail.com',
     buyer_name: '박하얀',
     buyer_tel: '010-9368-9324',
     buyer_addr: '경기도 의왕시 덕장로76',
     buyer_postcode: '123-456'
 }, function(rsp) {
     if (rsp.success) {
         var msg = '결제가 완료되었습니다.';
         msg += '고유ID : ' + rsp.imp_uid;
         msg += '상점 거래ID : ' + rsp.merchant_uid;
         msg += '결제 금액 : ' + rsp.paid_amount;
         msg += '카드 승인번호 : ' + rsp.apply_num;
         //jQuery로 HTTP 요청
         jQuery.ajax({
        	url: "https://www.myservice.com/payments/complete", //가맹점서버
        	method: "POST",
        	headers: {"Content-Type": "application/json"},
        	data: {
        		 imp_uid: rsp.imp_uid,
                 merchant_uid: rsp.merchant_uid
                 //기타 필요한 데이터가 있으면 추가 전달
             }
         }).done(function (data) {
           // 가맹점 서버 결제 API 성공시 로직
           
         })
        	
     } else {
         var msg = '결제에 실패하였습니다.';
         msg += '에러내용 : ' + rsp.error_msg;
     }
     alert(msg);
 });
 }
</script>


</head>

<body>
	<div id="container">
    <div class="contents clearfix" id="contents">

<%--     <script type="text/babel">
            // 메뉴 팝업 마우스오버
	$('.gnb_area ul li').hover(function(){
		$(this).find('.evt_pop').stop().fadeToggle();
	});

	// 관심클래스 버튼 클릭
    $(document).on('click','.btn_like', function(e) {
		e.preventDefault();
		// $(this).addClass('on');
	});

	$(window).scroll(function(){
		if($(window).scrollTop() >= 60){
			$('.header_bnr_wrap').addClass('fix');
		} else {
			$('.header_bnr_wrap').removeClass('fix');
		}
	});
	// 레이어 팝업 외부 영역 클릭시 창 닫힘기능 제외
    // $(document).on('click', function(e) {
	// 	console.log($(e.target).parents('.layout_popup').length);
	// 	if($(e.target).parents('.layout_popup').length == 0) {
	// 		if ($('.layout_popup_wrap').css('display') == 'block') {
	// 			if (confirm('창을 닫겠습니까?')) {
	// 				$('.layout_popup_wrap').hide();
	// 			} else {
	// 				return false;
	// 			}
	// 		}
	// 	}
	// });


    var headerView = new Vue({
        el: "#headerView",
        data: {
            isOpenMenu: false,
            isLoaded: false,
            userKey: "1615886789785310546",
            userName: "",
            nicName: "",
            nation: "",
            gender: "1",

            userImage: "",
            flag: "",

            alarms: [],
            location: document.location.href,
        },
        methods: {
            fetchData: async function() {
                var self = this;
                try {
                    var user = await axios({
                        method: 'POST',
                        url: "https://api.ficle.io/w1/user/getProfile",
                        data: {userKey: self.userKey},
                        responseType: 'json'
                    });

                    if(user.data.resultCode == 1) {
                        self.userName = user.data.user.userName;
                        self.nation = user.data.user.nation;
                        self.userImage = user.data.user.userImage;
                        self.nicName = user.data.user.nicName;

                        self.setNation();
                    }

                    // 알람 신청 리스트
                    var alarms = await axios({
                        method: 'POST',
                        url: "https://api.ficle.io/w1/user/programAlarmDatas",
                        data: {userKey: self.userKey},
                        responseType: 'json'
                    });

                    if(alarms.data.resultCode == 1) {
                        self.alarms = alarms.data.alarms;
                    }

                    self.isLoaded = true;
                } catch(error) {
                    console.log(error);
                }
            },
            setNation:function() {
                var self = this;

                axios({
                    method: 'GET',
                    url: 'https://restcountries.eu/rest/v2/all',
                    responseType: 'json'
                })
                .then(function(response) {
                    response.data.forEach(function(item) {
                        if(item.callingCodes[0] == self.nation) {
                            self.nation = item.callingCodes[0];
                            self.flag = item.flag;
                        }
                    });
                })
                .catch(function(error) {
                    console.log(error);
                });
            }
        },
        created() {
           this.fetchData();
        }
    });
</script>
        
                    // 시즌
                    var season = await axios({
                        method: 'GET',
                        url: 'https://api.ficle.io/w1/program/coachingProgramSeason/'+ self.seasonKey,
                        responseType: 'json'
                    });

                    if(season.data.resultCode == 1) {
                        self.season = season.data.season;
                        self.coachingProgramKey = season.data.season['coachingProgramKey'];

                        for (var i in self.season.seasonInfos) {
                            self.season[self.season.seasonInfos[i].key] = self.season.seasonInfos[i].value;
                        }

                    }
        
                    // 코칭프로그램
                    var coachingProgram = await axios({
                        method: 'GET',
                        url: 'https://api.ficle.io/w1/program/coachingProgram/'+ self.coachingProgramKey,
                        responseType: 'json'
                    });

                    if(coachingProgram.data.resultCode == 1) {
                        self.coachingProgram = coachingProgram.data.coachingProgram ;
                        self.programKey = coachingProgram.data.coachingProgram ['programKey'];
                        self.coachKey = coachingProgram.data.coachingProgram ['programKey'];
                    }

                    // 프로그램
                    var program = await axios({
                        method: 'GET',
                        url: 'https://api.ficle.io/w1/program/program/'+ self.programKey,
                        responseType: 'json'
                    });

                    if(program.data.resultCode == 1) {
                        self.program = program.data.program;
                    }


                   // console.log(program);
                    // 패키지
                    var packages = await axios({
                        method: 'POST',
                        url: 'https://api.ficle.io/w1/product/packages',
                        responseType: 'json'
                    });

                    if(packages.data.resultCode == 1) {
                        var pkgList = packages.data.packages;
                        for(var i in pkgList) {
                            self.pkg[pkgList[i].packageKey] = pkgList[i];
                        }

                    }

                    
                    // 
                    var couponlist = await axios({
                        method: 'POST',
                        url: 'https://api.ficle.io/w1/user/getCoupon',
                        data: {"userKey": self.userKey},
                        responseType: 'json'
                    });

                    if(couponlist.data.resultCode == 1) {
                        self.coupons = couponlist.data.coupons
                    }

                    // 환급 계좌 정보 불러오기
                    var refundAccount = await axios({
                        method: 'POST',
                        url: "https://api.ficle.io/w1/user/getRefundAccount",
                        data: {"userKey": self.userKey},
                        responseType: 'json'
                    });

                    if(refundAccount.data.resultCode == 1) {
            
                      if(refundAccount.data.refundAccount.depositorName) self.depositorName = refundAccount.data.refundAccount.depositorName;
                      if(refundAccount.data.refundAccount.accountNumber) self.accountNumber = refundAccount.data.refundAccount.accountNumber; 
                   
                        //$("input[name='bankType']").val(refundAccount.data.refundAccount.bankType);
				        //$("input[name='bankName']").val(refundAccount.data.refundAccount.bankName);
                      if(refundAccount.data.refundAccount.bankType) self.bankType = refundAccount.data.refundAccount.bankType;
                      if(refundAccount.data.refundAccount.bankName) self.bankName = refundAccount.data.refundAccount.bankName;

                    }
/*
                    // 이미 등록된 사용자 여부 확인
                    var getEventUser = await axios({
                        method: 'GET',
                        url: `https://api2.ficle.io/eventUser/${this.userKey}`,
                        responseType: 'json'
                    });

                    if(getEventUser.data.result && getEventUser.data.data.payFlag != 1) {
                        self.giftData.productGb = getEventUser.data.data.productGb
                        self.giftData.productKey = parseInt(getEventUser.data.data.memo)
                        self.giftData.packageKey = getEventUser.data.data.packageKey
                    }
*/




                    self.selectPkg(self.selectedPkg.key);

                   // console.log( self.depositorName+"|"+self.bankType+"|"+self.bankName+"|"+self.accountNumber ); 
                    self.isLoaded = true;
                } catch(error) {
                    console.log(error);
                }

            },
            async setProduct(packageInfo) {
                    
                var self = this;
                    this.selectedPkg.packageAmt = 0;
                    this.selectedPkg.saleAmt = 0;
                    this.selectedPkg.payEvents = [];

                    for( var i in packageInfo.products) {
                        self.selectedPkg.packageAmt += packageInfo.products[i].productAmt;
                        self.selectedPkg.saleAmt += packageInfo.products[i].productSaleAmt;

                        if ( packageInfo.products[i].payEventKeys.length > 0 ) {

                            // 할인정보
                            var payEvents = await axios({
                                method: 'POST',
                                url: 'https://api.ficle.io/w1/payment/events',
                                data: {eventKeys: packageInfo.products[i].payEventKeys},
                                responseType: 'json'
                            });

                            for(var j in payEvents.data.payEvents) {
                                for(var k in payEvents.data.payEvents[j].eventItems) {
                                    if([1,2,10].indexOf(payEvents.data.payEvents[j].eventItems[k].eventType) >= 0) {
                                        payEvents.data.payEvents[j].eventAmt = packageInfo.products[i].productAmt - packageInfo.products[i].productSaleAmt;
                                        payEvents.data.payEvents[j].eventDc = this.$common.getDiscount(packageInfo.products[i].productAmt, packageInfo.products[i].productSaleAmt);
                                        self.selectedPkg.payEvents.push(payEvents.data.payEvents[j]);
                                    }
                                }
                            }
                        }

                        self.selectedPkg.products[i] = {
                            'seasonKey': parseInt(self.seasonKey),
                            'packageKey': parseInt(self.selectedPkg.key),
                            'productKey': parseInt(packageInfo.products[i].productKey),
                            'qty': 1,
                            'saleAmt': parseInt(packageInfo.products[i].productSaleAmt),
                            'payAmt': parseInt(packageInfo.products[i].productSaleAmt),
                            'productType': parseInt(packageInfo.products[i].productType),
                            'couponKey': '',
                            'couponDCAmt': 0,
                            'infoAux' : [],
                                'payEventKeys': [],
                            // 'payEventKeys': packageInfo.products[i].payEventKeys,
                        };
                    }
            },
            async selectPkg(packageKey) {
                var self = this;
                console.log("packageKey : "+packageKey)
                if(this.selectedPkg.key == '' && false) {
                    this.selectedPkg.packageName = '';
                    this.selectedPkg.packageAmt = 0;
                    this.selectedPkg.saleAmt = 0;
                    this.selectedPkg.dlvAmt = 0;
                    this.selectedPkg.earlyBirdDc = 0;
                    this.selectedPkg.products = [];
                    this.selectedPkg.payEvents = [];
                    this.isDeliver = 0;
                    this.isSelected = false;
                    this.couponCancel();
                } else {
                    // 패키지 금액은 display용 (실제 결제는 상품별 productSaleAmt로 진행)
                    this.couponCancel();
                    this.selectedPkg.packageAmt = 0;
                    this.selectedPkg.saleAmt = 0;
                    this.selectedPkg.products = [];
                    this.selectedPkg.payEvents = [];
                    this.selectedPkg.dlvAmt = 0;
                    this.isDeliver = this.pkg[this.selectedPkg.key].deliveryType;
                    this.selectedPkg.packageName = this.pkg[this.selectedPkg.key].packageName;

                    await self.setProduct(self.pkg[packageKey]);

                    if ( self.selectedPkg.saleAmt > 1000 ) self.isRefundinfo = true;
                    if ( self.giftData.productGb > '0' && self.selectedPkg.saleAmt > 1000 ) {

                        var addProduct = {
                                'seasonKey': parseInt(0),
                                'packageKey': parseInt(self.giftData.packageKey),
                                'productKey': parseInt(self.giftData.productKey),
                                'qty': 1,
                                'saleAmt': parseInt(0),
                                'payAmt': parseInt(0),
                                'productType': parseInt(20),
                                'couponKey': '',
                                'couponDCAmt': 0,
                                'infoAux' : [],
                                'payEventKeys': [],
                                // 'payEventKeys': packageInfo.products[i].payEventKeys,
                            };

                        self.selectedPkg.products.push(addProduct);

                        self.isDeliver = 2;
                    }

                    if(self.isDeliver > 1) {

                        // 배송비 상품
                        var dlvProduct = await axios({
                            method: 'GET',
                            url: 'https://api.ficle.io/w1/product/product/100',
                            responseType: 'json'
                        });

                        if(dlvProduct.data.resultCode == 1) {
                            self.dlvProduct = {
                                'seasonKey': 0,
                                'packageKey': 0,
                                'productKey': parseInt(dlvProduct.data.product.productKey),
                                'qty': 1,
                                'saleAmt': parseInt(dlvProduct.data.product.productAmt),
                                'payAmt': parseInt(dlvProduct.data.product.productAmt),
                                'productType': parseInt(90),
                                'couponKey': '',
                                'couponDCAmt': 0,
                                'payEventKeys': [],
                                'infoAux' : [],
                            };

                            self.selectedPkg.products.push(self.dlvProduct);
                            self.selectedPkg.dlvAmt = dlvProduct.data.product.productAmt;
                        }                    
                    }

                    self.selectedPkg.earlyBirdDc = Math.floor((self.selectedPkg.packageAmt - self.selectedPkg.saleAmt)/self.selectedPkg.packageAmt*100);
                    self.isSelected = true;
                }
                
            },
            removeSelect() {
                this.selectedPkg.key = '';
                this.selectedPkg.packageName = '';
                this.selectedPkg.packageAmt = 0;
                this.selectedPkg.saleAmt = 0;
                this.selectedPkg.earlyBirdDc = 0;
                this.isSelected = false;
                this.couponCancel();
            },
            selectPostCode: function() {
                var self = this;
                new daum.Postcode({
                    oncomplete: function(data) {
                        var fullAddr = ''; // 최종 주소 변수
                        var extraAddr = ''; // 조합형 주소 변수

                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                            fullAddr = data.roadAddress;
                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                            fullAddr = data.jibunAddress;
                        }

                        // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                        if(data.userSelectedType === 'R'){
                            //법정동명이 있을 경우 추가한다.
                            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                extraAddr += data.bname;
                            }
                            // 건물명이 있을 경우 추가한다.
                            if(data.buildingName !== '' && data.apartment === 'Y'){
                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                            }
                            // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                            fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                        }


                        if(data.userSelectedType){
                            // 신규 우편번호
                            self.zipCode = data.zonecode;
                        }else{
                            //구 우편번호
                            self.zipCode = data.postcode1+'-'+data.postcode2;
                        }

                        self.address1 = fullAddr;

                        // 커서를 상세주소 필드로 이동한다.
                        self.address2 = "";
                        self.$refs.address2.focus();
                    }
                }).open();
            },
            couponApply: function() {
                var self = this;
                self.selectedPkg.couponDc = 0;
                /*
                axios({
                    method: 'GET',
                    url: 'https://api.ficle.io/w1/payment/coupon/'+self.couponKey,
                    responseType: 'json'
                })
                .then(function(res) {
                    if(res.data.resultCode == 1) {
                */
                        // 최종 할인금액
                        axios({
                            method: 'POST',
                            url: 'https://api.ficle.io/w1/payment/calculationCouponDCAmt',
                            data: {couponKey: self.couponKey.toString(), userKey: "1615886789785310546", products: self.selectedPkg.products},
                            responseType: 'json'
                        })
                        .then(function(res2) {
                            if(res2.data.resultCode == 1) {
                                self.selectedPkg.products = [];
                                for(var i in res2.data.products) {
                                    self.selectedPkg.products[i] = res2.data.products[i];
                                    self.selectedPkg.couponDc += res2.data.products[i].couponDCAmt;
                                }
                                self.isCouponApplied = true;
                            } else {
                                self.showAlert("쿠폰 할인금액 계산에 오류가 발생!");
                            }
                        })
                        .catch(function(error) {
                            console.log(error);
                        });

                /*
                    } else {
                        Bsjs_Modal('coupon_err', '/popup/coupon_err');
                    }
                })
                .catch(function(error) {
                    console.log(error);
                });
                */
            },
            couponCancel: function() {
                this.couponKey = "";
                this.selectedPkg.couponDc = 0;
                this.isCouponApplied = false;

            },
            selectMethod: function(method) {
                this.selectedMethod = method;
            },

            setRfdInfo() {
                // 환급계좌 정보 등록
                // var formDataRfd = new FormData();
                // formDataRfd.append('userKey',this.userKey);
                // formDataRfd.append('depositorName', this.depositorName);
                // formDataRfd.append('accountNumber', this.accountNumber);
                // formDataRfd.append('bankType', $("#bankType").val());
                // formDataRfd.append('bankName', $("#bankName").val()); 


    
                var formDataRfd =  {
                    "userKey" : this.userKey,
                    "refundAccount" : {
                        "depositorName" : this.depositorName,
                        "bankType" : this.bankType,
                        "bankName" : this.bankName,
                        "accountNumber" : this.accountNumber
                    }
                }

                axios({
                    method: 'POST',
                    headers: {'content-type': 'application/json'},
                    url: "https://api.ficle.io/w1/user/updateRefundAccount",
                    data: formDataRfd,
                    responseType: 'json'
                })
                .then(function(res) {
                   
                    console.log(res);
                })
                .catch(function(error) {
                    console.log(error);
                });

            },
            goPay() {

                if(!this.selectedPkg.key) {
                    this.showAlert("선택한 패키지가 없습니다. 패키지를 선택해주세요.");
                    return false;
                }
                if(!this.$refs.payAgree.checked) {
                    this.showAlert("결제진행 동의에 체크 시 결제가 가능합니다.");
                    return false;
                }


                console.log(this.selectedMethod);
                if(!this.selectedMethod || this.selectedMethod == 0 ) {
                    this.showAlert("카드종류를 선택해주세요.");
                    return false;
                } 

                if ( this.isRefundinfo ) {

                    if (this.depositorName == '') {
                        //BsJs_toastPopup('환급 계좌 이름을 입력해주세요.', 'error', function() {});
                        this.showAlert("환급 계좌 이름을 입력해주세요.");
                        return false;
                    }

                    //this.bankName = $('#bankName').val();
                    if (this.bankName == '') {
                        //BsJs_toastPopup('환급 계좌 은행을 입력해주세요.', 'error', function() {});
                        this.showAlert("환급 계좌 은행을 입력해주세요.");
                        return false;
                    }

                    if (this.accountNumber == '') {
                        //BsJs_toastPopup('환급 계좌번호를 입력해주세요.', 'error', function() {});
                        this.showAlert("환급 계좌번호를 입력해주세요.");
                        return false;
                    }       
                }
                if(this.isPayIng ) {
                    this.showAlert("결제 진행중입니다.");
                    return false;
                }


                this.setRfdInfo(); // 환급 계좌정보 업데이트
                
                this.isPayIng = true;
                // 결제정보
                var formData = {
                    'seasonKey': this.seasonKey,
                    'userKey': this.userKey,
                    'userName': this.userName == '' ? this.nicName : this.userName,
                    'userEmail': this.userEmail,
                    'userTel': this.userTel == '' ? '1661-9577' : this.userTel,
                    'orderAmt': this.selectedPkg.packageAmt + this.selectedPkg.dlvAmt,   // 상품금액 (packageAmt : pkgList.products의 productAmt 합계)
                    'payAmt': this.selectedPkg.saleAmt + this.selectedPkg.dlvAmt - this.selectedPkg.couponDc,     // 실 결제금액 (saleAmt : pkgList.products의 productSaleAmt 합계)
                    'orderMethod': this.selectedMethod,
                    'products': this.selectedPkg.products,
                    'isSetDefaultDlvAddr': this.isSetDefaultDlvAddr,
                    'isDeliver': this.isDeliver,
                    'zipCode': this.zipCode,
                    'address1': this.address1,
                    'address2': this.address2,
                    'memo': this.dlvMemo == '직접입력' ? this.meno : this.dlvMemo,
                    'card': this.selectedCard,
                    'orderMethodType': this.selectedMethodType,
                    'payNoti': this.seasonKey
                };

                Bsjs_Modal('iniPay','/php/ordering.php', formData);
            },
            showAlert: function(msg) {
                if (this.isWebView) {
                    window.flutter_inappwebview.callHandler('onAlertMessage', msg);
                } else {
                    BsJs_toastPopup(msg, 'error', function() {});
                }
            },
        },
        watch: {
            couponKey: function() {
                // 쿠폰이 적용된 상태에서 임의로 변경할 경우, 쿠폰 초기화
                if(this.isCouponApplied) {
                    this.couponCancel();
                } 
            }
        },
        created: function() {
           this.fetchData();
        },

    });


    $(document).on("change","input[name='bankName']", function(e) {
        payComponent.bankType = $("input[name='bankType']").val()
        payComponent.bankName = $("input[name='bankName']").val()
	});

</script> --%>

<!-- 결제 -->
        <div id="viewArea" class="column_left_wrap">
            <div class="contents_wrap">
                <div class="wad_apply_area">
                    <div class="wad_apply">               
                        <div class="tag_area"></div>
                        <p>거북목, 굽은등, 라운드숄더 타파! 체형교정운동<!-- 제목 --></p>
                        <h1>4월 8일 시작 [0주] 카이로<!-- 제목2 --></h1>
                        <div class="price_area mt50">
                            <div class="column1">
                                <div class="txt">상품금액</div>
                                <div class="num"><b><!-- 정보 끌어오기 --></b>원</div>
                            </div>
                            <div class="column1">
                                <div class="txt">배송비</div>
                                <div class="num"><b>0</b>원</div>
                            </div>
                            <div class="column1">
                                <div class="txt">할인금액</div>
                                <div class="num"><b>0</b>원</div>
                            </div>
                            <!-- <div class="column1">
                                <div class="txt bold maincolor1">패키지 할인</div>
                                <div class="num font18 maincolor1"><b>-40,000</b>원
                                </div>
                            </div> -->
                        </div>
                        <div class="price_area total_price">
                            <div class="column1">
                                <div class="txt">총 결제금액</div>
                                <div class="num"><b>40,000</b>원</div>
                            </div>
                        </div>
                        <div class="btn type1">
                        	<button type="button" onclick="iamport()" class="adClick" style="margin-bottom: 15px;">카드결제</button>
                        </div>
                        <div class="agree_box mt10"><input type="checkbox" id="check0"><label for="check0"><span class="font12 gray4">위 주문정보를 확인하였으며, 회원 본인은 결제에 동의합니다.</span></label></div>                   
                    </div>
                </div>
                <div class="contents_wrap_type2">
                    <div class="sub_title line">
                        <h3>신청 강좌 정보</h3>
                    </div>
                    <div class="table_basic_board board1 none">
                        <table>
                            <colgroup>
                                <col width="*">
                            </colgroup>
                            <tbody>
                                <tr>
                                    <td class="type_diff">
                                        <div class="list_img"><img src="https://ficle-live.s3.ap-northeast-2.amazonaws.com/origin/program/2021-02-04/1612438885971365399.png" alt="클래스썸네일"></div> <a href="javascript:;">
                                            <div class="list_txt full">
                                                <dl class="prod_infor">
                                                    <dt>
                                                        <div class="play_tch"><span>체형교정<!-- clsCategory --></span> <span>카이로<!-- trainer_name --></span></div>
                                                        거북목, 굽은등, 라운드숄더 타파! 체형교정운동 <!-- clsName -->
                                                    </dt>
                                                </dl>
                                                <p>기간 : 2021.4.8 ~ 4.29<!-- clsStart, clsEnd --> </p>
                                                <p> 목 19:00 ~ 19:50 (총 4회) <!-- 시간 --></p>
                                                <div class="prod_prc">80,000</div>
                                            </div>
                                        </a>
                                    </td>
                                </tr>
                                <!---->
                                <!---->
                                <!---->
                            </tbody>
                        </table>
                    </div>
                    <!---->
                    <!---->
                    <!---->
                    <div class="sub_title line">
                        <h3>할인쿠폰</h3>
                    </div>
                    <div class="column_wrap">
                        <div class="myaccount">
                            <p>할인쿠폰을 사용하고 할인을 받아보세요!</p>
                            <dl>
                                <dd>
                                    <div class="btn_search flat"><select name="coupon" class="option_type" style="width: 620px;">
                                            <option value="">쿠폰을 선택하세요</option>
                                        </select> <a href="javascript:;" class="adClick btn_basic type1">적용하기</a></div>
                                    <!---->
                                </dd>
                            </dl>
                        </div>
                    </div>
                    <div class="layout_h40"></div>
                    <div class="sub_title line div_area">
                        <h3>환급 계좌 정보</h3>
                    </div>
                    <div class="column_wrap div_area">
                        <div class="myaccount type2">
                            <dl>
                                <dt>예금주<b>*</b></dt>
                                <dd>
                                    <div class="btn_search"><input type="text" name="depositorName" placeholder="이름" class="input_name termbox"></div>
                                </dd>
                            </dl>
                            <dl>
                                <dt>은행선택<b>*</b></dt>
                                <dd>
                                    <div class="btn_search flat"><input type="hidden" name="bankType" id="bankType"> <input type="text" name="bankName" id="bankName" placeholder="은행을 선택해 주세요" readonly="readonly" style="width: 550px; vertical-align: top;"> <a href="javascript:;" onclick="Bsjs_Modal('bank_list', '/popup/bank_list');" class="adClick btn_basic">은행 검색</a></div>
                                </dd>
                            </dl>
                            <dl>
                                <dt>계좌번호입력<b>*</b></dt>
                                <dd>
                                    <div class="btn_search"><input type="text" name="accountNumber" placeholder="계좌번호입력"></div>
                                </dd>
                            </dl>
                        </div>
                        <p class="subtxt">*환급 상품인 경우, 각 강좌별 환급 조건을 꼭 확인해주세요.</p>
                    </div>
                    <div class="layout_h60"></div>
                    <div class="sub_title line">
                        <h3>결제방법</h3>
                    </div>
                    <div class="column_wrap mb100">
                        <div class="myaccount">
                            <div class="form-box-input mb0">
                                <div class="chk-box on"><input type="radio" id="method" name="method" checked="checked" class="circle-check2" value="1"> <label for="ml"><i></i><span class="font15 bold black">신용카드/체크카드</span></label></div>
                            </div>
                        </div>
                    </div>
                    <div style="height: 200px;"></div>
                    <div style="height: 100px;"></div>
                </div>
            </div>
        </div>

    </div>
</div>


	<!-- 환불받을 은행 선택 -->
	<!-- <div id="wrap">
    레이어 영역
    <div id="layerArea">
        <div id="bank_list" class="layerArea">
            <style>
                .scroll_area {
                    max-height: 360px;
                    overflow-y: auto;
                    overflow-x: hidden;
                    scrollbar-width: thin;
                    scrollbar-color: #eaeaea transparent;
                }

                .scroll_area::-webkit-scrollbar {
                    width: 3px;
                }

                .scroll_area::-webkit-scrollbar-track {
                    background-color: transparent;
                }

                .scroll_area::-webkit-scrollbar-thumb {
                    border-radius: 3px;
                    background-color: #ebebeb;
                }

                .scroll_area::-webkit-scrollbar-button {
                    width: 0;
                    height: 0;
                }

                .banklist_wrap {
                    margin: -5px;
                }

                .banklist_wrap:after {
                    content: '';
                    display: block;
                    clear: both;
                }

                .banklist_wrap li {
                    float: left;
                    width: calc(33.333% - 10px);
                    margin: 5px;
                }

                .banklist_wrap li a {
                    display: table;
                    width: 100%;
                    height: 50px;
                    text-align: center;
                    box-sizing: border-box;
                    border: 1px solid #000;
                    background: #fff;
                }

                .banklist_wrap li a span {
                    display: table-cell;
                    vertical-align: middle;
                    font-size: 14px;
                    line-height: 22px;
                    font-weight: 700;
                    color: #000;
                }

                .banklist_wrap li:hover a {
                    background: #000;
                }

                .banklist_wrap li:hover a span {
                    color: #fff;
                }

            </style>
            S : 팝업
            <div id="container">
    		<div class="contents clearfix" id="contents">
            <div id="viewAreaPopup" class="layout_popup_wrap">
                <div class="bg"></div>
                <div class="layout_popup pop_w514" style="top: 600px;">
                    <div class="pop_wrap">
                        <div data-adarea="피클_팝업닫기" class="close adClick"><a href="javascript:;"><img src="https://img.ficle.io/www/common/icon/btn_pop_close.png" alt="닫기"></a></div>
                        <div class="contents_w">
                            <div class="pop_cont_wrap">
                                <div class="layout_w100">
                                    <p class="subtxt2 center">은행을 선택해 주세요.</p>
                                </div>
                                <div class="layout_w100 scroll_area mt20">
                                    <div class="my_cont_in">
                                        <ul class="banklist_wrap">
                                            
                                            <li><a href="javascript:;"><span>산업</span></a></li>
                                            <li><a href="javascript:;"><span>기업</span></a></li>
                                            <li><a href="javascript:;"><span>국민</span></a></li>
                                            <li><a href="javascript:;"><span>외환</span></a></li>
                                            <li><a href="javascript:;"><span>수협</span></a></li>
                                            <li><a href="javascript:;"><span>수출입은행</span></a></li>
                                            <li><a href="javascript:;"><span>농협</span></a></li>
                                            <li><a href="javascript:;"><span>단위농협</span></a></li>
                                            <li><a href="javascript:;"><span>우리</span></a></li>
                                            <li><a href="javascript:;"><span>제일</span></a></li>
                                            <li><a href="javascript:;"><span>신한</span></a></li>
                                            <li><a href="javascript:;"><span>씨티</span></a></li>
                                            <li><a href="javascript:;"><span>대구</span></a></li>
                                            <li><a href="javascript:;"><span>부산</span></a></li>
                                            <li><a href="javascript:;"><span>광주</span></a></li>
                                            <li><a href="javascript:;"><span>제주</span></a></li>
                                            <li><a href="javascript:;"><span>전북</span></a></li>
                                            <li><a href="javascript:;"><span>경남</span></a></li>
                                            <li><a href="javascript:;"><span>새마을금고</span></a></li>
                                            <li><a href="javascript:;"><span>신협</span></a></li>
                                            <li><a href="javascript:;"><span>상호저축</span></a></li>
                                            <li><a href="javascript:;"><span>대화은행</span></a></li>
                                            <li><a href="javascript:;"><span>우체국</span></a></li>
                                            <li><a href="javascript:;"><span>하나</span></a></li>
                                            <li><a href="javascript:;"><span>신한</span></a></li>
                                            <li><a href="javascript:;"><span>케이뱅크</span></a></li>
                                            <li><a href="javascript:;"><span>카카오뱅크</span></a></li>
                                            <li><a href="javascript:;"><span>동양증권</span></a></li>
                                            <li><a href="javascript:;"><span>미래에셋</span></a></li>
                                            <li><a href="javascript:;"><span>삼성증권</span></a></li>
                                            <li><a href="javascript:;"><span>한국투자증권</span></a></li>
                                            <li><a href="javascript:;"><span>한화증권</span></a></li>
                                            <li><a href="javascript:;"><span>신한금융투자</span></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            </div>
            </div> -->
            
</body>

</html>
