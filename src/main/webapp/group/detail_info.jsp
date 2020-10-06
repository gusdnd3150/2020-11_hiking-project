<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>산 정보보기</title>
    <link rel="icon" href="../resources/img/doraemon.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="../resources/css/bootstrap.min.css" />
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
        <a class="nav-link" data-toggle="tab" href="#zxc">ZXC</a>
    </li>
</ul>
<div class="tab-content">
    <div class="tab-pane fade show active" id="mountainInfo">
        산정보 뿌릴거임
    </div>
    <div class="tab-pane fade" id="naverMap">
        네이버 지도 API 가져올거임
    </div>
    <div class="tab-pane fade" id="zxc">
        잘못된 정보 신고
    </div>
</div>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
</body>
</html>
