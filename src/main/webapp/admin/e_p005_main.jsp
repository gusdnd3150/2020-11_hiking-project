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
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css" />

<script
	src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<script
	src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>

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

<!-- datatable-editor js 파일 -->
<script type="text/javascript"
	src="../resources/js/view/admin/datatable-editor.js"></script>

<script type="text/javascript">
//승인 매출 데이터 테이블
var table = null;
	$(document).ready(function() {
		table = $('#foo-table').DataTable({
			pagingType : "full_numbers",
			autoWidth : false,
			dom : 'Blfrtip',

			buttons : [ {
				extend : 'excel',
				text : 'excel',
				filename : '결제정보',
				title : '오름마켓 결제정보'
			}, {
				extend : 'copy',
				text : 'copy',
				title : '결제목록'
			}, 'pdf', 'print' ]
		});

		$('#foo-table tbody').on('click', 'tr', function() {
			if ($(this).hasClass('selected')) {
				$(this).removeClass('selected');
			} else {
				table.$('tr.selected').removeClass('selected');
				$(this).addClass('selected');
			}
		});

	});
	
	//취소매출 데이터 테이블
	var table2 = null;
	$(document).ready(function() {
		table2 = $('#foo-table2').DataTable({
			pagingType : "full_numbers",
			autoWidth : false,
			dom : 'Blfrtip',

			buttons : [ {
				extend : 'excel',
				text : 'excel',
				filename : '결제정보',
				title : '오름마켓 결제정보'
			}, {
				extend : 'copy',
				text : 'copy',
				title : '결제목록'
			}, 'pdf', 'print' ]
		});

		$('#foo-table2 tbody').on('click', 'tr', function() {
			if ($(this).hasClass('selected')) {
				$(this).removeClass('selected');
			} else {
				table.$('tr.selected').removeClass('selected');
				$(this).addClass('selected');
			}
		});

	});

	// 데이터테블 함수 끝----------------------------------------------------------------
	function selectDay(str) {
		console.log("셀렉트 옵션값          " + str);
		var t = new Date();
		var _st = t.getFullYear() + '-' + (t.getMonth() + 1) + '-'+ t.getDate();
		var _end;
		var _key_word;

		if (str == "all") {
			_key_word = "all";
		} else if (str == "toDay") {
			_st = t.getFullYear() + '-' + (t.getMonth() + 1) + '-'
					+ t.getDate();
			_key_word = "toDay"
		} else if (str == "1week") {
			t.setDate(t.getDate() - 7)
			_end = t.getFullYear() + '-' + (t.getMonth() + 1) + '-'
					+ t.getDate();
			_key_word = "week_month";
		} else if (str == "2week") {
			t.setDate(t.getDate() - 14)
			_end = t.getFullYear() + '-' + (t.getMonth() + 1) + '-'
					+ t.getDate();
			_key_word = "week_month";
		} else if (str == "1month") {
			t.setMonth(t.getMonth() - 1)
			_end = t.getFullYear() + '-' + (t.getMonth() + 1) + '-'
					+ t.getDate();
			_key_word = "week_month";
		}

		console.log("버튼 선택후 포멧되어 나온 _st            " + _st);
		console.log("버튼 선택후 포멧되어 나온 _end            " + _end);
		console.log("버튼 선택후 포멧되어 나온 _key_word        " + _key_word);

		location.href = "selectSearch.do?key_word=" + _key_word + "&st=" + _st
				+ "&end=" + _end;
	}
	
	// 취소매출 조회
	function cancelselectDay(str) {
		console.log("셀렉트 옵션값          " + str);
		var t = new Date();
		var _st = t.getFullYear() + '-' + (t.getMonth() + 1) + '-'+ t.getDate();
		var _end;
		var _key_word;

		if (str == "all") {
			_key_word = "all";
		} else if (str == "toDay") {
			_st = t.getFullYear() + '-' + (t.getMonth() + 1) + '-'
					+ t.getDate();
			_key_word = "toDay"
		} else if (str == "1week") {
			t.setDate(t.getDate() - 7)
			_end = t.getFullYear() + '-' + (t.getMonth() + 1) + '-'
					+ t.getDate();
			_key_word = "week_month";
		} else if (str == "2week") {
			t.setDate(t.getDate() - 14)
			_end = t.getFullYear() + '-' + (t.getMonth() + 1) + '-'
					+ t.getDate();
			_key_word = "week_month";
		} else if (str == "1month") {
			t.setMonth(t.getMonth() - 1)
			_end = t.getFullYear() + '-' + (t.getMonth() + 1) + '-'
					+ t.getDate();
			_key_word = "week_month";
		}

		console.log("버튼 선택후 포멧되어 나온 _st            " + _st);
		console.log("버튼 선택후 포멧되어 나온 _end            " + _end);
		console.log("버튼 선택후 포멧되어 나온 _key_word        " + _key_word);

		location.href = "cancelSearch.do?key_word=" + _key_word + "&st=" + _st+ "&end=" + _end;
	}
	
	//박스 닫기
	function updateClass(value){
		console.log("박스 닫기 함수 실행")
		$('#'+value).attr('class','box box-info collapsed-box');
	}
	//박스 열기
	function updateClass1(value){
		console.log("박스 닫기 함수 실행")
		$('#'+value).attr('class','box box-info');
	}
