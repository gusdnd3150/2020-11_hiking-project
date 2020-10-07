<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/common/header.jsp" />
<link rel="stylesheet" type="text/css" href="/resources/css/views/group/detail.css" />
<div class="container pt-5">
    <!-- Portfolio Item Heading -->
    <h1 class="my-4">${group.NAME}
        <small class="text-muted">${group.MTNM}</small>
    </h1>
    <div class="row" style="position: relative; height: fit-content">
        <div class="photos col-md-8 col-sm-12">
            <%--            <img class="img-fluid" src="http://placehold.it/750x500" alt="">--%>
            <div id="photo0"><img class="img-fluid" src="http://localhost:8080/resources/img/${group.image0}" alt="" style="height: 100%;width: 100%"></div>
            <div id="photo1" style="display: none"><img class="img-fluid" src="http://localhost:8080/resources/img/${group.image1}" alt="" style="height: 100%;width: 100%"></div>
            <div id="photo2" style="display: none"><img class="img-fluid" src="http://localhost:8080/resources/img/${group.image2}" alt="" style="height: 100%;width: 100%"></div>
            <ul class="thumbs">
                <li><a href="javascript:void(0)" onclick="switchPhoto('photo0', 3);"><img class="img-fluid" src="http://localhost:8080/resources/img/${group.image0}" alt=""></a> </li>
                <li><a href="javascript:void(0)" onclick="switchPhoto('photo1', 3);"><img class="img-fluid" src="http://localhost:8080/resources/img/${group.image1}" alt=""></a> </li>
                <li><a href="javascript:void(0)" onclick="switchPhoto('photo2', 3);"><img class="img-fluid" src="http://localhost:8080/resources/img/${group.image2}" alt=""></a> </li>
            </ul>
        </div>
        <div class="col-md-4 col-sm-12">
            <div style="height: 80%">
                <h3 class="mt-3">${group.NAME}</h3>
                <hr />
                <p style="height: 80px;">
                    주최자:
                    집합일시:
                    참가비:
                    수정유무
                    이미지 너무 작은거 올리면 크게 확대 할것(썸네일화 시키자)
                </p>
                <h3 class="mt-3">모임 정보</h3>
                <hr />
                <ul class="pl-0 col-12" style="list-style: none;height: auto">
                    <li>
                        <c:choose>
                            <c:when test="${group.STATUS eq 1}">진행중</c:when>
                            <c:when test="${group.STATUS eq 0}">마감</c:when>
                        </c:choose>
                    </li>
                    <li>모집 인원 ${group.STAFFMAX} 명</li>
                    <li>
                        <c:choose>
                            <c:when test="${(group.STAFFCURRENT / group.STAFFMAX) ne 1}">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped bg-info" role="progressbar" style="width: ${(group.STAFFCURRENT*100 / group.STAFFMAX *100)/100}%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">${group.STAFFCURRENT} / ${group.STAFFMAX} 명</div>
                                </div>
                            </c:when>
                            <c:when test="${(group.STAFFCURRENT / group.STAFFMAX) eq 1}">
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped bg-danger" role="progressbar" style="width: ${(group.STAFFCURRENT*100 / group.STAFFMAX *100)/100}%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">${group.STAFFCURRENT} / ${group.STAFFMAX} 명</div>
                                </div>
                            </c:when>
                        </c:choose>
                    </li>
                    <li>${group.AREA}</li>
                    <li>${group.AGESTART}</li>
                    <li>${group.AGEEND}</li>
                    <li>현재 로그인된 아이디(임시): <%= request.getSession().getAttribute("LOGIN")%></li>
                    <li>${group.STARTDAY}</li>

                </ul>
                <!--SNS 공유 버튼 넣자-->
            </div>
            <div style="height: 10%;">
                <div class="row col-12" style="position: relative;">
                    <c:choose>
                        <c:when test="${favoriteResult eq 1}"><button class="dislike btn btn-danger col-6">좋아요 취소</button></c:when>
                        <c:when test="${favoriteResult ne 1}"><button class="like btn btn-outline-danger col-6" >좋아요</button></c:when>
                    </c:choose>
                    <!--favoriteResult ne 1 or-->
                    <button class="btn btn-outline-info col-6" onclick="showMtInfo()">산 정보보기</button>
                    <c:choose>
                        <c:when test="${userGradeResult eq 0}"><button class="selectWaitingList btn btn-dark col-12" data-toggle="modal" data-target="#listModal">요청 리스트보기</button></c:when>
                        <c:when test="${userGradeResult eq 1}"><button class="withdrawGroupBtn btn btn-info col-12" data-toggle="modal" data-target="#cancelModal">요청 취소하기</button></c:when>
                        <c:when test="${userGradeResult eq 2}"><button class="joinButton btn btn-outline-info col-12" data-toggle="modal" data-target="#joinModal">참여 신청</button></c:when>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>

    <hr />

    <h3 class="my-4">산모임 상세내용</h3>
    <div class="row">
        <div class="col-12">
            ${group.DETAIL}
        </div>
    </div>

    <hr />

    <div class="row">
        <h3 class="col-12 mt-2">댓글</h3>
        <!-- 댓글 내용 -->
        <div class="mt-2 media col-12">
            <img src="..." class="mr-3" alt="...">
            <div class="media-body">
                <h5 class="mt-0">Media heading</h5>
                Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.

                <div class="media mt-3">
                    <a class="mr-3" href="#">
                        <img src="..." class="mr-3" alt="...">
                    </a>
                    <div class="media-body">
                        <h5 class="mt-0">Media heading</h5>
                        Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                    </div>
                </div>
            </div>
        </div>
        <!-- 댓글 입력 -->
        <div id="commentInput" class="row col-12 pt-3">
            <img src="..." class="col-md-1 col-xs-1" alt="...">
            <input id="commentContent" class="form-control form-control-lg col-md-10 col-xs-8" type="text" placeholder="내용을 입력해주세요">
            <button id="commentSubmit" class="btn btn-info col-md-1 col-xs-1">입력</button>
        </div>
    </div>

    <hr />

    <h3 class="my-4">${group.MTNM}의 다른 모임</h3>
    <div class="row">
        <%--        <c:forEach var="group" items="${group}">--%>
        <%--            <div class="pt-3 col-lg-4 col-sm-6" id="groupList">--%>
        <%--                <div class="card" >--%>
        <%--                    <img class="card-img-top" src="http://localhost:8080/resources/img/${group.STOREDFILENAME}" alt="..." style="width: 100%"></img>--%>
        <%--                    <div class="card-body">--%>
        <%--                        <h5 class="card-title">${group.NAME}</h5>--%>
        <%--                        <p class="card-text text-muted" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">${group.DETAIL}</p>--%>
        <%--                        <a href="/group/${group.GROUPNUM}" class="btn btn-info">바로가기</a>--%>
        <%--                    </div>--%>
        <%--                </div>--%>
        <%--            </div>--%>
        <%--        </c:forEach>--%>
    </div>
    <div class="modal fade" id="listModal">
        <div class="modal-dialog" id="modal1">
            <div class="modal-content">
                <!-- header -->
                <div class="modal-header">
                    <h4 class="modal-title">참여 리스트</h4>
                    <!-- 닫기(x) 버튼 -->
                    <button type="button" class="close" data-dismiss="modal" onclick="window.location.reload();">×</button>
                    <!-- header title -->
                </div>
                <!-- body -->
                <div class="modal-body">
                    <ul id="waitingList" class="pl-3 pr-3" style="font-size: 18px">
                    </ul>
                </div>
                <!-- Footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.reload();">닫기</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="joinModal">
        <div class="modal-dialog" id="modal2">
            <div class="modal-content">
                <!-- header -->
                <div class="modal-header">
                    <h4 class="modal-title">${group.NAME} 참여하기</h4>
                    <!-- 닫기(x) 버튼 -->
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <!-- header title -->
                </div>
                <!-- body -->
                <div class="modal-body">
                    <textarea id="userComment" class="form-control col-xs-12" placeholder="요청 메시지를 입력해주세요"></textarea>
                </div>
                <!-- Footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                    <button type="button" class="joinGroupBtn btn btn-info">신청</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="cancelModal">
        <div class="modal-dialog" id="modal3">
            <div class="modal-content">
                <!-- header -->
                <div class="modal-header">
                    <h4 class="modal-title">${group.NAME} 참여 신청 취소하기</h4>
                    <!-- 닫기(x) 버튼 -->
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <!-- header title -->
                </div>
                <!-- body -->
                <div class="modal-body">
                    정말로 취소하시겠습니까?
                </div>
                <!-- Footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                    <button type="button" class="cancelModalBtn btn btn-info">확인</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
