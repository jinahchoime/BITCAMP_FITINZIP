<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보수정</title>
<link href="../resources/mypage/css/mypage.css" rel="stylesheet"></link>
<link href="../resources/mypage/css/updateForm.css" rel="stylesheet"></link>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function search_post() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddr").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddr").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('post').value = data.zonecode;
                document.getElementById("addr").value = addr;
                // 커서를 상세주소 필드로 이동한다.addr_1
                document.getElementById("detailAddr").focus();
            }
        }).open();
    }
</script>
<script type="text/javascript">
	function check(){
		var nickname = document.getElementById('nickname').value;
		var phone = document.getElementById('phone').value;
		var post = document.getElementById('post').value;
		
		/* if(nickname.length == 0 && phone.length == 0 && post.length == 0){
			document.getElementById('nick_p').innerHTML = "닉네임을 입력해 주세요";
			document.getElementById('phone_p').innerHTML = "연락처를 입력해 주세요";
			document.getElementById('post_p').innerHTML = "우편번호를 입력해 주세요";
			
			return false;
		} */
		
		
		if(nickname.length == 0 &&
				 document.getElementById('nick_p').innerHTML == ""){
			document.getElementById('nick_p').innerHTML = "닉네임을 입력해 주세요";
			return false;
		}
		
		if(!(nickname.length == 0)){
			document.getElementById('nick_p').innerHTML = "";
		}
		
		if(nickname.length == 0){
			return false;
		}
		
		if(phone.length == 0 &&
			 document.getElementById('phone_p').innerHTML == ""){
			document.getElementById('phone_p').innerHTML = "연락처를 입력해 주세요";
			return false;
		}
		
		if(!(phone.length == 0)){
				document.getElementById('phone_p').innerHTML = "";
		}
		
		if(phone.length == 0){
			return false;
		}
		
		if(post.length == 0 &&
			 document.getElementById('post_p').innerHTML == ""){
			document.getElementById('post_p').innerHTML = "우편번호를 입력해 주세요";
			return false;
		}
		
		if(!(post.length == 0)){
			document.getElementById('post_p').innerHTML = "";
		}
		
		if(post.length == 0){
			return false;
		}
		
		return true
    };
	
