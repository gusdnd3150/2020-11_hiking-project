<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <script type="text/javascript">
 //상단 헤더부분 알림 아이콘 실행
/*   var timer = setInterval(function(){
	 count();
 }, 5000);   */
 
 //알림 카운트
 function count(){
	 console.log("알림 카운트 함수 실행");
	 //문의글 알림
	 $.ajax({
			type : 'post',
			url : 'countBoard.do',
			success : function(data) {
				  $('#inquiry').text(data);

			}
		});
	 
	 //중고요청 알림
	 $.ajax({
			type : 'post',
			url : 'countUsed.do',
			success : function(data) {
				  $('#countUsed').text(data);
			}
		});
	 
	 //신고글 알림
	 $.ajax({
			type : 'post',
			url : 'countBoard300.do',
			success : function(data) {
				  $('#count300').text(data);
			}
		});
	 
 	}
</script>
<style>
.main-header .navbar {
    background-color: rgb(23, 131, 150) !important;
}
.main-header .logo:hover {
    background-color: rgb(23, 131, 150) !important;
}
.main-header .logo{
background-color: rgb(23, 131, 150) !important;
}
.main-header .navbar .sidebar-toggle:hover {
    background-color: rgb(23, 131, 150) !important;
}
</style>
  
<header class="main-header">

    <!-- Logo -->
    <a href="/admin/admin_home.jsp" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>산</b></span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>산오름</b>관리자</span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          <li class="dropdown messages-menu">
            <!-- Menu toggle button -->
            <a href="/admin/csBoardsearch.do?searchOption=count" title="문의글">
              <i class="fa fa-envelope-o"></i>
      <!--0000000000000000000000000000000000000000        문의글   00000000000000000000000000000000000000000000000000000000000  -->
              <span class="label label-success" id="inquiry">0</span>
            </a>
            </li>
      
          <!-- /.messages-menu -->

          <!-- Notifications Menu -->
          <li class="dropdown notifications-menu">
            <!-- Menu toggle button -->
            <a href="/admin/selectUsedProd.do?searchOption=a" title="중고요청">
              <i class="fa fa-bell-o"></i>
              <!--0000000000000000000000000000000000000000   중고요청카운트   00000000000000000000000000000000000000000000000000000000000  -->
              <span class="label label-warning" id="countUsed">0</span>
            </a>
          </li>
          <!-- Tasks Menu -->
          <li class="dropdown tasks-menu">
            <!-- Menu Toggle Button -->
            <a href="/admin/csBoardsearch.do?searchOption=count300" title="신고글">
              <i class="fa fa-flag-o"></i>
                <!--0000000000000000000000000000000000000000   ????  00000000000000000000000000000000000000000000000000000000000  -->
              <span class="label label-danger" id="count300">0</span>
            </a>
          
          </li>
          <!-- User Account Menu -->
          <li class="dropdown user user-menu">
            <!-- Menu Toggle Button -->
            <a href="#"  >
              <!-- The user image in the navbar-->
              <img src="/resources/dist/img/goodBoy.jpg" class="user-image" alt="User Image">
              <!-- hidden-xs hides the username on small devices so only the image appears. -->
              <span class="hidden-xs">Admin</span>
            </a>
            
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" ><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>
    </nav>
  </header>