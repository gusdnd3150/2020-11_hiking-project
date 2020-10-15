<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/JavaScript"
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<title>산오름</title>
    <!-- ico,css -->
    <link rel="icon" href="../resources/img/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="../resources/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../resources/css/views/common/header.css" />
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
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
<style>
		.containerr{
		
			text-align: left;
		}
		
	</style>
<body>
	<div class="container">
		<jsp:include page="/common/header.jsp" flush="false"/>
		</div>
		<br>
		<br>
		<br>
			<div class="row text-center">
				 <div class="col-md-4"></div>
				<div class="col-md-5">
					<h3 class="display-4">나의 정보</h3>
					<br>
					<form action="/mypage/updateUser.do" method="post" id="updateUserForm">
						<table class="table table-boardered">
							<tr>
								<th>아이디</th>
								<td><input type="text" class="form-control" id="id"
									name="id" placeholder="소문자와 숫자 4~12자리" value="${userVO.id}"
									readonly><br>
									<div class="check_font" id="idCheck"></div></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input type="text" class="form-control" id="name"
									name="name"  value="${userVO.name}" required><br>
									<div class="check_font" id="nameCheck"></div></td>
							</tr>
							<tr>
								<th>닉네임</th>
								<td><input type="text" class="form-control" id="nickName"
									name="nickName"  value="${userVO.nickName}" required><br>
								<div class="check_font" id="nickNameCheck"></div></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="email" class="form-control" id="email"
									name="email" value="${userVO.email}" readonly><br>
									<div class="check_font" id="emailCheck"></div></td>
							</tr>
							<tr>
								<th>주소</th>
								<td><input type="text" id="zonecode" name="zonecode"  value="${userVO.zonecode}" style="width: 50px;"  readonly  /> &nbsp; 
									<input type="button" onClick="openDaumZipAddress();" value="주소 찾기" /> &nbsp; 
									<input type="text" id="address" name="address" value="${userVO.address}" style="width: 240px;" readonly /><br> 
									<input type="text" class="form-control" id="address2" name="address2"  value="${userVO.address2}"placeholder="상세 주소를 입력해주세요." required
									 ><br>
									<div class="check_font" id="addressCheck"></div></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td><input type="text" class="form-control" id="phone"
									name="phone" placeholder="ex)01012345678" value="${userVO.phone}"
									 required><br>
									<div class="check_font" id="phoneCheck"></div></td>
							</tr>
							<tr>
								<th>성별</th>
								<td>
								<table>
								<tr>
								<td style="border: #000000 solid; border-width: 0px;">
								<input type="radio" name="sex" value="10">&nbsp;&nbsp;남성&nbsp;&nbsp;</td>
								<td style="border: #000000 solid; border-width: 0px;">
								<input type="radio" name="sex" value="20">&nbsp;&nbsp;여성&nbsp;&nbsp;</td>
								<td colspan="3" style="border: #000000 solid; border-width: 0px;"></td>
									<td style="border: #000000 solid; border-width: 0px;">
									</tr>
									</table>
									</td>
							</tr>
							<input type="hidden" name="password" value="">
							</form>
							<tr>
								<th>비밀번호</th>
						<td><jsp:include page="/user/modPassword.jsp" flush="false"/></td>
							</tr>
							<tr>
								<td colspan="2">
								<input type="button"
									class="btn btn-primary" value="저장하기" id="updateUser" disabled >
								<br><br><br><br><br><br>
								<a href="/user/withdrawalCheck.jsp" id="deleteUser"><h6>탈퇴하기</h6></a>
									</td>
							</tr>
						</table>
				</div>
				 <div class="col-md-3"></div>
	</div>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
		integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
		crossorigin="anonymous"></script>
</body>
<script>
	//모든 공백 체크 정규식
	var empJ = /\s/g;
	//아이디 정규식
	var idJ = /^[a-z0-9]{4,12}$/;
	// 이름 정규식
	var nameJ = /^[가-힣]{2,6}$/;
	//이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	//휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	//닉네임 정규식
	var nickJ =/^[0-9]|[a-z]|[A-Z]|[가-힣]/;
	
		// 이름에 특수문자 들어가지 않도록 설정
		$("#name").blur(function() {
			console.log("이벤트 먹었니");
			if (nameJ.test($(this).val())) {
				console.log(nameJ.test($(this).val()));
				$("#nameCheck").text('');
				$("#updateUser").attr("disabled", false);
			} else {
				$('#nameCheck').text('이름을 확인해주세요.');
				$('#nameCheck').css('color', 'red');
				$("#updateUser").attr("disabled", true);
			}
		});
	

		//주소	
		$('#zonecode').blur(function() {
			console.log("이벤트 먹었니");
			if ($(this).val() != "") {
				$("#addressCheck").text('');
				$("#updateUser").attr("disabled", false);
			} else {
				$('#addressCheck').text('주소를 확인해주세요.');
				$('#addressCheck').css('color', 'red');
				$("#updateUser").attr("disabled", true);
			}
		});
		
		// 휴대전화
		$('#phone').blur(function() {
			console.log("이벤트 먹었니");	
			if (phoneJ.test($(this).val())) {
				console.log(phoneJ.test($(this).val()));
				$("#phoneCheck").text('');
				$("#updateUser").attr("disabled", false);
			} else {
				$('#phoneCheck').text('휴대폰번호를 확인해주세요.');
				$('#phoneCheck').css('color', 'red');
				$("#updateUser").attr("disabled", true);
			}
		});

		//성별
		$("input:radio[name=sex]").blur(function() {
			if ($(this).val() == "") {
				$("#sexCheck").text('성별을 선택해주세요.');
				$("#updateUser").attr("disabled", true);
			} else {
				console.log($(this).val());
				$('#sexCheck').text('');
				$("#updateUser").attr("disabled", false);
			}
		});
		
		
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
							$("#updateUser").attr("disabled", true);
						} else {
							// 0 : 닉네임 정규식 검사 
							if(nickJ.test(nickName)){
								console.log(nickJ.test(nickName));
								$("#nickNameCheck").text('');
								$("#updateUser").attr("disabled", false);
							} else {
								$('#nickNameCheck').text('닉네임을 확인해주세요.');
								$('#nickNameCheck').css('color', 'red');
								$("#updateUser").attr("disabled", true);
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
		
	$(document).ready(function() {
			$("#editInfo").click(function() {
				$.ajax({
					url : "/mypage/modifyView.do",
					type : "post",
					success : function(data) {
						console.log(data);
						$('#id').val(data.id);
						console.log("id");
						$('#name').val(data.name);
						console.log("name");
						$('#nickName').val(data.nickName);
						$('#email').val(data.email);
						console.log("email");
						$('#zonecode').val(data.zonecode);
						$('#address').val(data.address);
						$('#address2').val(data.address2);
						$('#phone').val(data.phone);
						$('#sexCheck').text(data.sex2);
						$('#myInfo').addClass('active');
					},
					error : function(data, textStatus) {
						console.log("실패");
					},
					complete : function(data, textStatus) {
					}
				});
			});
			
			$("#updateUser").click(function() {
				$("#updateUserForm").submit();
			}); 
		}); 

</script>
</html>