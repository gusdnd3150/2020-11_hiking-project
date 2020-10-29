<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/common/header.jsp" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/css/views/group/detail.css" />
<div class="container pt-5">
    <div class="pt-5">
        <h1 class="pb-5">'${searchWrd}'의 검색 결과</h1>
    </div>
    <div class="row">
        <div class="col-4">
            <div class="list-group" id="list-tab" role="tablist">
                <c:forEach var="trail" items="${trail}" varStatus="status">
                    <a class="list-group-item list-group-item-action" id="list-${trail.mntnnm}-${status.index}-list" data-toggle="list" href="#${trail.mntnnm}-${status.index}" role="tab" aria-controls="home">
                        <div><b>${trail.baekdusections} - ${trail.baekdusectione} 구간</b></div>
                        <div class="text-muted">[${trail.mntnnm}]${trail.baekdurealdistance}</div>
<%--                        <div><i class="fas fa-star" style="color:rgb(255, 215, 20)"></i> ${mountain.countLike}</div>--%>
                    </a>
                </c:forEach>
            </div>
        </div>
        <div class="col-8">
            <div class="tab-content" id="nav-tabContent">
                <c:forEach var="trail" items="${trail}" varStatus="status">
                    <div class="tab-pane fade" id="${trail.mntnnm}-${status.index}" role="tabpanel" aria-labelledby="list-${trail.mntnnm}-${status.index}-list">
                        <div class="text-right">
                            <!-- 여기 if문 --><%----%>
<%--                            <c:if test="${mountain.likeYN eq 'Y'}">--%>
<%--                                <button class="mtStar btn btn-outline-warning" onclick="unFollowMountain(${mountain.mntilistno})"><i class="fas fa-star"></i></button>--%>
<%--                            </c:if>--%>
<%--                            <c:if test="${mountain.likeYN ne 'Y'}">--%>
<%--                                <button class="mtStar btn btn-outline-warning" onclick="followMountain(${mountain.mntilistno})"><i class="far fa-star"></i></button>--%>
<%--                            </c:if>--%>
                        </div>
                        <li>
                            <h5>등산로 구간상세</h5>
                            <div>${trail.baekduvia}</div>
                        </li>
                        <hr />
                        <li>
                            <h4>주소</h4>
                            <div>${trail.mntloca}</div>
                        </li>
                        <hr />
                        <li>
                            <h4>등산로 산권</h4>
                            <div>${trail.baekdugbnname}</div>
                        </li>
                        <hr />
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <hr />
    <h3 class="mt-5">현재 ${searchWrd} 같이가실 분 모집중!</h3>
    <div class="recommend row">
        <c:choose>
            <c:when test="${empty recommendList}">
                <div class="text-center text-muted" style="width:100%; height: 150px; font-size: 20px;display: flex;justify-content: center;flex-direction: column">
                    <c:if test="${searchWrd eq ''}">
                        <p>검색어가 없습니다</p>
                    </c:if>
                    <c:if test="${searchWrd ne ''}">
                        <p>현재 ${searchWrd}의 다른 모임이 없습니다</p>
                    </c:if>
                </div>
            </c:when>
            <c:when test="${!empty recommendList}">
                <c:forEach var="recommend" items="${recommendList}">
                    <div class="pt-3 col-lg-3 col-sm-6" id="groupList">
                        <div class="card border-0">
                            <a href="/group/${recommend.GROUPNUM}">
                                <img class="card-img-top" src="/resources/img/${recommend.STOREDFILENAME}" alt="..."/>
                            </a>
                            <div class="card-body row p-3 pl-3">
                                <div class="col-10 pl-2">
                                    <h5 class="card-title m-0" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">${recommend.NAME}</h5>
                                    <p class="text-muted">${recommend.STARTDAY} 출발</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
        </c:choose>
    </div>
</div>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
<script>
    function showMtInfo(){
        window.open("detail_info.jsp","산 정보","width=400, height=300, left=100, top=50");
    }

    function followMountain(mntilistno){
        var data = {
            'mntilistno' : mntilistno,
            'userId' : '<%= session.getAttribute("LOGIN")%>',
            'likeYN' : 'Y'
        }
        $.ajax({
            type: "POST",
            url: "/mountain/followFN.do",
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){
                console.log("success")
                $('.mtStar')
                    .empty().append('<i class="fas fa-star"></i>')
                alert("찜 목록에 추가 되었습니다")
                location.reload();
            },
            error: function(response){
                console.log("error");
            }
        })
    }

    function unFollowMountain(mntilistno){
        var data = {
            'mntilistno' : mntilistno,
            'userId' : '<%= session.getAttribute("LOGIN")%>',
            'likeYN' : 'N'
        }
        $.ajax({
            type: "POST",
            url: "/mountain/followFN.do",
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){
                $('.mtStar')
                    .empty().append('<i class="far fa-star"></i>')
                alert("찜 목록에서 삭제 되었습니다")
                location.reload();
            },
            error: function(response){
                console.log("error");
            }
        })
    }

    function loadMtImage(mntilistno){

        var data = {
            'mntilistno' : mntilistno,
        }

        $.ajax({
            type: "GET",
            url: "/mountain/image.do",
            data: data,
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){
                $('.mtImage').empty();
                for(var i=0;i<response.length;i++){
                    var html = '';

                    html += '<img src="'+response[i]+'" style="display: inline-block"/>'

                    $('.mtImage').append(html)
                }
            },
            error: function(response){
                $('.mtImage').empty();
            }
        })
    }
</script>