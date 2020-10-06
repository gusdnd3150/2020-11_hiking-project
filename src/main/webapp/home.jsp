<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<jsp:include page="/common/header.jsp" />
<link rel="stylesheet" type="text/css" href="./resources/css/views/home.css">
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
	<div class="pt-3 groupList">
		<label for="groupList">
			<h1>추천 등산모임</h1>
		</label>
		<div class="row">
				<c:forEach var="group" items="${group}">
					<div class="pt-3 col-lg-4 col-sm-6" id="groupList">
						<div class="card" >
							<img class="card-img-top" src="http://localhost:8080/resources/img/${group.STOREDFILENAME}" alt="..." style="width: 100%"></img>
							<div class="card-body">
								<h5 class="card-title">${group.NAME}</h5>
								<p class="card-text text-muted" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">${group.DETAIL}</p>
								<a href="/group/${group.GROUPNUM}" class="btn btn-info">바로가기</a>
							</div>
						</div>
					</div>
				</c:forEach>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6">
			<p><h2>공지사항</h2></p>
			<ul class="list-group">
				<li class="list-group-item"><a href="#" class="notice-item" style="color: black">[공지사항타입] 공지내용</a><span class="badge badge-danger">New</span></li>
				<li class="list-group-item"><a href="#" class="notice-item" style="color: black">공지사항2</a></li>
				<li class="list-group-item"><a href="#" class="notice-item" style="color: black">공지사항3</a></li>
				<li class="list-group-item"><a href="#" class="notice-item" style="color: black">공지사항4</a></li>
				<li class="list-group-item"><a href="#" class="notice-item" style="color: black">공지사항5</a></li>
			</ul>
		</div>
		<div class="col-md-6">
			<p><h2>이벤트</h2></p>
			<img src="./resources/img/test/event1.jpg" style="width: 100%;">
		</div>
	</div>
	<pre></pre>
	<div class="memberCountCon col-12" style="font-size:40px;text-align: center"></div>
</div>

<!-- js -->
<script type="text/javascript" src="./resources/js/jquery.js"></script>
<script type="text/javascript" src="./resources/js/bootstrap.min.js"></script>
<script>
	var memberCountConTxt= 296842;

	$({ val : 0 }).animate({ val : memberCountConTxt }, {
		duration: 1000,
		step: function() {
			var num = numberWithCommas(Math.floor(this.val));
			$(".memberCountCon").text("현재 "+num+ "번의 등산이 이루어졌어요");
		},
		complete: function() {
			var num = numberWithCommas(Math.floor(this.val));
			$(".memberCountCon").text("현재 "+num+ "번의 등산이 이루어졌어요" );
		}
	});

	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}

</script>
<jsp:include page="/common/footer.jsp" />