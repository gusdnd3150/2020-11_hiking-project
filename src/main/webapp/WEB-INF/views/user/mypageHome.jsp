<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>MypageHome</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet"
	href="/resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="/resources/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="/resources/bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/resources/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="/resources/dist/css/skins/_all-skins.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<style>
.content-wrapper {
	padding: 50px 20px;
	margin: 0 auto;
}
</style>
<body>
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Main content -->
		<section class="content">
			<div class="row">
				<div class="col-md-3">
				<h1>MyPage</h1>
					<!-- Profile Image -->
					<div class="box box-primary">
						<div class="box-body box-profile">
							<img class="profile-user-img img-responsive img-circle"
								src="../../dist/img/user4-128x128.jpg"
								alt="User profile picture">

							<h3 class="profile-username text-center">Nina Mcintire</h3>

							<p class="text-muted text-center">Software Engineer</p>

							<ul class="list-group list-group-unbordered">
								<li class="list-group-item"><b>Followers</b> <a
									class="pull-right">1,322</a></li>
								<li class="list-group-item"><b>Following</b> <a
									class="pull-right">543</a></li>
								<li class="list-group-item"><b>Friends</b> <a
									class="pull-right">13,287</a></li>
							</ul>
							<a href="#" class="btn btn-primary btn-block"><b>Follow</b></a>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->

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
							<a href="${contextPath}/mypage/modifyView" class="btn btn-primary btn-block"><b>나의 정보
									수정하기</b></a>
						</div>
						<!-- /.box-body -->
					</div>
					<!-- /.box -->
				</div>
				<!-- /.col -->
				<div class="col-md-9">
					<div class="nav-tabs-custom">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#activity" data-toggle="tab">Activity</a></li>
							<li><a href="#timeline" data-toggle="tab">Timeline</a></li>
							<li><a href="#settings" data-toggle="tab">Settings</a></li>
						</ul>
						<div class="tab-content">
							<div class="active tab-pane" id="activity">
								<!-- Post -->
							

<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->

