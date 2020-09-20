<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>

<!-- 주소, 비밀번호 확인 미완성 -->


<html>
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/JavaScript"
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>수정</title>
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
			oncomplete : function(data) {
				jQuery("#postcode1").val(data.postcode1);
				jQuery("#postcode2").val(data.postcode2);
				jQuery("#zonecode").val(data.zonecode);
				jQuery("#address").val(data.address);
				jQuery("#address_etc").focus();
				console.log(data);
			}
		}).open();
	}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-12 text-center">
				<div class="col-sm-3"></div>

				<div class="col-sm-6">
					<h2>회원가입</h2>
					<form action="/user/insertUser" method="post">
						<table class="table table-boardered">
							<tr>
								<th>아이디</th>
								<td><input type="text" class="form-control" id="id"
									name="id" placeholder="소문자와 숫자 4~12자리" value="${LOGIN.id}" disabled><br>
									<div class="check_font" id="idCheck"></div></td>
							</tr>

							<tr>
								<th>비밀번호</th>
								<td><input type="password" class="form-control"
									id="password" name="password" placeholder="대소문자와 숫자 4~12자리" 
									required><br>
									<div class="check_font" id="passwordCheck"></div></td>

							</tr>
							<tr>
								<th>비밀번호 확인</th>
								<td><input type="password" class="form-control"
									id="password2" name="password2" placeholder="비밀번호 확인"  required><br>
									<div class="check_font" id="password2Check"></div></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input type="text" class="form-control" id="name"
									name="name" required value="${LOGIN.name}"><br>
									<div class="check_font" id="nameCheck"></div></td>
							</tr>

							<tr>
								<th>이메일</th>
								<td><input type="email" class="form-control" id="email"
									name="email" value="${LOGIN.email}" required><br>
									<div class="check_font" id="emailCheck"></div></td>
							</tr>
							<tr>
								<th> 주소</th>
								<td><input id="zonecode" type="text" value="" style="width: 50px;" readonly /> &nbsp; 
								<input type="button" onClick="openDaumZipAddress();" value="주소 찾기" /> &nbsp; 
								<input type="text" id="address" value="" style="width: 240px;" readonly /><br> 
								<input type="text" class="form-control" id="userAddress" name="userAddress" 
								placeholder="상세 주소를 입력해주세요." value="${LOGIN.address}" required><br>
								<div class="check_font" id="addressCheck"></div></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td><input type="text" class="form-control" id="phone"
									name="phone" placeholder="'-'없이 입력해 주세요." value="${LOGIN.phone}" required><br>
									<div class="check_font" id="phoneCheck"></div></td>
							</tr>

							<tr>
								<th>성별</th>
								<td>
								<input type="radio" name="sex" value="10">남성&nbsp;&nbsp; 
								<input type="radio" name="sex" value="20">여성&nbsp;&nbsp;<div class="check_font" id="sexCheck">${LOGIN.sex}</div></td>
							</tr>
							<tr>
								<td colspan="2"><input type="submit"
									class="btn btn-primary" value="저장" id="updateUser">&nbsp;&nbsp;&nbsp;&nbsp;
										<form method="post">
		<input type="text" name="id" value="${LOGIN.id}"> <input
			type="text" name="password" value="${LOGIN.password}"> <input
			type="submit" class="btn btn-primary" value="탈퇴" id="deleteUser">
	</form></td>
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

	$(document).ready(function() {
		//아이디 유효성 검사
		$("#id").blur(function() {
			console.log("이벤트 먹었니");
			var userId = $("#id").val();
			$.ajax({
				url : "/user/idCheck?id=" + id,
				type : "get",
				success : function(data, textStatus) {
					console.log("1 = 중복o / 0 = 중복x : " + data);
					if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#idCheck").text("사용중인 아이디입니다 :p");
						$("#idCheck").css("color", "red");
						$("#insertUser").attr("disabled", true);
					} else {
						if (idJ.test(userId)) {
							// 0 : 아이디 길이 / 문자열 검사
							$("#idCheck").text("");
							$("#insertUser").attr("disabled", false);
						} else if (userId == "") {
							$('#idCheck').text('아이디를 입력해주세요 :)');
							$('#idCheck').css('color', 'red');
							$("#insertUser").attr("disabled", true);
						} else {
							$('#idCheck').text("아이디는 소문자와 숫자 4~12자리만 가능합니다:)");
							$('#idCheck').css('color', 'red');
							$("#insertUser").attr("disabled", true);
						}
					}
				},
				error : function(data, textStatus) {
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
			} else {
				$('#nameCheck').text('이름을 확인해주세요 :)');
				$('#nameCheck').css('color', 'red');
			}
		});
		//비밀번호
		$('#password').blur(function() {
			console.log("이벤트 먹었니");
			if (pwdJ.test($(this).val())) {
				console.log(pwdJ.test($(this).val()));
				$("#passwordCheck").text('');
			} else {
				$('#passwordCheck').text('비밀번호를 확인해주세요 :)');
				$('#passwordCheck').css('color', 'red');
			}
		});
		//비밀번호 확인
		$('#password2').blur(function() {
			console.log("이벤트 먹었니");
			var password = $("password").val()
			if ($(this).val() == userPwd) {
				console.log("비밀번호 같을 때 ");
				console.log($(this).val())
				$("#password2Check").text('');
			} else {
				console.log(userPwd)
				console.log($(this).val())
				console.log("비밀번호 다를 때 ");
				$('#password2Check').text('비밀번호가 일치하지 않습니다 :p');
				$('#password2Check').css('color', 'red');
			}
		});
		// 이메일
		$('#email').blur(function() {
			console.log("이벤트 먹었니");
			if (mailJ.test($(this).val())) {
				console.log(mailJ.test($(this).val()));
				$("#emailCheck").text('');
			} else {
				$('#emailCheck').text('이메일을 확인해주세요 :)');
				$('#emailCheck').css('color', 'red');
			}
		});

		//주소	
		$('#zonecode').blur(function() {
			console.log("이벤트 먹었니");
			if ($(this).val() != "") {
				$("#addressCheck").text('');
			} else {
				$('#addressCheck').text('주소를 확인해주세요 :)');
				$('#addressCheck').css('color', 'red');
			}
		});
		// 휴대전화
		$('#phone').blur(function() {
			if (phoneJ.test($(this).val())) {
				console.log(phoneJ.test($(this).val()));
				$("#phoneCheck").text('');
			} else {
				$('#phoneCheck').text('휴대폰번호를 확인해주세요 :)');
				$('#phoneCheck').css('color', 'red');
			}
		});
	
	//성별
	$("input:radio[name=sex]").click(function() {
		if ($("input:radio[name=sex]:checked").val()=="10") {
			console.log($(this).val());
			$("#sexCheck").text('남자');
			$('#sexCheck').css('color', 'green');
		} else {
			console.log($(this).val());
			$('#sexCheck').text('여자');
			$('#sexCheck').css('color', 'green');
		}
	});
});
</script>
</html>