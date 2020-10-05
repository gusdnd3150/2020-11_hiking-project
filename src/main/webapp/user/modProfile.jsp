<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
textarea {
	width: 300px;
	height: 100px;
}
</style>
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-block" id="editProf"
	data-toggle="modal" data-target="#exampleModalCenter">
	<b>프로필 수정하기</b>
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">나의 프로필 수정하기</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="container">
					<div class="row">
						<div class="col-sm-12 text-center" align="center"></div>
						<form action="/mypage/updateUserInfo.do" enctype="multipart/form-data"
							method="post">
							<table class="table">
							<%-- <input type="hidden" value="${userVO.userNum}"> --%>
								<tr>
									<th>프로필 사진</th>
									<td colspan="4"><input type="file" name="content" /></td>
								</tr>
								<tr>
									<th>나의 소개글</th>
									<td colspan="4">
									<textarea id="profile2" name="profile" 
									placeholder="당신은 어떤 사람입니까?"></textarea><br>
									</td>
								</tr>
							</table>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">X
					닫기</button>
				<button type="submit" class="btn btn-primary">변경하기</button>
				</form>
			</div>
		</div>
	</div>
</div>

</html>