<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<jsp:include page="/common/header.jsp" />
<link rel="stylesheet" type="text/css" href="./resources/css/views/home.css">
<link rel="stylesheet" type="text/css" href="./resources/css/slick.css">
<link rel="stylesheet" type="text/css" href="./resources/css/slick-theme.css">
<!-- slider -->
<body class="pt-5">
<header>
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<!-- Slide One - Set the background image for this slide in the line below -->
			<div class="carousel-item active" style="background-image: url('resources/img/slider/slider1.jpg')">
				<div class="carousel-caption d-none d-md-block">
					<h3 class="display-4">우리가 '진짜' 백두 산악회</h3>
					<p class="lead">건전한 등산문화 '음주가무는 안돼' 마음편히 등산하자..더보기</p>
				</div>
			</div>
			<!-- Slide Two - Set the background image for this slide in the line below -->
			<div class="carousel-item" style="background-image: url('/resources/img/slider/slider2.jpg')">
				<div class="carousel-caption d-none d-md-block">
					<h3 class="display-4">등산이 즐거운 11가지 이유</h3>
					<p class="lead">등산이 즐거운 이유는 여러가지 이지만..더보기</p>
				</div>
			</div>
			<!-- Slide Three - Set the background image for this slide in the line below -->
			<div class="carousel-item" style="background-image: url('/resources/img/slider/photo3.jpeg')">
				<div class="carousel-caption d-none d-md-block">
					<h3 class="display-4">시원한 가을바람 쐬고 가세요</h3>
					<p class="lead">여름은 갔다. 가을산행에 준비해야할 것들은..더보기</p>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
</header>
<div class="container">
	<div>
		<h1>추천 등산모임</h1>
	</div>
	<div class="responsive">
			<c:forEach var="group" items="${group}">
					<div class="card" >
						<img class="card-img-top" src="/group/media/${group.groupNum}" alt="..." style="width: 100%"></img>
						<div class="card-body">
							<h5 class="card-title">${group.name}</h5>
							<p class="card-text text-muted" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">${group.detail}</p>
							<a href="/group/${group.groupNum}" class="btn btn-info">바로가기</a>
						</div>
					</div>
			</c:forEach>
	</div>
</div>
<!-- js -->
<script type="text/javascript" src="./resources/js/jquery.js"></script>
<script type="text/javascript" src="./resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="./resources/js/slick.js"></script>
<script>
	$(document).ready(function() {
		$('.responsive').slick({
			swipe: true,
			speed: 300,
			slidesToShow: 3,
			slidesToScroll: 3,
			autoPlay: true,
			autoplaySpeed: 4000,
			arrow: true,
			responsive: [
				{
					breakpoint: 1024,
					settings: {
						slidesToShow: 2,
						slidesToScroll: 2,
					}
				},
				{
					breakpoint: 600,
					settings: {
						slidesToShow: 1.3,
						slidesToScroll: 1.3
					}
				},
				{
					breakpoint: 480,
					settings: {
						slidesToShow: 1,
						slidesToScroll: 1
					}
				}
				// You can unslick at a given breakpoint now by adding:
				// settings: "unslick"
				// instead of a settings object
			]
		});
	})
</script>
<jsp:include page="/common/footer.jsp" />