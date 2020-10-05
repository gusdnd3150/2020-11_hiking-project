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
<title>mypageHome</title>
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<!— body —>
<script src="/resources/js/jquery.js"></script>
<script src="/resources/js/bootstrap.bundle.js"></script>
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
<body>
	<div class="container">
		<jsp:include page="/common/header.jsp" flush="false"/>
		</div>
		<br>
		<br>
		<br>
			<div class="row text-center">
				 <div class="col-md-3"></div>
				<div class="col-md-6">
					<h2>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					나의 정보</h2>
					<form action="/mypage/updateUser.do" method="post">
						<table class="table table-boardered">
							<tr>
								<th>아이디</th>
								<td><input type="text" class="form-control" id="id"
									name="id" placeholder="소문자와 숫자 4~12자리" value="${userVO.id}"
									readonly><br>
									<div class="check_font" id="idCheck"></div></td>
							</tr>
							<tr>
								<th>비밀번호</th>
						<td><jsp:include page="/user/modPassword.jsp" flush="false"/></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input type="text" class="form-control" id="name"
									name="name"  value="${userVO.name}" required ><br>
									<div class="check_font" id="nameCheck"></div></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="email" class="form-control" id="email"
									name="email" value="${userVO.email}" required><br>
									<div class="check_font" id="emailCheck"></div></td>
							</tr>
							<tr>
								<th>주소</th>
								<td><input type="text" id="zonecode" name="zonecode"  value="${userVO.zonecode}" style="width: 50px;"  readonly  /> &nbsp; 
									<input type="button" onClick="openDaumZipAddress();" value="주소 찾기" /> &nbsp; 
									<input type="text" id="address" name="address" value="${userVO.address}" style="width: 240px;" readonly /><br> 
									<input type="text" class="form-control" id="address2" name="address2"  value="${userVO.address2}"placeholder="상세 주소를 입력해주세요."
									 required ><br>
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
							<tr>
								<td colspan="2"><input type="submit"
									class="btn btn-primary" value="저장하기" id="updateUser">
						</form>
								<br><br><br><br><br><br>
								<a href="/user/withdrawalCheck.jsp" id="deleteUser"><h6>탈퇴하기</h6></a>
									</td>
							</tr>
						</table>
				</div>
				 <div class="col-md-3"></div>
	</div>

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
			if ($("input:radio[name=sex]:checked").val() == "10") {
				console.log($(this).val());
				$("#sexCheck").text('남자');
				$('#sexCheck').css('color', 'green');
			} else {
				console.log($(this).val());
				$('#sexCheck').text('여자');
				$('#sexCheck').css('color', 'green');
			}
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
		}); 

</script>
</html>