<script>
    function showMtInfo(){
        window.open("detail_info.jsp","산 정보","width=700, height=500, left=300, top=300");
    }

    function switchPhoto(divName, totalImgs){
        for(var i=0; i<=totalImgs; i++){
            var showDivName = "photo" + i;
            var showObj = document.getElementById(showDivName);
            if(showDivName == divName)
                showObj.style.display = "block";
            else
                showObj.style.display = "none";
        }
    }
$(document).ready(function (){
    $(document).on('click','.joinGroupBtn',function (){

        var data = {
            "groupNum": "${group.GROUPNUM}",
            "userId" : "<%= request.getSession().getAttribute("LOGIN")%>",
            "userComment" : $('#userComment').val()
        }

        $.ajax({
            type: "POST",
            url: "/group/join.do",
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success : function (response){
                alert("신청 처리 되었습니다");
                location.reload();
            },
            error : function (response){
                alert("오류 발생! 다시 시도해주세요");
            }
        })
    })
    $(document).on('click','.withdrawGroupBtn',function (){
        $("#cancelModal").show();
    })
    $(document).on('click','.cancelModalBtn',function (){

        var data = {
            "groupNum": ${group.GROUPNUM},
            "userId" : "<%= request.getSession().getAttribute("LOGIN")%>",
        }

        $.ajax({
            type: "POST",
            url: "/group/withdraw.do",
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success : function (response){
                location.reload();
            },
            error : function (response){
                console.log("error")
            }
        })
    })

    });
    $(document).on('click','.like',function (){
        var data = {
            "groupNum" : "${group.GROUPNUM}",
            "userId" : "<%= request.getSession().getAttribute("LOGIN")%>"
        }
        $.ajax({
            type: "POST",
            url: "/group/insertFavorite.do",
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success : function (response){
                $('.like').removeClass("like btn btn-outline-danger col-6")
                    .addClass("dislike btn btn-danger col-6")
                    .text("좋아요 취소");
            },
            error : function (response){
                console.log("error!");
                console.log(response);
            }
        })
    })

    $(document).on('click','.dislike',function (e){
        var data = {
            "groupNum" : "${group.GROUPNUM}",
            "userId" : "<%= request.getSession().getAttribute("LOGIN")%>"
        }
        $.ajax({
            type: "POST",
            url: "/group/deleteFavorite.do",
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success : function (response){
                $('.dislike').removeClass("dislike btn btn-danger col-6")
                    .addClass("like btn btn-outline-danger col-6")
                    .text("좋아요");
            },
            error : function (response){
                alert("로그인이 필요합니다")
                window.location.replace('/user/logInView.jsp')
            }
        })
    })

    $(document).on('click','.selectWaitingList',function (){

        var data = {
            "groupNum" : ${group.GROUPNUM},
            "userId" : "<%= request.getSession().getAttribute("LOGIN")%>"
        }

        $.ajax({
            type: "POST",
            url: "/group/selectWaitingList.do",
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){
                $('#waitingList').empty()

                for(var i=0;i<response.length;i++){

                    var id = "waitingUser"+i;

                    $('#waitingList')
                        .append('<li class="row pt-1" style="list-style: none"><div id="waitingUser" class="col-10 pt-1" style="font-size: 22px">'+response[i].USERID+'</div></li>');

                    $('#waitingUser').attr('id',id);

                        if(response[i].USERSTATUS==0){
                            $('#'+id).after('<button class="userDisallowed btn btn-dark col-2">취소</button>');
                        }else if(response[i].USERSTATUS==1){
                            $('#'+id).after('<button class="userAllowed btn btn-light col-2">승인</button>');
                        }
                    }
            },
            error: function(response){
                console.log("error");
                alert("새로고침 후 다시 시도해주세요")
            }
        })
    })

    $(document).on('click','.userAllowed',function (e){

        var data = {
            userId : (this.parentNode).childNodes[0].innerHTML,
            groupNum : ${group.GROUPNUM}
        }

        $.ajax({
            type: "GET",
            url: "/group/userAllowed.do",
            data: data,
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){
                e.target.className ="userDisallowed btn btn-dark col-2";
                e.target.innerText = "취소";
            },
            error: function(response){
                console.log("error");
                alert("새로고침 후 다시 시도해주세요")
            }
        })
    })

    $(document).on('click','.userDisallowed',function (e){
        var data = {
            userId : (this.parentNode).childNodes[0].innerHTML,
            groupNum : ${group.GROUPNUM}
        }

        $.ajax({
            type: "GET",
            url: "/group/userDisallowed.do",
            data: data,
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){
                e.target.className ="userAllowed btn btn-light col-2";
                e.target.innerText = "승인";
            },
            error: function(response){
                console.log("error");
                alert("새로고침 후 다시 시도해주세요")
            }
        })
    })

    $(document).on('click','#commentSubmit',function (){

        var data = {
            "groupNum" : "${group.GROUPNUM}",
            "userId" : "<%= request.getSession().getAttribute("LOGIN")%>",
            "commentContent" : $('#commentContent').val(),
        }

        console.log(data);

    })
</script>