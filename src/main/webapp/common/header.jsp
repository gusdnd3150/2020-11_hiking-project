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
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top p-0">
    <div class="container">
        <a class="navbar-brand" href="/">
            <img src="../resources/img/main-icon.svg" width="50" height="50" class="d-inline-block align-top" alt="" loading="lazy" style="float: left">
            <p class="m-0 p-1" style="font: 30pt 'fromdamiM'; float: left">산오름</p>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive" style="font-size: 20px">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/group/main1.do">산오르기<span class="sr-only"></span></a>
                    <ul id="sub-menu">
                        <li style="font-size: 16px"><a class="nav-link" href="/group/main1.do">등산가기<span class="sr-only"></span></a></li>
                        <li style="font-size: 16px"><a class="nav-link" href="/after/main.do">후기<span class="sr-only"></span></a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/commu/commuMainView.do">산모임</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/B_P002_D001/shopMainCate?listType=100">오름마켓</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../board/board.jsp">고객센터</a>
                </li>
                <li class="nav-item">
                </li>

                <c:choose>
                    <c:when test="${not empty LOGIN}">
                        <c:if test="${LOGIN eq 'admin'}">
                            <li class="nav-item">
                                <a class="nav-link" href="/admin.do">관리자페이지</a>
                            </li>
                        </c:if>
                        <c:if test="${LOGIN ne 'admin'}">
                            <li class="nav-item">
                                    <a class="nav-link" href="/mypage/mypageHomeView.do">마이페이지</a>
                            </li>
                        </c:if>
                        <li class="nav-item">
                            <a class="nav-link" href="/user/logOut.do">로그아웃</a>
                        </li>
                    </c:when>
                    <c:otherwise>
                <li class="nav-item">
                        <a class="nav-link" href="/user/logInView.do">로그인</a>
                </li>
                    </c:otherwise>
                </c:choose>
                <button class="btn my-2 my-sm-0">
                    <a href="/search/main.jsp">
                        <img src="../resources/img/search.png" width="25" height="25" onclick="">
                    </a>
                </button>
            </ul>
        </div>
    </div>
</div>
</nav>