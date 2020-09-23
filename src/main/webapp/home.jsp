<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/views/home.css">
<jsp:include page="/common/header.jsp" />
	<!-- slider -->
	<div class="single-item">
		<div><img src="resources/img/slider/photo1.jpeg"></div>
		<div><img src="resources/img/slider/photo2.jpeg"></div>
		<div><img src="resources/img/slider/photo3.jpeg"></div>
		<div><img src="resources/img/slider/photo4.jpeg"></div>
		<div><img src="resources/img/slider/photo5.jpeg"></div>
		<div><img src="resources/img/slider/photo6.jpeg"></div>
	</div>
	<div class="list_wrap">
		<div class="list_title">
			<h1>추천 등산모임</h1>
		</div>
		<div class="list_content">
		<c:forEach var="list" items="${list}">
			<li class="item">
				<img class="image" src="/group/media/${list.groupNum}"></img>
				<div class="cont">
					<strong>${list.name}</strong>
					<p>${list.detail}</p>
					<a href="#">바로가기</a>
				</div>
			</li>
		</c:forEach>
		</div>
	</div>

<script src="resources/js/jquery.js"></script>
<script type="text/javascript" src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$('.single-item').slick({
				autoplay : true,
				dots: true,
				speed : 300 ,
				infinite: true,
				autoplaySpeed: 3000 ,
				arrows: true,
				slidesToShow: 1,
				slidesToScroll: 1,
				fade: false,
			});
			$('.multiple-items').slick({
				slidesToShow: 4,
				slidesToScroll: 1
			});
		});

	</script>
</body>
<jsp:include page="/common/footer.jsp" />