<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="ko">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/JavaScript"
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>산오름</title>
<!-- ico,css -->
<link rel="icon" href="../resources/img/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css"
	href="../resources/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="../resources/css/views/common/header.css" />
<!-- Navigation -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
		function openDaumZipAddress() {
			new daum.Postcode({
				oncomplete:function(data) {
					jQuery("input[name=zonecode]").val(data.zonecode);
					jQuery("input[name=address]").val(data.address);
					jQuery("#address2").focus();
					console.log(data);
				}
			}).open();
		}
		
		function fn_insertUser() {
			var userVO = document.frmJoin;
			var address = userVO.address.value;
			var zonecode = userVO.zonecode.value;
			if((zonecode.length == 0|| zonecode =="") || (address.length ==0 || address =="")) {
				let i = document.getElementById("addressCheck");
				i.innerHTML = "'주소 찾기'를 완료 해주세요.";
				i.style.color="red";
			}else {
				frmJoin.method="post";
				frmJoin.action="/user/insertUser.do";
				frmJoin.submit();
			}

		}
			
	</script>
<style>
.containerr {
	text-align: left;
}
</style>
</head>
<body>
	 <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
<div class="containerr ">
		<a class="navbar-brand" href="/"> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
											&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<img src="../resources/img/main-icon.svg" width="30" height="30"
			class="d-inline-block align-top" alt="" loading="lazy"> 산오름
		</a>
	</div> 
	</nav>
	<div class="row text-center">
		<div class="col-md-3 mt-3"></div>
		<div class="col-md-5">
			<h2 class="display-3">산오름 회원가입</h2>
			<br>
			<form name="frmJoin" action="/user/insertUser.do" method="post">
				<table class="table table-boardered">
					<tr>
						<th>아이디</th>
						<td><input type="text" class="form-control" id="id" name="id"
							placeholder="소문자와 숫자 4~12자리" required><br>
							<div class="check_font" id="idCheck"></div></td>
					</tr>

					<tr>
						<th>비밀번호</th>
						<td><input type="password" class="form-control" id="password"
							name="password" placeholder="대소문자와 숫자 4~12자리" required><br>
							<div class="check_font" id="passwordCheck"></div></td>

					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" class="form-control"
							id="password2" name="password2" placeholder="비밀번호 확인" required><br>
							<div class="check_font" id="password2Check"></div></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" class="form-control" id="name"
							name="name" required><br>
							<div class="check_font" id="nameCheck"></div></td>
					</tr>
						<tr>
						<th>닉네임</th>
						<td><input type="text" class="form-control" id="nickName"
							name="nickName" required><br>
							<div class="check_font" id="nickNameCheck"></div></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="email" class="form-control" id="email"
							name="email" placeholder="ex) abc@hiking.com" required><br>
							<div class="check_font" id="emailCheck"></div>
							<p>'회원가입 인증', '고객문의 답변' 등이 해당 메일주소로 전송됩니다.</p>
							<p>
								<strong>후에 변경 불가</strong>하니 정확하게 입력해 주세요.
							</p></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input id="zonecode" name="zonecode" type="text"
							style="width: 50px;" readonly /> &nbsp; <input type="button"
							id="addressBnt" onClick="openDaumZipAddress();" value="주소 찾기" />
							&nbsp; <input type="text" id="address" name="address"
							style="width: 240px;" readonly /><br> <br> <input
							type="text" class="form-control" id="address2" name="address2"
							placeholder="상세 주소를 입력해주세요." required><br>
							<div class="check_font" id="addressCheck"></div></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="text" class="form-control" id="phone"
							name="phone" placeholder="'-'없이 입력해 주세요." required><br>
							<div class="check_font" id="phoneCheck"></div></td>
					</tr>

					<tr>
						<th>성별</th>
						<td><input type="radio" name="sex" value="10" required>남성&nbsp;&nbsp;
							<input type="radio" name="sex" value="20" required>여성&nbsp;&nbsp;
							<div class="check_font" id="sexCheck"></div></td>
					</tr>
					<tr>
						<td colspan="2">
							<!--  <input type="submit" class="btn btn-primary" value="가입" id="insertUser" > -->
							<input type="button" onClick="fn_insertUser()"
							class="btn btn-primary" value="산오름 가입하기" />
						</td>
					</tr>
				</table>
			</form>
		</div>

	</div>
	</div>
	</div>