<script type="text/javascript">
		function openDaumZipAddress() {
			new daum.Postcode({
				oncomplete:function(data) {
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

     <div class="container">
    <div class="row">
    <div class="col-sm-12 text-center" >
    <div class="col-sm-3"></div>
     
    <div class="col-sm-6">
    <h2>회원가입</h2>
    <form action="/user/insertUser" method="post">
        <table class="table table-boardered">
            <tr>
                <th>아이디</th>
                <td><input type="text" class="form-control" id="id" name="id" placeholder="소문자와 숫자 4~12자리" required><br>
                <div class ="check_font" id="idCheck"></div></td>  
           </tr>
        
            <tr>
                <th>비밀번호</th>
                <td><input type="password" class="form-control" id="password" name="password" placeholder="대소문자와 숫자 4~12자리" required><br>
                <div class ="check_font" id="passwordCheck"></div></td>      
                
            </tr>
                 <tr>
                <th>비밀번호 확인</th>
                <td><input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호 확인" required><br>
                 <div class ="check_font" id="password2Check"></div></td>      
            </tr>
            <tr>
                <th>이름</th>
                <td><input type="text" class="form-control" id="name" name="name" required><br>  
                 <div class ="check_font" id="nameCheck"></div></td>    
            </tr>

            <tr>
                <th>이메일</th>
                <td><input type="email" class="form-control"id="email" name="email" required><br>
                 <div class ="check_font" id="emailCheck"></div></td>       
            </tr>
            <tr>
                <th>주소</th>
                <td> 
				<input id="zonecode" type="text" value="" style="width:50px;" readonly/> &nbsp;
				<input type="button" onClick="openDaumZipAddress();" value = "주소 찾기" /> &nbsp;
                <input type="text" id="address" value="" style="width:240px;" readonly/><br>
                <input type="text" class="form-control" id="userAddress" name="userAddress" value="상세 주소를 입력해주세요."  required><br>
                <div class ="check_font" id="addressCheck"></div></td>      
            </tr>
            <tr>
                <th>전화번호</th>
                <td><input type="text" class="form-control" id="phone" name="phone" placeholder="'-'없이 입력해 주세요." required><br>
                   <div class ="check_font" id="phoneCheck"></div></td>       
            </tr>
         
            <tr>
                <th>성별</th>
                <td>
                <input type="radio"  name="sex" value="10">남성 &nbsp;&nbsp;
                <input type="radio"  name="sex" value="20">여성 &nbsp;&nbsp;
                </td>     
            </tr>
            <tr>
                <td colspan="2">
                <input type="submit" class="btn btn-primary" value="수정" id="updateUser" >
               
                
                
                </td>
            </tr>
        </table>
    </form>
    </div>
     
    </div>
    </div>
</div>
 				<form method="post">
				<input type="text" name="id" value="${login.id}">
				<input type="text" name="password" value="${login.password}">
				<input type="submit" class="btn btn-primary" value="탈퇴" id="deleteUser" >
				</form>

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
	
	$(document).ready(function(){ 
		//아이디 유효성 검사
		$("#id").blur(function() {
		console.log("이벤트 먹었니");					
		var userId = $("#id").val();
		$.ajax({
			url : "/user/idCheck?id="+id ,
			type : "get",
			success : function(data, textStatus) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);		
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#idCheck").text("사용중인 아이디입니다 :p");
						$("#idCheck").css("color", "red");
						$("#insertUser").attr("disabled", true);
					} else {
						if(idJ.test(userId)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#idCheck").text("");
							$("#insertUser").attr("disabled", false);
						} else if(userId == ""){
							$('#idCheck').text('아이디를 입력해주세요 :)');
							$('#idCheck').css('color', 'red');
							$("#insertUser").attr("disabled", true);		
						} else {
							$('#idCheck').text("아이디는 소문자와 숫자 4~12자리만 가능합니다:)");
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
			} else {
				$('#nameCheck').text('이름을 확인해주세요 :)');
				$('#nameCheck').css('color', 'red');
			}
		});
		//비밀번호
		$('#password').blur(function(){
			console.log("이벤트 먹었니");	
			if(pwdJ.test($(this).val())){
				console.log(pwdJ.test($(this).val()));
				$("#passwordCheck").text('');
			} else{
				$('#passwordCheck').text('비밀번호를 확인해주세요 :)');
				$('#passwordCheck').css('color', 'red');
			}
		});
		//비밀번호 확인
		$('#password2').blur(function(){
			console.log("이벤트 먹었니");
			var password = $("password").val()
			if($(this).val() == userPwd){
				console.log("비밀번호 같을 때 ");
				console.log($(this).val())
				$("#password2Check").text('');
			} else{
				console.log(userPwd)
				console.log($(this).val())
				console.log("비밀번호 다를 때 ");	
				$('#password2Check').text('비밀번호가 일치하지 않습니다 :p');
				$('#password2Check').css('color', 'red');
			}
		});
		// 이메일
		$('#email').blur(function(){
			console.log("이벤트 먹었니");	
			if(mailJ.test($(this).val())){
				console.log(mailJ.test($(this).val()));
				$("#emailCheck").text('');
			} else {
				$('#emailCheck').text('이메일을 확인해주세요 :)');
				$('#emailCheck').css('color', 'red');
			}
		});
		
		//주소	
		$('#zonecode').blur(function(){
			console.log("이벤트 먹었니");	
			if($(this).val() != ""){
				$("#addressCheck").text('');
			} else{
				$('#addressCheck').text('주소를 확인해주세요 :)');
				$('#addressCheck').css('color', 'red');
			}
		});
	// 휴대전화
	$('#phone').blur(function(){
		if(phoneJ.test($(this).val())){
			console.log(phoneJ.test($(this).val()));
			$("#phoneCheck").text('');
		} else {
			$('#phoneCheck').text('휴대폰번호를 확인해주세요 :)');
			$('#phoneCheck').css('color', 'red');
		}
	});
});
	</script>

							<!-- /.tab-pane -->
							<div class="tab-pane" id="timeline">
								<!-- The timeline -->
								<ul class="timeline timeline-inverse">
									<!-- timeline time label -->
									<li class="time-label"><span class="bg-red"> 10
											Feb. 2014 </span></li>
									<!-- /.timeline-label -->
									<!-- timeline item -->
									<li><i class="fa fa-envelope bg-blue"></i>

										<div class="timeline-item">
											<span class="time"><i class="fa fa-clock-o"></i> 12:05</span>

											<h3 class="timeline-header">
												<a href="#">Support Team</a> sent you an email
											</h3>

											<div class="timeline-body">Etsy doostang zoodles disqus
												groupon greplin oooj voxy zoodles, weebly ning heekya
												handango imeem plugg dopplr jibjab, movity jajah plickers
												sifteo edmodo ifttt zimbra. Babblely odeo kaboodle quora
												plaxo ideeli hulu weebly balihoo...</div>
											<div class="timeline-footer">
												<a class="btn btn-primary btn-xs">Read more</a> <a
													class="btn btn-danger btn-xs">Delete</a>
											</div>
										</div></li>
									<!-- END timeline item -->
									<!-- timeline item -->
									<li><i class="fa fa-user bg-aqua"></i>

										<div class="timeline-item">
											<span class="time"><i class="fa fa-clock-o"></i> 5
												mins ago</span>

											<h3 class="timeline-header no-border">
												<a href="#">Sarah Young</a> accepted your friend request
											</h3>
										</div></li>
									<!-- END timeline item -->
									<!-- timeline item -->
									<li><i class="fa fa-comments bg-yellow"></i>

										<div class="timeline-item">
											<span class="time"><i class="fa fa-clock-o"></i> 27
												mins ago</span>

											<h3 class="timeline-header">
												<a href="#">Jay White</a> commented on your post
											</h3>

											<div class="timeline-body">Take me to your leader!
												Switzerland is small and neutral! We are more like Germany,
												ambitious and misunderstood!</div>
											<div class="timeline-footer">
												<a class="btn btn-warning btn-flat btn-xs">View comment</a>
											</div>
										</div></li>
									<!-- END timeline item -->
									<!-- timeline time label -->
									<li class="time-label"><span class="bg-green"> 3
											Jan. 2014 </span></li>
									<!-- /.timeline-label -->
									<!-- timeline item -->
									<li><i class="fa fa-camera bg-purple"></i>

										<div class="timeline-item">
											<span class="time"><i class="fa fa-clock-o"></i> 2
												days ago</span>

											<h3 class="timeline-header">
												<a href="#">Mina Lee</a> uploaded new photos
											</h3>

											<div class="timeline-body">
												<img src="http://placehold.it/150x100" alt="..."
													class="margin"> <img
													src="http://placehold.it/150x100" alt="..." class="margin">
												<img src="http://placehold.it/150x100" alt="..."
													class="margin"> <img
													src="http://placehold.it/150x100" alt="..." class="margin">
											</div>
										</div></li>
									<!-- END timeline item -->
									<li><i class="fa fa-clock-o bg-gray"></i></li>
								</ul>
							</div>
							<!-- /.tab-pane -->

							<div class="tab-pane" id="settings">
								<form class="form-horizontal">
									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">Name</label>

										<div class="col-sm-10">
											<input type="email" class="form-control" id="inputName"
												placeholder="Name">
										</div>
									</div>
									<div class="form-group">
										<label for="inputEmail" class="col-sm-2 control-label">Email</label>

										<div class="col-sm-10">
											<input type="email" class="form-control" id="inputEmail"
												placeholder="Email">
										</div>
									</div>
									<div class="form-group">
										<label for="inputName" class="col-sm-2 control-label">Name</label>

										<div class="col-sm-10">
											<input type="text" class="form-control" id="inputName"
												placeholder="Name">
										</div>
									</div>
									<div class="form-group">
										<label for="inputExperience" class="col-sm-2 control-label">Experience</label>

										<div class="col-sm-10">
											<textarea class="form-control" id="inputExperience"
												placeholder="Experience"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label for="inputSkills" class="col-sm-2 control-label">Skills</label>

										<div class="col-sm-10">
											<input type="text" class="form-control" id="inputSkills"
												placeholder="Skills">
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<div class="checkbox">
												<label> <input type="checkbox"> I agree to
													the <a href="#">terms and conditions</a>
												</label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<button type="submit" class="btn btn-danger">Submit</button>
										</div>
									</div>
								</form>
							</div>
							<!-- /.tab-pane -->
						</div>
						<!-- /.tab-content -->
					</div>
					<!-- /.nav-tabs-custom -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->

		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->

	<!-- /.control-sidebar -->
	<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
	<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<!-- jQuery 3 -->
	<script src="../../bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap 3.3.7 -->
	<script src="../../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script src="../../bower_components/fastclick/lib/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="../../dist/js/adminlte.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="../../dist/js/demo.js"></script>
</body>
</html>
