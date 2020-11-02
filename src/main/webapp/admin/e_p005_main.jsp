<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
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

<!-- datatable-editor js 파일 -->
<script type="text/javascript" src="../resources/js/view/admin/datatable-editor.js"></script>

<script type="text/javascript">
var	table = null;
$(document).ready(function() {
	table=$('#foo-table').DataTable({
		  bAutoWidth : false, //자동너비
          ordering : true, //칼럼별 정렬
    		pagingType:"full_numbers",
    	   autoWidth: true,
        dom: 'Blfrtip',
  
		buttons: [
			{
				extend:'excel',
				text:'excel',
				filename:'결제정보',
				title:'오름마켓 결제정보'
			},
			{
				extend:'copy',
				text:'copy',
				title:'결제목록'
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
function selectDay(str){
 console.log("셀렉트 옵션값          "+str);
var t = new Date();
var _end=t.getFullYear()+'-'+(t.getMonth()+1)+'-'+t.getDate();
var _st;
var _key_word;

if(str=="all"){
	_key_word="all";
}else if(str=="toDay"){
	_st=t.getFullYear()+'-'+(t.getMonth()+1)+'-'+t.getDate();
	_key_word="toDay"
}else if(str=="1week"){
	t.setDate(t.getDate()-7)
	_st=t.getFullYear()+'-'+(t.getMonth()+1)+'-'+t.getDate();
	_key_word="week_month";
}else if(str=="2week"){
	t.setDate(t.getDate()-14)
	_st=t.getFullYear()+'-'+(t.getMonth()+1)+'-'+t.getDate();
	_key_word="week_month";
}else if(str=="1month"){
	t.setMonth(t.getMonth()-1)
	_st=t.getFullYear()+'-'+(t.getMonth()+1)+'-'+t.getDate();
	_key_word="week_month";
}

 console.log("버튼 선택후 포멧되어 나온 시작일            "+_st);
 console.log("버튼 선택후 포멧되어 나온 종료일            "+_end);
 console.log("버튼 선택후 포멧되어 나온 키워드            "+_key_word);

 location.href="selectSearch.do?key_word="+_key_word+"&st="+_st+"&end="+_end;
}

</script>
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
 <div class="box box-info">
            <div class="box-header">
              <h3 class="box-title">매출 조회
                <small></small>
              </h3>
           <!--    tools box -->
              <div class="pull-right box-tools">
                <button type="button" class="btn btn-info btn-sm" data-widget="collapse" data-toggle="tooltip" title="" data-original-title="Collapse">
                  <i class="fa fa-minus"></i></button>
                <button type="button" class="btn btn-info btn-sm" data-widget="remove" data-toggle="tooltip" title="" data-original-title="Remove">
                  <i class="fa fa-times"></i></button>
              </div>
          <!--     /. tools -->
            </div>
          <!--   /.box-header -->
            <div class="box-body pad" style="">
				<center>
        	<form action="searchPayList.do" mathod="get">
			  		<input type='date' name='startDate' id='startDate'/> ~ <input type='date' name='endDate' id='endDate'/> 
			  		 <button type="submit"  class="btn btn-danger btn-xs" id="searchDate">조회</button>&nbsp;&nbsp;
			   		</form> 
			   	<select name="searchOption" class="basic_btn btn-primary" onchange="selectDay(this.value)">
            		<option value=" ">조회선택</option>
            		<option value="all">전체조회</option>
            		<option value="toDay">당일</option>
           			<option value="1week">1주</option>
            		<option value="2week">2주</option>
            		<option value="1month">1달</option>
        			</select>  
			 </center>
      <div class="box">
          <!--   /.box-header -->
			<div class="box-body">
					<!-- 	페이지 내용 -->
				<div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
								<div class="row">
									<div>
										<table id="foo-table" class="display" style="width:100%">
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
								                    <th colspan="1" style="text-align:right;white-space:nowrap;">총 매출  : </th>
								                    <th colspan="2" style="text-align:right;white-space:nowrap;">${sumPrice}</th>
								                    <th colspan="1" style="text-align:right;white-space:nowrap;">일평균 매출  : </th>
								                    <th colspan="2" style="text-align:right;white-space:nowrap;">${avgPrice}</th>		                  
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
                   
           </div>
          </div>
          <!-- /.box -->

<!-- 2페이지 시작 -->
         <!--  <div class="box box-info">
            <div class="box-header">
              <h3 class="box-title">상품 조회
                <small></small>
              </h3>
              tools box
              <div class="pull-right box-tools">
                <button type="button" class="btn btn-info btn-sm" data-widget="collapse" data-toggle="tooltip" title="" data-original-title="Collapse">
                  <i class="fa fa-minus"></i></button>
                <button type="button" class="btn btn-info btn-sm" data-widget="remove" data-toggle="tooltip" title="" data-original-title="Remove">
                  <i class="fa fa-times"></i></button>
              </div>
              /. tools
            </div>
            /.box-header
            <div class="box-body pad" style="">
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
			
			
      <div class="box">
            /.box-header
		<div class="box-body">
				2페이지 내용
				
				
			</div>
            /.box-body
          </div>  
                   
           </div>
          </div> --> 
          <!--2페이지 끝  -->
          
          
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

</body>
</html>