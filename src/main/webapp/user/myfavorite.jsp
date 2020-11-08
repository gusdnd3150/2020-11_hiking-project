<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/common/header.jsp" />
<jsp:include page="/alarm.jsp" />
<body class="container pt-5">
<div class="pt-5">
    <h1>나의 찜 목록</h1>
    <div class="card-header">
        <ul class="nav nav-tabs row" id="myInfoTab" role="tablist">
            <li class="nav-item" role="presentation">
                <a class="nav-link active" id="follower-tab" data-toggle="tab" href="#follower" role="tab" aria-controls="follower" aria-selected="true">
                    <b>등산모임</b>
                </a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="following-tab" data-toggle="tab" href="#following" role="tab" aria-controls="following" aria-selected="false">
                    <b>등산로</b>
                </a>
            </li>
        </ul>
        <div class="tab-content " id="myInfoContent">
            <div class="row tab-pane fade show active" id="follower" role="tabpanel" data-spy="scroll" aria-labelledby="follower-tab">
                <ul id="b" >
                    <c:forEach var="group" items="${group}">
                        <li class="pt-3">
                            <a href="/group/${group.GROUPNUM}" class="row" style="color: black">
                                <img class="rounded" src="/resources/img/${group.STOREDFILENAME}" width="50" height="50">
                                <table class="m-0 p-0">
                                    <h6 class="col-3">${group.NAME}</h6>
                                    <c:if test="${group.STATUS eq '마감'}">
                                        <span class="col-2" style="color: red">${group.STATUS}</span>
                                    </c:if>
                                    <c:if test="${group.STATUS eq '진행중'}">
                                        <span class="col-2" style="color: green">${group.STATUS}</span>
                                    </c:if>
                                    <span class="col-1">${group.STAFFCURRENT} / ${group.STAFFMAX}</span>
                                    <span class="col-1">${group.AREA}</span>
                                    <span class="col-3">${group.STARTDAY}</span>
                                </table>
                            </a>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="row tab-pane fade" id="following" data-spy="scroll" role="tabpanel" aria-labelledby="following-tab">
                <ul id="a">
                    <c:forEach var="trail" items="${trail}">
                        <li class="pt-1 pb-1">
                            <a href="/trail/${trail.MNTN_CODE}.do?userId=${LOGIN}" style="color: black">
                                <div class="row" style="padding-left: 30px; padding-top: 20px;">
                                    <h6 class="col-6">${trail.MNTN_NM}</h6>
                                    <span class="col-6">${trail.CREATEDAT}</span>
                                </div>
                            </a>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
</body>
<jsp:include page="/common/footer.jsp" />