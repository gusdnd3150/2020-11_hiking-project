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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>산오름</title>
<%--    <link rel="shortcut icon" href="http://localhost:8080/favicon.ico">--%>
    <link rel="icon" href="../resources/img/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="../resources/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../resources/css/views/common/header.css" />
    <script src="../resources/js/jquery.js"></script>
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
                    <a class="nav-link" href="/group/list.do">산오르기</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">산모임</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">오름마켓</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">고객센터</a>
                </li>
                <li class="nav-item">
                </li>

                <c:choose>
                    <c:when test="${not empty LOGIN}">
                <li class="nav-item">
                        <a class="nav-link" href="${contextPath}/user/logOut">로그아웃</a>
                </li>
                <li class="nav-item">
                        <a class="nav-link" href="${contextPath}/mypage/mypageHome">마이페이지</a>
                </li>
                    </c:when>
                    <c:otherwise>
                <li class="nav-item">
                        <a class="nav-link" href="${contextPath}/user/logInView">로그인</a>
                </li>
                <li class="nav-item">
                        <a class="nav-link" href="${contextPath}/user/signUpView">회원가입</a>
                </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</div>
</nav>
<%--<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom box-shadow">--%>
<%--        <h1 class="my-0 mr-md-auto font-weight-normal">산오름</h1>--%>
<%--        <nav class="my-2 my-md-0 mr-md-3">--%>
<%--            <a class="p-2 text-dark" href="/group/list.do">산 오르기</a>--%>
<%--            <a class="p-2 text-dark" href="#">산 모임</a>--%>
<%--            <a class="p-2 text-dark" href="#">오름 마켓</a>--%>
<%--            <a class="p-2 text-dark" href="#">고객센터</a>--%>
<%--            <form action="/search" method="post" >--%>
<%--                <input type="text" name="keyword">--%>
<%--                <input type="submit" value="검색">--%>
<%--            </form>--%>
<%--        </nav>--%>
<%--        <c:choose>--%>
<%--            <c:when test="${not empty LOGIN}">--%>
<%--                <a class="btn btn-outline-primary" href="${contextPath}/user/logOut"><h3>로그아웃</h3></a>--%>
<%--                <a class="btn btn-outline-primary" href="${contextPath}/mypage/mypageHome"><h3>마이페이지</h3></a>--%>
<%--            </c:when>--%>
<%--            <c:otherwise>--%>
<%--                <a class="btn btn-outline-primary" href="${contextPath}/user/logInView"><h3>로그인</h3></a>--%>
<%--                <a class="btn btn-outline-primary" href="${contextPath}/user/signUpView"><h3>회원가입</h3></a>--%>
<%--            </c:otherwise>--%>
<%--        </c:choose>--%>
<%--        </div>--%>
<%--</div>--%>