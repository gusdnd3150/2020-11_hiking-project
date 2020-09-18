<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
 <style>
        * {
            margin: 0;
            padding: 0;
            color: #000;
            box-sizing: border-box;
        }

        ul {
            list-style: none;
        }

        a {
            text-decoration: none;
            outline: none;
        }

        .container {
            width: 1440px;
            margin: 0 auto;
        }
        header {
            width: 100%;
            height: 80px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        header > h1 {
            margin-left: 20px;
        }

        header > nav {
            width: 600px;
            height: 100%;
        }
        header ul {
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: space-between;
        }

        header ul > li {
            font-size: 20px;
            height: 100%;
            display: flex;
            align-items: center;
        }

    </style>
<div class="container">
    <header>
        <div class="title-box">
            <div class="title">
                <h1>산오름</h1>
            </div>
            <!--            <div class="logo-container">-->
            <!--                <a href="#"><img src="./home.png"  /></a>-->
            <!--            </div>-->
        </div>
        <nav class="menu-bar">
            <ul>
                <li><a href="#">산 오르기</a></li>
                <li><a href="/group/lists">산 모임</a></li>
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