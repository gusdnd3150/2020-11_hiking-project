<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="goods"  value="${goodsMap.goods}"  />

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
				if ("ok" == (data)) {
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

h2 {
	font-size: 1.8rem;
}

.b_table {
	table-layout: fixed;
	width: 100%;
}

.b_table thead th {
	padding: 10px;
	font-size: 15px;
	border: 1px solid #ddd;
	background: #e9ecef;
}

.b_table tbody td {
	padding: 10px;
	font-size: 15px;
	border: 1px solid #ddd;
	text-align: center;
}

.form-control:disabled, .form-control[readonly] {
	background: #fff;
	border: none;
	text-align: center;
	padding: 0;
}

.basic_btn {
	display: inline-block;
	max-width: 110px;
	width: 100%;
	line-height: 35px;
	font-size: 15px;
	border: 1px solid #007bff;
	border-radius: 10px;
}

.container {
	padding-top: 30px;
}
</style>
</head>
<body>

	<script src="/resources/js/jquery.js"></script>
	<script src="/resources/js/bootstrap.bundle.js"></script>





	<div class="container">
		<div class="row">
			<div class="text-center">
				<div>
					<h2>상품 상세 페이지</h2>
				
					<table class="b_table">
						<colgroup>
							<col style="width: 5%">
							<col style="width: 10%">
							<col style="width: 10%">
							<col style="width: 15%">
							<col style="width: 10%">
							<col style="width: 15%">
							<col style="width: 15%">
						
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>분류</th>
								<th>제품명</th>
								<th>가격</th>
								<th>수량</th>
								<th>타입</th>
								<th>등록일</th>
								<th>수정일</th>
							</tr>
						</thead>
							<c:forEach var="viewDetaList" items="${viewDetaList}">
							<tbody>
								<tr>
									<td><input type="text" class="form-control"
										placeholder="${viewDetaList.prodNum}" disabled></td>

									<td><input type="text" class="form-control"
										placeholder="${viewDetaList.pCategoryNumStirng}" disabled></td>

									<td><input type="text" class="form-control"
										placeholder="${viewDetaList.name}" disabled></td>

									<td><input type="text" class="form-control"
										placeholder="${viewDetaList.priceString}" disabled></td>

									<td><input type="text" class="form-control"
										placeholder="${viewDetaList.quantity}" disabled></td>
										
										<td><input type="text" class="form-control"
										placeholder="${viewDetaList.typeString}" disabled></td>

									<td><input type="text" class="form-control"
										placeholder="${viewDetaList.createdAtString}" disabled></td>

									<td><input type="text" class="form-control"
										placeholder="${viewDetaList.updatedAtString}" disabled></td>

								</tr>

							</tbody>
					</table>

				</div>

			</div>
		</div>
	</div>
	<article>
		<div class="container" role="main">
			<div class="mb-3">
				<label for="content">내용</label>
				<textarea class="form-control" rows="5" name="content" id="content"
					value="${viewDetaList.content}"
					placeholder="${viewDetaList.content}"></textarea>
			</div>
			</c:forEach>


			
				<div class="mb-3">
					<label for="content">이미지</label> 
					<c:forEach var="viewList" items="${viewPhotoList}">
					<img src="http://localhost:8090/resources/img/${viewList.pcontent}" alt="..." style="width: 250px; height: 250px; display: block;"> 
				</c:forEach>
				<tr>
						
				</div>
			



		</div>
	</article>
	<center>
		<button type="button" class="basic_btn btn-primary" id="btnSave"
			style=>확인</button>
	</center>




</body>
</html>