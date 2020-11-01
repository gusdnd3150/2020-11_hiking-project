<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/common/header.jsp" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=10adf6d2b4bb761d1e63b20e8cb26e87&libraries=drawing"></script>
<body class="container pt-5">
<div class="pt-5">
    <div class="d-flex justify-content-between">
        <h1>${trail[0].MNTN_NM} 등산로</h1>
        <c:choose>
            <c:when test="${checkLike eq 'Y'}">
                <button class="trailStar btn btn-outline-warning" style="height: 40px"><i class="fas fa-star"></i></button>
            </c:when>
            <c:when test="${empty checkLike || checkLike eq 'N'}">
                <button class="trailDisStar btn btn-outline-warning" style="height: 40px" ><i class="far fa-star"></i></button>
            </c:when>
        </c:choose>
    </div>
    <div class="map_wrap form-inline">
        <div id="map" class="col-sm-12 col-md-8" style="height:350px;"></div>
        <div id="sectionList" class="col-sm-12 col-md-4" style="height: 350px;border: 1px solid black;overflow-y: scroll">
            <li class="p-1" style="list-style: none;">
                <a href="/trail/${trail[0].MNTN_CODE}.do?userId=${LOGIN}" class="col-12 pr-0 mr-0" style="text-decoration: none;height: 10px">
                    <span>전체 구간 보기</span>
                </a>
            </li>
            <c:forEach var="trail" items="${trail}">
                <li class="p-1" style="list-style: none;">
                    <a href="/trail/detail/${trail.MNTN_CODE}.do?FID=${trail.FID}&userId=${LOGIN}"
                       class="col-12 justify-content-between" style="text-decoration: none;height: 10px"
                       onclick="window.open(this.href,'${trail.PMNTN_NM}_blank','width=450, height=777');return false;">
                        <span>${trail.FID+1}</span>
                        <span>${trail.PMNTN_NM}</span>
                    </a>
                </li>
            </c:forEach>
        </div>
    </div>
    <div class="p-5" style="border: solid 1px black">
        <h3>등산로 상세 정보</h3>
        <div class="row" style="font-size: 20px">
                <div class="col-6">
                    <div>등산로 구분 : ${trail[0].MNTN_NM}</div>
                    <div>종합 난이도 : ${sum[0].AVGDFFL}</div>
                    <div>총 구간 길이 : ${sum[0].SUMLT} km</div>
                </div>
                <div class="col-6">
                    <div>총 상행시간 : ${sum[0].SUMUP} 분</div>
                    <div>총 하행시간 : ${sum[0].SUMDN} 분</div>
                    <div>갱신일자 : ${sum[0].DATA_STDR_}</div>
                </div>
        </div>
    </div>
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
            level: 5,
            draggable: true
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

                if (navigator.geolocation) {
                    //위치 정보를 얻기
                    navigator.geolocation.getCurrentPosition (function(pos) {

                        positions.push(
                            {
                                title: 'myposition',
                                content: '<div>현재 나의 위치</div>',
                                latlng: new kakao.maps.LatLng(pos.coords.latitude, pos.coords.longitude)
                            })

                        var imageSrc = "/resources/img/marker.png";

                        for (var i = 0; i < positions.length; i++) {

                            var imageSize = new kakao.maps.Size(35, 35);

                            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

                            var marker = new kakao.maps.Marker({
                                map: map,
                                position: positions[i].latlng,
                                title: positions[i].title,
                                image: markerImage,
                                zIndex: positions[i].zIndex,
                            });
                            console.log("pushed")
                            overlays.push(marker);

                        }
                    })
                } else {
                    alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.")
                }

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
                    strokeColor: 'red',
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
    $(document).on('click','.trailDisStar',function (){

        if(${LOGIN==''}||${LOGIN==null}){
            alert('로그인 해주세요');return
        }

        var data = {
            "MNTN_CODE" : ${trail[0].MNTN_CODE},
            "USERID" : '${LOGIN}',
            "likeYN" : 'Y'
        }

        $.ajax({
            type: "POST",
            url: "/trail/like.do",
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){
                $('.trailDisStar')
                    .empty()
                    .attr('class','trailStar btn btn-outline-warning')
                    .append('<i class="fas fa-star"></i>')
                alert("찜 목록에 추가 되었습니다")
            },
            error: function (response){
                console.log("error")
            }
        })
    })
    $(document).on('click','.trailStar',function (){

        if(${LOGIN==''}||${LOGIN==null}){
            alert('로그인 해주세요');return
        }

        var data = {
            "MNTN_CODE" : ${trail[0].MNTN_CODE},
            "USERID" : '${LOGIN}',
            "likeYN" : 'N'
        }

        $.ajax({
            type: "POST",
            url: "/trail/like.do",
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){
                $('.trailStar')
                    .empty()
                    .append('<i class="far fa-star"></i>')
                    .attr('class','trailDisStar btn btn-outline-warning');
                alert("찜 목록에서 삭제 되었습니다")

            },
            error: function (response){
                console.log("error")
            }
        })
    })
</script>
</body>
</html>