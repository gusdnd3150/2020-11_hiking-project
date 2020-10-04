<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/common/header.jsp" />
<div class="container pt-5">
    <!-- Portfolio Item Heading -->
    <h1 class="my-4">${group.NAME}
        <small>${group.MTNM}</small>
    </h1>
    <div class="row">
        <div class="col-md-8">
<%--            <img class="img-fluid" src="http://placehold.it/750x500" alt="">--%>
            <img class="img-fluid" src="http://localhost:8080/resources/img/${group.image0}" alt="">
        </div>
        <div class="col-md-4">
            <h3 class="my-3">${group.NAME}</h3>
            <hr />
            <p style="height: 80px">
                간단한 설명
            </p>
            <h3 class="my-3">모임 상태</h3>
            <hr />
            <ul style="list-style: none">
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
            <div class="row col-12" style="bottom: 0px">
                <button class="btn btn-outline-info col-12" onclick="showMtInfo()">산 정보보기</button>
                <button class="btn btn-danger col-6">찜하기</button>
                <button class="btn btn-info col-6">신청하기</button>
            </div>
        </div>
    </div>
    <h3 class="my-4">산모임 상세내용</h3>
    <div class="row">
        <div class="col-12">
            ${group.DETAIL}
        </div>
    </div>

    <h3 class="my-4">이 모임은 어때요?</h3>
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
<script>
    function showMtInfo(){
        window.open("detail_info.jsp","산 정보","width=400, height=300, left=100, top=50");
    }
</script>