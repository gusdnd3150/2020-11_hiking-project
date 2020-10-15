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




<!-- datatable-editor js 파일 -->
<script type="text/javascript" src="../resources/js/view/admin/datatable-editor.js"></script>

<script type="text/javascript">
	var table = "";
	$(document).on("click", "#serch", function() {
		var _searchOption = $('#searchOption').val();
		var _key_word = $('#key_word').val();


		table = $('#foo-table').DataTable({

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
				{data : "prodsize"},
				{data : "color"},
				{data : "typeString"},
				{data : "prodcategorynumString"},
				{data : "prodstatusString"},
				{data : "createdAtString"},
				{defaultContent : "&nbsp;&nbsp;&nbsp;<button id='info' class='btn btn-primary btn-xs'>상세보기</button> "}

			]
		});

		console.log(table);
		datatableEdit({
			dataTable : table,
			columnDefs : [
				{
					targets : 1
				},
				{
					targets : 2
				},
				{
					targets : 3
				},
				{
					targets : 4
				},
				{
					targets : 5
				},
				{
					targets : 6
				},
				{
					targets : 8
				}
			],
			onEdited : function(prev, changed, index, cell) {
				console.log(prev, changed, index, cell);
				console.log(prev );
				console.log(changed);
				console.log(index);
				console.log(index['column']);
				var result = null;
				if(index['column']==1){
					result='name';
				}else if (index['column']==2){
					result='price';
				}else if (index['column']==3){
					result='quantity';
				}else if (index['column']==4){
					result='prodSize';
				}else if (index['column']==5){
					result='color';
				}else if (index['column']==6){
					result='type';
				}else if (index['column']==8){
					result='prodstatus';
				}
				console.log("리전트 변환 값 :"+result);

			}
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

		$('#button').click( function () { //삭제
			var num = document.querySelector('.selected').childNodes[0].innerText;
			console.log(document.querySelector('.selected'));
			console.log(document.querySelector('.selected').childNodes);
			console.log(document.querySelector('.selected').childNodes[0].innerText);
			$.ajax({
				type : 'get',
				url : 'deleteProd.do',
				data : {
					prodNum : num
				},
				success : function(data) {
					if ("ok"== (data)) {
						alert("삭제완료");

					} else {
						alert("다시확인해주세요");
					};
				}
			})
			table.row('.selected').remove().draw( false );
		});

	});







	// 데이터테블 함수 끝----------------------------------------------------------------
	/*
       $(document).on("click", "#remove", function() {// 상품 삭제
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
     */
	$(function insertProdMsg() { // 상품등록알림창
		var insertMsg = "<c:out value="${msg}" />";
		if (insertMsg == "ok") {
			alert("상품 등록 완료");
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
						<option value="prodstatus1">판매중</option>
						<option value="prodstatus2">품절</option>
						<option value="prodcategorynum1">의류</option>
						<option value="prodcategorynum2">잡화</option>
						<option value="prodcategorynum3">등산용품</option>
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
							<button id="button" class='btn btn-danger btn-xs'>Delete</button>
							<table id="foo-table" class="display" style="width:100%">
								<thead>
								<tr>
									<th>번호</th>
									<th>상품명</th>
									<th>가격</th>
									<th>재고</th>
									<th>사이즈</th>
									<th>색상</th>
									<th>타입</th>
									<th>분류</th>
									<th>상태</th>
									<th>등록일</th>
									<th>상세 보기 </th>
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