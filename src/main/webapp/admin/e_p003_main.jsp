<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
     <%
     request.setCharacterEncoding("utf-8");
      %>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp" %>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="../resources/js/jquery.js"></script>

<!-- 데이터 테이블 -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css" />

<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>

<script src=https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js></script>
<!--  이거 없으면 버튼 안생김  -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<!--  //엑셀 -->
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<!-- // 카피+ pdf -->
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>
<!--  // 프린트 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<!--  // pdf -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<!--  //pdf -->

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>

<script type="text/javascript">

var	table = null;
$(document).ready(function() {
	table=$('#foo-table').DataTable({
		pagingType:"full_numbers",
    	   autoWidth: false,
		dom : 'Blfrtip',
		buttons : [ {
			extend : 'excel',
			text : 'excel',
			filename : '게시글 정보',
			title : '게시글 정보'
		}, {
			extend : 'copy',
			text : 'copy',
			title : '게시글 정보'
		}, 'pdf', 'print' ]
	});
	
	  $('#foo-table tbody').on( 'click', 'tr', function () {
		    if ( $(this).hasClass('selected') ) {
		        $(this).removeClass('selected');
		    }
		    else {
		        table.$('tr.selected').removeClass('selected');
		        $(this).addClass('selected');
		    }
		}); 
	
});


	// 데이터테블 함수 끝----------------------------------------------------------------
	
	//조건검색시 인풋창 입력 막는 조건
  function myFunction(str) {
	    if(str=='count300'){
	        $(".form-control").prop("disabled",true); 
	    }else if(str=='count'){
	    	 $(".form-control").prop("disabled",true);
	    }else if (str=='csPostType100'){
	    	 $(".form-control").prop("disabled",true);
	    }else if (str=='csPostType200'){
	    	$(".form-control").prop("disabled",true);
	    }else if(str=='csPostType300'){
	    	$(".form-control").prop("disabled",true);
	    }else if(str=='csPostType400'){
	    	$(".form-control").prop("disabled",true);
	    }
	    
	    else{
	    	  $(".form-control").prop("disabled",false);
	    	  $("#radioInput").hide();
	    	
	    }
	};
	$(document).on("click", "#remove", function() {// 글삭제 알림창
		var _csPostNum = $(this).val();

		$.ajax({
			type : 'get',
			url : 'removeCsboard.do',
			data : {
				csPostNum : _csPostNum
			},
			success : function(data) {
				if ("ok"== (data)) {
					alert("삭제완료");
					window.location.reload(true);
				} else {
					alert("다시확인해주세요");
				}
				;
			}
		})
	});


	$(function addCsBoardMsg() { // 공지사항 등록완료
		var result = "<c:out value="${result}" />";
		if (result == 1) {
			alert(" 등록완료");
		} else {

		}
	});

	$(function upDateMsg() { // 글 수정 후 알림창
		var upDate = "<c:out value="${upDatemsg}" />";
		if (upDate ==="ok") {
			opener.location.reload();
			close(viewDetaList);
		}
	});
	
	var viewDetaList;
	function viewCsboard (csPostNum){
		viewDetaList=window.open("viewDetaList.do?csPostNum="+csPostNum, '상품상세정보','width=700px,height=800px,scrollbars=yes');
	};
	
	function add(){
		var title = $("#title").val();
		
		if(title == "" || title == null || title == undefined || ( title != null && typeof title == "object" && !Object.keys(title).length )){
			alert("제목을 입력해주세요");
		}else{
			form.submit();
		}
		

	}
</script>
<style>
.ck.ck-editor{
	max-width: 100%;
	}
.ck-editor__editable {
    min-height: 300px;
}

.main_common{
    display: inline-block !important;

}

</style>


