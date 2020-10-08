<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

      <!-- search form (Optional) -->
      <form action="/admin" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
          <span class="input-group-btn">
              <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
              </button>
            </span>
        </div>
      </form>
      <!-- /.search form -->

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">관리자 메뉴</li>
        <!-- Optionally, you can add icons to the links -->
        <li> <a href="/admin/e_p001_main.jsp"><i class="fa fa-child"></i> <span>회원 관리</span></a></li>
        <li> <a href="/admin/e_p002_main.jsp"><i class="fa fa-cart-plus"></i> <span>상품 관리</span></a></li>
        <li> <a href="/admin/e_p003_main.jsp"><i class="fa fa-list-ul"></i><span>게시글 관리</span></a></li>
        <li> <a href="#"><i class="fa fa-link"></i> <span>주문 관리</span></a></li>
        <li> <a href="/admin/e_p005_main.jsp"><i class="fa fa-won"></i> <span>매출 관리</span></a></li>
        <li> <a href="/admin/e_p006_main.jsp"><i class="fa fa-pie-chart"></i> <span>통계 현황</span></a></li>
       
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>