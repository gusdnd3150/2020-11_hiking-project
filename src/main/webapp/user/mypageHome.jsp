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
<body>

		<jsp:include page="/common/header.jsp" flush="false"/>
		<div class="container">
		<!-- Profile Image -->
		<table
			style="width: 100%; height: 200px; table-layout: fixed; !important">
			<tr>
				<td>
						<h1>MyPage</h1>
					<div class="box box-primary">
						<div class="box-body box-profile">
						<div style="text-align:center;">

							<img class="rounded-circle" src="/mypage/contentView.do" width="100" height="100"
								alt="프로필사진">
							
								</div>
							<h3 class="profile-username text-center" id="name"></h3>
							<!-- <p class="text-muted text-center">여기다가는 뭘 넣을까 그냥 뺼까</p> -->

							<ul class="list-group list-group-unbordered">
								<li class="list-group-item text-center">
									<p id="profile1">여기에 나의 소개글이 이렇게 들어갈거에요.</p>
								</li>
								<li class="list-group-item"><b>내가 오른 산</b> <a
									class="pull-right"><h5 style="text-align: right">15</h5></a></li>
								<li class="list-group-item"><b>오르고 싶은 산</b> <a
									class="pull-right"><h5 style="text-align: right">50</h5></a></li>
								<li class="list-group-item"><b>나의 산 모임</b> <a
									class="pull-right"><h5 style="text-align: right">청솔 젊은 산모임</h5></a></li>
								<jsp:include page="/user/modProfile.jsp" flush="false" /></ul>
						</div>
					</div>
				</td>
				<td colspan="2" rowspan="4">
					<div class="card text-center">
						<div class="card-header">
							<ul class="nav nav-tabs card-header-tabs" id="tabs" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									href="#tab1" data-toggle="tab">Link</a></li>
								<li class="nav-item"><a class="nav-link" href="#tab2"
									id="" data-toggle="tab">Link2</a></li>
								<%-- <li class="nav-item"><a class="nav-link" href="#tab3"
									data-toggle="tab"  id="myInfo" data-target="#exampleModalCenter3">나의정보</a>
									<jsp:include page="/user/pwdCheck.jsp"/></li> --%>
							</ul>
						</div>
						<div class="tab-content">
							<div class="card-body tab-pane active" id="tab1">
								<p class="card-text" id="tab1">여기는 tab1</p>
							</div>
							<div class="card-body tab-pane " id="tab2">
							<p class="card-text" id="tab3">여기는 tab2</p>
							</div>
							<%-- <div class="card-body tab-pane " id="tab3">
								<p class="card-text" id="tab3"><jsp:include page="/user/modifyView.jsp"/></p>
							</div> --%>
							<!-- 	<a href="#" class="btn btn-primary">수정하기</a> -->
							<!-- 이거 누르면 disabled readonly 사라지게하기. -->
						</div>
					</div>
				</td>
			</tr>
			 <tr>
				<td rowspan="3">
					<!-- About Me Box -->
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">About Me</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<strong><i class="fa fa-book margin-r-5"></i> Education</strong>

							<p class="text-muted">B.S. in Computer Science from the
								University of Tennessee at Knoxville</p>

							<hr>

							<strong><i class="fa fa-map-marker margin-r-5"></i>
								Location</strong>

							<p class="text-muted">Malibu, California</p>

							<hr>

							<strong><i class="fa fa-pencil margin-r-5"></i> Skills</strong>

							<p>
								<span class="label label-danger">UI Design</span> <span
									class="label label-success">Coding</span> <span
									class="label label-info">Javascript</span> <span
									class="label label-warning">PHP</span> <span
									class="label label-primary">Node.js</span>
							</p>

							<hr>

							<strong><i class="fa fa-file-text-o margin-r-5"></i>
								Notes</strong>

							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Etiam fermentum enim neque.</p>
						
								<a><jsp:include page="/user/pwdCheck.jsp"/>
							</a>
						</div>
						<!-- /.box-body -->
					</div> <!-- /.box -->
					</div>
				</td>
			</tr>
		</table>
		<!-- /.box-body -->

		<div class="row mb-2">
			<div class="col-md-6">
				<div class="card flex-md-row mb-4 box-shadow h-md-250">
					<div class="card-body d-flex flex-column align-items-start">
						<strong class="d-inline-block mb-2 text-primary">World</strong>
						<h3 class="mb-0">
							<a class="text-dark" href="#">Featured post</a>
						</h3>
						<div class="mb-1 text-muted">Nov 12</div>
						<p class="card-text mb-auto">This is a wider card with
							supporting text below as a natural lead-in to additional content.</p>
						<a href="#">Continue reading</a>
					</div>
					<img class="card-img-right flex-auto d-none d-md-block"
						data-src="holder.js/200x250?theme=thumb" alt="Card image cap">
				</div>
			</div>
			<div class="col-md-6">
				<div class="card flex-md-row mb-4 box-shadow h-md-250">
					<div class="card-body d-flex flex-column align-items-start">
						<strong class="d-inline-block mb-2 text-success">Design</strong>
						<h3 class="mb-0">
							<a class="text-dark" href="#">Post title</a>
						</h3>
						<div class="mb-1 text-muted">Nov 11</div>
						<p class="card-text mb-auto">This is a wider card with
							supporting text below as a natural lead-in to additional content.</p>
						<a href="#">Continue reading</a>
					</div>
					<img class="card-img-right flex-auto d-none d-md-block"
						data-src="holder.js/200x250?theme=thumb" alt="Card image cap">
				</div>
			</div>
		</div>
	</div>
	<main role="main" class="container">
		<div class="row">
			<div class="col-md-8 blog-main">
				<h3 class="pb-3 mb-4 font-italic border-bottom">From the
					Firehose</h3>

			</div>
		</div>
		<!-- /.row -->
	</main>
</body>
<script>
<!-- /.container -->
	$(document).ready(function() {
			$.ajax({
				url : "/mypage/modProfile.do",
				type : "post",
				success : function(data) {
					console.log(data);
					$('#profile1').text(data.profile);
					$('#profile2').text(data.profile);
					$('#name').text(data.name);
				},
				error : function(data, textStatus) {
					console.log("실패");
				},
				complete : function(data, textStatus) {

				}

		});
		
		$("#checkIt").click(function() {
			var pwd = $("#password3").val(); 
			console.log("이벤트!!" +pwd);
			$.ajax({
				url : "/mypage/pwdCheck.do",
				type : "post",
				data: {
					pwd:pwd
				},
				success : function(data) {
				console.log(data);
				if($('#password3').val() == ""){
					$('#passwordCheck3').text('비밀번호를 입력해주세요.');
					$('#passwordCheck3').css('color', 'red');
					$("#myInfo").attr("disabled", true);		
					} else if (data == "0"){
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
		$("#close").click(function() {
			console.log("close");
			$("#password3").val(""); 
	});
	});

</script>
</body>
</html>