</body>
<script>
//모든 공백 체크 정규식
var empJ = /\s/g;
//아이디 정규식
var idJ = /^[a-z0-9]{4,12}$/;
// 이름 정규식
var nameJ = /^[가-힣]{2,6}$/;
// 비밀번호 정규식
var pwdJ = /^[A-Za-z0-9]{4,12}$/; 
//이메일 검사 정규식
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
//휴대폰 번호 정규식
var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
//닉네임 정규식
var nickJ =/^[0-9]|[a-z]|[A-Z]|[가-힣]/;
	
	$(document).ready(function(){ 
		//아이디 유효성 검사
		$("#id").blur(function() {
		console.log("이벤트 먹었니");					
		var id = $("#id").val();
		$.ajax({
			url : "/user/idCheck.do?id="+id ,
			type : "get",
			success : function(data, textStatus) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);		
				if (data == "1") {
						// 1 : 아이디가 중복되는 문구
						$("#idCheck").text("사용중인 아이디입니다.");
						$("#idCheck").css("color", "red");
						$("#insertUser").attr("disabled", true);
					} else {
						if(idJ.test(id)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#idCheck").text("");
							$("#insertUser").attr("disabled", false);		
						} else {
							$('#idCheck').text("아이디는 소문자와 숫자 4~12자리만 가능합니다.");
							$('#idCheck').css('color', 'red');
							$("#insertUser").attr("disabled", true);
						}
					}
				}, error : function(data, textStatus) {
					console.log(data.readyState);
					console.log(data.status);
					console.log(data.responseText); 
						console.log("실패");
				},
				complete : function(data, textStatus) {
				}
			});
		});
		
		// 이름에 특수문자 들어가지 않도록 설정
		$("#name").blur(function() {
			console.log("이벤트 먹었니");	
			if (nameJ.test($(this).val())) {
					console.log(nameJ.test($(this).val()));
					$("#nameCheck").text('');
					$("#insertUser").attr("disabled", false);
					
			} else {
				$('#nameCheck').text('이름을 확인해주세요 :)');
				$('#nameCheck').css('color', 'red');
				$("#insertUser").attr("disabled", true);
			}
		});
		
	//비밀번호
		$('#password').blur(function(){
			console.log("이벤트 먹었니");	
			if(pwdJ.test($(this).val())){
				console.log(pwdJ.test($(this).val()));
				$("#passwordCheck").text('');
				$("#insertUser").attr("disabled", false);
			} else{
				$('#passwordCheck').text('비밀번호를 확인해주세요 :)');
				$('#passwordCheck').css('color', 'red');
				$("#insertUser").attr("disabled", true);
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
				$("#insertUser").attr("disabled", false);
			} else{
				console.log(password)
				console.log($(this).val())
				console.log("비밀번호 다를 때 ");	
				$('#password2Check').text('비밀번호가 일치하지 않습니다 :p');
				$('#password2Check').css('color', 'red');
				$("#insertUser").attr("disabled", true);
			}
		});
		
		
		// 이메일
		$("#email").blur(function() {
			console.log("이벤트 먹었니");					
			var email = $("#email").val();
			$.ajax({
				url : "/user/emailCheck.do?email="+email ,
				type : "get",
				success : function(data, textStatus) {
					console.log("1 = 중복o / 0 = 중복x : "+ data);		
					if (data == "1") {
							// 1 : 이메일 중복된다는 문구
							$("#emailCheck").text("이미 등록된 이메일입니다.");
							$("#emailCheck").css("color", "red");
							$("#insertUser").attr("disabled", true);
						} else {
							// 0 : 이메일 정규식 검사 
							if(mailJ.test(email)){
								console.log(mailJ.test(email));
								$("#emailCheck").text('');
								$("#insertUser").attr("disabled", false);
							} else {
								$('#emailCheck').text('이메일을 확인해주세요 :)');
								$('#emailCheck').css('color', 'red');
								$("#insertUser").attr("disabled", true);
							}
						}
					}, error : function(data, textStatus) {
						console.log(data.readyState);
						console.log(data.status);
						console.log(data.responseText); 
							console.log("실패");
					},
					complete : function(data, textStatus) {
					}
				});
			});
			
	// 휴대전화
	$('#phone').blur(function(){
		if(phoneJ.test($(this).val())){
			console.log(phoneJ.test($(this).val()));
			$("#phoneCheck").text('');
			$("#insertUser").attr("disabled", false);
		} else {
			$('#phoneCheck').text('휴대폰번호를 확인해주세요 :)');
			$('#phoneCheck').css('color', 'red');
			$("#insertUser").attr("disabled", true);
		}
	});
	
	//닉네임
	$('#nickName').blur(function(){
		console.log("이벤트 먹었니");					
		var nickName = $("#nickName").val();
		$.ajax({
			url : "/user/nickNameCheck.do?nickName="+nickName ,
			type : "get",
			success : function(data, textStatus) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);		
				if (data == "1") {
						// 1 : 닉네임 중복된다는 문구
						$("#nickNameCheck").text("이미 등록된 닉네임입니다.");
						$("#nickNameCheck").css("color", "red");
						$("#insertUser").attr("disabled", true);
					} else {
						// 0 : 닉네임 정규식 검사 
						if(nickJ.test(nickName)){
							console.log(nickJ.test(nickName));
							$("#nickNameCheck").text('');
							$("#insertUser").attr("disabled", false);
						} else {
							$('#nickNameCheck').text('닉네임을 확인해주세요.');
							$('#nickNameCheck').css('color', 'red');
							$("#insertUser").attr("disabled", true);
						}
					}
				}, error : function(data, textStatus) {
					console.log(data.readyState);
					console.log(data.status);
					console.log(data.responseText); 
						console.log("실패");
				},
				complete : function(data, textStatus) {
				}
			});
		});
});

	</script>
</html>