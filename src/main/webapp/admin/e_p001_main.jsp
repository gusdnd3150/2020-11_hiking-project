<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
     <%
     request.setCharacterEncoding("utf-8");
      %>
<!DOCTYPE html>
<html>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<%@ include file="../include/head.jsp"%>

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
$(document).ready(function() {
	var	table = null;
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
    	});
	   datatableEdit({
			dataTable : table,
			columnDefs : [
				
				{
					targets : 5
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
	           
	          
	           var  date =  index['row'];
	           
	           var date1 = date+1;
	           
	           var tr = $("#foo-table tr:eq("+date1+")");
	           var _userNum = tr.find('td:eq(0)').text();
	          
	           console.log("회원번호"+_userNum);
	           console.log("수정 포인트"+changed);
	           
	           var regexp = /^[0-9]*$/
	           
	       	    if(regexp.test(changed)){
	   		   	 $("#msg").html("");
	   	       $.ajax({
	               type : 'get',
	               url : 'updateUserPoint.do',
	               data : {
	               	userNum : _userNum,
	               	point : changed
	               },
	               success : function(data) {
	               	if ("ok"== (data)) {
	               		console.log("포인트지급 완료");
	               		window.location.reload(true);
						} else {
							console.log("포인트지급 실패");
						};
	               	
	               }
	            })  
	   		 }else{
	   			alert("포인트는 숫만 입력가능합니다.")
	   			window.location.reload(true);
	   	 	}
	          
	     
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
     
        <small>회원 관리</small>
     
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
              <h3 class="box-title">회원 조회
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
		   	 <form action="searchUser.do" method="get">
		          <div class="input-group margin">
		                <div class="input-group-btn">
		                	<select name="searchOption" class="btn btn-info dropdown-toggle">
		            		<option value="all">전체검색</option>
		           			<option value="name">이름</option>
		            		<option value="id">아이디</option>
		           			<option value="address">주소</option>
		            		<option value="email">email</option>
		        			</select>
		                </div>
		                <input type="text" name="key_word" class="form-control" placeholder="조회내용을 입력하세요">
		                    <span class="input-group-btn">
		                      <button type="submit" class="btn btn-info btn-flat" >조회</button>
		                    </span>
		              </div>
		             </form>
      <div class="box">
          <!--   /.box-header -->
			<div class="box-body">
					<!-- 	페이지 내용 -->
				<div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
		            <table id="foo-table"  class="display" style="width:100%" >
						<thead>
					<tr>
		                <th>번호</th>
		                <th>아이디</th>
		                <th>이름</th>
		                <th>성별</th>
		                <th>전화</th>
		                <th>포인트</th>
		                <th>이메일</th>
		                <th>상태</th>
		                <th>상세보기</th>
		            </tr>
		            </thead>
		   
		             <tbody>
		                <c:forEach var="user" items="${userList}" >   
		                <tr>
		                  <td>${user.userNum}</td>
		                  <td>${user.id}</td>
		                  <td>${user.name}</td>
		                  <td>${user.sexType}</td>
		                  <td>${user.phone}</td>
		                  <td>${user.totalpoint}</td>
		                  <td>${user.email}</td>
		                  <td>
		                  <select  id="userStatus" class="basic_btn btn btn-default" onchange="user_status(this.value,${user.userNum})">
								<option value="10" ${user.statusType == '황동중' ? 'selected="selected"' : ''}>활동중</option>
								<option value="20" ${user.statusType == '휴면' ? 'selected="selected"' : ''}>휴면</option>
							</select>
						</td>
		                  <td><a href="userView.do?userNum=${user.userNum}" onclick="window.open(this.href,'','width=450, height=800'); return false;">
							<button type="button" class="btn btn-primary btn-xs">상세보기</button></a></td>
		                </tr>
		                 </c:forEach>
		                </tbody>
		              </table>
		
		              </div>
		              
		              </div>
		            </div>		
				</div>
           <!--  /.box-body -->
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
 <%@ include file="../include/main_footer.jsp" %>
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->
<%@ include file="../include/plugin_js.jsp" %>

</body>
</html>