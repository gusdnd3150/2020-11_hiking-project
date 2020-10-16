<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/JavaScript"
	src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">

<style>
#space {
	width: 170px;
}

#space2 {
	width: 400px;
	margin: 10px;
}

#myTabContent {
	height: 200px;
}
</style>
	<jsp:include page="/common/header.jsp" flush="false" />
	<div class="container">
		<!-- Profile Image -->
		<div class="row pt-5">
			<div class="col-md-3"></div>
			<div class="col-md-6 mt-3">

				<h1 style="text-align: center;">마이페이지</h1>
				<div class="box box-primary">
					<div class="box-body box-profile text-center">
						<div style="text-align: center;">

							<img class="rounded-circle mt-2"
								src="/resources/img/${userVO.content2}"
								width="100" height="100" alt="프로필사진">

						</div>
						<h4 class="text-center mt-2" id="nickName">${userVO.nickName}</h4>
						<%-- 	<p class="text-muted text-center" id="name">${userVO.name}</p>  --%>
						<p id="profile1">${userVO.profile}</p>
						<center>
							<div style="width: 550px;"><jsp:include
									page="/user/modProfile.jsp" flush="false" /></div>
						</center>
					</div>
				</div>
			</div>
			<div class="row mt-4">
				<div id="space"></div>
				<div id="space2">
					<!-- 			<div class="col-md-5"> -->
					<ul class="list-group list-group-unbordered">
						<li class="list-group-item text-center">
							<h4 id="shoppingMall">나의 산오름</h4>
						</li>
						<li class="list-group-item d-flex justify-content-between align-items-center"><b> 오른 산 길</b> 
						<a href=""><h5 class="mt-2">15</h5></a></li>
						<li class="list-group-item d-flex justify-content-between align-items-center"><b>오르고 싶은 산 길</b> <a
							href=""><h5 class="mt-2">50</h5></a></li>
						<li class="list-group-item d-flex justify-content-between align-items-center"><b>함께 했던 등산 모임</b> <a
							href=""><h5 class="mt-2">50</h5></a></li>
						<li class="list-group-item">
							<ul class="nav nav-tabs" id="myTab" role="tablist">
								<li class="nav-item" role="presentation"><a
									class="nav-link active" id="joined-tab" data-toggle="tab"
									href="#joined" role="tab" aria-controls="joined"
									aria-selected="true"><b>내가 가입한 산모임</b></a></li>
								<li class="nav-item" role="presentation"><a
									class="nav-link" id="created-tab" data-toggle="tab"
									href="#created" role="tab" aria-controls="created"
									aria-selected="false"><b>내가 만든 산모임</b></a></li>
							</ul>
							<div class="tab-content" id="myTabContent" style="overflow:scroll;" >
								<div class="tab-pane fade show active" id="joined"
									data-spy="scroll" role="tabpanel" aria-labelledby="joined-tab">
									<% %>
									<c:forEach var="JList" items="${JList}">
										<img class="rounded-circle mt-2"
											src="http://localhost:8080/resources/img/${JList.STOREDFILENAME}"
											width="50" height="50">
										<a href="/commu/commuPageView.do?groupNum=${JList.GROUPNUM}">
											${JList.NAME}</a>
										<br>
									</c:forEach>
								</div>
								<div class="tab-pane fade" id="created" role="tabpanel"
									data-spy="scroll" aria-labelledby="created-tab">
									<c:forEach var="CList" items="${CList}">
										<img class="rounded-circle mt-2"
											src="http://localhost:8080/resources/img/${CList.STOREDFILENAME}"
											width="50" height="50">
										<a href="/commu/commuPageView.do?groupNum=${CList.GROUPNUM}">
											${CList.NAME}</a>
										<br>
									</c:forEach>
								</div>
							</div>
						</li>
					</ul>
				</div>

				<jsp:include page="/user/mypageMarket.jsp" flush="false" />
			</div>
		</div>

		<center>
			<div class="pt-3" style="width: 550px;">
			<jsp:include page="/user/pwdCheck.jsp" /></div>
		</center>
	</div>

	<div class="container pt-5">
		<jsp:include page="../common/footer.jsp" flush="false" />
	</div>
</body>
<script>
<!-- /.container -->
	$(document).ready(function() {
		/* 	$.ajax({
				url : "/mypage/modProfile.do",
				type : "post",
				success : function(data) {
					console.log(data);
					$('#profile1').text(data.profile);
					$('#profile2').text(data.profile);
					$('#name').text(data.name);
					var content2 =  (data.content2);
				},
				error : function(data, textStatus) {
					console.log("실패");
				},
				complete : function(data, textStatus) {

				}

		}); */

		$("#checkIt").click(function() {
			var pwd = $("#password3").val();
			console.log("이벤트!!" + pwd);
			$.ajax({
				url : "/mypage/pwdCheck.do",
				type : "post",
				data : {
					pwd : pwd
				},
				success : function(data) {
					console.log(data);
					if ($('#password3').val() == "") {
						$('#passwordCheck3').text('비밀번호를 입력해주세요.');
						$('#passwordCheck3').css('color', 'red');
						$("#myInfo").attr("disabled", true);
					} else if (data == "0") {
						// 0 : 비밀번호 통과
						$("#password3").val("");
						$("#passwordCheck3").text("'다음'을 클릭하세요.");
						$('#passwordCheck3').css('color', 'green');
						$("#myInfo").attr("disabled", false);
					} else if (data == "1") {
						// 1 : 	비밀번호 틀림
						$("#password3").val("");
						$("#passwordCheck3").text("비밀번호를 다시 확인해주세요.");
						$("#passwordCheck3").css("color", "red");
						$("#myInfo").attr("disabled", true);
					}
				},
				error : function(data, textStatus) {
					console.log("실패");
				},
				complete : function(data, textStatus) {
				}
			//responsebody -> 아작스로 들어옴
			});
		});

		$("#myInfo").click(function() {
			console.log("myInfo");
			$("#password3").val("");
		});
	});
</script>
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
</html>