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
            <div id="photo0"><img class="img-fluid" src="http://localhost:8080/resources/img/${group.image0}" alt="" ></div>
            <div id="photo1" style="display: none"><img class="img-fluid" src="http://localhost:8080/resources/img/${group.image1}" alt=""></div>
            <div id="photo2" style="display: none"><img class="img-fluid" src="http://localhost:8080/resources/img/${group.image2}" alt=""></div>
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
                    간단한 설명
                </p>
                <h3 class="mt-3">모임 상태</h3>
                <hr />
                <ul class="pl-0" style="list-style: none;height: auto">
                    <li>
                        <c:choose>
                        <c:when test="${group.STATUS eq 1}">진행중</c:when>
                        <c:when test="${group.STATUS eq 0}">모집완료</c:when>
                        </c:choose>
                    </li>
                    <li>${group.STAFFCURRENT} / ${group.STAFFMAX} 명</li>
                    <li>${group.AREA}</li>
                    <li>${group.AGESTART}</li>
                    <li>${group.AGEEND}</li>

                </ul>
                <!--SNS 공유 버튼 넣자-->
            </div>
            <div style="height: 10%;">
                <div class="row col-12" style="position: relative;">
                    <%--            <div class="row col-12">--%>
                    <button class="btn btn-outline-info col-12" onclick="showMtInfo()">산 정보보기</button>
                    <button class="btn btn-danger col-6">찜하기</button>
                    <button class="btn btn-info col-6">신청하기</button>
                </div>
            </div>
        </div>
    </div>
    <h3 class="my-4">산모임 상세내용</h3>
    <div class="row">
        <div class="col-12">
            ${group.DETAIL}
        </div>
    </div>

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
</div>
<script>
    function showMtInfo(){
        window.open("detail_info.jsp","산 정보","width=400, height=300, left=100, top=50");
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
</script>