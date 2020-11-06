<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>산 정보보기</title>
    <link rel="icon" href="../resources/img/doraemon.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="/resources/css/views/mountain/sub-detail.css" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=aa5fc29e99e8b77c9464b6a8922d3eaa&libraries=services"></script>
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
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script>
    var keyword = '${mountain[0].mntnm}';
    var markers = [];

    var mapContainer = document.getElementById('map'),
        mapOption = {
            center: new kakao.maps.LatLng(37.566826, 126.9786567),
            level: 3
        };

    var map = new kakao.maps.Map(mapContainer, mapOption);
    var ps = new kakao.maps.services.Places();
    var infowindow = new kakao.maps.InfoWindow({zIndex:1});

    ps.keywordSearch( keyword, placesSearchCB);

    function placesSearchCB(data, status, pagination) {
        if (status === kakao.maps.services.Status.OK) {

            displayPlaces(data);
            displayPagination(pagination);

        } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

            alert('검색 결과가 존재하지 않습니다.');
            return;

        } else if (status === kakao.maps.services.Status.ERROR) {

            alert('검색 결과 중 오류가 발생했습니다.');
            return;

        }
    }

    function displayPlaces(places) {

        var listEl = document.getElementById('placesList'),
            menuEl = document.getElementById('menu_wrap'),
            fragment = document.createDocumentFragment(),
            bounds = new kakao.maps.LatLngBounds(),
            listStr = '';

        removeAllChildNods(listEl);

        for ( var i=0; i<places.length; i++ ) {

            var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
                marker = addMarker(placePosition, i),
                itemEl = getListItem(i, places[i]);

            bounds.extend(placePosition);

            (function(marker, title) {
                kakao.maps.event.addListener(marker, 'mouseover', function() {
                    displayInfowindow(marker, title);
                });

                kakao.maps.event.addListener(marker, 'mouseout', function() {
                    infowindow.close();
                });

                itemEl.onmouseover =  function () {
                    displayInfowindow(marker, title);
                };

                itemEl.onmouseout =  function () {
                    infowindow.close();
                };
            })(marker, places[i].place_name);

            fragment.appendChild(itemEl);
        }

        listEl.appendChild(fragment);
        menuEl.scrollTop = 0;

        map.setBounds(bounds);
    }

    function getListItem(index, places) {

        var el = document.createElement('li'),
            itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

        if (places.road_address_name) {
            itemStr += '    <span>' + places.road_address_name + '</span>' +
                '   <span class="jibun gray">' +  places.address_name  + '</span>';
        } else {
            itemStr += '    <span>' +  places.address_name  + '</span>';
        }

        itemStr += '  <span class="tel">' + places.phone  + '</span>' +
            '</div>';

        el.innerHTML = itemStr;
        el.className = 'item';

        return el;
    }

    function addMarker(position, idx, title) {
        var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
            imageSize = new kakao.maps.Size(36, 37),
            imgOptions =  {
                spriteSize : new kakao.maps.Size(36, 691),
                spriteOrigin : new kakao.maps.Point(0, (idx*46)+10),
                offset: new kakao.maps.Point(13, 37)
            },
            markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
                position: position,
                image: markerImage
            });

        marker.setMap(map);
        markers.push(marker);

        return marker;
    }

    function displayPagination(pagination) {
        var paginationEl = document.getElementById('pagination'),
            fragment = document.createDocumentFragment(),
            i;

        while (paginationEl.hasChildNodes()) {
            paginationEl.removeChild (paginationEl.lastChild);
        }

        for (i=1; i<=pagination.last; i++) {
            var el = document.createElement('a');
            el.href = "#";
            el.innerHTML = i;

            if (i===pagination.current) {
                el.className = 'on';
            } else {
                el.onclick = (function(i) {
                    return function() {
                        pagination.gotoPage(i);
                    }
                })(i);
            }

            fragment.appendChild(el);
        }
        paginationEl.appendChild(fragment);
    }

    function displayInfowindow(marker, title) {
        var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

        infowindow.setContent(content);
        infowindow.open(map, marker);
    }

    function removeAllChildNods(el) {
        while (el.hasChildNodes()) {
            el.removeChild (el.lastChild);
        }
    }
</script>
</body>
</html>
