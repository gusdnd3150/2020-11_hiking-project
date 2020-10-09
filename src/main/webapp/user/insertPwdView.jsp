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
	<title>LOGIN</title>
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
              <h3 class="login-heading mb-4">산오름 비밀번호 설정하기</h3> 
             			<form action="/user/insertPwd.do" method="post">
                <div class="form-label-group">
                  <input type="password" id="password" name="password" class="form-control" placeholder="Password" required>
                  <label for="password">비밀번호</label>
                   <div class ="check_font" id="passwordCheck"></div>
                </div>
                   <div class="form-label-group">
                  <input type="password" id="password2" name="password2" class="form-control" placeholder="Password" required>
                  <label for="password2">비밀번호 확인</label>
                   <div class ="check_font" id="password2Check"></div></div>
                   <div class="text-center"><a href="#">일치 여부 확인</a></div>
                
                <button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" 
                id="insertPwd" type="submit" disabled >저장</button>
      
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
//비밀번호 정규식
var pwdJ = /^[A-Za-z0-9]{4,12}$/;
//비밀번호
$('#password').blur(function(){
	console.log("이벤트 먹었니");	
	if(pwdJ.test($(this).val())){
		console.log(pwdJ.test($(this).val()));
		$("#passwordCheck").text('');
		$("#insertPwd").attr("disabled", true);
	} else{
		$('#passwordCheck').text('대소문자와 숫자 4~12자리로 입력해주세요.');
		$('#passwordCheck').css('color', 'red');
		$("#insertPwd").attr("disabled", true);
	}
});
//비밀번호 확인
$('#password2').blur(function(){
	console.log("이벤트 먹었니");
	var password = $("#password").val()
	if($(this).val() == password){
		console.log(password)
		console.log("비밀번호 같을 때 ");
		console.log($(this).val())
		$("#password2Check").text('');
		$("#insertPwd").attr("disabled", false);
	} else{
		console.log(password)
		console.log($(this).val())
		console.log("비밀번호 다를 때 ");	
		$('#password2Check').text('비밀번호가 일치하지 않습니다 :p');
		$('#password2Check').css('color', 'red');
		$("#insertPwd").attr("disabled", true);
	}
});
</script>
</html>