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
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/views/common/header.css" />
    <style>
        body {padding-top: 70px;} footer {padding-left: 15px;padding-right: 15px;} @media screen and (max-width: 768px) { /* 4. 모바일용 레이아웃이 되었을때 적용되는 CSS */ .row-offcanvas { position: relative; -webkit-transition: all 0.25s ease-out; -moz-transition: all 0.25s ease-out; transition: all 0.25s ease-out; } .row-offcanvas-right .sidebar-offcanvas {right: -50%;} .row-offcanvas-left .sidebar-offcanvas {left: -50%;} .row-offcanvas-right .active {right: 50%;} .row-offcanvas-left .active {left: 50%;} .sidebar-offcanvas {position: absolute; top: 0; width: 50%;} }

    </style>
</head>
<body>
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom box-shadow">
    <header>
        <h1 class="my-0 mr-md-auto font-weight-normal">산오름</h1>
        <nav class="my-2 my-md-0 mr-md-3">
            <a class="p-2 text-dark" href="/group/list.do">산 오르기</a>
            <a class="p-2 text-dark" href="#">산 모임</a>
            <a class="p-2 text-dark" href="#">오름 마켓</a>
            <a class="p-2 text-dark" href="#">고객센터</a>
            <form action="/search" method="post" >
                <input type="text" name="keyword">
                <input type="submit" value="검색">
            </form>
        </nav>
        <c:choose>
            <c:when test="${not empty LOGIN}">
                <a class="btn btn-outline-primary" href="${contextPath}/user/logOut"><h3>로그아웃</h3></a>
                <a class="btn btn-outline-primary" href="${contextPath}/mypage/mypageHome"><h3>마이페이지</h3></a>
            </c:when>
            <c:otherwise>
                <a class="btn btn-outline-primary" href="${contextPath}/user/logInView"><h3>로그인</h3></a>
                <a class="btn btn-outline-primary" href="${contextPath}/user/signUpView"><h3>회원가입</h3></a>
            </c:otherwise>
        </c:choose>
        </div>
    </header>
</div>

<hr color="green"/>