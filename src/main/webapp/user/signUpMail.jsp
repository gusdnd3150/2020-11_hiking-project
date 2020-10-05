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
          <div class="row">
            <div class="col-md-9 col-lg-8 mx-auto">
              <h3 class="login-heading mb-4">입력하신 이메일 주소로 가입인증 메일이 발송되었습니다. <br>
              <br >메일을 먼저 확인해주셔야 로그인이 가능합니다 :)</h3> 
             			<form action="/user/logInView.do" method="post">
                <button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" 
               type="submit" >로그인</button>
      
              </form>
              
            </div>
            
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>