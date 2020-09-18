<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">


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
		}
	})
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
    
    <%@ include file="../include/user_search.jsp" %>

<div class="box">
            <div class="box-header">
              <h3 class="box-title">Data Table With Full Features</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
              <div class="row">
              <div class="col-sm-6">
              <div class="dataTables_length" id="example1_length">
              <label>Show <select name="example1_length" aria-controls="example1" class="form-control input-sm">
              <option value="10">10</option>
              <option value="25">25</option>
              <option value="50">50</option>
              <option value="100">100</option>
              </select> 
              entries
              </label>
              </div>
              </div>
              <div class="col-sm-6"><div id="example1_filter" class="dataTables_filter">
              <label>Search:<input type="search" class="form-control input-sm" placeholder="" aria-controls="example1"></label>
              </div>
              </div>
              </div>                                        
              <div class="row">
              <div class="col-sm-12">
              <table id="example1" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                <thead>
                <tr role="row">
                <th  tabindex="0"  rowspan="1" colspan="1"  style="width: 25px;">회원 번호</th>
                <th  tabindex="0"  rowspan="1" colspan="1"  style="width: 25px;">회원 아이디</th>
                <th class="sorting" tabindex="0"  rowspan="1" colspan="1"  style="width: 10px;">회원 비밀번호</th>
                <th class="sorting" tabindex="0"  rowspan="1" colspan="1"  style="width: 10px;">회원 이름</th>
                <th class="sorting" tabindex="0"  rowspan="1" colspan="1"  style="width: 10px;">회원  성별</th>
                <th class="sorting" tabindex="0"  rowspan="1" colspan="1"  style="width: 10px;">회원 전화번호</th>
                <th class="sorting" tabindex="0"  rowspan="1" colspan="1"  style="width: 10px;">회원 주소</th>
                <th class="sorting" tabindex="0"  rowspan="1" colspan="1"  style="width: 25px;">회원 이메일</th>
                <th class="sorting" tabindex="0"  rowspan="1" colspan="1"  style="width: 25px;">회원 유형</th>
                <th class="sorting" tabindex="0"  rowspan="1" colspan="1"  style="width: 25px;">회원 등록일자</th>
                <th class="sorting" tabindex="0"  rowspan="1" colspan="1"  style="width: 25px;">회원 수정일자</th>
                <th class="sorting" tabindex="0"  rowspan="1" colspan="1"  style="width: 25px;">회원 상태</th>
                <th class="sorting" tabindex="0"  rowspan="1" colspan="1"  style="width: 25px;">수정</th>
                <th class="sorting" tabindex="0"  rowspan="1" colspan="1"  style="width: 25px;">삭제</th>
       
   
                </thead>
                <tbody>
                <c:forEach var="user" items="${userList}" >   
                <tr role="row" class="odd">
                  <td class="sorting_1">${user.userNum}</td>
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
                  <td><a href="upDateUserList.do?userNum=${user.userNum}"><button>수정</button></a></td>
                  <td><button id="uesr_id" value="${user.id}">삭제하기</button></td>
                </tr>
                 </c:forEach>
                </tbody>
                <tfoot>
                <tr>
                </tfoot>
              </table>
              </div>
              </div>
            </div>
          </div>

<%-- <table border="1"  align="center"  width="80%">
    <tr align="center"   bgcolor="lightgreen">
      <td ><b>회원번호</b></td>
      <td><b>회원아이디</b></td>
      <td><b>회원비밀번호</b></td>
      <td><b>회원이름</b></td>
      <td><b>회원성별</b></td>
      <td><b>회원전화번호</b></td>
      <td><b>회원주소</b></td>
      <td><b>회원이메일</b></td>
      <td><b>회원유형</b></td>
      <td><b>등록일자</b></td>
      <td><b>수정일자</b></td>
      <td><b>회원상태</b></td>
      <td><b>수정</b></td>
      <td><b>삭제</b></td>
   </tr>
   
 <c:forEach var="user" items="${userList}" >     
   <tr align="center">
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
      <td><a href="upDateUserList.do?userNum=${user.userNum}"><button>수정</button></a></td>
      <td><button id="uesr_id" value="${user.id}">삭제하기</button></td>
    </tr>
  </c:forEach>
</table>
<a  href="">회원가입</h1></a> --%>

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