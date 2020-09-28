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
	<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
	<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
	<script src=https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js></script> <!--  이거 없으면 버튼 안생김  -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script><!--  //엑셀 -->
	<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script> <!-- // 카피+ pdf -->
	<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script><!--  // 프린트 -->
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script> <!--  // pdf -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script><!--  //pdf -->
    
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
    
    
   



	
    
<script type="text/javascript">

$(document).ready(function() {
    $('#foo-table').DataTable({
    	
    	"pagingType":"full_numbers",
    	  "autoWidth": true,
    	  "scrollY": true,
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
});



// 데이터테블 함수 끝----------------------------------------------------------------



$(document).on("click", "#uesr_id", function(){// 회원삭제 알림창
	  var id=$(this).val();
	  console.log(id)
	  $.ajax({
			type : 'get',
			url : 'removeUser.do',
			data : {
				id : id
			},
			success : function(data) {
				console.log(data)
				if (1 == (data)) {
					alert("삭제완료");
					window.location.reload(true);
				} else {
					alert("다시확인해주세요");
				};
			 }
		});
	});
	

	$(function msg(){ // 회원 수정 완료후 알림창
		var upDate="<c:out value="${upDateMsg}" />";
		console.log(upDate)
		if(upDate==1){
			alert("수정완료")
			window.location.href='http://localhost:8090/admin/e_p001_main.jsp';
		}
	});
	
	$(function msg(){ // 회원 등록완료
		var userName="<c:out value="${userName}" />";
		console.log(userName)
		if(userName==""||userName == null ||typeof userName == "undefined"){
			
		}else{
			alert(userName+" 회원 등록완료")
			window.location.href='http://localhost:8090/admin/e_p001_main.jsp';
		}
	});
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
           
              <div class="col-sm-6"><div id="example1_filter" class="dataTables_filter">
              
              <a href="e_p001_addUserForm.jsp"><button class="btn btn-primary btn-xs">회원등록</button></a>
              </div>
              </div>
              </div>                                        
              <div class="row">
             <div>
            <table id="foo-table" class="table table-bordered">
				<thead>
			<tr>
                <th>회원 번호</th>
                <th>회원 아이디</th>
                <th>회원 비밀번호</th>
                <th>회원 이름</th>
                <th>회원 성별</th>
                <th>회원 전화번호</th>
                <th>회원 주소</th>
                <th>회원 이메일</th>
                <th>회원 유형</th>
                <th>회원 등록일자</th>
                <th>회원 수정일자</th>
                <th>회원 상태</th>
                <th>수정</th>
                <th>삭제</th>
            </tr>
            </thead>
   
             <tbody>
                <c:forEach var="user" items="${userList}" >   
                <tr>
                  <td>${user.userNum}</td>
                  <td>${user.id}</td>
                  <td>${user.password}</td>
                  <td>${user.name}</td>
                  <td>${user.sexType}</td>
                  <td>${user.phone}</td>
                  <td>${user.address}</td>
                  <td>${user.email}</td>
                  <td>${user.usersType}</td>
                  <td>${user.createdAtString}</td>
                  <td>${user.updatedAtString}</td>
                  <td>${user.statusType}</td>
                  <td><a href="upDateUserList.do?userNum=${user.userNum}"><button class="btn btn-primary btn-xs">수정</button></a></td>
                  <td><button class="btn btn-danger btn-xs"id="uesr_id" value="${user.id}">삭제</button></td>
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