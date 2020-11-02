<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%
	request.setCharacterEncoding("UTF-8");
pageContext.setAttribute("loginID", request.getSession().getAttribute("LOGIN"));
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>${userInfo.NICKNAME}의프로필</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../resources/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="../resources/css/views/profile/detail.css" />
</head>
<body class="m-3">
	<div class="p-3">
	<div class="row">
		<h1>${userInfo.NICKNAME}님의 프로필</h1>
		<c:if test="${1 eq followBoth && 1 eq followStatus}">
		<small style="color:orange; margin: 20px 10px;"><svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-check-circle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
</svg>&nbsp서로 맞팔 중!</small>
		<br>
		</c:if>
		</div>
		<div class="box box-primary">
			<div class="box-body box-profile">
				<div class="row col-12 m-0 p-0">
					<img class="rounded-circle"
						src="/resources/img/${userInfo.CONTENT2}" width="70px"
						height="70px" alt="프로필사진">
					<div id="profile1" class="ml-3" style="width: auto">
						<p class="m-3">${userInfo.PROFILE}</p>
					</div>
				</div>

				<c:if test="${loginID ne userInfo.ID}">
					<div id="button-groups" class="pt-3">
					<c:if test="${0 eq followStatus}">
						<button type="button" id="followUser" class="btn btn-outline-secondary" onclick="follow();">
							<i id="follow" class="fas fa-user-friends">팔로우</i>
						</button>
						</c:if>
						<c:if test="${1 eq followStatus}">
						<button type="button" id="unFollowUser" class="btn btn btn-secondary" onclick="unFollow();">
							<i id="unfollow" class="fas fa-user-friends">언팔로우</i>
						</button>
						</c:if>
						<button type="button" id="blockUser" class="btn btn-outline-danger">
							<i class="fas fa-ban">차단</i>
						</button>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12 pt-3">
			<h5 class="mt-2">${userInfo.NICKNAME}님이 작성한 글</h5>
			<div class="">작성한 글이 없습니다</div>
		</div>
		<div class="p-3 col-12 text-muted" style="text-align: right">
			가입일 : ${fn:substring(userInfo.CREATEDAT, 0, 10)}</div>
	</div>

<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
</body>
<script>
$(document).ready(function (){

})


	 var data ={
				userId : "${loginID}",
				followId : "${userInfo.ID}"
				}

function unFollow(){
	 console.log("response???: " +"언팔로우");
		  $.ajax({
		         type: "GET",
		         url: "/profile/deleteUserFollow.do",
		         data: data,
		         success : function (response){
		        	 console.log("response:"+response);
		        	location.reload();

		         },   error : function (request, status, error){
		        	  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		            }
		        })
}


 function follow(){
	 console.log("response???: " +"팔로우");
		  $.ajax({
		         type: "GET",
		         url: "/profile/insertUserFollow.do",
		         data:data,
		         success : function (response){
		        	 console.log("response:"+response);
		        	document.getElementById("followUser").className= "btn btn-secondary";
		        	document.getElementById("follow").innerHTML = '언팔로우';
		        	location.reload();
		         },   error : function (request, status, error){
		        	  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		            }
		        })
}



















</script>
</html>



