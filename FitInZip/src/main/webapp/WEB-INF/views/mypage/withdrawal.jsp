<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="../resources/mypage/css/mypage.css" rel="stylesheet"></link>
<link href="../resources/mypage/css/cls.css" rel="stylesheet"></link>
<script type="text/javascript">
	function okWithdrawal(){
		var agreement = document.getElementById('agree'); //탈퇴 동의체크
		if(agreement.checked){
			
			var resonLength = document.getElementsByName("breakReason").length;
			var withdrawalReason1;
			var wantSay1;
			
			for(var i=0; i<resonLength; i++){
				if(document.getElementsByName("breakReason")[i].checked == true){
					withdrawalReason1 = document.getElementsByName("breakReason")[i].value;
				}
			}
			
			if(document.getElementById('wantSay').value.length > 0){
				wantSay1 = document.getElementById('wantSay').value;
			}
			
			$.ajax("/deleteUser",{
				type: "get",
				dataType: "json",
				data : {
					withdrawalReason : withdrawalReason1,
					wantSay : wantSay1
					},
				success : function(returnValue){
					alert("회원님의 계정은 성공적으로 탈퇴되었습니다.");
					location.href="/";
				},
				error : function () {
					alert("회원탈퇴가 불가능합니다. 관리자에게 문의하세요!");
				}
			})  
		}else{
			alert("탈퇴에 동의해 주세요.");
		}
		
	}
</script>
</head>
<body>
	<!-- Navigation -->
    <jsp:include page="../nav.jsp"></jsp:include>
    
    <!-- Content  -->
    <div style="height: 1000px; margin: 0 auto; width: 1200px">
    	<!-- 마이페이지 메뉴  -->
		<jsp:include page="mypageMenu.jsp"></jsp:include>
		
		<!-- 회원탈퇴 -->
		<jsp:include page="breakout.jsp"></jsp:include>
	</div>
	
	<!-- Footer -->
    <jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>