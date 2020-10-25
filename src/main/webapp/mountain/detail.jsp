<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/common/header.jsp" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/css/views/group/detail.css" />
<div class="container pt-5">
    <div class="pt-5">
        <h1 class="pb-5">${searchWrd}의 검색 결과</h1>
    </div>
    <div class="row">
        <div class="col-4">
            <div class="list-group" id="list-tab" role="tablist">
            <c:forEach var="mountain" items="${mountain}" varStatus="status">
                <a class="list-group-item list-group-item-action" id="list-${mountain.mntiname}-${status.index}-list" data-toggle="list" href="#${mountain.mntiname}-${status.index}" role="tab" aria-controls="home">
                    <div><b>${mountain.mntiname}</b></div>
                    <div class="text-muted">${mountain.mntiadd}</div>
                    <div><i class="fas fa-star" style="color:rgb(255, 215, 20)"></i> ${mountain.countLike}</div>
                </a>
            </c:forEach>
            </div>
        </div>
        <div class="col-8">
            <div class="tab-content" id="nav-tabContent">
            <c:forEach var="mountain" items="${mountain}" varStatus="status">
                <div class="tab-pane fade" id="${mountain.mntiname}-${status.index}" role="tabpanel" aria-labelledby="list-${mountain.mntiname}-${status.index}-list">
                    <div class="text-right">
                        <!-- 여기 if문 --><%----%>
                        <c:if test="${mountain.likeYN eq 'Y'}">
                            <button class="mtStar btn btn-outline-warning" onclick="unFollowMountain(${mountain.mntilistno})"><i class="fas fa-star"></i></button>
                        </c:if>
                        <c:if test="${mountain.likeYN ne 'Y'}">
                            <button class="mtStar btn btn-outline-warning" onclick="followMountain(${mountain.mntilistno})"><i class="far fa-star"></i></button>
                        </c:if>
                    </div>
                    <li>
                        <h4>주소</h4>
                        <div>${mountain.mntiadd}</div>
                    </li>
                    <hr />
                    <li>
                        <h4>산높이</h4>
                        <div>${mountain.mntihigh} m</div>
                    </li>
                    <hr />
                    <li>
                        <h4>상세정보</h4>
                        <div>${mountain.mntidetails}</div>
                    </li>
                    <hr />
                    <li>
                        <h5>관리자</h5>
                        <div>${mountain.mntiadmin}</div>
                    </li>
                    <hr />
                    <li>
                        <h5>관리자 연락처</h5>
                        <div>${mountain.mntiadminnum}</div>
                    </li>
                </div>
            </c:forEach>
            </div>
        </div>
    </div>
    <div class="pt-5">
    </div>
    <h3 class="my-4">${searchWrd}에 같이 갈 사람 모집중!</h3>
    <div class="row">
        <div class="col-md-3 col-sm-6 mb-4">
            <a href="#">
                <img class="img-fluid" src="http://placehold.it/500x300" alt="">
            </a>
        </div>

        <div class="col-md-3 col-sm-6 mb-4">
            <a href="#">
                <img class="img-fluid" src="http://placehold.it/500x300" alt="">
            </a>
        </div>

        <div class="col-md-3 col-sm-6 mb-4">
            <a href="#">
                <img class="img-fluid" src="http://placehold.it/500x300" alt="">
            </a>
        </div>

        <div class="col-md-3 col-sm-6 mb-4">
            <a href="#">
                <img class="img-fluid" src="http://placehold.it/500x300" alt="">
            </a>
        </div>

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
</script>