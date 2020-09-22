<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

<!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/resources/css/shop-homepage.css" rel="stylesheet">
  <!-- Bootstrap core JavaScript -->
   <script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script> 
  <script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
  
  
  
  
  
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}
.column {
  float: left;
  width: 50%;
  padding: 10px;
  height: 300px; /* Should be removed. Only for demonstration */
}
.row:after {
  content: "";
  display: table;
  clear: both;
}

ul{
   list-style:none;
   padding-left:0px;
   }


/* Style the tab */
.tab {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
}

</style>
<script>
function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}
</script>
</head>
<body>

<h2>주문 상세</h2>

<div class="row"> 

    <img class="column" src="resource/image/images.jpg" width="600" height="900" alt="">
  <div class="column" style="background-color:#bbb;">
    <h2>상품</h2>
    <hr>
    <ul>
    <li>아이젠4p/골드 등산용품/원버클</li>
    <li><b>22,000원</b></li>
    <hr>
    <li><b>적립 포인트 4p</b></li>
    <hr>
    <li>
    <form>
    수량: <input type="text" name="count">
    <table align="center">
    <tr>
    <td><button>장바구니</button></td>
     <td><button>구매하기</button></td>
     <td><button>위시리스트</button></td>
    </tr>
    </table>
    </form>
    </li>
    </ul>
  </div>
</div>

<br>
<br>
<br>

<div class="tab">
  <button class="tablinks" onclick="openCity(event, 'London')">상품후기</button>
  <button class="tablinks" onclick="openCity(event, 'Paris')">제품설명</button>
</div>

<div id="London" class="tabcontent">
  <h3>상품후기</h3>
  <div class="row"> 

    <img class="column" src="resource/image/images.jpg" width="600" height="900" alt="">
  <div class="column" style="background-color:#bbb;">
    <h2>상품</h2>
    <hr>
    <ul>
    <li>아이젠4p/골드 등산용품/원버클</li>
    <li><b>22,000원</b></li>
    <hr>
    <li><b>적립 포인트 4p</b></li>
    <hr>
    <li>
    <form>
    <table align="center">
    <tr>
    <td>수량:</td>
    </tr>
    <tr>
    <td><button>장바구니</button></td>
     <td><button>구매하기</button></td>
     <td><button>위시리스트</button></td>
    </tr>
    </table>
    </form>
    </li>
    </ul>
  </div>
</div>
  <p>London is the capital city of England.</p>
  <p>London is the capital city of England.</p>
  <p>London is the capital city of England.</p>
  <p>London is the capital city of England.</p>
  <p>London is the capital city of England.</p>
  <p>London is the capital city of England.</p><p>London is the capital city of England.</p>
</div>

<div id="Paris" class="tabcontent">
  <h3>제품설명</h3>
  <p>Paris is the capital of France.</p> 
  <p>London is the capital city of England.</p>
  <p>London is the capital city of England.</p>
  <p>London is the capital city of England.</p>
  <p>London is the capital city of England.</p>
  <p>London is the capital city of England.</p>
  <p>London is the capital city of England.</p>
  <p>London is the capital city of England.</p>
  
</div>



</body>
</html>
