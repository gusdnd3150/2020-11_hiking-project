<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>산오름</title>
    <!-- ico,css -->
    <link rel="icon" href="../resources/img/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" type="text/css" href="../resources/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../resources/css/views/common/header.css" />
    <style>
		/* body {
			
		}
		
		.container {
			margin: auto;
			float: center;
		}
		
		.space {
			height: 120px;
		}
		
		#search {
			width: 100%;
			margin: 10px auto;
		}
		
		#search1 {
			width: 80%;
			float: left;
		}
		
		#search2 {
			width: 20%;
			float: right;
		}*/
		
		.card {
			margin: 10px auto;
		}
		
		#space {
			width: 50px;
		}
		/*
		.col-md-2 {
			position: fixed;
		}
		
		#side{
			list-style-type: none;
			width: 7%;
			padding:2px 2px;
			position: fixed;
			border: 3px solid green;
		}
		
		li {
			padding: 12px 0px;
		}*/
		#list-tab{
		width: 90px;
		position: fixed;
		} 
	</style>
</head>
<body style="background-color: #E0F8E7;">
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
    <div class="container">
        <a class="navbar-brand" href="/">
            <img src="../resources/img/main-icon.svg" width="30" height="30" class="d-inline-block align-top" alt="" loading="lazy">
            산오름
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/group/list.do">산오르기<span class="sr-only"></span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">산모임</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/B_P002_D001/shopMainCate?listType=10">오름마켓</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">고객센터</a>
                </li>
                <li class="nav-item">
                </li>

                <c:choose>
                    <c:when test="${not empty LOGIN}">
                <li class="nav-item">
                        <a class="nav-link" href="/user/logOut.do">로그아웃</a>
                </li>
                <li class="nav-item">
                        <a class="nav-link" href="/mypage/mypageHomeView.do">마이페이지</a>
                </li>
                    </c:when>
                    <c:otherwise>
                <li class="nav-item">
                        <a class="nav-link" href="/user/logInView.do">로그인</a>
                </li>
       
                    </c:otherwise>
                </c:choose>
                <button class="btn my-2 my-sm-0">
                    <img src="../resources/img/search.png" width="25" height="25" onclick="">
                </button>
            </ul>
        </div>
    </div>
</div>
</nav>
	<div class="container mt-4">
		<div class="row pt-5">
			<div class="col-md-3">
				<div class="card col-sm-12" style="width: 15rem;">
					<img src="../resources/img/home.png" height="200"
						class="card-img-top" alt="카페 기본 이미지">
					<div class="card-body">
						<h5 class="card-title">Card title</h5>
						<small>멤버</small><small>13</small> <br> <br>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
						<a href="" style="color: gray;">관리하기></a> <br> <a href=""
							style="color: gray;">탈퇴하기></a> <br> <br>
					</div>
				</div>
				
				
			<center>
				<a href="#" class="btn btn-primary btn-sm"
					style="background-color: green;">가입 신청</a> 
				</center>
				</div>
				<div>
			</div>


			<div class="col-md-6">
				<div id="search" class="row pl-3 pb-2">
					<div id="search1">
						<input class="form-control " type="search"
							style="width: 420px; height: 40px; !important;"
							placeholder="Search" aria-label="Search">
					</div>
					<button class="btn btn-outline-success"
						style="width: 50px; height: 40px; !important;" type="submit">
						<img src="../resources/img/search.png" width="25" height="25"
							onclick="">
					</button>
				</div>
				
				<div class="card">
				<div class="card-body">
				📌📍📎📏📐📑📒📓📔📕📖📗📘📙📚📛📜📝
					<hr class="my-4">
					</div>
					<div class="card-body">
						<blockquote class="blockquote my-4">
							<p>글을 작성해주세요~~~~~ //CK에디터 박힐 부분</p>
						</blockquote>
					</div>
				</div>

				<div class="card">
					<div class="card-header">공지사항</div>
					<div class="card-body">
						<blockquote class="blockquote mb-0">
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
								Integer posuere erat a ante.</p>
							<footer class="blockquote-footer">
								Someone famous in <cite title="Source Title">Source Title</cite>
							</footer>
						</blockquote>
					</div>
				</div>
<div class="card">
<div class="card-body">
우리 청솔 산모임 9월 정모 너무 행복했어요~~우리 청솔 산모임 9월 정모 너무 행복했어요~~우리 청솔 산모임 9월 정모 너무 행복했어요~~우리 청솔 산모임 9월 정모 너무 행복했어요~~우리 청솔 산모임 9월 정모 너무 행복했어요~~우리 청솔 산모임 9월 정모 너무 행복했어요~~
<hr class="my-4">
댓글 부분
</div>
</div>
			</div>


			<div class="col-md-2">
    <div class="list-group" id="list-tab" role="tablist">
      <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" href="#list-home" role="tab">메인</a>
      <a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="#list-profile" role="tab">일정</a>
      <a class="list-group-item list-group-item-action" id="list-messages-list" data-toggle="list" href="#list-messages" role="tab">사진첩<a>
      <a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" href="#list-settings" role="tab">첨부</a>
      <a class="list-group-item list-group-item-action" id="list-settings-list" data-toggle="list" href="#list-settings" role="tab">멤버</a>
    </div>
			</div>
		</div>
	</div>






	<div class="container">
		<jsp:include page="/common/footer.jsp" flush="false" />
	</div>
	<script type="text/javascript" src="../resources/js/jquery.js"></script>
	<!-- <script type="text/javascript" src="../resources/js/bootstrap.min.js"></script> -->
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
		integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
		crossorigin="anonymous"></script>
</body>
</html>