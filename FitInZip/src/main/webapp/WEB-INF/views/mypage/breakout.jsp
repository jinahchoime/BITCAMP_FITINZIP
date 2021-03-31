<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div style="display:inline-block; width: 800px;" class="ml30 mt200">
	<div class="clearfix" style="width: 1098px;">
		<div class="maintxt2 line2">회원탈퇴</div>
	</div>
	<div class="mt40">
    	<div>
    		<h5>회원탈퇴 사유</h5>
    		<label><input type="radio" name ="breakReason" value="rejoin" style="display: inline" class="mr5" checked="checked">회원탈퇴 후 재가입을 위해서</label><br>
    		<label><input type="radio" name ="breakReason" value="notUsed" style="display: inline" class="mr5">이용빈도가 낮고 이용할 필요가 없어서</label><br>
    		<label><input type="radio" name ="breakReason" value="dissatisfaction" style="display: inline" class="mr5">서비스 및 고객지원이 만족스럽지 못해서</label><br>
    		<label><input type="radio" name ="breakReason" value="just" style="display: inline" class="mr5">별다른 이유없이 탈퇴</label>
    	</div>
    	<div class="mt30">
    		<h5>탈퇴하시려는 사유를 입력해주세요</h5>
    		<textarea rows="5" cols="80" placeholder=" 피트인집에 하시고 싶은 말씀이 있으시면 남겨주세요!" id="wantSay"></textarea>
    	</div>
    	<div class="mt30">
    		<h5>회원탈퇴 동의</h5>
    		<label><input type="checkbox" name ="agree" id="agree" value="agree" style="display: inline" class="mr5">회원탈퇴 안내를 모두 확인하였으며 탈퇴에 동의합니다</label>
    	</div>
   	</div>
   	<input type="button" class="btn_basic type5 adClick mt50" value="탈퇴하기" onclick="javascript:okWithdrawal()">
</div>