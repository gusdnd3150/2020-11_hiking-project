<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
if(${mandateC.GROUP1 ne 0} && ${mandateC.GROUP2 eq 0} ){
	alert("종료되지 않은 등산 모임이 있습니다. 생성한 등산모임의 출발날짜가 지난 후 탈퇴가능합니다.");
	self.location ="/mypage/mypageHomeView.do";

}else if(${mandateC.GROUP2 ne 0} && ${mandateC.GROUP1 eq 0}){
	alert("리더로 가입되어있는 산모임이 있습니다. 산모임의 리더를 다른 멤버에게 위임한 후 탈퇴가능합니다.");
	self.location ="/mypage/mypageHomeView.do";	

}else if(${mandateC.GROUP1 ne 0} && ${mandateC.GROUP2 ne 0}){
	alert("종료되지 않은 등산 모임과 리더로 가입되어있는 산모임이 있습니다. 산모임의 경우 리더를 다른 멤버에게 위임한 후, 생성한 등산모임은 출발날짜가 지난 후 탈퇴가능합니다.");
	self.location ="/mypage/mypageHomeView.do";

}
</script>
</body>
</html>