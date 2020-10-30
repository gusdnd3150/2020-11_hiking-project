<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<jsp:include page="/common/header.jsp" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=10adf6d2b4bb761d1e63b20e8cb26e87&libraries=services"></script>
<body class="container pt-5">
<div class="pt-5">
    <h1>${trail[0].PMNTN_NM}</h1>
    <div id="map" style="width:100%;height:350px;"></div>
    <div>난이도 : ${trail[0].PMNTN_DFFL}</div>
    <div>산이름 : ${trail[0].MNTN_NM}</div>
    <div>주요지점 : ${trail[0].PMNTN_MAIN}</div>
    <div>난이도 : ${trail[0].PMNTN_DFFL}</div>
    <div>구간 길이 : ${trail[0].PMNTN_LT} km</div>
    <div>갱신 : ${trail[0].DATA_STDR_}</div>
    <div>폐쇄여부 : ${trail[0].PMNTN_CNRL}</div>
    <div>상행시간 : ${trail[0].PMNTN_UPPL} 분</div>
    <div>하행시간 : ${trail[0].PMNTN_GODN} 분</div>
    <div>위험구간 내용 : ${trail[0].PMNTN_RISK}</div>
    <div>공식 추천 : ${trail[0].PMNTN_RECO}</div>
<%--    <div>${trail[0]}</div>--%>
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
            "MNTN_CODE" : ${trail[0].MNTN_CODE},
            "FID" : 0
        }

        $.ajax({
            type: "GET",
            url: "/trail/map.do",
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
                        level: 7
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