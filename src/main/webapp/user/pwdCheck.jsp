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
							<td><button id="pwdCheckDo">확인하기</button></td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" id="close">X닫기</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal"
						href="#tab3" data-toggle="tab" disabled id="editInfo">정보
						보기</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
$(document).ready(function() {
$("#pwdCheckDo").click(function() {
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
			$("#editInfo").attr("disabled", true);		
			} else if (data == 0){
					// 0 : 비밀번호 통과
					$("#passwordCheck3").text("'정보 보기'를 클릭하세요.");
					$('#passwordCheck3').css('color', 'green');
					$("#editInfo").attr("disabled", false);
				} else if (data == 1) {
					// 1 : 	비밀번호 틀림
					$("#passwordCheck3").text("비밀번호가 맞지 않습니다.:p");
					$("#passwordCheck3").css("color", "red");
					$("#editInfo").attr("disabled", true);
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
});
</script>
</html>