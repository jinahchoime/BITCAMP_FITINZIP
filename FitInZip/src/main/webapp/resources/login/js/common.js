if(typeof babel != 'undefined') {
    jQuery.fn.load = function( url, params, callback ) {
        if ( typeof url !== "string" && _load ) {
            return _load.apply( this, arguments );
        }
        var selector, type, response,
            self = this,
            off = url.indexOf( " " );
        if ( off > -1 ) {
            selector = jQuery.trim( url.slice( off, url.length ) );
            url = url.slice( 0, off );
        }
        // If it's a function
        if ( jQuery.isFunction( params ) ) {
            // We assume that it's the callback
            callback = params;
            params = undefined;
        // Otherwise, build a param string
        } else if ( params && typeof params === "object" ) {
            type = "POST";
        }
        // If we have elements to modify, make the request
        if ( self.length > 0 ) {
            jQuery.ajax( {
                url: url,
                // If "type" variable is undefined, then "GET" method will be used.
                // Make value of this field explicit since
                // user can override it through ajaxSetup method
                type: type || "GET",
                dataType: "html",
                data: params
            } ).done( function( responseText ) {
                $dom = jQuery( "<div>" ).append( jQuery.parseHTML( responseText ) );
                $dom.find("script[type='text/babel']").each(function(index) {
                    $(this).attr('type', 'text/javascript');
                    $(this).html(babel.transform($(this).html(), { }).code);
                });
                responseText = $dom.html();
                // Save response for use in complete callback
                response = arguments;
                self.html( selector ?
                    // If a selector was specified, locate the right elements in a dummy div
                    // Exclude scripts to avoid IE 'Permission Denied' errors
                    jQuery( "<div>" ).append( jQuery.parseHTML( responseText ) ).find( selector ) :
                    // Otherwise use the full result
                    responseText );
            // If the request succeeds, this function gets "data", "status", "jqXHR"
            // but they are ignored because response was set above.
            // If it fails, this function gets "jqXHR", "status", "error"
            } ).always( callback && function( jqXHR, status ) {
                self.each( function() {
                    callback.apply( this, response || [ jqXHR.responseText, status, jqXHR ] );
                } );
            } );
        }
        return this;
    };
}

function BsJs_getCookie( name ){
	var nameOfCookie = name + "=";
	var x = 0;
	while ( x <= document.cookie.length )
	{
		var y = (x+nameOfCookie.length);
		if ( document.cookie.substring( x, y ) == nameOfCookie )
		{
			if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )
			endOfCookie = document.cookie.length;
			return unescape( document.cookie.substring( y, endOfCookie ) );
		}

		x = document.cookie.indexOf( " ", x ) + 1;

		if ( x == 0 ) break;
	}
	return "";
}

function BsJs_setCookie( name, value, expiredays ){
	var todayDate = new Date();
	todayDate.setDate( todayDate.getDate() + expiredays );
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}



//우편번호찾기
function daumPost(){
	new daum.Postcode({
	oncomplete: function(data) {
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var fullAddr = ''; // 최종 주소 변수
        var extraAddr = ''; // 조합형 주소 변수

        // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
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
			$("#dlv_zip1").val(data.zonecode);
			$("#dlv_zip2").val('');
			$("#dlv_zip").val(data.zonecode); //합쳐서 통째로 넣기위한 ID값
		}else{
			//구 우편번호
			$("#dlv_zip1").val(data.postcode1);
			$("#dlv_zip2").val(data.postcode2);
			$("#dlv_zip").val(data.postcode1+'-'+data.postcode2); //합쳐서 통째로 넣기위한 ID값
		}

		$("#dlv_addr1").val(fullAddr);

		// 커서를 상세주소 필드로 이동한다.
		$("#dlv_addr2").val('');
		$("#dlv_addr2").focus();

		}
  }).open();
}

function Bsjs_Modal(objnm,url,dat) {
	url += (url.indexOf('?') === -1 ? '?' : '&')+'_'+new Date().getTime();

    $("#layerArea").append("<div id=\""+objnm+"\" class=\"layerArea\"></div>");
    if(!dat) dat = {top:$(window).scrollTop()+100};
	$("#"+objnm).load(url, dat, function(){
        var psn = $(window).scrollTop()+100;
        $(".layout_popup").css("top",psn+"px");
	});
}

function Bsjs_closeModal(objnm){
	var $obj = $("#"+objnm);
	$("iframe",$obj).attr("src","");
	$obj.remove();

}

$(document).on("click",".pop_wrap .close, .layout_popup .close",function(){
	var objnm = $(this).closest(".layerArea").attr("id");
	Bsjs_closeModal(objnm);
});

