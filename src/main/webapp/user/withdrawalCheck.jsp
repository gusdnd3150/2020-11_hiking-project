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
	<title>비밀번호 확인</title>
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
              <h3 class="login-heading mb-4">탈퇴하시는 이유를 알 수 있을까요?<br>
              더 나은 '산오름'이 되도록 노력하겠습니다.</h3> 
             			<form action="/user/withdrawal.do" method="post">
             			
             			<div class="btn-group">
  <button type="button" class="btn btn-info dropdown-toggle mb-2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    탈퇴 사유
  </button>
  <div class="dropdown-menu">
    <a class="dropdown-item" id="1" href="#">사이트가 안 예뻐요.</a>
    <a class="dropdown-item" id="2" href="#">사이트를 이용하기가 너무 어려워요.</a>
    <a class="dropdown-item" id="3" href="#">원하는 정보가 없어요.</a>
    <a class="dropdown-item" id="4" href="#">이상한 유저가 너무 많아요.</a>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" id="5" href="#">직접 작성하기</a>
  </div>
</div>
             			
             			<br>
          <div class="form-label-group">
                  <input type="text" id="reason" name="reason" class="form-control" readonly required>
                <div id="label"></div>
                </div>
                <button class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2" 
               type="submit">정말 탈퇴하기</button>
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
$(document).ready(function() {
$("#1").click(function() {
	console.log("1");
	$("#label").html(""); 
	$("#reason").attr("readonly", true);
	$("#reason").val('사이트가 안 예뻐요.');
});

$("#2").click(function() {
	console.log("2");
	$("#label").html(""); 
	$("#reason").attr("readonly", true);
	$("#reason").val('사이트를 이용하기가 너무 어려워요.');
});

$("#3").click(function() {
	console.log("3");
	$("#label").html(""); 
	$("#reason").attr("readonly", true);
	$("#reason").val('원하는 정보가 없어요.');
});

$("#4").click(function() {
	console.log("4");
	$("#label").html(""); 
	$("#reason").attr("readonly", true);
	$("#reason").val('이상한 유저가 너무 많아요.');
});
$("#5").click(function() {
	console.log("5");
	$("#reason").val(""); 
	$("#label").html(""); // 태그 초기화
	$("#reason").attr("readonly", false);
    $("#label").append("<label for='text'>탈퇴 사유를 작성해주세요.</label>"); // 태그 추가
    });
});
</script>



</html>