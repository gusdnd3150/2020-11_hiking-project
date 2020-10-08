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

<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

	 <link href="/resources/css/bootstrap.min.css" rel="stylesheet">

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
	
	//문의글 답변 클릭시 유저 이메일 전달
	$(document).on('click', '#_email', function(e) {
		var _userEmail = $(this).val();
		e.preventDefault();
		$('#recipient-name').val(_userEmail);
	});
	
	$(document).on('click', '#sendMail', function(e) {
		var _content = $('#message-text').val();
		var _userMail = $('#recipient-name').val();
		var _title = $('#recipient-title').val();
		e.preventDefault();
		
		$.ajax({
			type : 'post',
			url : 'sendMail.do',
			data : {
				content : _content,
				userEmail : _userMail,
				title : _title
			},
			success : function(data) {
				if ("ok"== (data)) {
					alert("메일 발송 완료");
					window.location.reload(true);
				} else {
					alert("다시확인해주세요");
				}
				;
			}
		})
	
	});
	
	

</script>
<style>
body {
	padding-top: 70px;
	padding-bottom: 30px;
}
h2{font-size:1.8rem;}
.b_table{table-layout:fixed; width:100%;}
.b_table thead th{padding: 10px; font-size: 15px;border: 1px solid #ddd;background:#e9ecef;}
.b_table tbody td{padding: 10px; font-size: 15px;border: 1px solid #ddd;text-align:center;}
.form-control:disabled, .form-control[readonly]{background:#fff;border:none;text-align:center;padding:0;}
.basic_btn{display:inline-block;max-width:110px;width:100%;line-height:35px;font-size:15px;border:1px solid #007bff;border-radius:10px;}
.container{padding-top:30px;}
</style>
</head>
<body>

<script src="/resources/js/jquery.js"></script>
<script src="/resources/js/bootstrap.bundle.js"></script>

<c:if test="${viewType eq '공지사항'}">

	<c:forEach var="viewList" items="${viewDetaList}">
		<div class="container">
			<div class="row">
				<div class="text-center">
					<div>
						<h2>작성자 글 정보</h2>
						<table class="b_table">
							<colgroup>
								<col style="width:5%">
								<col style="width:10%">
								<col style="width:10%">
								<col style="width:15%">
								<col style="width:5%">
								<col style="width:10%">
								<col style="width:10%">
								<col style="width:10%">
								<col style="width:10%">
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>ID</th>
									<th>이름</th>
									<th>이메일</th>
									<th>글번호</th>
									<th>게시판번호</th>
									<th>구분</th>
									<th>등록일자</th>
									<th>수정일자</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" class="form-control" placeholder="${viewList.userNum}" disabled></td>
						
									<td><input type="text" class="form-control" placeholder="${viewList.id}" disabled></td>
							
									<td><input type="text" class="form-control" placeholder="${viewList.name}" disabled></td>
						
									<td><input type="text" class="form-control" placeholder="${viewList.email}" disabled></td>
									
									<td><input type="text" class="form-control" placeholder="${viewList.csPostNum}" disabled></td>
								
									<td><input type="text" class="form-control" placeholder="${viewList.csBoardNum}" disabled></td>
									
									<td><input type="text" class="form-control" placeholder="${viewList.csPostTypeString}" disabled></td>
									
									<td><input type="text" class="form-control" placeholder="${viewList.createdAtString}" disabled></td>
							
									<td><input type="text" class="form-control" placeholder="${viewList.updatedAtString}" disabled></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<article>
			<div class="container" role="main">
				<h2>글 상세보기</h2>
				<form name="form" id="form" role="form" method="post" action="upDateCsboard.do">
					<div class="mb-3">
						<label for="title">제목</label> 
						<input type="text" class="form-control" name="title" id="title" value="${viewList.title}">
					</div>
					<div class="mb-3">
						<label for="content">내용</label>
						<textarea class="form-control" rows="5" name="content" id="content" value="${viewList.content}"></textarea>
					</div>
					<div class="mb-3">
					
						<input type="hidden" name="csPostNum" value="${viewList.csPostNum}">
					</div>
				</form>
					</div>
						</article>
						<center>
					<button type="button" class="basic_btn btn-primary" id="btnSave" style=>수정</button>
					</center>
					</c:forEach>
					</c:if>
					
					
<c:if test="${viewType eq '문의사항'}">

	<c:forEach var="viewList" items="${viewDetaList}">
		<div class="container">
			<div class="row">
				<div class="text-center">
					<div>
						<h2>작성자 글 정보</h2>
						<table class="b_table">
							<colgroup>
								<col style="width:5%">
								<col style="width:10%">
								<col style="width:10%">
								<col style="width:15%">
								<col style="width:5%">
								<col style="width:10%">
								<col style="width:10%">
								<col style="width:10%">
								<col style="width:10%">
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>ID</th>
									<th>이름</th>
									<th>이메일</th>
									<th>글번호</th>
									<th>게시판번호</th>
									<th>구분</th>
									<th>등록일자</th>
									<th>수정일자</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" class="form-control" placeholder="${viewList.userNum}" disabled></td>
						
									<td><input type="text" class="form-control" placeholder="${viewList.id}" disabled></td>
							
									<td><input type="text" class="form-control" placeholder="${viewList.name}" disabled></td>
						
									<td><input type="text" class="form-control" placeholder="${viewList.email}" disabled></td>
									
									<td><input type="text" class="form-control" placeholder="${viewList.csPostNum}" disabled></td>
								
									<td><input type="text" class="form-control" placeholder="${viewList.csBoardNum}" disabled></td>
									
									<td><input type="text" class="form-control" placeholder="${viewList.csPostTypeString}" disabled></td>
									
									<td><input type="text" class="form-control" placeholder="${viewList.createdAtString}" disabled></td>
							
									<td><input type="text" class="form-control" placeholder="${viewList.updatedAtString}" disabled></td>
								</tr>
							</tbody>
						</table>
					
					</div>

				</div>
			</div>
		</div>
		<article>
			<div class="container" role="main">
				<h2>글 상세보기</h2>
				<form name="form" id="form" role="form" method="post" action="upDateCsboard.do">
					<div class="mb-3">
						<label for="title">제목</label> 
						<input type="text" class="form-control" name="title" id="title" value="${viewList.title}">
					</div>
					<div class="mb-3">
						<label for="content">내용</label>
						<textarea class="form-control" rows="5" name="content" id="content" value="${viewList.content}"></textarea>
					</div>
					<div class="mb-3">
						<label for="content">문의상태</label> 
						<input type="radio" name="status" value="1" checked="checked">처리대기 &nbsp;&nbsp;
						<input type="radio" name="status" value="2">완료 &nbsp;&nbsp; 
						<input type="hidden" name="csPostNum" value="${viewList.csPostNum}">
					</div>
				</form>
					</div>
						</article>
					<center>
					<button type="button" class="basic_btn btn-primary" id="btnSave" style=>확인</button>
					<button type="button" id="_email"class="basic_btn btn-primary" data-toggle="modal" data-target="#exampleModal" value="${viewList.email}" >문의글 답변</button>
					</center>
					</c:forEach>
					<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
							 <%@ include file="../admin/e_p003_mailModal.jsp"%>		
					  </div>
					</div>
					</c:if>
					
					
<c:if test="${viewType eq '신고글'}">

	<c:forEach var="viewList" items="${viewDetaList}">
		<div class="container">
			<div class="row">
				<div class="text-center">
					<div>
						<h2>작성자 글 정보</h2>
						<table class="b_table">
							<colgroup>
								<col style="width:5%">
								<col style="width:10%">
								<col style="width:10%">
								<col style="width:15%">
								<col style="width:5%">
								<col style="width:10%">
								<col style="width:10%">
								<col style="width:10%">
								<col style="width:10%">
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>ID</th>
									<th>이름</th>
									<th>이메일</th>
									<th>글번호</th>
									<th>게시판번호</th>
									<th>구분</th>
									<th>등록일자</th>
									<th>수정일자</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><input type="text" class="form-control" placeholder="${viewList.userNum}" disabled></td>
						
									<td><input type="text" class="form-control" placeholder="${viewList.id}" disabled></td>
							
									<td><input type="text" class="form-control" placeholder="${viewList.name}" disabled></td>
						
									<td><input type="text" class="form-control" placeholder="${viewList.email}" disabled></td>
									
									<td><input type="text" class="form-control" placeholder="${viewList.csPostNum}" disabled></td>
								
									<td><input type="text" class="form-control" placeholder="${viewList.csBoardNum}" disabled></td>
									
									<td><input type="text" class="form-control" placeholder="${viewList.csPostTypeString}" disabled></td>
									
									<td><input type="text" class="form-control" placeholder="${viewList.createdAtString}" disabled></td>
							
									<td><input type="text" class="form-control" placeholder="${viewList.updatedAtString}" disabled></td>
								</tr>
							</tbody>
						</table>
					
					</div>

				</div>
			</div>
		</div>
		<article>
			<div class="container" role="main">
				<h2>글 상세보기</h2>
				<form name="form" id="form" role="form" method="post" action="upDateCsboard.do">
					<div class="mb-3">
						<label for="title">제목</label> 
						<input type="text" class="form-control" name="title" id="title" value="${viewList.title}">
					</div>
					<div class="mb-3">
						<label for="content">내용</label>
						<textarea class="form-control" rows="5" name="content" id="content" value="${viewList.content}"></textarea>
					</div>
					<div class="mb-3">
						<label for="content">문의상태</label> 
						<input type="radio" name="status" value="1" checked="checked">처리대기 &nbsp;&nbsp;
						<input type="radio" name="status" value="2">완료 &nbsp;&nbsp; 
						<input type="hidden" name="csPostNum" value="${viewList.csPostNum}">
					</div>
				</form>
					</div>
						</article>
					<center>
					<button type="button" class="basic_btn btn-primary" id="btnSave" style=>확인</button>
					</center>
					</c:forEach>
					</c:if>
					

</body>
</html>