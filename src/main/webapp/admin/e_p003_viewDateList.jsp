<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
function end(){
	  opener.location.reload();
	    close();
};

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
img {
    width: 100px;
    height:100px;
    border-radius: 50px; /* 이미지 반크기만큼 반경을 잡기*/
}

a {
    text-align: center  !important;
}

</style>
</head>
<body>

<script src="/resources/js/jquery.js"></script>
<script src="/resources/js/bootstrap.bundle.js"></script>

<c:if test="${viewType eq '관리자게시글'}">

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
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>ID</th>
									<th>이름</th>
									<th>이메일</th>
									<th>글번호</th>
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
						 <textarea class="form-control"  name="content1" id="content1" >${viewList.content}</textarea>
					</div>
					<div class="mb-3">
						<input type="hidden" name="csPostNum" value="${viewList.csPostNum}">
						<input type="hidden" name="result" value="admin">
					</div>
					<center>
					<div class="mb-3">
						<label for="content">글 구분</label> 
						<input type="radio" name="csPostType" value="100" ${viewList.csPostTypeString == '공지사항' ?  'checked="checked"' : ''}>공지사항 &nbsp;&nbsp;
						<input type="radio" name="csPostType" value="400" ${viewList.csPostTypeString == '이벤트글' ?  'checked="checked"' : ''}>이벤트글 &nbsp;&nbsp; 
					</div>
					</center>
				</form>
					</div>
						</article>
						<center>
					<button type="button" class='btn btn-primary btn-xs' id="btnSave" onclick="upDateBoard()">수정</button>
					</center>
					</c:forEach>
					</c:if>
					
					
<c:if test="${viewType eq '문의사항'}">
 <div class="box box-primary">
            <div class="box-body box-profile">
           	<c:forEach var="viewList" items="${viewDetaList}">
           	<center>
               <img class="img-circle" src="/resources/img/${viewList.content2}" alt="User profile picture">
            </center>
                          <h3 class="profile-username text-center">${viewList.userNum}</h3>
            
                          <p class="text-muted text-center">${viewList.id}</p>
                          
                           <p class="text-muted text-center">${viewList.name}</p>
   
                          <ul class="list-group list-group-unbordered">
                          <li class="list-group-item">
                              <b>글번호</b> <a class="pull-right">${viewList.csPostNum}</a>
                            </li>
                            <li class="list-group-item">
                              <b>구분</b> <a class="pull-right"   style="text-align: center;">${viewList.csPostTypeString}</a>
                            </li>
                            <li class="list-group-item">
                              <b>등록일자</b> <a class="pull-right">${viewList.createdAtString}</a>
                            </li>
                                                        <li class="list-group-item">
                              <b>수정일자</b> <a class="pull-right">${viewList.updatedAtString}</a>
                            </li>
                          </ul>  
                       
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
						<textarea class="form-control" rows="5" name="content" id="content" value="${viewList.content}" placeholder="${viewList.content}" ></textarea>
					</div>
					<center>
					<div class="mb-3">
						<label for="content">문의상태</label> 
						<input type="radio" name="status" value="1" ${viewList.status == '1' ?  'checked="checked"' : ''}>처리대기 &nbsp;&nbsp;
						<input type="radio" name="status" value="2" ${viewList.status == '2' ?  'checked="checked"' : ''}>완료 &nbsp;&nbsp;
						<input type="hidden" name="csPostNum" value="${viewList.csPostNum}">
						<input type="hidden" name="result" value="user">
					</div>
					</center>
				</form>
					</div>
						</article>
					<center>
					<button type="button" class='btn btn-primary btn-xs' id="btnSave">확인</button>
					<button type="button" id="_email" class='btn btn-primary btn-xs'data-toggle="modal" data-target="#exampleModal" value="${viewList.email}" >문의글 답변</button>
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
							</colgroup>
							<thead>
								<tr>
									<th>번호</th>
									<th>ID</th>
									<th>이름</th>
									<th>이메일</th>
									<th>글번호</th>
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
						<textarea class="form-control" rows="5" name="content" id="content" value="${viewList.content}" placeholder="${viewList.content}"></textarea>
					</div>
					<center>
					<div class="mb-3">
						<label for="content">문의상태</label> 
						<input type="radio" name="status" value="1" ${viewList.status == '1' ?  'checked="checked"' : ''}>처리대기 &nbsp;&nbsp;
						<input type="radio" name="status" value="2" ${viewList.status == '2' ?  'checked="checked"' : ''}>완료 &nbsp;&nbsp; 
						<input type="hidden" name="csPostNum" value="${viewList.csPostNum}">
						<input type="hidden" name="result" value="user">
					</div>
				</form>
					</div>
						</article>
					<center>
					<button type="button" class='btn btn-primary btn-xs' id="btnSave" onclick="upDateBoard()">확인</button>
					</center>
					</c:forEach>
					</c:if>
					
