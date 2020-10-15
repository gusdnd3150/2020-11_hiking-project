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
<link rel="stylesheet"
	href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css" />
<script
	src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
<script
	src=https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js></script>
<!--  이거 없으면 버튼 안생김  -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<!--  //엑셀 -->
<script type="text/javascript"
	src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<!-- // 카피+ pdf -->
<script type="text/javascript"
	src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>
<!--  // 프린트 -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<!--  // pdf -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<!--  //pdf -->

<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>








<script type="text/javascript">
$(document).on("click", "#serch", function() {
	var _searchOption = $('#searchOption').val();
	var _key_word = $('#key_word').val();
	
	

    $('#foo-table').DataTable({
       destroy : true,//테이블 파괴가능
       bPaginate : true, //페이징처리
       bLengthChange : true, // n개씩보기
       lengthMenu : [ [ 10, 25, 50, -1 ], [ 10, 25, 50, "All" ] ], // 10/25/50/All 개씩보기
       bAutoWidth : false, //자동너비
       ordering : true, //칼럼별 정렬
       searching : true, //검색기능

       dom : 'Blfrtip',
      buttons : [ {
			extend : 'excel',
			text : 'excel',
			filename : '상품정보',
			title : ' 상품정보'
		}, {
			extend : 'copy',
			text : 'copy',
			title : '상품'
		}, 'pdf', 'print' ],
       ajax : {
          method : "get",
          url : "selectProd.do",
          dataType: "json",
          data :{
        	  searchOption :$('#searchOption').val(),
	          key_word :$('#key_word').val()

			},
          dataSrc : ""
       },
       columns : [ 
          {data : "prodNum"},
          {data : "name"},
          {data : "priceString"},
          {data : "quantity"},
          {data : "typeString"},
          {data : "pCategoryNumStirng"},
          {data : "createdAtString"},
          {defaultContent : "&nbsp;&nbsp;&nbsp;<button id='info' class='btn btn-primary btn-xs' onclick='remove'>상세보기</button> &nbsp;&nbsp;&nbsp;<button id='remove' class='btn btn-danger btn-xs' value='prodNum'>삭제</button> "},
          //{defaultContent : "&nbsp;&nbsp;<button id='remove' class='btn btn-danger btn-xs' value='prodNum'>삭제</button>"}
       ]
    });
});

	// 데이터테블 함수 끝----------------------------------------------------------------

	$(document).on("click", "#remove", function() {// 글삭제 알림창
		var num = $(this).closest('tr');
		var num1 = num.find('td:eq(0)').text();
		$.ajax({
			type : 'get',
			url : 'deleteProd.do',
			data : {
				prodNum : num1
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
			window.location.href = 'http://localhost:8090/admin/e_p003_main.jsp';
		}
	});

	$(function addCsBoardMsg() { // 공지사항 등록완료
		var result = "<c:out value="${result}" />";
		if (result == 1) {
			alert(" 공지사항  등록완료");
			window.location.href = 'http://localhost:8090/admin/e_p003_main.jsp';
		} else {

		}
	});

	$(function mailSending() { // 이메일발송 완료
		var mailResult = "<c:out value="${mailResult}" />";
		if (mailResult == 1) {
			alert(" 이메일 발송이 완료 되었습니다.");
			window.location.href = 'http://localhost:8090/admin/e_p003_main.jsp';
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
				<small>상품 관리</small>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
					<li class="active">Here</li>
				</ol>
			</section>

			<!-- Main content -->
			<div class="box">
			
				<!-- 상품관리 검색창 -->
         	 <div class="input-group margin">
               			 <div class="input-group-btn">
                	<select name="searchOption" id="searchOption"class="btn btn-info dropdown-toggle" >
            		<option value="all">전체조회</option>
            		<option value="name">상품명</option>
           			<option value="type1">신제품</option>
            		<option value="type2">중고품</option>
            		<option value="pCategoryNum1">양말</option>
            		<option value="pCategoryNum2">가방</option>
            		<option value="pCategoryNum3">의류</option>
            		<option value="pCategoryNum4">스틱</option>
            		<option value="pCategoryNum5">신발</option>
            		<option value="pCategoryNum6">장갑</option>
            		<option value="pCategoryNum7">보호대</option>
        			</select>  
        			
                </div> 
                <input type="text" name="key_word" id="key_word"class="form-control" placeholder="조회내용을 입력하세요">
                    <span class="input-group-btn">
                      <button type="button" id="serch"class="btn btn-info btn-flat" >조회</button>            
                    </span>
              </div>
              
               <div id="radioInput"> </div> 
         
				<div class="box-header">
					<h3 class="box-title">상품 목록</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div id="example1_wrapper"
						class="dataTables_wrapper form-inline dt-bootstrap">
						<div class="row">

							<div class="col-sm-6">
								<div id="example1_filter" class="dataTables_filter">
									<div>
										<a href="e_p002_addProdForm.jsp"><button class="btn btn-primary btn-xs">상품 등록</button></a>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div>
								<table id="foo-table" class="table table-bordered">
									<thead>
										<tr>
											<th>번호</th>
											<th>상품명</th>
											<th>가격</th>
											<th>수량</th>
											<th>구분</th>
											<th>분류</th>
											<th>등록일자</th>
											<th> 설정 </th>
										</tr>
									</thead>
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