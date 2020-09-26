<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<jsp:include page="/common/header.jsp" />
<link rel="stylesheet" type="text/css" href="./resources/css/views/home.css">
	<!-- slider -->
<header>
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner" role="listbox">
			<!-- Slide One - Set the background image for this slide in the line below -->
			<div class="carousel-item active" style="background-image: url('/resources/img/slider/photo1.jpeg')">
				<div class="carousel-caption d-none d-md-block">
					<h3 class="display-4">First Slide</h3>
					<p class="lead">This is a description for the first slide.</p>
				</div>
			</div>
			<!-- Slide Two - Set the background image for this slide in the line below -->
			<div class="carousel-item" style="background-image: url('/resources/img/slider/photo2.jpeg')">
				<div class="carousel-caption d-none d-md-block">
					<h3 class="display-4">Second Slide</h3>
					<p class="lead">This is a description for the second slide.</p>
				</div>
			</div>
			<!-- Slide Three - Set the background image for this slide in the line below -->
			<div class="carousel-item" style="background-image: url('/resources/img/slider/photo3.jpeg')">
				<div class="carousel-caption d-none d-md-block">
					<h3 class="display-4">Third Slide</h3>
					<p class="lead">This is a description for the third slide.</p>
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
		<div class="row">
			<div class="col-md-4">
				<div class="list_title">
					<h1>추천 등산모임</h1>
				</div>
				<div class="list_content">
				<c:forEach var="group" items="${group}">
					<li class="item">
						<img class="image" src="/group/media/${group.groupNum}"></img>
						<div class="cont">
							<strong>${group.name}</strong>
							<p>${group.detail}</p>
							<a href="#">바로가기</a>
						</div>
					</li>
				</c:forEach>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="/common/footer.jsp" />