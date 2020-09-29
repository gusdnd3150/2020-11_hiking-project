<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Button trigger modal -->
	<button type="button" class="btn btn-primary btn-block" id="editInfo"
	data-toggle="modal" data-target="#exampleModalCenter3">
	<b>나의 정보 수정하기</b>
</button>
	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter3" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">Modal
						title</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<table>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" class="form-control"
								id="password3" name="password3" placeholder="비밀번호를 입력하세요."
								required><br>
								<div class="check_font" id="passwordCheck3"></div>
							<td>
							<td><button id="checkIt">확인</button><td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" id="close">X닫기</button>
					<a href="/mypage/modifyView.do"><button type="button" class="btn btn-primary"  
				 disabled id="myInfo">정보 보기</button></a>
				</div>
			</div>
		</div>
	</div>
</body>

</html>