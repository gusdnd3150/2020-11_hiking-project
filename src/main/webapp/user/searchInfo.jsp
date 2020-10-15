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
<style>
body {
	float: center;
}

.card {
	margin: 10px auto;
	width: 500px;
	height: 350px;
}

.container {
	margin: auto;
	float: center;
}

.row {
	margin: auto;
	width: 100%;
	height: 100%;
}

.space {
	height: 120px;
}

.space2 {
	height: 100px;
}

#email{
	width: 450px;
}

#id{
	width: 450px;
}
</style>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  
<title>산오름</title>
<!-- ico,css -->
<link rel="icon" href="../resources/img/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="../resources/css/views/common/header.css" />
</head>
<body>

	<div class="container">
		<jsp:include page="/common/header.jsp" flush="false" />
	</div>


	<div class="space"></div>


	<div class="container">
		<h3 class="display-6">&nbsp&nbsp&nbsp 아이디 혹은 비밀번호를 잊어버리셨나요?</h3>
	</div>
	<br>
	<br>

	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">아이디 찾기</h5>
						<hr class="my-4">
						 <form class="form-inline" action="/user/searchId.do" id="form1" method="post"> 
							<table>
								<tr>
									<td>
										<div class="form-group">
											<label for="email">회원가입 때 입력한 이메일 주소</label> <br>
											<br>
										</div>
									</td>
								</tr>
								<tr>
									<td><div class="form-group">
											<input type="email" class=" form-control" name="email"
												id="email1" placeholder="ex) abc@hiking.com"
												aria-describedby="emailHelp" required>
										</div>
										<div class="check_font" id="emailCheck1"></div>
										</td>
								</tr>
						</form> 
								<tr>
									<td><br>
										<button type="button" id="sendMail1" class="btn btn-primary mb-2">
											메일로 ID 확인하기</button></td>
								</tr>
							</table>
							<br>
						<hr class="my-4">
				<a tabindex="0"  role="button" data-toggle="popover" data-trigger="focus" 
				data-content="고객님은 아이디가 임의로 설정되어 있습니다.
				 따라서 간편로그인 이용하신 해당 포털사이트에 방문하셔서 정보에 등록된 이메일 주소를 확인하신 후,&nbsp&nbsp위의 입력칸에 입력해주셔야 합니다."><button type="button" class="btn btn-link">
				 저는 간편로그인(네이버, 카카오, 구글)으로 가입했어요.</button></a>
				
					 
					
					</div>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="card">
					<div class="card-body">
						<h5 class="card-title">비밀번호 찾기</h5>
						<hr class="my-4">
						<form class="form-inline" action="/user/sendTempPwd.do" id="form2" method="post">
							<table>
							<tr>
									<td>
										<div class="form-group">
											<label for="email">회원가입 때 입력한 이메일 주소</label> <br>
											<br>
										</div>
									</td>
								</tr>
								<tr>
									<td><div class="form-group">
											<input type="email" class=" form-control" name="email"
												id="email2" placeholder="ex) abc@hiking.com"
												aria-describedby="emailHelp" required>
										</div>
								</tr>
								<tr>
									<td>
										<div class="form-group">
											<label for="id">ID</label> 
										</div>
									</td>
								</tr>
								<tr>
									<td>
										<div class="form-group ">
											<input type="text" class="form-control" id="id" name="id"
												placeholder="아이디를 입력해주세요." required>
										</div>
										<div class="check_font" id="check"></div>
									</td>
								</tr>
						</form>
								<tr>
									<td><br>
										<button type="button" id="sendMail2" class="btn btn-primary mb-2">임시
											비밀번호 발급받기</button>
									</td>
								</tr>
							</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="space2"></div>

	<div class="container">
		<jsp:include page="/common/footer.jsp" flush="false" />
	</div>
	<script type="text/javascript" src="../resources/js/jquery.js"></script>
	<!-- <script type="text/javascript" src="../resources/js/bootstrap.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script> 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
<script>
$(function () {
  $('[data-toggle="popover"]').popover()
});

//이메일
$("#sendMail1").click(function() {
	console.log("이벤트 먹었니");					
	var email1 = $("#email1").val();
	if (email1==""){
		$("#emailCheck").text("메일 주소를 입력해주세요.");
		$('#emailCheck').css('color', 'red');
	} else{
	$.ajax({
		url : "/user/emailCheck.do?email="+email1 ,
		type : "get",
		success : function(data, textStatus) {
			console.log("1 = 중복o / 0 = 중복x : "+ data);		
			if (data == "1") {
					// 1 : 이메일 있다는 문구
					$('#emailCheck').text('입력하신 주소로 이메일 전송중입니다.');
					$('#emailCheck').css('color', 'green');
					$("#form1").submit();
				} else {
					// 0 : 이메일이 없다는 문구
						$('#emailCheck').text('가입하지 않은 회원정보입니다.');
						$('#emailCheck').css('color', 'red');
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
		}
	});
	
	
	$("#sendMail2").click(function() {
		console.log("이벤트 먹었니");	
		
		var email2 = $("#email2").val();
		var id = $("#id").val();
		if (email2=="" || id==""){
			$("#check").text("정보를 입력해주세요.");
			$('#check').css('color', 'red');
		} else{
		$.ajax({
			url : "/user/idEmailCheck.do?id="+id+"&email="+email2,
			type : "get",
			success : function(data, textStatus) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);		
				if (data == "1") {
					$('#check').text('입력하신 주소로 이메일 전송중입니다.');
					$('#check').css('color', 'green');
								$("#form2").submit();
					} else {
						// 0 : 이메일이 없다는 문구
						$('#check').text('가입하지 않은 회원정보입니다.');
						$('#check').css('color', 'red');
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
			}
		
	
	});
		
	
	
	
	
	
</script>
</html>