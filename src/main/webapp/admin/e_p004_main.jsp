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

<!-- datatable-editor js 파일 -->
<script type="text/javascript" src="../resources/js/view/admin/datatable-editor.js"></script>

<script type="text/javascript">
/* 주문조회 데이터 테이블 */
var	table = null;
$(document).ready(function() {
	table=$('#foo-table').DataTable({
		pagingType:"full_numbers",
    	   autoWidth: false,
		dom : 'Blfrtip',
		buttons : [ {
			extend : 'excel',
			text : 'excel',
			filename : '회원정보',
			title : '산오름 회원정보'
		}, {
			extend : 'copy',
			text : 'copy',
			title : '회원정보입니다.'
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
/* 취소 요청 데이터 테이블 */
var	table2 = null;
$(document).ready(function() {
	table2=$('#foo-table2').DataTable({
		pagingType:"full_numbers",
    	   autoWidth: false,
		dom : 'Blfrtip',
		buttons : [ {
			extend : 'excel',
			text : 'excel',
			filename : '회원정보',
			title : '산오름 회원정보'
		}, {
			extend : 'copy',
			text : 'copy',
			title : '회원정보입니다.'
		}, 'pdf', 'print' ]
	});
	
	  $('#foo-table tbody2').on( 'click', 'tr', function () {
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
	
	 location.href="selectOrderDay.do?key_word="+_key_word+"&startDate="+_st+"&endDate="+_end;
}

	//배송상태 변경
	function deliverystatus(_value, _orderNum, phone, name){
		
		var result = _value;
		if (result == 300){
			message(phone,name);
		}
		
		
	    $.ajax({
	           type : 'get',
	           url : 'updateDelivery.do',
	           data : {
	        	deliverystatus : _value,
	           	orderNum : _orderNum	          
	           },
	           success : function(data) {
	           	if ("ok"== (data)) {
	           		console.log("수정완료");
	           		//window.location.reload(true);
					} else {
						console.log("수정 실패");
					};
	             }
	        })
	};
	
	//주문상태별 조회
	function orderStatusOption(_value){
		
		location.href="selectOrderStatus.do?orderStatus="+_value;
	};
	
	//배송 상태별 조회
	function deliverystatusOption(_value){
		location.href="selectDeliveryStatus.do?deliverystatus="+_value;
	}
	
	//배송 완료시 문자 발송
	function message(_phone,_name){
		$.ajax({
	           type : 'get',
	           url : 'message.do',
	           data : {
	        	 phone : _phone,
	        	name : _name	          
	           },
	           success : function(data) {
	           	if ("ok"== (data)) {
	           		console.log("배송완료 메세지 발송 완료");
	           		//window.location.reload(true);
					} else {
						console.log("배송완료 메세지 발송 실패");
					};
	             }
	        })
		
	}
	//결제 취소요청 상세보기 팝업
	$(document).on("click", "#viewCancelList", function() {
		var num = $(this).val();
		window.open("viewCancelList.do?merchant_uid="+num, '취소요청상세보기','width=700px,height=800px,scrollbars=yes');
		
	});
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
     
        <small>주문 관리</small>
     
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
          <div class="box box-info ">
            <div class="box-header">
              <h3 class="box-title">취소 요청
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
   	<div id="example1_wrapper"class="dataTables_wrapper form-inline dt-bootstrap">
									<table id="foo-table2" class="display" style="width:100%">
										<thead align=center>
										<tr>
											<th>승인번호</th>
											<th>주문일자</th>
											<th>고객정보</th>
											<th>주문정보</th>
											<th>상세 보기</th>
										</tr>
										</thead>
										 <tbody align=center>
							                <c:forEach var="cancel" items="${cancelOrde}" >   
							                <tr>
							                  <td>${cancel.merchant_uid}</td>
							                  <td>${cancel.orderDatString}</td>
							                  <td>
							                      <strong>이름:${cancel.custName}</strong><br>
							                      <strong>전화번호:${cancel.custPhone}</strong><br>
												  <strong>우편번호:${cancel.zoneCode}</strong><br>
												  <strong>주소:${cancel.address}</strong><br>
												  <strong>상세주소:${cancel.address2}</strong><br>
							                  </td>
							                  <td>
							                      <strong>상품명:${cancel.prodCount}</strong><br>
							                      <strong>결제금액:${cancel.totalpay}</strong><br>
												  <strong><img src="/resources/img/${cancel.pcontent}" style="width: 90px; height: 90px; display: block;"></strong><br>
							                  </td>
							              <td><button class="btn btn-primary btn-xs" id="viewCancelList" value="${cancel.merchant_uid}">상세보기</button></td>		
							                </tr>
							                 </c:forEach>
							                </tbody>
									</table>
								</div>
            			</div>
          		</div>
          <!-- /.box -->
          

          <div class="box box-info">
            <div class="box-header">
              <h3 class="box-title">주문 조회
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
             <form action="selectOrder.do" method="get">
					<div class="input-group margin">
						<div class="input-group-btn">
							<select name="searchOption" id="searchOption"class="btn btn-info dropdown-toggle" >
								<option value="all">전체조회</option>
								<option value="orderNum">주문번호</option>
								<option value="userName">고객명</option>
								<option value="prodName">상품명</option>
								<option value="address">주소</option>
								<option value="zoneCode">우편번호</option>
								<option value="address2">상세주소</option>
							</select>
						</div>
						<input type="text" name="key_word" id="key_word"class="form-control" placeholder="조회내용을 입력하세요">
						<span class="input-group-btn">
		                      <button type="submit" id="serch"class="btn btn-info btn-flat" >조회</button>
		                    </span>
					</div>
					</form>
				
					<div>
						<div class="m1 main_common">
	        			 <form action="searchOrderDay.do" mathod="get">
	        			 	&nbsp;&nbsp;
					  		<strong>일자별 조회 :</strong><input type='date' name='startDate' id='startDate'/> ~ <input type='date' name='endDate' id='endDate'/>
					  		 	&nbsp;<button type="submit"  class="btn btn-danger btn-xs" id="searchDate">조회</button>&nbsp;&nbsp;
					   		</form>
					   	</div>&nbsp;&nbsp;	
						   	<div class="m2 main_common">
							   	<strong  style="color:#111111">
								   	 <input type="radio"  name="dayType" value="all" onclick="selectDay(this.value)"> 전체조회 &nbsp;&nbsp;
								   	 <input type="radio"  name="dayType" value="toDay" onclick="selectDay(this.value)"> 당일 &nbsp;&nbsp;
								   	 <input type="radio"  name="dayType" value="1week" onclick="selectDay(this.value)"> 1주일 &nbsp;&nbsp;
								   	 <input type="radio"  name="dayType" value="2week" onclick="selectDay(this.value)"> 2주일 &nbsp;&nbsp;
								   	 <input type="radio"  name="dayType" value="1month" onclick="selectDay(this.value)"> 1달 &nbsp;&nbsp;
		                         </strong>
			        		</div>
		        		</div>
		        		<br>
		        		
		        		<div>
		        		&nbsp;&nbsp;
		        		<strong>상태별 조회 :</strong>
			        		<div class="m3 main_common">
				        		<select name="orderStatusOption" class="basic_btn btn-primary" onchange="orderStatusOption(this.value)">
				            		<option value=" ">주문상태</option>
				            		<option value="1">결제전</option>
				            		<option value="2">결제완료</option>
				           			<option value="3">결제취소</option>
				        		</select>
			        		</div>
		        		<div class="m4 main_common"> 
		        		<select name="deliverystatusOption" class="basic_btn btn-primary" onchange="deliverystatusOption(this.value)">
		            		<option value=" ">배송상태</option>
		            		<option value="100">배송대기</option>
		           			<option value="200">배송준비</option>
		           			<option value="300">배송완료</option>
		           			<option value="400">배송취소</option>
		        		</select>  
        		   		</div>
			   </div>
			   <br>
			   <!--지정일자 및 상태별 조회 css 수정해야함  -->
            <div class="box">
    
            <!-- /.box-header -->
            <div class="box-body">
	<!-- 	페이지 내용 -->
						<div id="example1_wrapper"class="dataTables_wrapper form-inline dt-bootstrap">
		
									<table id="foo-table" class="display" style="width:100%">
										<thead align=center>
										<tr>
											<th>주문번호</th>
											<th>주문일자</th>
											<th>고객정보</th>
											<th>주문정보</th>
											<th>주문상태</th>
											<th>배송상태</th>
											<!-- <th>상세 보기</th> -->
										</tr>
										</thead>
										 <tbody align=center>
							                <c:forEach var="order" items="${list}" >   
							                <tr>
							                  <td>${order.orderNum}</td>
							                  <td>${order.orderDatString}</td>
							                  <td>
							                      <strong>이름:${order.custName}</strong><br>
							                      <strong>전화번호:${order.custPhone}</strong><br>
												  <strong>우편번호:${order.zoneCode}</strong><br>
												  <strong>주소:${order.address}</strong><br>
												  <strong>상세주소:${order.address2}</strong><br>
							                  </td>
							                  <td>
							                      <strong>상품명:${order.prodName}</strong><br>
												  <strong>사이즈:${order.prodSize}</strong><br>
												  <strong>색상:${order.color}</strong><br>
												  <strong>수량:${order.quantity}</strong><br>
												  <strong><img src="/resources/img/${order.content}" style="width: 80px; height: 80px; display: block;"></strong><br>
							                  </td>
							                  <td>
							                  <c:if test="${order.orderStatusString eq '결제완료'}">
							                  <span class="label label-warning">${order.orderStatusString = "결제완료"}</span>
							                  </c:if>
							                  <c:if test="${order.orderStatusString eq '결제취소'}">
							                  <span class="label label-danger">${order.orderStatusString = "결제취소"}</span>
							                  </c:if>
							                  </td>
							                  <td>
							                   <select  id="deliverystatus" class="basic_btn btn-primary" onchange="deliverystatus(this.value,'${order.orderNum}','${order.custPhone}','${order.custName}')">
													<option value="100"  ${order.deliverystatus == 100 ? 'selected="selected"' : ''}>배송대기</option>
													<option value="200"  ${order.deliverystatus == 200 ? 'selected="selected"' : ''}>배송준비</option>
													<option value="300"  ${order.deliverystatus == 300 ? 'selected="selected"' : ''}>배송완료</option>
												</select>
							                  </td>
							                <%--   <td><button class="btn btn-primary btn-xs" id ="view" onclick="location.href='viewOrderList.do?orderNum=${order.orderNum}'">상세보기</button></td --%> 		
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