</script>
</head>
<body>
	<!-- Navigation -->
    <jsp:include page="../nav.jsp"></jsp:include>
    
	
	<!-- Content  -->
	<div style="height: 1300px; margin: 0 auto; width: 1200px">
		<!-- 마이페이지 메뉴  -->
		<jsp:include page="mypageMenu.jsp"></jsp:include>
		
		<form action="/UpdateMypage" method="post" onsubmit="return check();">
			<div class="column_right mt200">
			    <p class="tit_area big" style="display: inline-block;">회원정보수정</p>
			    <div class="line"></div>
			    <div class="myaccount">
			    	<c:if test="${empty member}">
						<p>비어있음 아님 오류~</p>
					</c:if>
					<c:if test="${not empty member}">
			        <dl>
			            <dt>이름</dt>
			            <dd>
			                <div class="btn_search">
			                	<input type="text" name="name" placeholder="이름" disabled="disabled" class="disabled" value="${member.name }" id="name"
			                	style="color:#ccc">
			                </div>
			            </dd>
			        </dl>
			        <dl>
			            <dt>닉네임</dt>
			            <dd>
			                <div class="btn_search" style="width: 214px;">
			                	<input type="text" name="nickname" placeholder="닉네임" maxlength="10" value="${member.nickname }" id="nickname">
			                	<p style="color:red;" id="nick_p"></p>
			                </div>
			            </dd>
			        </dl>
			        <dl>
			            <dt>연락처</dt>
			            <dd>
			                <div class="btn_search">
			                	<input type="text" name="phone" placeholder="010-0000-0000 양식에 맞춰 입력하세요" value="${member.phone }" id="phone">
			                	<p style="color:red;" id="phone_p"></p>
			                </div>
			            </dd>
			        </dl>
			        <dl>
			            <dt>이메일</dt>
			            <dd>
			                <div class="btn_search">
			                	<input type="text" name="id" disabled="disabled" class="disabled" placeholder="${member.id }">
			                </div>
			            </dd>
			        </dl>
			        <dl>
			            <dt>생년월일</dt>
			            <c:set var="birth" value="${member.birth }"/>
			            <dd>
			                <div class="btn_search type5">
				                <select name="year" class="option_type">
				                		<c:set var="year" value="${f:substring(birth,0,4) }"/>
				                		<c:forEach var="i" begin="1970" end="2009">
				                			<c:if test="${year ne i }">
			                					<option value="${i}">${i}</option>
			                				</c:if>
				                			<c:if test="${year eq i }">
				                				<option value="${i}" selected="selected">${i}</option>
				                			</c:if>
				                		</c:forEach>
			                    </select>
	                    	</div>
			                <div class="btn_search type5">
			                	<select name="month" class="option_type">
			                		<c:set var="month" value="${f:substring(birth,4,6) }"/>
			                		<c:forEach var="i" begin="1" end="12">
			                			<c:if test="${month ne i }">
			                				<option value="${i}">${i}</option>
			                			</c:if>
			                			<c:if test="${month eq i }">
			                				<option value="${i}" selected="selected">${i}</option>
			                			</c:if>
			                		</c:forEach>
			                    </select>
			                </div>
			                <div class="btn_search type5">
			                	<select name="day" class="option_type">
			                		<c:set var="day" value="${f:substring(birth,6,8) }"/>
			                		<c:forEach var="i" begin="1" end="31">
			                			<c:if test="${day ne i }">
			                				<option value="${i}">${i}</option>
			                			</c:if>
			                			<c:if test="${day eq i }">
			                				<option value="${i}" selected="selected">${i}</option>
			                			</c:if>
			                		</c:forEach>
			                    </select>
			                </div>
			            </dd>
			        </dl>
			        <dl>
			            <dt>성별</dt>
			            <dd class="tmiddle">
			                <div class="form-box-input mb0" style="padding-top: 10px">
			                	<c:set var="gender" value="${member.gender }" />
			                    <div class="chk-box">
			                    	<c:if test="${gender eq 'male' }">
			                    		<input type="radio" id="m" name="gender" class="circle-check2" value="male" checked="checked">
			                    	</c:if>
			                    	<c:if test="${empty gender}">
			                    		<input type="radio" id="m" name="gender" class="circle-check2" value="male" checked="checked">
			                    	</c:if>
			                    	<c:if test="${gender eq 'female' }">
			                    		<input type="radio" id="m" name="gender" class="circle-check2" value="male" checked="checked">
			                    	</c:if>
			                    	<label for="m">
			                    		<i></i>
			                    		<span class="black" style="display: inline-block; padding: 10px;">남자</span>
			                    	</label>
		                    	</div>
			                    <div class="chk-box">
			                    	<c:if test="${gender eq 'female'}">
			                    		<input type="radio" id="f" name="gender" class="circle-check2" value="female" checked="checked">
			                    	</c:if>
			                    	<c:if test="${empty gender}">
			                    		<input type="radio" id="f" name="gender" class="circle-check2" value="female">
			                    	</c:if>
			                    	<c:if test="${gender eq 'male'}">
			                    		<input type="radio" id="f" name="gender" class="circle-check2" value="female">
			                    	</c:if>
			                    	<label for="f">
			                    		<i></i>
			                    		<span class="black" style="display: inline-block; padding: 10px;">여자</span>
			                    	</label>
			                    </div>
			                </div>
			            </dd>
			        </dl>
			        <dl>
			            <dt>주소</dt>
			            <dd>
			                <div class="btn_search flat">
			                	<input type="text" name="post" readonly="readonly" placeholder="우편번호 검색을 누르세요" style="width: 624px; vertical-align: top;" id="post" value="${member.post }"> 
		                		<a class="adClick btn_basic" style="margin-top: 14px;" onclick="search_post()">우편번호 검색</a>
			                	<p style="color:red;" id="post_p"></p>
			                </div>
			                <div class="btn_search">
			                	<input type="text" readonly="readonly" name="addr" id="addr" value="${member.addr }"> 
			                	<input type="text" name="detailAddr" id="detailAddr" value="${member.detailAddr }"> 
			                	<input type="text" name="extraAddr" id="extraAddr" value="${member.extraAddr }">
			                </div>
			            </dd>
			        </dl>
			        <!-- <dl>
			            <dt>프로필 사진</dt>
			            <dd>
			                <div class="profile_box"><input type="file" name="uploadImage" id="uploadImage">
			                    <div class="profile_img"><label for="uploadImage">
			                            <div class="preload_box"><img src="" style="display: none;"><span class="btn">
			                                    <em>프로필 등록</em>
			                                </span></div>
			                        </label></div>
			                </div>
			            </dd>
			        </dl> -->
			       </c:if>
			    </div>
		    </form>
		    <div class="btn_wrap mt40">
		    	<input type="submit" class="btn_basic type5 adClick" value="저장">
	    	</div>
		</div>
	</div>
	
	<!-- Footer -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>