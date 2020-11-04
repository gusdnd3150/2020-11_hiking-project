<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!doctype html>

<style>
#ASpace {
	width: 320px;
}

#OContent {
	display: block;
	margin: auto;
	height: auto !important;
	max-height: 750px;
	max-width: 800px;
}
</style>

<div class="tab-pane fade" id="album" role="tabpanel"
	aria-labelledby="list-album-list">
	<div class="row pt-3">
		<h3>&nbsp&nbsp&nbsp오름 사진</h3>
		<div id="ASpace"></div>
		<button type="file" style="float: right;" class="btn btn-outline-success" data-toggle="modal" data-target="#uploadAlbum">사진 올리기</button>
	</div>

	<div class="row mt-4 text-center text-lg-left" id="albumList">
		<!-- 이 곳에 ajax로 사진 뿌림 -->
	</div>


	<!-- 사진 상세보기 모달 -->
	<div class="modal row" tabindex="-1" id="originalContent">
		<div class="row">
			<!-- <div class="col-sm-7" style="width: 40rem; height: 60rem;" > -->
			<img class="col-sm-7" id="OContent" src="">
			<!--  </div> -->
			<div class="card scroll" style="width: 30rem; height: 55rem; margin-left: 0px; margin-right: 8%;">
				<button type="button" class="close" id="ocClose" onclick="oCModalClose()" data-dismiss="modal" aria-label="Close" style="text-align: right; margin-right: 10px;">
					<span aria-hidden="true">&times;</span>
				</button>
				<div class="card-body">
					<div class="card-title row">
						<div class=" row text-left" style="width:400px; margin-left:10px;">
							<img class="rounded-circle mt-1" id="profilePic" style="margin-left: 10px" src='' width="50" height="50" alt="프로필사진"> &nbsp
							<h6 style="margin-top: 25px" id="nickName"></h6>
							&nbsp&nbsp&nbsp&nbsp
							<h6 style="margin-top: 25px;">
								<small id="createdAt"></small>
							</h6>
						</div>
						<!-- 	<div style="width:150px;"></div> -->
							<button type="button" id="AremoveBtn" class="btn btn-link" style="margin-top: 17px;">삭제</button>
							<button type="button" id="AreportBtn" class="btn btn-link" style="margin-top: 17px;">신고</button>
					</div>
					<hr />

					<div class="mt-3">
						<h6 class="mt-2 pb-1">댓글</h6>
						<div style="width: 28rem; height: 35rem; overflow:scroll;">
							<div id="commentBoard" name="commentBoard" class="row"></div>
						</div>
					</div>
					<hr />
					<div id="commentInput" class="row" style="text-align: center">
						<img src="/resources/img/${sessionIdImage}" class="rounded-circle mt-1" style="margin-left: 10px; width: 30px; height: 30px"> 
							<input id="commentContent"name="commentContent" class="form-control form-control-md col-lg-9 col-md-9 col-sm-10 col-10 ml-2 mr-2" type="text" placeholder="내용을 입력해주세요">
							<button id="commentSubmit" class="btn btn-success btn-sm" >입력</button>
					</div>

				</div>
			</div>
		</div>
	</div>



	<!-- 페이징 -->
	<div class="col-sm-6 mt-5">
		<div style="display: block; text-align: center;">
			<div id="paging"></div>
		</div>
	</div>



</div>

<!-- #uploadAlbum 모달 -->
<div class="modal fade" id="uploadAlbum" tabindex="-1"
	aria-labelledby="uploadAlbum" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">사진 업로드</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="multiUpload" method="post" enctype="multipart/form-data">
					<input type="file" id="pics" name="pics" multiple>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" id="closeUploadModal" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				<button type="button" id="uploadPics" class="btn btn-primary">저장</button>
			</div>
		</div>
	</div>
</div>






</html>