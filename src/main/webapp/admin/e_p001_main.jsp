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

function user_status(value,_userNum){
	 $.ajax({
			type : 'get',
			url : 'upDateUser.do',
			data : {
				userNum : _userNum,
				status : value
			},
			success : function(data) {
				if ("ok"== (data)) {
					console.log("수정완료");
				} else {
					alert("다시확인해주세요");
				}
				;
			}
		});
	}
	

</script>
<style>


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
        <small>회원관리</small>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
      </ol>
    </section>

    <!-- Main content -->
    <div class="box">
    <%@ include file="../include/user_search.jsp" %>

            <div class="box-header">
              <h3 class="box-title">회원 목록</h3>
            </div>

            <!-- /.box-header -->
            <div class="box-body">
              <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
              <div class="row">
             <div>
            <table id="foo-table"  class="display" style="width:100%" >

				<thead>
			<tr>
                <th>번호</th>
                <th>아이디</th>
                <th>이름</th>
                <th>성별</th>
                <th>전화</th>
                <th>주소</th>
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
                  <td>${user.address}</td>
                  <td>${user.email}</td>
                  <td>
                  <select  id="userStatus" class="basic_btn btn btn-default" onchange="user_status(this.value,${user.userNum})">
						<option value="10" ${user.statusType == '황동중' ? 'selected="selected"' : ''}>활동중</option>
						<option value="20" ${user.statusType == '휴면' ? 'selected="selected"' : ''}>휴면</option>
					</select>
				</td>
                  <td><a href="userView.do?userNum=${user.userNum}" onclick="window.open(this.href,'','width=450, height=800'); return false;">
					<button type="button" class="basic_btn btn-primary">상세보기</button></a></td>
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
 <%@ include file="../include/main_footer.jsp" %>
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->
<%@ include file="../include/plugin_js.jsp" %>

</body>
</html>