<script src="../resources/ckeditor5/ckeditor.js"></script>
<script>
		ClassicEditor
	    .create( document.querySelector( '#content1' ), {
	        extraPlugins: [MyCustomUploadAdapterPlugin],
	        heading: {
	            options: [
	                { model: 'paragraph', title: '본문', class: 'ck-heading_paragraph' },
	                { model: 'heading1', view: 'h1', title: '제목 1', class: 'ck-heading_heading1' },
	                { model: 'heading2', view: 'h2', title: '제목 2', class: 'ck-heading_heading2' },
	                { model: 'heading3', view: 'h3', title: '제목 3', class: 'ck-heading_heading3' }
	            ]
	        },
	        language: 'ko',
	        image: {
	            ImageCaption: {
	
	            },
	            resizeUnit: 'px',
	            toolbar: [
	                'imageTextAlternative',
	                'imageStyle:alignLeft',
	                'imageStyle:full',
	                'imageStyle:side'
	            ],
	            styles: [ 'full','alignLeft','alignRight','side' ]
	        },
	        table: {
	            contentToolbar: [
	                'tableColumn',
	                'tableRow',
	                'mergeTableCells'
	            ]
	        },
	        ckfinder: {
	            options: {
	                uploadUrl: '/after/uploadImage.do'
	            }
	        },
	        alignment: {
	            options: [ 'left', 'center', 'right']
	        }
	    } )
	    .then( editor => {
	        window.editor = editor;
	
	    } )
	    .catch( err => {
	        console.error( err.stack );
	    } );
	
	function MyCustomUploadAdapterPlugin(editor) {
	    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
	        return new UploadAdapter(loader)
	    }
	}
	
	class UploadAdapter {
	    constructor(loader) {
	        this.loader = loader;
	    }
	
	    upload() {
	        return this.loader.file.then( file => new Promise(((resolve, reject) => {
	            this._initRequest();
	            this._initListeners( resolve, reject, file );
	            this._sendRequest( file );
	        })))
	    }
	
	    _initRequest() {
	        const xhr = this.xhr = new XMLHttpRequest();
	        xhr.open('POST', '/after/uploadImage.do', true);
	        xhr.responseType = 'json';
	    }
	
	    _initListeners(resolve, reject, file) {
	        const xhr = this.xhr;
	        const loader = this.loader;
	        const genericErrorText = '파일을 업로드 할 수 없습니다.'
	
	        xhr.addEventListener('error', () => {reject(genericErrorText)})
	        xhr.addEventListener('abort', () => reject())
	        xhr.addEventListener('load', () => {
	            const response = xhr.response
	
	            if(!response || response.error) {
	                return reject( response && response.error ? response.error.message : genericErrorText );
	            }
	
	            resolve({
	                default: response.url //업로드된 파일 주소
	            })
	        })
	    }
	
	    _sendRequest(file) {
	        const data = new FormData()
	        data.append('upload',file)
	        this.xhr.send(data)
	    }
	}
	$('#reset').on("click",function (){
	    $('#title').val("");
	    window.editor.setData("");
	})
/*  	
	$('#submit').on("click",function (){
	
	    var data = {
	        "title" : $('#title').val(),
	        "title" : $('#title').val(),
	        "content" : window.editor.getData(),

	     
	    }
	
	    $.ajax({
	        type: "POST",
	        url: "/after/insertAfter.do",
	        data: JSON.stringify(data),
	        dataType: 'json',
	        contentType: "application/json; charset=utf-8;",
	        success : function (response){
	            console.log(response);
	
	            if(response==0){
	                alert("회원당 후기는 1개만 작성가능합니다")
	                return;
	            }
	            alert("작성 완료")
	            location.href="../group/main1.jsp"
	        },
	        error : function (response){
	            alert("오류 발생! 다시 시도해주세요");
	        }
	    })
	})  */
</script>			

</body>
</html>