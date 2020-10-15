<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<jsp:include page="/common/header.jsp" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/views/group/main.css" />
<body class="pt-5 mt-5">
	<div class="container">
		<div class="row">
			<h1 class="col-md-8 col-lg-10 mb-0">인기글</h1>
			<div class="col-md-4 col-lg-2 pt-2 pb-2 mt-5">
				<a href=""><button type="button"  style="margin:0 0 0 60px; color:green;" class="btn btn-link">더 보기 ></button></a>
			</div>
			<div class="row row-cols-1 row-cols-md-2">
				<div class="col mb-4">
					<div class="card"  style="border: 1px solid green;">
						<img src="http://localhost:8080/resources/img/home.png" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
						</div>
					</div>
				</div>
				<div class="col mb-4">
					<div class="card" style="border: 1px solid green;">
						<img src="http://localhost:8080/resources/img/home.png" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">Card title</h5>
							<p class="card-text">This is a longer card with supporting
								text below as a natural lead-in to additional content. This
								content is a little bit longer.</p>
						</div>
					</div>

				</div>
			</div>
		</div>
		<div class="btn-group" role="group" aria-label="...">
			<!-- <button type="button" class="btn btn-info" id="group" onclick="goMain1()">산모임</button>
        <button type="button" class="btn btn-outline-secondary" id="path" onclick="goMain2()">등산로</button> -->
		</div>
		<!-- <a href="/commu/createForm.jsp"><button type="button"
				class="btn btn-info" id="create" style="float: right;">산모임
				만들기</button></a> -->
		<p></p>
		<hr >
		<div class="row">
			<h1 class="col-md-8 col-lg-10 mb-0">이런 산모임 어때요?</h1>
			<div class="col-md-4 col-lg-2 pt-2 pb-2 btn-group btn-group-toggle"
				data-toggle="buttons">
				<label class="btn btn-outline-secondary active"> <input
					type="radio" name="options" id="option1" checked> 최신순
				</label> <label class="btn btn-outline-secondary"> <input
					type="radio" name="options" id="option2"> 인기순
				</label>
			</div>
		</div>
		<div class="responsive">
			<div class="row">
				<div class="col-sm-6">
					<a href="/commu/createForm.jsp"><button type="button" class="btn btn-outline-success"
						style="padding: 10px 10px; margin:20px 10px 10px 10px; width: 100%; height: 100px;">
						<div class="row">
						<svg width="3em" height="3em" viewBox="0 0 16 16"
							class="bi bi-plus-circle" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg"
							style="margin:0% 0% 0% 30%;" class="mr-3">
						  <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
						  <path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
						</svg>
						<h3 style="margin:1% 0% 0% 0%;">&nbsp&nbsp&nbsp&nbsp산모임 만들기</h3>
						</div>
					</button></a>
					<c:forEach var="commu" items="${commu}">
						<c:if test="${commu.RN%2==0}">
							<a href="/commu/commuPageView.do?groupNum=${commu.GROUPNUM}"
								style="text-decoration: none; color: black;">
								<div class="media" style=" padding: 10px 10px;">
									<img
										src="http://localhost:8080/resources/img/${commu.STOREDFILENAME}"
										style="width: 120px; height: 100px;" class="mr-3" alt="...">
									<div class="media-body" style="width:100px;">
										<h6 class="mt-0 mb-1">
											<strong>${commu.NAME}</strong>
										</h6>
										<small class="card-text text-mute" style="display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis">${commu.DETAIL}</small>
										<small style="color: gray;">멤버 ${commu.STAFFCURRENT} /
											지역 ${commu.AREA} </small>
									</div>
								</div>
							</a>
						</c:if>
					</c:forEach>
				</div>
				<div class="col-sm-6">
					<c:forEach var="commu" items="${commu}">
						<c:if test="${commu.RN%2==1}">
							<a href="/commu/commuPageView.do?groupNum=${commu.GROUPNUM}"
								style="text-decoration: none; color: black;">
								<div class="media" style="padding: 10px 10px;">
									<img
										src="http://localhost:8080/resources/img/${commu.STOREDFILENAME}"
										style="width: 120px; height: 100px;" class="mr-3" alt="...">
									<div class="media-body" style="width:100px;">
										<h6 class="mt-0 mb-1">
											<strong>${commu.NAME}</strong>
										</h6>
										<small class="card-text text-mute"
											style="display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis">${commu.DETAIL}</small>
										<small style="color: gray;">멤버 ${commu.STAFFCURRENT} /
											지역 ${commu.AREA} </small>
									</div>
								</div>
							</a>
						</c:if>
					</c:forEach>
				</div>
			</div>
			<!-- row -->
		</div>
		<!-- responsive -->
	</div>
	<!-- container -->














	<div class="container">
		<jsp:include page="../common/footer.jsp" flush="false" />
	</div>
	<script type="text/javascript" src="../resources/js/jquery.js"></script>
	<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
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