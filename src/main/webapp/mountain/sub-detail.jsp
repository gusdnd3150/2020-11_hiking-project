<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>산 정보보기</title>
    <link rel="icon" href="../resources/img/doraemon.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css" />
</head>
<body>
<ul class="nav nav-tabs">
    <li class="nav-item">
        <a class="nav-link active" data-toggle="tab" href="#mountainInfo">산정보</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#naverMap">찾아가는길</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#alert">신고</a>
    </li>
</ul>
<div class="tab-content">
    <div class="tab-pane fade show active" id="mountainInfo">
        <c:forEach var="mountain" items="${mountain}">
            <ul class="list-group">
                <li class="list-group-item">
                    <h1>${mountain.mntnm}</h1>
                    <p>${mountain.areanm}</p>
                    <p>해발 ${mountain.mntheight} m</p>
                </li>
                <li class="list-group-item">
                    <h2>소개</h2>
                    ${mountain.overview}
                </li>
                <li class="list-group-item">
                    <h2>추천 코스</h2>
                    ${mountain.etccourse}
                </li>
                <li class="list-group-item">
                    <h2>100대 명산에 선정된 이유</h2>
                    ${mountain.aeatreason}
                </li>
                <li class="list-group-item">
                    <h2>산 상세 정보</h2>
                    ${mountain.details}
                </li>
                <li class="list-group-item">
                    <h2>관광 정보</h2>
                    ${mountain.tourisminf}
                </li>
            </ul>
        </c:forEach>
    </div>
    <div class="tab-pane fade" id="naverMap">
        네이버 지도 API 가져올거임
    </div>
    <div class="tab-pane fade" id="alert">
        <div class="p-3">
            <h3>잘못된 정보 신고</h3>
        </div>
    </div>
</div>
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
</body>
</html>
