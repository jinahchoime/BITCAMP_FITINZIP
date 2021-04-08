<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<div id="menuView" class="column_left mt200">
   	<div class="nav_wrap" style="border-radius: 5px;">
	    <div class="nav_tit">
	        <p><img src="${member.profileImgFileName}" onerror="this.src='../resources/mypage/imgs/profile_img.jpg'"></p> <span style="font-size:inherit; line-height: 21px;">안녕하세요!<br>${member.nickname }님</span>
	    </div>
	    <div class="submenu">
	        <ul class="clearfix pl20">
	            <li><a class="nav_in" style="text-decoration: none;">나의 클래스</a>
	                <div class="nav_item_in">
	                    <ul class="clearfix">
	                        <li><a href="/clsHistory" class="adClick">클래스내역</a></li>
	                        <li><a href="/clsHeart" class="adClick">위시클래스</a></li>
	                        <li><a href="/couponHistory" class="adClick">쿠폰내역</a></li>
	                    </ul>
	                </div>
	            </li>
	        </ul>
	    </div>
	    <div class="submenu">
	        <ul class="clearfix pl20">
	            <li><a class="nav_in" style="text-decoration: none;">상품</a>
	                <div class="nav_item_in">
	                    <ul class="clearfix">
	                        <li><a href="/productHistory" class="adClick">주문조회</a></li>
	                    </ul>
	                </div>
	            </li>
	        </ul>
	    </div>
	    <div class="submenu">
	        <ul class="clearfix pl20">
	            <li><a class="nav_in" style="text-decoration: none;">회원정보</a>
	                <div class="nav_item_in">
	                    <ul class="clearfix">
	                        <li><a href="/calendar" class="adClick">나의일정</a></li>
	                        <li><a href="/updateMemberInfo" class="adClick">정보수정</a></li>
	                        <li><a href="/withdrawal" class="adClick">회원탈퇴</a></li>
	                    </ul>
	                </div>
	            </li>
	        </ul>
	    </div>
	</div>
</div>