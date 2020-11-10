<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/common/header.jsp" />
<body class="container pt-5">
<div class="pt-5">
    <h1>새로운 요청 알림</h1>
<%--    <button class="btn btn-info m-3" data-toggle="modal" data-target="#deleteModal">모든 알림 삭제</button>--%>
    <div class="card-header">
        <ul class="nav nav-tabs row" id="myInfoTab" role="tablist">
            <li class="nav-item" role="presentation">
                <a class="nav-link active" id="following-tab" data-toggle="tab" href="#following" role="tab" aria-controls="following" aria-selected="true">
                    <b>내가 받은 요청</b>
                </a>
            </li>
            <li class="nav-item" role="presentation">
                <a class="nav-link" id="follower-tab" data-toggle="tab" href="#follower" role="tab" aria-controls="follower" aria-selected="false">
                    <b>나의 요청</b>
                </a>
            </li>
        </ul>
        <div class="tab-content " id="myInfoContent">
            <div class="row tab-pane fade show active" id="following" data-spy="scroll" role="tabpanel" aria-labelledby="following-tab">
                <ul id="a">
                    <c:forEach var="response" items="${response}">
                        <li class="form-inline m-3" style="text-decoration: none;color: black;font-size: 24px">
                            <a href="/profile/${response.REQUESTUSER}">
                                <img class="rounded" src="/resources/img/${response.CONTENT2}" width="50" height="50">
                                <span class="align-middle">${response.NICKNAME}</span>
                            </a>
                                    님이&nbsp;
                            <a href="/group/${response.GROUPNUM}">
                                ${response.NAME} 모임
                            </a>에 참여를 원합니다
                            <span class="text-muted" style="font-size: 16px">${response.REQUESTEDAT}</span>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="row tab-pane fade" id="follower" role="tabpanel" data-spy="scroll" aria-labelledby="follower-tab">
                <ul id="b" >
                    <c:forEach var="request" items="${request}">
                        <li class="form-inline m-3" style="text-decoration: none;color: black;font-size: 24px">
                            <a href="/profile/${request.REQUESTUSER}">
                                <img class="rounded" src="/resources/img/${request.CONTENT2}" width="50" height="50">
                                <span class="align-middle">${request.NICKNAME}</span>
                            </a>
                            님의&nbsp;
                            <a href="/group/${request.GROUPNUM}">
                                    ${request.NAME} 모임
                            </a>에 참여를 요청했습니다
                            <span class="text-muted" style="font-size: 16px">${request.REQUESTEDAT}</span>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
<%--        <div class="modal fade" id="deleteModal" role="dialog">--%>
<%--            <div class="modal-dialog">--%>
<%--                <div class="modal-content">--%>
<%--                    <div class="modal-header">--%>
<%--                        <h4 class="modal-title">정말로 삭제할까요?</h4>--%>
<%--                        <button type="button" class="close" data-dismiss="modal">x</button>--%>
<%--                    </div>--%>
<%--                    <div class="modal-body text-right">--%>
<%--                        <button id="cancelRequestBtn" class="btn btn-secondary">취소</button>--%>
<%--                        <button id="deleteAllRequest" class="btn btn-info">확인</button>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
    </div>
</div>
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script>
    $(document).ready(function (){
        setTimeout(function (){
            deleteAllRequest()
        },2000)
    })
    $('#cancelRequestBtn').on('click',function (){
        $('#deleteModal').modal("hide")
    })

    function deleteAllRequest(){
        var data = {
            'userId' : '${LOGIN}'
        }

        console.log(data)

        $.ajax({
            type: "GET",
            url: "/alarm/update",
            data: data,
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){
                // if(response==1){
                // }
            },
            error: function(response){
                console.log("error");
            }
        })
    }
</script>
</body>
<jsp:include page="/common/footer.jsp" />