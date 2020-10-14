<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<!-- <!— CSS only —> -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css"/>
<link rel="stylesheet" href="/resources/css/logIn.css"/>

<!-- <!— JS, Popper.js, and jQuery —> -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script type="text/javascript" src="/resources/js/bootstrap.bundle.min.js"/></script>
	<title>회원가입 완료</title>
</head>
<body>
<div class="container-fluid">
  <div class="row no-gutter">
    <div class="d-none d-md-flex col-md-4 col-lg-6 bg-image"></div>
    <div class="col-md-8 col-lg-6">
      <div class="login d-flex align-items-center py-5">
        <div class="container text-center">
          <div class="row">
            <div class="col-md-9 col-lg-8 mx-auto">
              <h3 class="login-heading mb-4"><strong>산오름</strong>에 오신 것을 환영합니다!</h3> 
              <br>
              <div id="count"></div>
              <br>
             			<form action="/user/insertUser2.do" method="post" name="frm">
             			<%-- <input type="hidden" id="hidden" name="hidden" value="${requestScope.snsUser}"> --%>
               <button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2">
               산오름 지금 시작하기</button>
      
              </form>
              
            </div>
            
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
<script>
window.onload = function(){
	let form = document.frm;
	let time =10;  
	 setInterval(function(){
		 if(time==0){
				form.submit();
			};
		 var time_text = time +'초 후 메인화면으로 전환됩니다.';
			$("#count").text(time_text);
			$("#count").css('color','gray');
			time--;
	 },1000); 
};
</script>
</html>