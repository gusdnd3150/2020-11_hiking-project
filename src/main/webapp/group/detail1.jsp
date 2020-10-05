<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/common/header.jsp" />
<link rel="stylesheet" type="text/css" href="/resources/css/views/group/detail.css" />
<div class="container pt-5">
    <h1 class="my-4">${mtInfo.mntiname}
        <small>${mtInfo.mntisname}</small>
    </h1>
    <div class="row">
        <div class="col-md-8">
            <img class="img-fluid" src="${mtInfo.imgfilename}" alt="" style="width: 100%; height: 100%">
        </div>
        <div class="col-md-4">
            <h3 class="my-3">위치</h3>
            <hr />
            <p style="height: 80px">
                ${mtInfo.mntiadd}
            </p>
            <h3 class="my-3">산 정보</h3>
            <hr />
            <ul style="list-style: none">
                <li>산 높이 : ${mtInfo.mntihigh} m</li>
                <li>관리처 : ${mtInfo.mntiadmin}</li>
                <li>관리처 전화번호 : ${mtInfo.mntiadminnum}</li>
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
            ${mtInfo.mntidetails}
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