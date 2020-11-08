<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<jsp:include page="/common/header.jsp" />
<body class="container pt-5">
<div class="pt-5">
    <h1>나의 모임 관리</h1>
    <div class="card-header">
        <ul class="nav nav-tabs row" id="myInfoTab" role="tablist">
            <li class="nav-item" role="presentation">
                <a class="nav-link active" id="following-tab" data-toggle="tab" href="#following" role="tab" aria-controls="following" aria-selected="true">
                    <b>내가 가입한 모임</b>
                </a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="follower-tab" data-toggle="tab" href="#follower" role="tab" aria-controls="follower" aria-selected="false">
                    <b>내가 만든 모임</b>
                </a>
            </li>
        </ul>
        <div class="tab-content " id="myInfoContent">
            <div class="row tab-pane fade show active" id="following" data-spy="scroll" role="tabpanel" aria-labelledby="following-tab">
                <ul id="a">
                    <c:forEach var="JList" items="${JList}">
                        <li class="pt-2 pb-1">
                            <a href="/commu/commuPageView.do?groupNum=${JList.GROUPNUM}" class="row" style="color: black">
                                <img class="rounded mt-2" src="/resources/img/${JList.STOREDFILENAME}" width="50" height="50">
                                <div class="row" style="padding-left: 30px; padding-top: 20px;">
                                    <h6>${JList.NAME}</h6>
                                </div>
                            </a>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="row tab-pane fade" id="follower" role="tabpanel" data-spy="scroll" aria-labelledby="follower-tab">
                <ul id="b" >
                    <c:forEach var="CList" items="${CList}">
                        <li class="pt-2 pb-1">
                            <a href="/commu/commuPageView.do?groupNum=${CList.GROUPNUM}" class="row" style="color: black">
                                <img class="rounded" src="/resources/img/${CList.STOREDFILENAME}" width="50" height="50">
                                    <div class="row" style="padding-left: 30px; padding-top: 20px;">
                                        <h6>${CList.NAME}</h6>
                                    </div>
                                </a>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
</body>
</html>