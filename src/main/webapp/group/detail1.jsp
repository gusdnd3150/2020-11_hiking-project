<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/common/header.jsp" />
<jsp:include page="/common/fixedBtn.jsp" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/resources/css/views/group/detail.css" />
<div class="container pt-5">
    <!-- Portfolio Item Heading -->
    <h1 class="my-4">${group.NAME}
        <small class="text-muted">${group.MTNM}</small>
    </h1>
    <div class="row" style="position: relative; height: fit-content">
        <div class="photos col-md-8 col-sm-12">
            <%--            <img class="img-fluid" src="http://placehold.it/750x500" alt="">--%>
            <div id="photo0"><img class="img-fluid" src="/resources/img/${group.image0}" alt="" style="height: 100%;width: 100%"></div>
            <div id="photo1" style="display: none"><img class="img-fluid" src="/resources/img/${group.image1}" alt="" style="height: 100%;width: 100%"></div>
            <div id="photo2" style="display: none"><img class="img-fluid" src="/resources/img/${group.image2}" alt="" style="height: 100%;width: 100%"></div>
            <ul class="thumbs">
                <li><a href="javascript:void(0)" onclick="switchPhoto('photo0', 3);"><img class="img-fluid" src="/resources/img/${group.image0}" alt=""></a> </li>
                <li><a href="javascript:void(0)" onclick="switchPhoto('photo1', 3);"><img class="img-fluid" src="/resources/img/${group.image1}" alt=""></a> </li>
                <li><a href="javascript:void(0)" onclick="switchPhoto('photo2', 3);"><img class="img-fluid" src="/resources/img/${group.image2}" alt=""></a> </li>
            </ul>
        </div>
        <div class="col-md-4 col-sm-12">
            <div style="height: 80%">
                <h2 class="mt-3">모임 정보</h2>
                <hr />
                <h3 class="row col-12 mt-3" style="align-items: center">
                    <img src="/resources/img/${group.CONTENT2}" class="rounded-circle" style="width: 40px;height: 40px; border: 1px solid grey">
                    <div class="pl-2">${group.NICKNAME}</div>
                </h3>
                <div class="text-muted">${group.CREATEDAT}</div>
                <hr />
                <div>
                    <c:choose>
                        <c:when test="${group.STATUS eq 1}"><div><h3>모집중</h3></div></c:when>
                        <c:when test="${group.STATUS eq 0}"><div><h3>모집 마감</h3></div></c:when>
                    </c:choose>
                </div>
                <hr />
                <ul class="pl-0 col-12" style="list-style: none;height: auto;font-size: 18px">
                    <li><b>모집 인원</b></li>
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
                    <li><b>출발시각</b><div>${group.STARTDAY}</div></li>
                    <li><b>지역</b> ${group.AREA}</li>
                    <li><b>조건</b>
                        <c:choose>
                            <c:when test="${group.AGESTART eq 0 || group.AGEEND eq 0}">
                                없음
                            </c:when>
                            <c:otherwise>
                                ${group.AGESTART}세 이상 ${group.AGEEND}세 미만
                            </c:otherwise>
                        </c:choose>
                    </li>