</script>
<style>
.main_common {
	display: inline-block !important;
}
</style>
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
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="#">Forms</a></li>
					<li class="active">Editors</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="box box-info " id="cancelBox">
							<div class="box-header">
								<h3 class="box-title">
									취소 매출 조회 <small></small>
								</h3>

								<div class="pull-right box-tools">
									<button type="button" class="btn btn-info btn-sm"
										data-widget="collapse" data-toggle="tooltip" title=""
										data-original-title="Collapse">
										<i class="fa fa-minus"></i>
									</button>
									<button type="button" class="btn btn-info btn-sm"
										data-widget="remove" data-toggle="tooltip" title=""
										data-original-title="Remove">
										<i class="fa fa-times"></i>
									</button>
								</div>

							</div>

							<div class="box-body pad" style="">
								<div>
									<div class="m1 main_common">
										<form action="cancelhPayList.do" mathod="get">
											&nbsp; <strong>일자별 조회 : </strong><input type='date'
												name='startDate' id='startDate' /> ~ <input type='date'
												name='endDate' id='endDate' />
											<button type="submit" class="btn btn-danger btn-xs"
												id="searchDate">조회</button>
											&nbsp;&nbsp;
										</form>
									</div>
									&nbsp;&nbsp;
									<div class="m2 main_common">
										<strong style="color: #111111"> <input type="radio"
											name="dayType" value="all"
											onclick="cancelselectDay(this.value)"> 전체조회
											&nbsp;&nbsp; <input type="radio" name="dayType" value="toDay"
											onclick="cancelselectDay(this.value)"> 당일
											&nbsp;&nbsp; <input type="radio" name="dayType" value="1week"
											onclick="cancelselectDay(this.value)"> 1주일
											&nbsp;&nbsp; <input type="radio" name="dayType" value="2week"
											onclick="cancelselectDay(this.value)"> 2주일
											&nbsp;&nbsp; <input type="radio" name="dayType"
											value="1month" onclick="cancelselectDay(this.value)">
											1달 &nbsp;&nbsp;
										</strong>
									</div>
								</div>
								<br>
								<div class="box">

									<div class="box-body">
										<!-- 2페이지 내용 -->
										<div id="example1_wrapper"
											class="dataTables_wrapper form-inline dt-bootstrap">
											<div class="row">
												<div>
													<table id="foo-table2" class="display" style="width: 100%">
														<thead>
															<tr>
																<th>취소일자</th>
																<th>주문번호</th>
																<th>회원번호</th>
																<th>회원이름</th>
																<th>취소사유</th>
																<th>취소금액</th>
															</tr>
														</thead>
														<tbody>
															<c:if test="${cancelPayList ==null}">
															<script>
															updateClass("cancelBox");
															</script>
															</c:if>
															<c:if test="${cancelPayList !=null}">
															<script>
															updateClass1("cancelBox");
															</script>
															</c:if>
															<c:forEach var="cancel" items="${cancelPayList}">
															
																<tr>
																	<td>${cancel.cancelcreatedate}</td>
																	<td>${cancel.orderNum}</td>
																	<td>${cancel.userNum}</td>
																	<td>${cancel.name}</td>
																	<td>${cancel.totalCancelPay}</td>
																	<td>${cancel.reason}</td>
																</tr>

															</c:forEach>
														</tbody>
														<tfoot>
															<tr>
																<th colspan="4"style="text-align: right; white-space: nowrap;">총 취소금액 :</th>
																<th colspan="2"style="text-align: right; white-space: nowrap;">${sumCancelPay}</th>
																
															</tr>
														</tfoot>

													</table>
												</div>
											</div>
										</div>

									</div>

								</div>

							</div>
						</div>

					</div>
					<!--  /.box-body -->
				</div>

				<!-- 2페이지 시작 -->
				<div class="box box-info" id="payBox">
					<div class="box-header">
						<h3 class="box-title">
							승인 매출 조회 <small></small>
						</h3>
						<!--    tools box -->
						<div class="pull-right box-tools">
							<button type="button" class="btn btn-info btn-sm"
								data-widget="collapse" data-toggle="tooltip" title=""
								data-original-title="Collapse">
								<i class="fa fa-minus"></i>
							</button>
							<button type="button" class="btn btn-info btn-sm"
								data-widget="remove" data-toggle="tooltip" title=""
								data-original-title="Remove">
								<i class="fa fa-times"></i>
							</button>
						</div>
						<!--     /. tools -->
					</div>
					<!--   /.box-header -->
					<div class="box-body pad" style="">
						<div>
							<div class="m1 main_common">
								<form action="searchPayList.do" mathod="get">
									&nbsp; <strong>일자별 조회 : </strong><input type='date'
										name='startDate' id='startDate' /> ~ <input type='date'
										name='endDate' id='endDate' />
									<button type="submit" class="btn btn-danger btn-xs"
										id="searchDate">조회</button>
									&nbsp;&nbsp;
								</form>
							</div>
							&nbsp;&nbsp;
							<div class="m2 main_common">
								<strong style="color: #111111"> <input type="radio"
									name="dayType" value="all" onclick="selectDay(this.value)">
									전체조회 &nbsp;&nbsp; <input type="radio" name="dayType"
									value="toDay" onclick="selectDay(this.value)"> 당일
									&nbsp;&nbsp; <input type="radio" name="dayType" value="1week"
									onclick="selectDay(this.value)"> 1주일 &nbsp;&nbsp; <input
									type="radio" name="dayType" value="2week"
									onclick="selectDay(this.value)"> 2주일 &nbsp;&nbsp; <input
									type="radio" name="dayType" value="1month"
									onclick="selectDay(this.value)"> 1달 &nbsp;&nbsp;
								</strong>
							</div>
						</div>
						<br>
						<div class="box">
							<!--   /.box-header -->
							<div class="box-body">
								<!-- 	페이지 내용 -->
								<div id="example1_wrapper"
									class="dataTables_wrapper form-inline dt-bootstrap">
									<div class="row">
										<div>
											<table id="foo-table" class="display" style="width: 100%">
												<thead>
													<tr>
														<th>주문번호</th>
														<th>회원번호</th>
														<th>결제일자</th>
														<th>카드결제</th>
														<th>무통장입금</th>
													</tr>
												</thead>
												<tbody>
													<c:if test="${payList ==null}">
															<script>
															updateClass("payBox");
															</script>
															</c:if>
															<c:if test="${payList !=null}">
															<script>
															updateClass1("payBox");
															</script>
															</c:if>
													<c:forEach var="list" items="${payList}">
														<tr>
															<td>${list.orderNum}</td>
															<td>${list.userNum}</td>
															<td>${list.createdateString}</td>
															<td>${list.pay1}</td>
															<td>${list.pay2}</td>
														</tr>

													</c:forEach>
												</tbody>
												<tfoot>
													<tr>
														<th colspan="1"
															style="text-align: right; white-space: nowrap;">총 매출
															:</th>
														<th colspan="2"
															style="text-align: right; white-space: nowrap;">${sumPrice}</th>
														<th colspan="1"
															style="text-align: right; white-space: nowrap;">일평균
															매출 :</th>
														<th colspan="1"
															style="text-align: right; white-space: nowrap;">${avgPrice}</th>
													</tr>
												</tfoot>

											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		</div>
	</div>
	<!-- /.box -->





	</div>
	<!-- /.col-->
	</div>
	<!-- ./row -->
	</section>
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