// 비밀번호 체크
function BsJs_checkPwd(pwd, userid) {
    var pwMinLen = 10; // 최소 비밀번호 길이
    var pwMaxLen = 20; // 최대 비밀번호 길이
    var mixPasswordType = 0;	//비밀번호 혼합 종류 숫자

    var chrstrUpper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    var chrstrLower = "abcdefghijklmnopqrstuvwxyz";
    var spestr = "[]{}-_=+\|()*&^%$#@!~`?></;,.:'";
    var numstr = "0123456789";
    var checkstr = "";

    //패스워드가 문자,숫자를 혼용하였는지 체크
    var chrUpperchk = true; //대문자
    var chrLowerchk = true; //소문자
    var numchk = true;
    var spechk = true;
    var emptychk = true;

    for (var a = 0; a < pwd.length; a++) {
        if (chrstrUpper.indexOf(pwd.charAt(a)) != -1) {
            chrUpperchk = false;
        }
        if (chrstrLower.indexOf(pwd.charAt(a)) != -1) {
            chrLowerchk = false;
        }
        if (numstr.indexOf(pwd.charAt(a)) != -1) {
            numchk = false;
        }
        if (spestr.indexOf(pwd.charAt(a)) != -1) {
            spechk = false;
        }
        if (" ".indexOf(pwd.charAt(a)) != -1) {
            emptychk = false;
        }
    }

    if (!chrUpperchk || !chrLowerchk) {
        mixPasswordType++;
    }

    if (!numchk) {
        mixPasswordType++;
    }
    if (!spechk) {
        mixPasswordType++;
    }

    if (pwd.length < pwMinLen) {
        return "너무 짧아요! 10자 이상 (영문/숫자/특수문자 조합) 입력해주세요.";
    }

    if (mixPasswordType < 2 ) {
        return "비밀번호는 영문, 숫자, 특수문자 중 2종류 이상으로 조합해주세요.";
    }

    if (!emptychk) {
        return "공백은 입력할 수 없어요.";
    }

    // 비밀번호에 ID문자열이 포함된 경우 체크
    if (pwd.toLowerCase().indexOf(userid) != -1 && userid != "") {
        return "비밀번호에 아이디가 포함되어있어요.";
    }

    //같은 문자가 연속해서 4자 이상 존재하는지 체크
    var isChkPwd = false;
    var comStr = "";
    for (var k = 0; k < pwd.length; k++) {
        comStr = pwd.charAt(k) + pwd.charAt(k) + pwd.charAt(k) + pwd.charAt(k);
        if (pwd.indexOf(comStr) != -1) {
            isChkPwd = true;
            break;
        }
    }
    if (isChkPwd == true) {
        return "비밀번호는 같은 문자를 4번 이상 사용하실 수 없어요.";
    }

    //연속되는 문자나 숫자 체크
    var isContiPwd = false;
    if (pwd.length >= 4) {
        var iUniCode = 0;
        for (var i = 0; i <= pwd.length; i++) {
            iUniCode = pwd.charCodeAt(i);
            if (pwd.charCodeAt(i + 1) == iUniCode + 1 && pwd.charCodeAt(i + 2) == iUniCode + 2 && pwd.charCodeAt(i + 3) == iUniCode + 3) {
                isContiPwd = true;
                break;
            }
        }
    }

    if (isContiPwd == true) {
        return "연속되는 문자는 4개 이상 사용하실 수 없어요.";
    }

    if(!checkSequenceKey(pwd)){
        return "연속되는 문자는 4개 이상 사용하실 수 없어요.";
    }

    return checkstr;
}

// 키보드 연속된 글자 체크
function checkSequenceKey(checkStr){
    var str = 'qwertyuiopasdfghjklzxcvbnm';

    for(var i in str){
        var s = '';
        var at = parseInt(i);
        if(at > str.length-4) break;
        var j = at;
        while(j < (at + 4) && j < str.length){
            s += str[j];
            j++;
        }
        var regex = new RegExp(s);
        if(regex.test(checkStr)){
            return false;
        }
    }
    return true;
}

function BsJs_chkLogin(typ, msg, url) {

    if ( !msg ) msg = '로그인하여 주세요';
    var chk = false;
    if ( BsJs_getCookie('SESS_DATA') != '' ) chk = true;

    if ( chk == false ) {
        switch(typ)
        {
            case '2' : if (url) $("input[name=ret_url]").val(url);
                        location.href="/member/login?ret_url=" + url;
                        break;
            case '0' : if ( url ) $("input[name=cur_url]").val(url);
                        location.href="/member/login";
                        break;
            case '1' : alert(msg); break;
            case '3' : alert(msg); location.href="/member/login"; break;
            case '9' :
            default  : break;
        }
    }
    return chk;
}

function BsJs_numberFormat(num, decimals, dec_point, thousands_sep) {
    num = parseFloat(num);
    if(isNaN(num)) return '0';

    if(typeof(decimals) == 'undefined') decimals = 0;
    if(typeof(dec_point) == 'undefined') dec_point = '.';
    if(typeof(thousands_sep) == 'undefined') thousands_sep = ',';
    decimals = Math.pow(10, decimals);

    num = num * decimals;
    num = Math.round(num);
    num = num / decimals;

    num = String(num);
    var reg = /(^[+-]?\d+)(\d{3})/;
    var tmp = num.split('.');
    var n = tmp[0];
    var d = tmp[1] ? dec_point + tmp[1] : '';

    while(reg.test(n)) n = n.replace(reg, "$1"+thousands_sep+"$2");

    return n + d;
}