<%--                    <li>--%>
<%--                        집합일시:--%>
<%--                        참가비:--%>
<%--                        수정유무--%>
<%--                        이미지 너무 작은거 올리면 크게 확대 할것(썸네일화 시키자)--%>
<%--                    </li>--%>
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
                        <c:when test="${group.STATUS eq 0 and userGradeResult eq 0}"><button class="resultWaitingBtn btn btn-dark col-12" data-toggle="modal" data-target="#resultModal">모집 종료</button></c:when>
                        <c:when test="${group.STATUS eq 0 and userGradeResult eq 1 or userGradeResult eq 2}"><button class="resultWaitingBtn btn btn-dark col-12">모집 종료</button></c:when>
                        <c:when test="${userGradeResult eq 0}"><button class="selectWaitingList btn btn-dark col-12" data-toggle="modal" data-target="#listModal">참여 리스트</button></c:when>
                        <c:when test="${userGradeResult eq 1}"><button class="withdrawGroupBtn btn btn-info col-12" data-toggle="modal" data-target="#cancelModal">참여 취소</button></c:when>
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

    <div class="mt-3">
        <h3 class="mt-2 pb-1">댓글</h3>
        <div id="commentBoard" class="row">
        </div>
    </div>
    <!-- 댓글 입력 -->
    <div id="commentInput" class="row" style="justify-content: center">
        <c:choose>
            <c:when test="${sessionIdImage eq null}">
                <img src="/resources/img/basic_profile.PNG" class="rounded-circle" style="width: 50px;height: 50px">
            </c:when>
            <c:when test="${sessionIdImage ne null}">
                <img src="/resources/img/${sessionIdImage}" class="rounded-circle" style="width: 50px;height: 50px">
            </c:when>
        </c:choose>
        <input id="commentContent" class="form-control form-control-lg col-lg-10 col-md-9 col-10 col-10 ml-2 mr-2" type="text" placeholder="내용을 입력해주세요">
        <button id="commentSubmit" class="btn btn-info col-lg-1 col-md-1 col-sm-11">등록</button>
    </div>
    <c:if test="${group.STATUS eq 0 and userGradeResult eq 0}">
    <hr />
    <div class="p-3" style="text-align: center">
        <h3>후기를 작성해주세요</h3>
        <h4 class="text-muted">후기를 작성해주시면 포인트를 드립니다(1회)</h4>
        <button id="writeAfter" type="button" class="btn btn-info" onclick="writeAfter()">작성하기</button>
    </div>
    </c:if>

    <hr />

    <h3 class="my-4">${group.MTNM}의 다른 모임</h3>
    <div class="recommend row">
        <c:choose>
            <c:when test="${empty recommendResult}">
                <div class="text-muted" style="width: 100%; height:200px; font-size: 20px;">
                    <p>현재 ${group.MTNM}의 다른 모임이 없습니다</p>
                </div>
            </c:when>
            <c:when test="${!empty recommendResult}">
            <c:forEach var="recommend" items="${recommendResult}">
                <div class="pt-3 col-lg-3 col-sm-6" id="groupList">
                    <div class="card border-0" >
                        <a href="/group/${recommend.GROUPNUM}">
                            <img class="card-img-top" src="/resources/img/${recommend.STOREDFILENAME}" alt="..." style="width: 100%" />
                        </a>
                        <div class="card-body row p-3 pl-3">
                            <div class="col-10 pl-2">
                                <h5 class="card-title m-0" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">${recommend.NAME}</h5>
                                <p class="card-text text-muted mb-1" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">${recommend.DETAIL}</p>
                                <p class="text-muted p-0">${recommend.STARTDAY} 출발</p>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            </c:when>
        </c:choose>
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
    <div class="modal fade" id="resultModal">
        <div class="modal-dialog" id="modal3">
            <div class="modal-content">
                <!-- header -->
                <div class="modal-header">
                    <h4 class="modal-title">출발 명단</h4>
                    <!-- 닫기(x) 버튼 -->
                    <button type="button" class="close" data-dismiss="modal" onclick="window.location.reload();">×</button>
                    <!-- header title -->
                </div>
                <!-- body -->
                <div class="modal-body">
                    <ul id="resultList" class="pl-3 pr-3" style="font-size: 18px">
                    </ul>
                </div>
                <!-- Footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.reload();">닫기</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
