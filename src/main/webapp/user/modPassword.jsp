<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-block"
	data-toggle="modal" data-target="#exampleModalCenter2">
	<b>비밀번호 수정하기</b>
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter2" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">비밀번호 수정하기</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="container">
					<div class="row">
						<div class="col-sm-12 text-center" align="center"></div>
						<form action="/mypage/updateUser.do" method="post">
							<table>
							<tr>
								<th>비밀번호</th>
								<td><input type="password" class="form-control"
									id="password" name="password" placeholder="대소문자와 숫자 4~12자리"
									 ><br>
									<div class="check_font" id="passwordCheck"></div></td>
							</tr>
							<tr>
								<th>비밀번호 확인</th>
								<td><input type="password" class="form-control"
									id="password2" name="password2" placeholder="비밀번호 확인"><br>
									<input type="button" value="일치 여부 확인"><br>
									<div class="check_font" id="password2Check"></div></td>
							</tr>
							
						
						</table>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">X닫기</button>
				<button  type="submit" class="btn btn-primary" id="updatePwd" disabled>변경하기</button>
				</form>
			</div>
		</div>
	</div>
</div>
<script>
	// 비밀번호 정규식
	var pwdJ = /^[A-Za-z0-9]{4,12}$/;
	//비밀번호
	$('#password').blur(function() {
		console.log("이벤트 먹었니");
		if (pwdJ.test($(this).val())) {
			console.log(pwdJ.test($(this).val()));
			$("#passwordCheck").text('');
		} else {
			$('#passwordCheck').text('대소문자와 숫자 4~12자리로 입력해주세요.');
			$('#passwordCheck').css('color', 'gray');
			$("#updatePwd").attr("disabled", true);
		}
	});
	//비밀번호 확인
	$('#password2').blur(function() {
		console.log("이벤트 먹었니");
		var password = $("#password").val()
		if (pwdJ.test($(this).val()) && $(this).val() == password) {
			console.log("비밀번호 같을 때 ");
			console.log($(this).val())
			$('#password2Check').css('color', 'green');
			$("#password2Check").text('변경 가능합니다. :)');
			$("#updatePwd").attr("disabled", false);
		} else {
			console.log(password)
			console.log($(this).val())
			console.log("비밀번호 다를 때 ");
			$('#password2Check').text('비밀번호를 다시 확인해주세요.');
			$('#password2Check').css('color', 'red');
			$("#updatePwd").attr("disabled", true);
		}
	}); 
</script>
</html>