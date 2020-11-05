<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script type="text/javascript">
 
    /* 로그아웃  */
function logout(){
	var result = confirm("로그아웃 하시겠습니까?");
	if(result ===true){
		 location.href="/user/logOut.do";
	}
};
</script>
<aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="/resources/dist/img/goodBoy.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>Admin</p>
          <!-- Status -->
          <a href=""><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>

		<div class="box-body">
              <button type="button" class="btn btn-danger  btn-block btn-sm" onclick="logout()">LogOut</button>
        </div>
            
      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">관리자 메뉴</li>
        <!-- Optionally, you can add icons to the links -->
        <li> <a href="/admin/searchUser.do?searchOption=userNum"><i class="fa fa-child"></i> <span>회원 관리</span></a></li>
        <li> <a href="/admin/selectProd.do?searchOption=all"><i class="fa fa-cart-plus"></i> <span>상품 관리</span></a></li>
        <li> <a href="/admin/csBoardsearch.do?searchOption=all"><i class="fa fa-list-ul"></i><span>게시글 관리</span></a></li>
        <li> <a href="/admin/selectOrder.do?searchOption=all"><i class="fa fa-link"></i> <span>주문 관리</span></a></li>
        <li> <a href="/admin/selectSearch.do?key_word=all"><i class="fa fa-won"></i> <span>매출 관리</span></a></li>
        <li> <a href="/admin/e_p006_main.jsp"><i class="fa fa-pie-chart"></i> <span>통계 현황</span></a></li>
       
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>