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
	$(document).ready(function() {
		$('#foo-table').DataTable({
			responsive : true,
			"pagingType" : "full_numbers",

			dom : 'Blfrtip',
			buttons : [ {
				extend : 'excel',
				text : 'excel',
				filename : '결제정보',
				title : '산오름 결제정보'
			}, {
				extend : 'copy',
				text : 'copy',
				title : '결제정보'
			}, 'pdf', 'print' ]
		}
		/*  "footerCallback":function(){
	            var api = this.api(), data;
	            var result = 0;
	            api.column(7, {search:'applied'}).data().each(function(data,index){
	                result += parseFloat(data);
	            });
	            $(api.column(3).footer()).html(result.toLocaleString()+'원');
	        } */

		);
	});

	// 데이터테블 함수 끝----------------------------------------------------------------

	

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
				<small>매출 관리</small>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
					<li class="active">Here</li>
				</ol>
			</section>

			<!-- Main content -->
			<div class="box">
				<!-- 게시글관리 검색창 -->
			<%-- 	<%@ include file="../include/admin_csBoard_search.jsp"%> --%>
			 <div>
			 <form action="searchPayList.do" mathod="get">
			   <input type='date' name='startDate' id='startDate'/> ~ <input type='date' name='endDate' id='endDate'/> 
			   <button type="submit"  class="btn btn-danger btn-xs" id="searchDate">조회</button>&nbsp;&nbsp;
			   </form>
			    	<select name="searchOption" class="btn btn-info dropdown-toggle" onchange="selectDay(this.value)">
            		<option value="all">전체조회</option>
            		<option value="toDay">당일</option>
           			<option value="1week">1주</option>
            		<option value="2week">2주</option>
            		<option value="1month">1달</option>
            		
        			</select>  
			   </div>

				<div class="box-header">
					<h3 class="box-title">매출 목록</h3>
				</div>
				<!-- /.box-header -->
				<div class="box-body">
					<div id="example1_wrapper"
						class="dataTables_wrapper form-inline dt-bootstrap">
						<div class="row">

							<div class="col-sm-6">
								<div id="example1_filter" class="dataTables_filter">
								</div>
							</div>
						</div>
						<div class="row">
							<div>
								<table id="foo-table" class="table table-bordered">
									<thead>
										<tr>
											<th>주문번호</th>
											<th>회원번호</th>
											<th>결제일자</th>
											<th>카드결제</th>
											<th>무통장입금</th>
											<th>상세보기</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="list" items="${payList}">
											<tr>
												<td>${list.orderNum}</td>
											 	<td>${list.userNum}</td>
												<td>${list.createdateString}</td>
												<td>${list.pay1}</td>
												<td>${list.pay2}</td>
												<td><a href="viewOrderList.do?orderNum=${list.orderNum}"><button class="btn btn-primary btn-xs">상세보기</button></a></td>
											</tr>
											
										</c:forEach>
									</tbody>
									 <tfoot>
						                <tr>
						                    <th colspan="2" style="text-align:right;white-space:nowrap;">TOTAL : </th>
						                    <th colspan="6" style="text-align:left;white-space:nowrap;"></th>
						                </tr>
						            </tfoot>

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