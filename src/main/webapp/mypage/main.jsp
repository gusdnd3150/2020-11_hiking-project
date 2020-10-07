<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<jsp:include page="/common/header.jsp"/>
<link rel="stylesheet" type="text/css" href="../resources/css/views/mypage/main.css">
<div id=mypageMain" class="container pt-5 col-md-2 col-lg-2">
    <div class="row pt-5">
        <img id="profilePhoto" class="rounded-circle" src="/mypage/contentView.do" width="150" height="150" alt="profile">
        <a class="col-12" href="#">프로필수정</a>
    </div>
    <!-- 패널 타이틀1 -->
    <div class="pt-5 panel panel-info">
        <!-- 사이드바 메뉴목록1 -->
        <ul class="list-group">
            <li class="list-group-item"><a href="#">내 정보 수정</a></li>
            <li class="list-group-item"><a href="#">내가 찜한 등산로</a></li>
            <li class="list-group-item"><a href="#">내가 찜한 등산모임</a></li>
        </ul>
    </div>
</div>
</body>
</html>