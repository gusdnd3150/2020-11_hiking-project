<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%> 


<!DOCTYPE html>

<html>
<head>
 <script src="<c:url value="/resource/vendor/jquery/jquery.min.js" />"></script> 
 <script src="<c:url value="/resource/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/vendor/bootstrap/css/bootstrap.min.css">
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/shop-homepage.css">
<style>
 

 
  .topnav a, .topnav input[type=text], .topnav .search-container button {
    float: none;
    display: block;
    text-align: left;
    width: 100%;
    margin: 0;
    padding: 14px;
    
  }
 body {
  margin: 0;
  font-family: "Lato", sans-serif;
  background-color: #f1f1f1;
}

.sidebar {
  margin: 0;
  padding: 0;
  width: 200px;
  background-color: #f1f1f1;
  height: 100%;
  overflow: auto; 
  position:fixed;
}

.sidebar a {
  display: block;
  color: black;
  padding: 16px;
  text-decoration: none;
}
 
.sidebar a.active {
  background-color: #4CAF50;
  color: white;
}

.sidebar a:hover:not(.active) {
  background-color: #555;
  color: white;
}

div.content {
  margin-left: 200px;
  padding: 1px 16px;
  height: 1000px;
}

@media screen and (max-width: 700px) {
  .sidebar {
    width: 100%;
    height: auto;
    position: relative;
  }
  .sidebar a {float: left;}
  div.content {margin-left: 0;}
}

@media screen and (max-width: 400px) {
  .sidebar a {
    text-align: center;
    float: none;
  }
}
 
 </style>
  <meta charset="UTF-8">
  <title>사이드 메뉴</title>
</head>

<body>
  <div class="sidebar">
  <a href="${contextPath}/B_P002_D001/shopMain.do" style="font-size:15px;text-decoration:none">전체상품보기</a><br>
  <a href="#services" style="font-size:13px;text-decoration:none">아웃도어</a><br>
  <a href="#clients" style="font-size:13px;text-decoration:none">등산스틱</a><br>
  <a href="#contact" style="font-size:13px;text-decoration:none">등산화</a><br>
  <a href="#contact" style="font-size:13px;text-decoration:none">등산 장갑</a><br>
  <a href="#contact" style="font-size:13px;text-decoration:none">등산 가방</a><br>
  <a href="#contact" style="font-size:13px;text-decoration:none">양말</a><br>
  <a href="#contact" style="font-size:13px;text-decoration:none">보호대</a><br>
  <hr align="center">
  <br>
  <a href="#contact" style="font-size:13px;text-decoration:none">중고물픔 등록</a>
</div> 


</body>
</html>