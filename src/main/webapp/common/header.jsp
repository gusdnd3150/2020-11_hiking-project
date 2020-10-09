<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>산오름</title>
    <!-- ico,css -->
    <link rel="icon" href="../resources/img/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="../resources/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../resources/css/views/common/header.css" />
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
    <div class="container">
        <a class="navbar-brand" href="/">
            <img src="../resources/img/main-icon.svg" width="30" height="30" class="d-inline-block align-top" alt="" loading="lazy">
            산오름
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/group/main1.do">산오르기<span class="sr-only"></span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">산모임</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/B_P002_D001/shopMainCate?listType=10">오름마켓</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">고객센터</a>
                </li>
                <li class="nav-item">
                </li>

                <c:choose>
                    <c:when test="${not empty LOGIN}">
                <li class="nav-item">
                        <a class="nav-link" href="/user/logOut.do">로그아웃</a>
                </li>
                <li class="nav-item">
                        <a class="nav-link" href="/mypage/mypageHomeView.do">마이페이지</a>
                </li>
                    </c:when>
                    <c:otherwise>
                <li class="nav-item">
                        <a class="nav-link" href="/user/logInView.do">로그인</a>
                </li>
       
                    </c:otherwise>
                </c:choose>
                <button class="btn my-2 my-sm-0">
                    <a href="/search/main.jsp"><img src="../resources/img/search.png" width="25" height="25"></a>
                </button>
            </ul>
        </div>
    </div>
</div>
</nav>