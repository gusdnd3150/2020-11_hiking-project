<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
.ck-editor__editable {
    min-height: 300px;
}
.ck.ck-editor{
	max-width: 100%;
	}
</style>
<button type="button" class="btn btn-outline-success" id="insertPostBtn" data-toggle="modal" data-target="#postCreateForm" style="padding: 10px 10px; margin: 10px 10px 10px 0px; width: 100%; height: 100px;">
	<div class="row">
		<svg width="3em" height="3em" viewBox="0 0 16 16"
			class="bi bi-pencil-square mr-3" fill="currentColor"
			xmlns="http://www.w3.org/2000/svg" style="margin: 0% 0% 0% 28%;">
  <path
				d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
  <path fill-rule="evenodd"
				d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
</svg>
		<h3 style="margin: 1% 0% 0% 0%;">&nbsp&nbsp&nbsp&nbsp산모임 피드 쓰기</h3>
	</div>
</button>

<!-- Modal -->
<div class="modal fade" id="postCreateForm" tabindex="-1"
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
				<form action="/commu/insertPost.do" method="post" >
			<div class="modal-body">
				 <div class="col-sm-5">
					<div class="input-group mb-2 row">
					<p style="margin-left:20%">&nbsp&nbsp공지게시글로 작성하기</p>
					<input style="margin: 5px 20px;" type="checkbox" id="importantPost" name="type" value="1">
					</div>
				</div> 
				<div class="row justify-content-md-center" id="feedContentDiv">
					<textarea class="form-control" name="feedContent" id="feedContent"></textarea>
				</div>
			</div>

			<div class="modal-footer">
				<input type="submit" class="btn btn-success" value="피드 작성">
			</div>
			<input type="hidden" name="groupNum" value="${m1.GROUPNUM}">
			</form>
		</div>
	</div>
</div>
