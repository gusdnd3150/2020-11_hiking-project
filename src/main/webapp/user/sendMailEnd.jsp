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
	<title>이메일 인증</title>
</head>
<body>
<div class="container-fluid">
  <div class="row no-gutter">
    <div class="d-none d-md-flex col-md-4 col-lg-6 bg-image"></div>
    <div class="col-md-8 col-lg-6">
      <div class="login d-flex align-items-center py-5">
        <div class="container">
          <div class="row text-center">
            <div class="col-md-9 col-lg-8 mx-auto">
              <h5 class="login-heading mb-4">
               <strong>입력하신 이메일 주소</strong>로<br> 
         		문의하신 정보에 대한 메일을 발송했습니다. 
              </h5><br>
       	    <h3>메일을 확인해보세요.<h3>
       	    
              <br>
              <h6> <div id="count"></div><h6>
         <form action="/user/logInView.do" method="post" name="frm">
                <button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" 
               type="submit">지금 바로 로그인하기</button>
      
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
	let time = 100;  
	 setInterval(function(){
		 if(time==0){
				form.submit();
			};
		 var time_text = '('+ time +'초 후 메인화면으로 자동 전환됩니다.)';
			$("#count").text(time_text);
			$("#count").css('color','gray');
			
			time--;
	 },1000); 
};
</script>
</html>