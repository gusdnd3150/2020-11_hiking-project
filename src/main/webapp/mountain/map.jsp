<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>산 정보보기</title>
    <link rel="icon" href="../resources/img/doraemon.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=10adf6d2b4bb761d1e63b20e8cb26e87&libraries=services"></script>
</head>
<body>
<ul class="nav nav-tabs">
    <li class="nav-item">
        <a class="nav-link active" data-toggle="tab" href="#kakaoMap">찾아가는길</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#mountainInfo">산정보</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" data-toggle="tab" href="#alert">
            <i class="fas fa-exclamation-triangle pt-1" style="color:red"></i>
        </a>
    </li>
</ul>
<div class="tab-content">
    <div class="tab-pane fade show active" id="kakaoMap">
        <div class="map_wrap">
            <div id="map"  style="width: 900px;height: 500px;position:relative;overflow:hidden;"></div>

            <div id="menu_wrap" class="bg_white">
                <ul id="placesList"></ul>
                <div id="pagination"></div>
            </div>
        </div>
    </div>
    <div class="tab-pane fade" id="mountainInfo">
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
    <div class="tab-pane fade" id="alert">
        <div class="p-3">
            <h3>잘못된 정보 신고</h3>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.6.2/proj4.js"></script>
<%--<script type="text/javascript" src="/resources/js/proj4js-combined.js"></script>--%>
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function (){
        selectTrailLocation();
    });

    function selectTrailLocation(){
        var data = {
            "FID" : 0
        }

        $.ajax({
            type: "GET",
            url: "/mountain/trail/487403601",
            data: data,
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){
                console.log("success")

                proj4.defs["EPSG:5181"] = "+proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=600000 +ellps=GRS80 +units=m +no_defs";
                proj4.defs["EPSG:4737"] = "+proj=longlat +ellps=bessel +no_defs +towgs84=-115.80,474.99,674.11,1.16,-2.31,-1.63,6.43";

                var linePath = [];

                var initX = 0;
                var initY = 0;

                for(var i=0;i<response.length;i++){
                    var centerGRS80 = proj4.Proj(proj4.defs["EPSG:5181"]);
                    var grs80 = proj4.Proj(proj4.defs["EPSG:4737"]);

                    var p = new proj4.Point( response[i].LOCATIONX, response[i].LOCATIONY);
                    p = proj4(centerGRS80, grs80, p); // 변환 좌표

                    linePath.push(new kakao.maps.LatLng(p.y, p.x))

                    initX = p.x;
                    initY = p.y;
                }

                console.log(initX);
                console.log(initY)

                var mapContainer = document.getElementById('map'),
                    mapOption = {
                        center: new kakao.maps.LatLng(initY,initX),
                        level: 3
                    };

                var map = new kakao.maps.Map(mapContainer, mapOption);

                var polyline = new kakao.maps.Polyline({
                    path: linePath,
                    strokeWeight: 5,
                    strokeColor: 'red',
                    strokeOpacity: 0.7,
                    strokeStyle: 'solid'
                });

                polyline.setMap(map);

            },
            error: function(response){
                console.log("error");
            }
        })
    }
</script>
</body>
</html>