<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Main Header -->
  <%@ include file="../include/main_header.jsp" %>
  <!-- Left side column. contains the logo and sidebar -->
  <%@ include file="../include/left_column.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
  	<section class="content-header">
     
        <small>게시글 관리</small>
     
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Forms</a></li>
        <li class="active">Editors</li>
      </ol>
    </section>

    <!-- Main content -->
 <section class="content">
      <div class="row">
        <div class="col-md-12">
        <!-- 1페이지 -->
            <div class="box box-info">
            <div class="box-header">
              <h3 class="box-title">게시글 조회
                <small></small>
              </h3>
              <!-- tools box -->
              <div class="pull-right box-tools">
                <button type="button" class="btn btn-info btn-sm" data-widget="collapse" data-toggle="tooltip" title="" data-original-title="Collapse">
                  <i class="fa fa-minus"></i></button>
              </div>
              <!-- /. tools -->
            </div>
            <!-- /.box-header -->
            
            <div class="box-body pad" style="">
             <form action="csBoardsearch.do" method="get" >
		          <div class="input-group margin">
		                <div class="input-group-btn">
		                	<select name="searchOption" id="searchOption" class="btn btn-info dropdown-toggle" onchange="myFunction(this.value)">
		            		<option value="all">전체조회</option>
		            		<option value="csPostType100">공지 전체 조회</option>
		            		<option value="csPostType400">이벤트 전체 조회</option>
		           			<option value="csPostType200">문의 전체 조회</option>
		            		<option value="csPostType300">신고 전체 조회</option>
		            		<option value="userNum">작성자 ID 조회</option>
		            		<option value="count">미처리 문의글</option>
		            		<option value="count300">미처리 신고글</option>
		        			</select>  
		                </div> 
		                <input type="text" name="key_word" class="form-control" placeholder="조회내용을 입력하세요">
		                    <span class="input-group-btn">
		                      <button type="submit"  id="searchBoard" class="btn btn-info btn-flat" >조회</button>            
		                    </span>
		              </div>
             </form>
            <div class="box">
    
            <!-- /.box-header -->
            <div class="box-body">
             <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
               <!-- 데이터 테이블 -->
              <table id="foo-table" class="display" style="width:100%">
                           <thead>
                      
                              <tr>
                                 <th>글 번호</th>
                                 <th>고객 번호</th>
                                 <th>제목</th>
                                 <th>등록일</th>
                                 <th>상태</th>
                                 <th>구분</th>
                                 <th>상세보기</th>
                                 <th>삭제</th>
                              </tr>
                           </thead>
                           <tbody>
                             	<c:forEach var="cs" items="${csBoardList}">
											<tr>
												<td>${cs.csPostNum}</td>
												<td>${cs.userNum}</td>
												<td>${cs.title}</td>
												<td>${cs.createdAtString}</td>
												<td>
													<c:if test="${cs.statusString eq '미처리'}">
								                  	<span class="label label-danger">${cs.statusString}</span>
								                    </c:if>
								                    <c:if test="${cs.statusString eq '완료'}">
								                  	<span class="label label-warning">${cs.statusString}</span>
								                    </c:if>
												</td>
												<td>${cs.csPostTypeString}</td>
												<td><button class="btn btn-primary btn-xs" onclick="viewCsboard(${cs.csPostNum})">상세보기</button></td>
												<td><button class="btn btn-danger btn-xs" id="remove" value="${cs.csPostNum}">삭제</button></td>
											</tr>
										</c:forEach>
                           </tbody>
                        </table>
             		</div>   
              	</div>
            <!-- /.box-body -->
          	  </div>              
            </div>
          </div>
         
          <!--1페이지 끝  -->
          <!-- /.box -->
		<!-- 2페이지 시작 -->
       <div class="box box-info collapsed-box">
            <div class="box-header">
              <h3 class="box-title">게시글 등록
                <small></small>
              </h3>
              <!-- tools box -->
              <div class="pull-right box-tools">
                <button type="button" class="btn btn-info btn-sm" data-widget="collapse" data-toggle="tooltip" title="" data-original-title="Collapse">
                  <i class="fa fa-plus"></i></button>
              </div>
              <!-- /. tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body pad" style="">
                      <form name="form" id="form" role="form" method="post" action="addCSboard.do">
                  <div style="margin-bottom:10px;">
                  <input  class="form-control" type="text" class="form-control" name="title" id="title" placeholder="제목을 입력해 주세요">
               </div>
               <div style="margin-bottom:10px;">
                  <textarea class="form-control"  name="content" id="content" ></textarea>
               </div>
        			<center> 
        				<div>
                     <input type="radio" class="minimal" name="csPostType" value="100" checked>공지사항 &nbsp;&nbsp;
                     <input type="radio"  class="minimal" name="csPostType" value="400">이벤트&nbsp;&nbsp;
                       </div>
                	</center>      
                	 <center>
                       <input class="btn btn-info" type="button"  value="등록" onclick="add()"/>
                     </center>                      
               </form>
            </div>
          </div>
          <!-- 2페이지 끝 -->
          
          
        </div>
        <!-- /.col-->
      </div>
      <!-- ./row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
 <%@ include file="../include/main_footer.jsp" %>
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->
<%@ include file="../include/plugin_js.jsp" %>

<script src="../resources/ckeditor5/ckeditor.js"></script>
<script>
		ClassicEditor
	    .create( document.querySelector( '#content' ), {
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

	
</script>
</body>
</html>