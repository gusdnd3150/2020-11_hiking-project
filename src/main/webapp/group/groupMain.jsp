<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<link rel="stylesheet" type="text/css" href="/resources/css/views/group/groupList.css" />
<body>
<div class="container">

    <div class="search_container">
        <div class="search_box">
            <h1>등산로 검색</h1>
            <div class="input_box">
                <input type="text" id="searchKeyword" placeholder="검색어 입력"></div>
                <button class="search_btn" id="search">검색</button>
            </div>
        </div>
    </div>

    <div class="list_wrap">
        <div class="list_title">
            <h1>추천 등산모임</h1>
        </div>
        <div class="list_content">
            <c:forEach var="list" items="${list}">
                <li class="item">
                    <img class="image" src="/group/media/${list.groupNum}"></img>
                    <div class="cont">
                        <strong>${list.name}</strong>
                        <p>${list.detail}</p>
                        <a href="/group/d">바로가기</a>
                    </div>
                </li>
            </c:forEach>
        </div>
    </div>
<div class="list_wrap">
    <div class="list_title">
        <h1>추천 등산로</h1>
    </div>
    <div class="list_content">
        <c:forEach var="list" items="${list}">
            <li class="item">
                <img class="image" src="/group/media/${list.groupNum}"></img>
                <div class="cont">
                    <strong>${list.name}</strong>
                    <p>${list.detail}</p>
                    <a href="#">바로가기</a>
                </div>
            </li>
        </c:forEach>
    </div>
</div>
</div>
</body>