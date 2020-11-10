<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>산오름</title>
<link rel="stylesheet" type="text/css" href="/resources/css/bootstrap.min.css" />
</head>
<style>

ul {
list-style:none;
padding-left: 30px;
}
ul#a li {
padding: 15px;
}
ul#b li {
padding: 15px;
} 
</style>
<body>
 <div class="card">
  <div class="card-header">
<ul class="nav nav-tabs row" id="myInfoTab" role="tablist">
	<li class="nav-item" role="presentation">
		<a class="nav-link active" id="following-tab" data-toggle="tab" href="#following" role="tab" aria-controls="following" aria-selected="true">
			<b>나를 팔로잉&nbsp&nbsp&nbsp&nbsp${followCnt.FOLLOWINGCNT}</b>
		</a>
	</li>
	<li class="nav-item" role="presentation">
		<a class="nav-link" id="follower-tab" data-toggle="tab" href="#follower" role="tab" aria-controls="follower" aria-selected="false">
			<b>내가 팔로우&nbsp&nbsp&nbsp&nbsp${followCnt.FOLLOWERCNT}</b>
		</a>
	</li>
</ul>
<div class="tab-content " id="myInfoContent" style="overflow:scroll; width: 300px; height: 530px" >
<div class="row tab-pane fade show active" id="following" data-spy="scroll" role="tabpanel" aria-labelledby="following-tab">
	<ul id="a">
	<c:forEach var="followings" items="${followingList}">
		<li><div class="row"><img class="rounded-circle mt-2" src="/resources/img/${followings.CONTENT2}" width="50" height="50">
		<a href='/profile/${followings.USERID}' style='color: black;' onclick="window.open(this.href,'','width=450, height=600'); return false;">
		<div class="row" style="padding-left: 30px; padding-top: 20px;"><small>${followings.USERID}</small>&nbsp&nbsp<h6>${followings.NICKNAME}</h6></div></div>
		</a></li>
	</c:forEach>
	</ul>
</div>
<div class="row tab-pane fade" id="follower" role="tabpanel" data-spy="scroll" aria-labelledby="follower-tab">
	<ul id="b" >
	<c:forEach var="followers" items="${followerList}">
		<li><div class="row"><img class="rounded-circle mt-2" src="/resources/img/${followers.CONTENT2}" width="50" height="50">
		<a href='/profile/${followers.FOLLOWID}' style='color: black;' onclick="window.open(this.href,'','width=450, height=600'); return false;">
		<div class="row" style="padding-left: 30px; padding-top: 20px;"><small>${followers.FOLLOWID}</small>&nbsp&nbsp<h6>${followers.NICKNAME}</h6></div></div>
		</a></li>
		</c:forEach>
		</ul>
	</div>
</div>
</div> 

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
</body>
</html>