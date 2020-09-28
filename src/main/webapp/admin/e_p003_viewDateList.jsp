<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
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

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<title>글 상세보기</title>

<script>
	$(document).on('click', '#btnSave', function(e) {
		e.preventDefault();
		$("#form").submit();
	});

	$(document).on('click', '#btnEmail', function(e) {
		var _userEmail = $(this).val();
		alert(_userEmail);
		e.preventDefault();
		location.href = "sendEmail.do?userEmail=" + _userEmail;
	});
</script>
<style>
body {
	padding-top: 70px;
	padding-bottom: 30px;
}
</style>
</head>
<body>
	<c:forEach var="viewList" items="${viewDetaList}">
		<div class="container">
			<div class="row">
				<div class="col-sm-12 text-center">
					<div class="col-sm-3"></div>

					<div class="col-sm-6">
						<h2>작성자 글 정보</h2>


						<table class="table table-boardered">
							<tr>
								<th>작성자번호</th>
								<td><input type="text" class="form-control"
									placeholder="${viewList.userNum}" disabled></td>
							</tr>
							<tr>
								<th>작성자ID</th>
								<td><input type="password" class="form-control"
									placeholder="${viewList.id}" disabled></td>
							</tr>
							<tr>
								<th>작성자이름</th>
								<td><input type="text" class="form-control"
									placeholder="${viewList.name}" disabled></td>
							</tr>
							<tr>
								<th>작성자이메일</th>
								<td><input type="text" class="form-control"
									placeholder="${viewList.email}" disabled></td>
							</tr>
							<tr>
								<th>글번호</th>
								<td><input type="text" class="form-control"
									placeholder="${viewList.csPostNum}" disabled></td>
							</tr>
							<tr>
								<th>게시판번호</th>
								<td><input type="text" class="form-control"
									placeholder="${viewList.csBoardNum}" disabled></td>
							</tr>
							<tr>
								<th>글구분</th>
								<td><input type="text" class="form-control"
									placeholder="${viewList.csPostTypeString}" disabled></td>
							</tr>
							<tr>
								<th>등록일자</th>
								<td><input type="text" class="form-control"
									placeholder="${viewList.createdAtString}" disabled></td>
							</tr>
							<tr>
								<th>수정일자</th>
								<td><input type="text" class="form-control"
									placeholder="${viewList.updatedAtString}" disabled></td>
							</tr>

						</table>

					</div>

				</div>
			</div>
		</div>

		<article>
			<div class="container" role="main">
				<h2>게시글 수정</h2>
				<form name="form" id="form" role="form" method="post"
					action="upDateCsboard.do">
					<div class="mb-3">
						<label for="title">제목</label> <input type="text"
							class="form-control" name="title" id="title"
							value="${viewList.title}">
					</div>

					<div class="mb-3">
						<label for="content">내용</label>
						<textarea class="form-control" rows="5" name="content"
							id="content" value="${viewList.content}"></textarea>
					</div>
					<label for="content">문의상태</label> 
					<input type="radio" name="status" value="1" checked="checked">처리대기 &nbsp;&nbsp;
					<input type="radio" name="status" value="2">완료 &nbsp;&nbsp; 
					
					<input type="hidden" name="csPostNum" value="${viewList.csPostNum}">
				</form>
				<div>
					<button type="button" class="btn btn-sm btn-primary" id="btnSave">수정완료</button>
					<button type="button" class="btn btn-sm btn-primary" id="btnEmail" value="${viewList.email}">메일답변</button>
				</div>
			</div>
		</article>
	</c:forEach>
</body>
</html>