// 스크롤
function BsJs_scroll(id_name) {
    var top_offs = $('#'+id_name).offset().top;
    var add = 0;
    if($('.depth01_area .depth01.mt50').length > 0) {
        add += $('.depth01_area .depth01.mt50').outerHeight();
    } else if($('#tab.tab1').length > 0) {
        add += $('#tab.tab1').outerHeight();
    }

    console.log(add);
    $( 'html, body' ).stop().animate( { scrollTop : top_offs-add } );
}

// 플레이 신청하기
function BsJs_goPay(e,fnm,tg, url) {
    e.preventDefault();

    var id_chk = BsJs_chkLogin('2','', url);
    if(!id_chk) return false;

    var cnt = 0;
    $("input[name='seasonKey']:checkbox",$("form[name="+fnm+"]")).each(function(){
        if($(this).is(":checked")) cnt += 1;
    });

    if(cnt == 0) {
        $("input[name='seasonKey']:hidden",$("form[name="+fnm+"]")).each(function(){
            cnt += 1;
        });
    }

    if(cnt == 0) {
        alert('상품을 선택하세요.');
        return false;
    }

    if (tg != 'undefined' && tg != undefined) document[fnm].target = tg;

    document[fnm].action = '/play/play_buy';
    document[fnm].submit();
}

function BsJs_addPay(e,prods,tg) {

    e.preventDefault();

    if (!BsJs_chkLogin('2', "", window.location.href)) return false;

    var arr = new Array;
    arr = prods.split("|");

    if(arr.length == 0) {
        alert('추가할 상품정보가 없습니다.');
        return false;
    }

    $("#addpayFrm").remove();
    var obj = $("<form name=\"addpayFrm\" id=\"addpayFrm\" method=\"post\"></form>");
    $("body").append(obj);
    $("#addpayFrm").append("<input type=\"hidden\" name=\"mode\" id=\"mode\">");
    $("#addpayFrm").append("<input type=\"hidden\" name=\"seasonKey\" value=\""+arr[0]+"\">");
    $("#addpayFrm").append("<input type=\"hidden\" name=\"packageKey\" value=\""+arr[1]+"\">");

    BsJs_goPay(e,'addpayFrm',tg);

}

Date.prototype.format = function (f) {
    if (!this.valueOf()) return " ";

    var weekKorName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
    var weekKorShortName = ["일", "월", "화", "수", "목", "금", "토"];
    var weekEngName = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    var weekEngShortName = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    var d = this;

    return f.replace(/(Y|y|m|n|d|j|KS|KL|ES|EL|H|h|i|s|a\/p)/gi, function ($1) {

        switch ($1) {
            case "Y": return d.getFullYear(); // 년 (4자리)
            case "y": return (d.getFullYear() % 1000).zf(2); // 년 (2자리)
            case "m": return (d.getMonth() + 1).zf(2); // 월 (2자리)
            case "n": return (d.getMonth() + 1); // 월
            case "d": return d.getDate().zf(2); // 일 (2자리)
            case "j": return d.getDate(); // 일
            case "KS": return weekKorShortName[d.getDay()]; // 요일 (짧은 한글)
            case "KL": return weekKorName[d.getDay()]; // 요일 (긴 한글)
            case "ES": return weekEngShortName[d.getDay()]; // 요일 (짧은 영어)
            case "EL": return weekEngName[d.getDay()]; // 요일 (긴 영어)
            case "H": return d.getHours().zf(2); // 시간 (24시간 기준, 2자리)
            case "h": return ((h = d.getHours() % 12) ? h : 12).zf(2); // 시간 (12시간 기준, 2자리)
            case "i": return d.getMinutes().zf(2); // 분 (2자리)
            case "s": return d.getSeconds().zf(2); // 초 (2자리)
            case "a/p": return d.getHours() < 12 ? "오전" : "오후"; // 오전/오후 구분
            default: return $1;
        }
    });
};

String.prototype.string = function (len) { var s = '', i = 0; while (i++ < len) { s += this; } return s; };
String.prototype.zf = function (len) { return "0".string(len - this.length) + this; };
Number.prototype.zf = function (len) { return this.toString().zf(len); };



function BsJs_addDays(date, days) {
    var result = new Date(date);
    result.setDate(result.getDate() + days);
    return result;
}

// 토스트팝업
function BsJs_toastPopup(msg, msgType, callback) {
	var toast = $('#toast');

	var obj = $('#toast').find('.pop_toast');

    if(msgType == 'error') {
        toast.addClass('error');
    } else {
        toast.removeClass('error');
    }

	obj.html(msg);

	if(typeof callback == 'function') {
		obj.attr('href', 'javascript:;');
		obj.off('click');
		obj.one('click', function(event) {
			callback();
		})
	} else {
		obj.off('click');
		obj.attr('href', '/mypage/basket');
	}
	toast.hasClass('on') ?
		(clearTimeout(removeToast), removeToast = setTimeout(function () {
			toast.removeClass('on');
		}, 1000)) :
		removeToast = setTimeout(function () {
			toast.removeClass('on');
		}, 3000)
	toast.addClass('on');
}