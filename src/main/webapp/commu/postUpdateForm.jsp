<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>


<!-- Button trigger modal -->
<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#postCreateForm">
  Launch demo modal
</button>
 -->
<!-- <button type="button" class="btn btn-outline-success"
	data-toggle="modal" data-target="#postUpdateForm"
	style="padding: 10px 10px; margin: 10px 10px 10px 0px; width: 100%; height: 100px;"> -->
	<button type="button" id="updateBtn" data-toggle="modal" data-target="#postUpdateForm" class="btn btn-link" style="margin-top: 30px; color: gray;">수정</button>

<!-- Modal -->
<div class="modal fade" id="postUpdateForm" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">산모임 피드 쓰기</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
					<form action="/commu/updatePost.do" method="post" enctype="multipart/form-data">
		
				<div class="row justify-content-md-center">
					<div class="col_c">
						<div class="input-group">
							<textarea class="form-control" name="feedContent" id="feedContent"></textarea>
							 <script type="text/javascript">
								CKEDITOR.replace('feedContent', {
									filebrowserUploadUrl :'/commu/imageUpload.do',
									height : 250,
									width : 750
								});
							</script> 
						</div>
					</div>
				</div>
			</div>

			<div class="modal-footer">
				<button type="submit" class="btn btn-success">게시글 수정</button>
			</div>
			<input type="hidden" name="groupNum" value="">
			</form>
		</div>
	</div>
</div>

