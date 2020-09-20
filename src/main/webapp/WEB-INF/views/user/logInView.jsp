<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
 
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>LOGIN</title>
</head>
<body>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-12 text-center">
				<div class="col-sm-3"></div>

				<div class="col-sm-6">
					<h2>회원가입</h2>
					<form action="/user/logIn" method="post">
						<table class="table table-boardered">

							<tr>
								<th>아이디</th>
								<td><input type="text" class="form-control" id="id"
									name="id" required><br></td>

							</tr>
							<tr>

								<th>비밀번호</th>
								<td><input type="password" class="form-control"
									id="password" name="password" placeholder="대소문자와 숫자 4~12자리"
									required><br></td>

							</tr>
							<tr>
								<td colspan="2"><input type="submit"
									class="btn btn-primary" value="로그인"></td>
							</tr>
						</table>
					</form>
				</div>

			</div>
		</div>
	</div>
</body>
</body>
</html>
