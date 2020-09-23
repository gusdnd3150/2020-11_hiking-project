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
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>산오름</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/views/common/header.css">
</head>
<body>
<div class="container">
    <header>
        <div class="title-box">
            <div class="title">
                <a href="/"><h1>산오름</h1></a>
            </div>
        </div>
        <nav class="menu-bar">
            <ul>
                <li><a href="../group/groupMain.jsp">산 오르기</a></li>
                <li><a href="#">산 모임</a></li>
                <li><a href="#">오름 마켓</a></li>
                <li><a href="#">고객센터</a></li>
            </ul>
        </nav>

        <div class="login-box">
        <c:choose>
            <c:when test="${isLogOn == true  && member!= null}">
                <a href="${contextPath}/member/logout.do"><h3>로그아웃</h3></a>
                <a href="${contextPath}/member/loginForm.do"><h3>로그인</h3></a>
            </c:when>
            <c:otherwise>
                <a href="${contextPath}/member/loginForm.do"><h3>로그인</h3></a>
            </c:otherwise>
        </c:choose>
        </div>
    </header>
</div>

<hr color="green"/>