<script>

    const userProfile = '${group.CONTENT2}';

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
    function toggleSubComment(e){
        $commentRoot = e.parentNode.parentNode;
        $subComments = $commentRoot.getElementsByTagName("li")

        for(var i=0;i<$subComments.length;i++){
            if($subComments[i].style.display == "block"){
                $subComments[i].style.display = "none";
            }else if($subComments[i].style.display == "none"){
                $subComments[i].style.display = "block";
            }
        }

    }

    function toggleWriteSubComment(e){
        $inputSubComment = e.parentNode.getElementsByTagName("p")[0]

        if($inputSubComment.style.display == "block"){
            $inputSubComment.style.display = "none";
        }else if($inputSubComment.style.display == "none"){
            $inputSubComment.style.display = "block";
        }

    }

    function writeSubComment(e){

        $root = e.parentNode.parentNode;
        $parentNum = $root.getElementsByTagName("pre")[0];

        var data = {
            "parentNum" : $parentNum.innerHTML,
            "depts" : 2,
            "groupNum" : "${group.GROUPNUM}",
            "content" : e.previousSibling.value,
            "userId" : "<%= request.getSession().getAttribute("LOGIN")%>"
        }


        $.ajax({
            type: "POST",
            url: "/group/insertSubComment.do",
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){
                var id = $root.parentNode.id;
                console.log(id)
                $('#'+id).append(
                    '<li id="temp" class="col-12 row pt-3 ml-5 pl-2">'+
                    '<img src="/resources/img/${sessionIdImage}" class="rounded-circle" style="width: 40px;height: 40px;float: left">'+
                    '<div class="col-9">'+
                    '<h5 class="mb-0 pl-0">'+response.nickname+'</h5>'+
                    response.content +'</div></li>'
                );
            },
            error: function(response){
                alert("다시 시도해주세요")
            }
        })


    }

    function cancelwriteSubComment(e){
        e.previousSibling.previousSibling.value=null;
    }

    function writeAfter(){

        localStorage.setItem("groupNum", ${group.GROUPNUM})
        localStorage.setItem("mtNm","${group.MTNM}")
        location.href="../after/form.jsp"
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

                if(response.length == 0){
                    $('#waitingList').append(
                        '<div style="text-align: center">신청한 회원이 없습니다</div>'
                    )
                }else if(response.length != 0){

                for(var i=0;i<response.length;i++){

                    var id = "waitingUser"+i;

                    $('#waitingList')
                        .append('<li class="row pt-1" style="list-style: none"><div id="waitingUser" class="col-10 pt-1" style="font-size: 22px">'+response[i].USERID+'</div></li>');

                    $('#waitingUser').attr('id',id);

                        if(response[i].USERSTATUS==0){
                            $('#'+id).after('<button class="userDisallowed btn btn-danger col-2">취소</button>');
                        }else if(response[i].USERSTATUS==1){
                            $('#'+id).after('<button class="userAllowed btn btn-light col-2">승인</button>');
                        }
                    }
                }
            },
            error: function(response){
                console.log("error");
                alert("새로고침 후 다시 시도해주세요")
            }
        })
    })
    $(document).on('click','.resultWaitingBtn',function (e){
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

                    for(var i=0;i<response.length;i++){

                        var id = "resultUser"+i;

                        $('#resultList').append(
                            '<a href="/profile/'+response[i].USERID+'"><li class="row pt-1" style="list-style: none">' +
                            '<div id="resultUser" class="col-10 pt-1" style="font-size: 22px">' +
                            response[i].USERID +
                            '</div></li></a>'
                        );
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
            groupNum : ${group.GROUPNUM},
            action : "plus"
        }

        $.ajax({
            type: "GET",
            url: "/group/userAllowed.do",
            data: data,
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){
                e.target.className ="userDisallowed btn btn-danger col-2";
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
            groupNum : ${group.GROUPNUM},
            action : "minus"
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
            "parentNum" : 0,
            "depts" : 1,
            "groupNum" : ${group.GROUPNUM},
            "content" : $('#commentContent').val(),
            "userId" : "<%= request.getSession().getAttribute("LOGIN")%>"
        }

        $.ajax({
            type: "POST",
            url: "/group/insertComment.do",
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){

                var index = 0;
                var count = response.subCommentCount;

                    var rootNum = response.parentNum;

                    if (rootNum == 0) {
                        var id = 'depts' + index

                        $('#commentBoard').append(
                            '<ul id="' + id + '" class="col-12 pl-5 row">' +
                            '<img src="/resources/img/${sessionIdImage}" class="rounded-circle" style="width: 50px;height: 50px">'+
                            '<div class="col-10">'+
                            '<pre style="display: none">'+response.commentNum+'</pre>'+
                            '<h5>'+response.nickname+'</h5>'+
                            '<div>'+response.content +'</div>' +
                            '<button class="'+id+' p-0 btn btn-default text-muted" onclick="toggleSubComment(this)">[답글 '+ count +'개 더보기]</button>' +
                            '<button class="'+id+'subComment p-0 btn btn-default text-muted" onclick="toggleWriteSubComment(this)">[답글 작성]</button>' +
                            '<p style="display: none"><input type="text" class="form-control" placeholder="댓글 내용 입력"/>' +
                            '<button id="writeSubCommentBtn" class="btn btn-info" onclick="writeSubComment(this)">작성</button>' +
                            '<button class="btn btn-light" onclick="cancelwriteSubComment(this)">취소</button>' +
                            '</p></div></ul>');

                        index++;
                    }
            },
            error: function(response){
                alert("다시 시도해주세요")
            }
        })

    })
    $(document).ready(function (){

        var data = {
            "groupNum" : ${group.GROUPNUM}
        }

        $.ajax({
            type: "GET",
            url: "/group/selectCommentByGroupNum.do",
            data: data,
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){

                var index = 0;
                for(var i=0;i<response.length;i++) {

                    var commentNum = response[i].commentNum;
                    var rootNum = response[i].parentNum;
                    var count = response[i].subCommentCount;

                    if (rootNum == 0) {
                        var id = 'depts' + index

                        $('#commentBoard').append(
                            '<ul id="' + id + '" class="col-12 pl-5 row">' +
                            '<img src="/resources/img/' + response[i].content2 + '" class="rounded-circle" style="width: 50px;height: 50px">'+
                            '<div class="col-10">'+
                            '<pre style="display: none">'+response[i].commentNum+'</pre>'+
                            '<h5>'+response[i].nickname+'</h5>'+
                            '<div>'+response[i].content +'</div>' +
                            '<button class="'+id+' p-0 btn btn-default text-muted" onclick="toggleSubComment(this)">[답글 '+ count +'개 더보기]</button>' +
                            '<button class="'+id+'subComment p-0 btn btn-default text-muted" onclick="toggleWriteSubComment(this)">[답글 작성]</button>' +
                            '<p style="display: none"><input type="text" class="form-control" placeholder="댓글 내용 입력"/>' +
                            '<button id="writeSubCommentBtn" class="btn btn-info" onclick="writeSubComment(this)">작성</button>' +
                            '<button class="btn btn-light" onclick="cancelwriteSubComment(this)">취소</button>' +
                            '</p></div></ul>');

                        index++;

                        var index1 = 0;
                        for (var j = 0; j < response.length; j++) {

                            if (response[j].parentNum == commentNum) {
                                $('#' + id).append(
                                    '<li id="' + id + index1 + '" class="col-12 row pt-3 ml-5 pl-2" style="display: none;">'+
                                    '<img src="/resources/img/'+response[j].content2+'" class="rounded-circle" style="width: 40px; height: 40px; float: left">'+
                                    '<div class="col-9 ml-2 pl-5">'+
                                    '<h5 class="mb-0">'+response[j].nickname+'</h5>'+
                                    response[j].content +'</div></li>'
                                );

                                index1++;
                            }
                        }
                    }
                }
            },
            error: function(response){
                console.log("error");
                console.log(response)
            }
        })
    })
</script>
<jsp:include page="/common/footer.jsp" />