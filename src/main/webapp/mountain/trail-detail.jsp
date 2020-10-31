<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<jsp:include page="/common/header.jsp" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=10adf6d2b4bb761d1e63b20e8cb26e87&libraries=drawing"></script>
<body class="container pt-5">
<div class="pt-5">
    ${trail}
    <div class="d-flex justify-content-between">
        <h1>${trail[0].MNTN_NM} 등산로</h1>
        <button class="mtStar btn btn-outline-warning" style="height: 40px" onclick=""><i class="fas fa-star"></i></button>
    </div>
    <span>
        ${trail[0].PMNTN_NM}
    </span>
<%--    <button class="mtStar btn btn-outline-warning" onclick=""><i class="far fa-star"></i></button>--%>
    <div class="map_wrap form-inline">
        <div id="map" style="width:80%;height:350px;"></div>
        <div id="sectionList" style="width: 20%;height: 350px;border: 1px solid black"></div>
    </div>
    <div>
        <h3>등산로 상세 정보</h3>
        <div class="row">
                <div class="col-6">
                    <div>난이도 : ${trail[0].PMNTN_DFFL}</div>
                    <div>산이름 : ${trail[0].MNTN_NM}</div>
                    <div>주요지점 : ${trail[0].PMNTN_MAIN}</div>
                    <div>구간 길이 : ${trail[0].PMNTN_LT} km</div>
                    <div>갱신 : ${trail[0].DATA_STDR_}</div>
                </div>
                <div class="col-6">
                    <div>상행시간 : ${trail[0].PMNTN_UPPL} 분</div>
                    <div>하행시간 : ${trail[0].PMNTN_GODN} 분</div>
                    <div>폐쇄여부 : ${trail[0].PMNTN_CNRL}</div>
                    <div>위험구간 내용 : ${trail[0].PMNTN_RISK}</div>
                    <div>공식 추천 : ${trail[0].PMNTN_RECO}</div>
                </div>
                <hr />
        </div>
    </div>
</div>
<div>${trail[0].MNTN_CODE} // ${LOGIN}
    <a href="/trail/${trail[0].MNTN_CODE}.do?FID=0&userId=${LOGIN}">0</a>
    <a href="/trail/${trail[0].MNTN_CODE}.do?FID=1&userId=${LOGIN}">1</a>
    <a href="/trail/${trail[0].MNTN_CODE}.do?FID=2&userId=${LOGIN}">2</a>
    <a href="/trail/${trail[0].MNTN_CODE}.do?FID=3&userId=${LOGIN}">3</a>
    <a href="/trail/${trail[0].MNTN_CODE}.do?FID=4&userId=${LOGIN}">4</a>
    <a href="/trail/${trail[0].MNTN_CODE}.do?FID=5&userId=${LOGIN}">5</a>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.6.2/proj4.js"></script>
<%--<script type="text/javascript" src="/resources/js/proj4js-combined.js"></script>--%>
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function (){
        getDataFromDrawingMap();
    });

    proj4.defs["EPSG:5181"] = "+proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=600000 +ellps=GRS80 +units=m +no_defs";
    proj4.defs["EPSG:4737"] = "+proj=longlat +ellps=GRS80 +no_defs";

    var centerGRS80 = proj4.Proj(proj4.defs["EPSG:5181"]);
    var grs80 = proj4.Proj(proj4.defs["EPSG:4737"]);

    var p = new proj4.Point( ${trail[0].LOCATIONX}, ${trail[0].LOCATIONY});
    p = proj4(centerGRS80, grs80, p);

    var mapContainer = document.getElementById('map'),
        mapOptions = {
            center: new kakao.maps.LatLng(p.y, p.x),
            level: 5
        };

    var map = new kakao.maps.Map(mapContainer, mapOptions),
        overlays = [];

    function getDataFromDrawingMap() {
        removeOverlays();

        drawMarker();
        <c:forEach var="trail" items="${trail}">
           drawPolyline(${trail.MNTN_CODE}, ${trail.FID});
        </c:forEach>
    }

    function removeOverlays() {
        var len = overlays.length, i = 0;

        for (; i < len; i++) {
            overlays[i].setMap(null);
        }

        overlays = [];
    }
    function drawMarker() {

        var data = {
            "MNTN_CODE" : ${trail[0].MNTN_CODE}
        }

        $.ajax({
            type: "GET",
            url: "/trail/spot.do",
            data: data,
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){

                proj4.defs["EPSG:5181"] = "+proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=600000 +ellps=GRS80 +units=m +no_defs";
                proj4.defs["EPSG:4737"] = "+proj=longlat +ellps=GRS80 +no_defs";

                var positions = [];

                var initX = 0;
                var initY = 0;

                for(var i=0;i<response.length;i++){
                    var centerGRS80 = proj4.Proj(proj4.defs["EPSG:5181"]);
                    var grs80 = proj4.Proj(proj4.defs["EPSG:4737"]);

                    var p = new proj4.Point( response[i].LOCATIONX, response[i].LOCATIONY);
                    p = proj4(centerGRS80, grs80, p);

                    var content = '';

                    content += '<div class ="label"><span class="left"></span><span class="center">'
                    content += response[i].DETAIL_SPO;
                    content += '</span><span class="right"></span></div>'

                    positions.push(
                        {
                            title:'a',
                            content: content,
                            latlng: new kakao.maps.LatLng(p.y, p.x)

                        }
                    )

                    var customOverlay = new kakao.maps.CustomOverlay({
                        position: positions[i].latlng,
                        content: content
                    });

                    customOverlay.setMap(map);

                    initX = p.x;
                    initY = p.y;
                }

                var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

                for (var i = 0; i < positions.length; i ++) {

                    var imageSize = new kakao.maps.Size(24, 35);

                    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

                    var marker = new kakao.maps.Marker({
                        map: map,
                        position: positions[i].latlng,
                        title : positions[i].title,
                        image : markerImage,
                        zIndex: positions[i].zIndex,
                        customOverlay: customOverlay
                    });

                    overlays.push(marker);
                }

            },
            error: function(response){
                console.log("error");
            }
        })
    }
    function drawPolyline(MNTN_CODE,FID) {

        var data = {
            "MNTN_CODE" : MNTN_CODE,
            "FID" : FID,
        }

        $.ajax({
            type: "GET",
            url: "/trail/location.do",
            data: data,
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){
                proj4.defs["EPSG:5181"] = "+proj=tmerc +lat_0=38 +lon_0=127 +k=1 +x_0=200000 +y_0=600000 +ellps=GRS80 +units=m +no_defs";
                proj4.defs["EPSG:4737"] = "+proj=longlat +ellps=GRS80 +no_defs";

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

                var polyline = new kakao.maps.Polyline({
                    map: map,
                    path: linePath,
                    strokeWeight: 5,
                    strokeColor: '#ffcc00',
                    strokeOpacity: 0.7,
                    strokeStyle: 'solid'
                });
                overlays.push(polyline);
            },
            error: function(response){
                console.log("error");
            }
        })
    }
    function pointsToPath(points) {
        var len = points.length,
            path = [],
            i = 0;

        for (; i < len; i++) {
            var latlng = new kakao.maps.LatLng(points[i].y, points[i].x);
            path.push(latlng);
        }

        return path;
    }
</script>
</body>
</html>