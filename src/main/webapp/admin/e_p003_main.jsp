<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp"%>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 데이터 테이블 -->
<!-- 데이터 테이블 css -->
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
	$(document).ready(function() {
		var	table = null;
		 table= $('#foo-table').DataTable({
			  bAutoWidth : false, //자동너비
	          ordering : true, //칼럼별 정렬
	    		pagingType:"full_numbers",
	    	   autoWidth: true,
	        dom: 'Blfrtip',
	  
			buttons: [
				{
					extend:'excel',
					text:'excel',
					filename:'게시글정보',
					title:'cs게시글 목록'
				},
				{
					extend:'copy',
					text:'copy',
					title:'게시글목록.'
				},			
	                'pdf', 'print'
	            ]
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

	$(function upDateMsg() { // 글 수정 후 알림창
		var upDate = "<c:out value="${upDateCsBoardMsg}" />";
		if (upDate == 1) {
			alert("완료");
			//window.location.href = 'http://localhost:8090/admin/e_p003_main.jsp';
		}
	});

	$(function addCsBoardMsg() { // 공지사항 등록완료
		var result = "<c:out value="${result}" />";
		if (result == 1) {
			alert(" 공지사항  등록완료");
			//window.location.href = 'http://localhost:8090/admin/e_p003_main.jsp';
		} else {

		}
	});

	$(function mailSending() { // 이메일발송 완료
		var mailResult = "<c:out value="${mailResult}" />";
		if (mailResult == 1) {
			alert(" 이메일 발송이 완료 되었습니다.");
			//window.location.href = 'http://localhost:8090/admin/e_p003_main.jsp';
		} else {

		}
	});
</script>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->
		<%@ include file="../include/main_header.jsp"%>
		<!-- Left side column. contains the logo and sidebar -->
		<%@ include file="../include/left_column.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<small>게시글 관리</small>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
					<li class="active">Here</li>
				</ol>
			</section>

			<!-- Main content -->
			<div class="box">
				<!-- 게시글관리 검색창 -->
				<%@ include file="../include/admin_csBoard_search.jsp"%>

				<div class="box-header">
					<h3 class="box-title">게시글 목록</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div id="example1_wrapper"
						class="dataTables_wrapper form-inline dt-bootstrap">
						<div class="row">

							<div class="col-sm-6">
								<div id="example1_filter" class="dataTables_filter">
									<div>
										<a href="e_p003_addCsBoardForm.jsp"><button class="btn btn-primary btn-xs">게시글 등록</button></a>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div>
								<table id="foo-table" class="display" style="width:100%">
									<thead>
										<tr>
											<th>글 번호</th>
											<th>고객 번호</th>
											<th>제목</th>
											<th>내용</th>
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
												<td>${cs.content}</td>
												<td>${cs.createdAtString}</td>
												<td>${cs.statusString}</td>
												<td>${cs.csPostTypeString}</td>
												<td><a href="viewDetaList.do?csPostNum=${cs.csPostNum}"><button class="btn btn-primary btn-xs">상세보기</button></a></td>
												<td><button class="btn btn-danger btn-xs" id="remove" value="${cs.csPostNum}">삭제</button></td>
											</tr>
										</c:forEach>
									</tbody>

								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<!-- Main Footer -->
		<%@ include file="../include/main_footer.jsp"%>
	</div>
	<!-- ./wrapper -->
	<!-- REQUIRED JS SCRIPTS -->
	<%@ include file="../include/plugin_js.jsp"%>
</body>
</html>