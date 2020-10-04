<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<jsp:include page="/common/header.jsp" />
<link rel="stylesheet" type="text/css" href="/resources/css/views/group/main.css" />
<body class="pt-5 mt-5">
<div class="container">
    <div class="btn-group" role="group" aria-label="...">
        <button type="button" class="btn btn-outline-info button-class1" id="path" onclick="goMain1()">등산로</button>
        <button type="button" class="btn btn-outline-secondary button-class2" id="group" onclick="goMain2()">등산모임</button>
    </div>
    <button type="button" class="btn btn-dark" id="create" style="float:right;" data-toggle="modal" data-target="#createModal">등산하기</button>
    <p></p>
    <h1>등산모임 리스트</h1>
    <div class="responsive">
        <div class="row">
            <c:forEach var="group" items="${group}">
                <div class="pt-3 col-lg-4 col-sm-6" id="groupList">
                    <div class="card" >
                        <img class="card-img-top" src="http://localhost:8080/resources/img/${group.STOREDFILENAME}" alt="..." style="width: 100%"></img>
                        <div class="card-body">
                            <h5 class="card-title">${group.NAME}</h5>
                            <p class="card-text text-muted" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">${group.DETAIL}</p>
                            <a href="/group/${group.GROUPNUM}" class="btn btn-info">바로가기</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<div class="modal fade" id="createModal" role="dialog">
    <div class="modal-dialog" style="max-width: 100%; width: auto; display: table">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">인원 설정</h4>
                <button type="button" class="close" data-dismiss="modal">x</button>
            </div>
            <div class="modal-body row" style="text-align: center">
                <div class="col-6">
                    <img src="../resources/img/select4.png" style="width: 250px; height: 250px; display: block;">
                    <button class="btn btn-primary" onclick="create1()">1인</button>
                </div>
                <div class="col-6" style="text-align: center">
                    <img src="../resources/img/select5.png" style="width: 250px; height: 250px; display: block">
                    <button class="btn btn-primary" onclick="create2()">2인이상</button>
                </div>
            </div>
        </div>

    </div>
</div>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/js/view/group/main.js"></script>
</body>