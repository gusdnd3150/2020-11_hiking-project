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
var	table = null;
$(document).ready(function() {
   table= $('#foo-table').DataTable({
    	"scrollY":        "200px",
        "scrollCollapse": true,
        "paging":         false,
        dom: 'Blfrtip',
  
		buttons: [
			{
				extend:'excel',
				text:'excel',
				filename:'회원정보',
				title:'산오름 회원정보'
			},
			{
				extend:'copy',
				text:'copy',
				title:'회원정보입니다.'
			},			
                'pdf', 'print'
            ]
    	}
	
	 );
   datatableEdit({
		dataTable : table,
		columnDefs : [
			
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
				targets : 9
			}
		],
		onEdited : function(prev, changed, index, cell) {
		
           console.log(prev, changed, index, cell);
           console.log(prev );
           console.log(changed);
           console.log(index);
           console.log(index['column']);
           
           var _value = changed;
           var _result = null;
           
           if(index['column']==4){
           	_result='quantity';
           }else if (index['column']==5){
           	_result='prodSize';
           }else if (index['column']==6){
           	_result='color';
           }else if (index['column']==9){
           	_result='prodstatus';
           }
          
           var  date =  index['row'];
           
           var date1 = date+2;
           
           var tr = $("tr:eq("+date1+")");
           var _prodNum = tr.find('td:eq(0)').text();
           var _optionNum = tr.find('td:eq(1)').text();
           var _quantity = tr.find('td:eq(4)').text();
           var _prodSize = tr.find('td:eq(5)').text();
           var _color = tr.find('td:eq(6)').text();
           var _prodStatus = tr.find('td:eq(9)').text();
         
           console.log("변경할 컬럼 이름     :"+_result);
           console.log("변경값           :"+_value);
           console.log("상품 번호 :    "+_prodNum);
           console.log("옵션 번호       :"+_optionNum);
           console.log("재고        :"+_quantity);
           console.log("사이즈          :"+_prodSize);
           console.log("컬러       :"+_color);
           console.log("상태     :"+_prodStatus);
                 
           
            $.ajax({
               type : 'get',
               url : 'updateOption.do',
               data : {
               	result : _result,
               	optionNum : _optionNum,
               	prodNum : _prodNum,
               	quantity : _quantity,
               	prodSize : _prodSize,
               	color : _color,
               	prodStatus : _prodStatus,
               	value : _value
               	
               },
               success : function(data) {
               	if ("ok"== (data)) {
               		console.log("수정완료");

					} else {
						console.log("수정 실패");
					};
               	
               }
            })  
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

   
});

		




	// 데이터테블 함수 끝----------------------------------------------------------------

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
		<form action="selectProd.do" method="get">
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
                      <button type="submit" id="serch"class="btn btn-info btn-flat" >조회</button>
                    </span>
			</div>
			</form>

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
						
						<!-- 	<button id="button" class='btn btn-danger btn-xs'>Delete</button> -->
						
							<table id="foo-table" class="display" style="width:100%">
								<thead>
								<tr>
									<th>번호</th>
									<th>옵션번호</th>
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
								 <tbody>
					                <c:forEach var="prod" items="${list}" >   
					                <tr>
					                  <td>${prod.prodNum}</td>
					                  <td>${prod.optionNum}</td>
					                  <td>${prod.name}</td>
					                  <td>${prod.priceString}</td>
					                  <td>${prod.quantity}</td>
					                  <td>${prod.prodsize}</td>
					                  <td>${prod.color}</td>
					                  <td>${prod.typeString}</td>
					                  <td>${prod.prodcategorynumString}</td>
					                  <td>${prod.prodstatusString}</td>
					                  <td>${prod.createdAtString}</td>
					                  <td><a href="upDateUserList.do?userNum=${user.userNum}"><button class="btn btn-primary btn-xs">상세보기</button></a></td>
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