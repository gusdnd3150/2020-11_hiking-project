<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<jsp:include page="/common/header.jsp" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./resources/css/views/home.css">
<body class="container pt-5" style="width: 100%">
<!-- cover -->
<div class="cover-container row">
	<div class="left-cover col-6 align-self-center">
		<div class="inner-cover" style="margin-left: 20%">
			<h1>등산 좋아하세요?</h1>
			산모임 검색하기
<%--			<button class="btn btn-outline-info" onclick="moveToMain();">더보기</button>--%>
			<div class="form-inline">
				<input type="text" class="form-control col-6">
				<a href="#" class="pl-2">
					<img src="../resources/img/search.png" width="25" height="25" onclick="">
				</a>
			</div>
			<div onclick="moveToMain()">
				<h1><i class="fas fa-angle-down"></i></h1>
			</div>
		</div>
	</div>
	<div class="right-cover text-right col-sm-12 col-md-6 pt-5" style="object-fit: cover">
		<img id="cover_image" src="./resources/img/cover.png" style="height: 100%;overflow-y: hidden" >
	</div>
</div>
<hr />
<%--<div class="container">--%>
<!-- slider -->
<header>
	<div id="carouselExampleIndicators" class="carousel slide container" data-ride="carousel">
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
	<hr />
	<div class="pt-3">
		<label for="groupList">
			<h1>인기 등산모임</h1>
		</label>
		<div id="groupList" class="row"></div>
	</div>
	<hr />
	<div class="row">
		<div class="col-sm-12 col-md-6">
			<label for="afterList">
				<h1>인기 등산후기</h1>
			</label>
			<div id="afterList"></div>
		</div>
		<div class="col-sm-12 col-md-6">
			<label for="moimList">
				<h1>인기 산모임</h1>
			</label>
			<div id="moimList"></div>
		</div>
	</div>
	<hr />
	<div class="row">
		<div class="col-sm-12 col-md-6">
			<p><h2>공지사항</h2></p>
			<ul class="list-group">
				<li class="list-group-item"><a href="#" class="notice-item" style="color: black">[공지사항타입] 공지내용</a><span class="badge badge-danger">New</span></li>
				<li class="list-group-item"><a href="#" class="notice-item" style="color: black">공지사항2</a></li>
				<li class="list-group-item"><a href="#" class="notice-item" style="color: black">공지사항3</a></li>
				<li class="list-group-item"><a href="#" class="notice-item" style="color: black">공지사항4</a></li>
				<li class="list-group-item p-0 text-center text-muted"><a href="#" class="notice-item" style="color: black">더보기</a></li>
			</ul>
		</div>
		<div class="col-sm-12 col-md-6">
			<p><h2>이벤트</h2></p>
			<img src="./resources/img/test/event1.jpg" style="max-width: 100%">
		</div>
	</div>
	<hr />
	<div class="text-center" style="width:100%; height: 150px; display: flex;justify-content: center;flex-direction: column">
		<div>
			<div class="memberCountCon col-12" style="font-size:40px;"></div>
		</div>
	</div>
	<hr />
</div>

<!-- js -->
<script type="text/javascript" src="./resources/js/jquery.js"></script>
<script type="text/javascript" src="./resources/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function (){
		mainGroupList();
		mainAfterList();
		mainMoimList();
	})
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

	function moveToMain(){
		var location = document.querySelector('header').offsetTop;
		window.scrollTo({top:location, behavior:"smooth"})
	}

	function mainGroupList(){

		$.ajax({
			type: "GET",
			url: "/main/groupList.do",
			dataType: 'json',
			contentType: "application/json; charset=utf-8;",
			success: function (response){
				for(var i=0;i<response.length;i++) {

					var editorContent = response[i].DETAIL;
					var covertContent = editorContent.replace(/(<([^>]+)>)/ig,"");

					var html = '';

					html += '<div class="pt-3 col-lg-4 col-sm-6" id="groupList">';
					html += '<div class="card border-0" >';
					html += '<a href="/group/' + response[i].GROUPNUM + '">';
					html += '<img class="card-img-top" src="/resources/img/' + response[i].STOREDFILENAME + '" alt="..." style="width: 100%" />'
					html += '</a>';
					html += '<div class="card-body row p-3 pl-4">';
					html += '<a href="/profile/' + response[i].ID + '" onclick=\"window.open(this.href,\'\',\'width=500, height=600\'); return false;">';
					html += '<img src="/resources/img/' + response[i].CONTENT2 + '" class="rounded-circle" style="width: 40px;height: 40px;">';
					html += '</a>';
					html += '<div class="col-10 p-0 pl-2">';
					html += '<h5 class="card-title m-0" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">';

					if (response[i].STATUS == '모집중') {
						html += '<span style="color: limegreen">';
					} else if (response[i].STATUS == '마감') {
						html += '<span style="color: red">';
					}

					html += '[' + response[i].STATUS + ']</span>';
					html += response[i].NAME;
					html += '</h5>';
					html += '<p class="card-text text-muted mb-1" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">' + covertContent + '</p>';
					html += '<p class="text-muted">' + response[i].STARTDAY + ' 출발</p>'
					html += '</div></div></div></div>';

					$('#groupList').append(html);
				}
			},
			error: function(response){
				console.log("error");
			}
		})
	}

	function mainAfterList(){
		$.ajax({
			type: "GET",
			url: "/main/afterList.do",
			dataType: 'json',
			contentType: "application/json; charset=utf-8;",
			success: function (response){
				for(var i=0;i<5;i++){

					var html = '';

					html += '<a href="'+response[i].AFTERNUM+'">';
					html += '<div class="media p-1">';
					html += '<img src="/resources/img/'+response[i].CONTENT2+'" class="mr-3 rounded" style="width: 50px;height: 50px">';
					html += '<div class="media-body">';
					html += '<span>';
					html += '<h4 class="m-0" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">['+response[i].MTNM+'] '+response[i].TITLE+'</h4>';
					html += '<div class="text-muted">'+response[i].CREATEDAT+'</div>'
					html += '</span></div></div></a>';

					$('#afterList').append(html);
				}


			},
			error: function(response){
				console.log("error");
			}
		})
	}

	function mainMoimList(){

		$.ajax({
			type: "GET",
			url: "/main/commuList.do",
			dataType: 'json',
			contentType: "application/json; charset=utf-8;",
			success: function (response){

				console.log(response)
				for(var i=0;i<5;i++){

					var html = '';

					html += '<a href="/commu/commuPageView.do?groupNum='+response[i].GROUPNUM+'">';
					html += '<div class="media p-1">';
					html += '<img src="/resources/img/'+response[i].STOREDFILENAME+'" class="mr-3 rounded" style="width: 50px;height: 50px">';
					html += '<div class="media-body">';
					html += '<span>';
					html += '<h4 class="m-0" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">'+response[i].NAME+'</h4>';
					html += '<div class="text-muted"> 멤버 '+ response[i].STAFFCURRENT +'/'+ response[i].AREA+ '</div>'
					html += '</span></div></div></a>';

					$('#moimList').append(html);
				}


			},
			error: function(response){
				console.log("error");
			}
		})
	}
</script>
</body>
<jsp:include page="/common/footer.jsp" />
