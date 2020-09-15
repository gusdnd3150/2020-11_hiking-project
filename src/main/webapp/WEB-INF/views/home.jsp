<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick.css" />
	<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />
	<style>
		.slick-arrow{
			z-index: 2;
			position:absolute;
			top: 50%;
			width: 50px;
			height: 50px;
			transform: translateY(-25px);
		}
		.slick-prev.slick-arrow{
			left: 0;
		}
		.slick-next.slick-arrow{
			right: 0;
		}

		.slick-dots{
			text-align: center;
		}
		.slick-dots li{
			display: inline-block;
			margin: 0 5px;
		}
		.slick-items {
			width: 1600px;
			position: center;
		}
		.slick-items > div {
			width: 100%;
			height: 500px;
		}
		.slick-items{
			display:flex!important;
			align-items:center;
		}

	</style>
</head>
<body>
	<div class="slick-items">
		<div><img src="resources/img/slider/photo1.jpeg"></div>
		<div><img src="resources/img/slider/photo2.jpeg"></div>
		<div><img src="resources/img/slider/photo3.jpeg"></div>
		<div><img src="resources/img/slider/photo4.jpeg"></div>
		<div><img src="resources/img/slider/photo5.jpeg"></div>
		<div><img src="resources/img/slider/photo6.jpeg"></div>
	</div>

<script src="resources/js/jquery.js"></script>
<script type="text/javascript" src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$('.slick-items').slick({
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
		});
	</script>
</body>
</html>
