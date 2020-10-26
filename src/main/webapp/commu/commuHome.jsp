<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<title>산오름</title>
<!-- ico,css -->
<link rel="icon" href="../resources/img/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="../resources/css/views/common/header.css" />
</head>
<body>
	<div class="container">
		<jsp:include page="/common/header.jsp" flush="false"/>
		</div>

<script>



$(document).on( 'click', 'button#showCommentBtn' , function(e){ 
    $('a#oC img').each(function(){
    	$(this).click(function(){
             console.log("this.id: "+this.id);
         	var nickName = $(this).data('nickName').replace(/\"/g, "");
         	var content2 = $(this).data('content2')
         	var createdAts = $(this).data('createdAt').replace(/\"/g, "");
         	var postNum = $(this).data('postNum').replace(/\"/g, "");
         	var userNum = $(this).data('userNum').replace(/\"/g, "");
         	var createdAt = createdAts.slice(0,19);
         	var src = "/resources/img/"+content2.replace(/\"/g, "");
       		 console.log("클릭이벤트 먹었니: "+ src +"    ;///   "+postNum);                
         	 var modal = document.getElementById('originalContent');
         	 var modalImg = document.getElementById('OContent');
         	document.getElementById('nickName').innerHTML=nickName;
         	document.getElementById('profilePic').src=src;
         	document.getElementById('createdAt').innerHTML=createdAt;
         	$('#commentContent').data('postNum', postNum);
         	  modal.style.display = 'block';
         	 modalImg.src = this.src;
         	 
         	 
         	 
         	 
         	 
      	var data = {
                    "postNum" : postNum
                 }; 
         	
         $.ajax({
             type: "GET",
             url: "/group/selectCommentByPostNum.do",
             data: data,
             dataType: 'json',
             contentType: "application/json; charset=utf-8;",
             success: function (response){
                 var index = 0;
                 for(var i=0; i<response.length; i++) {
                     var commentNum = response[i].commentNum;
                     var rootNum = response[i].parentNum;
                     var count = response[i].subCommentCount;

                     if (rootNum == 0) {
                         var id = 'depts' + index

                         $('#commentBoard').append(
                             '<ul id="' + id + '" class="col-12 pl-5 row">' +
                             '<img src="/resources/img/' + response[i].content2 + '" class="rounded-circle" style="width: 50px;height: 50px">'+
                             '<div class="col-10">'+
                             '<pre style="display: none">'+response[i].commentNum+'</pre>'+
                             '<h5>'+response[i].nickname+'</h5>'+
                             '<div>'+response[i].content +'</div>' +
                             '<button class="'+id+' p-0 btn btn-default text-muted" onclick="toggleSubComment(this)">[답글 '+ count +'개 더보기]</button>' +
                             '<button class="'+id+'subComment p-0 btn btn-default text-muted" onclick="toggleWriteSubComment(this)">[답글 작성]</button>' +
                             '<p style="display: none"><input type="text" class="form-control" placeholder="댓글 내용 입력"/>' +
                             '<button id="writeSubCommentBtn" class="btn btn-success btn-sm" onclick="writeSubComment(this)">작성</button>' +
                             '<button class="btn btn-light btn-sm" onclick="cancelwriteSubComment(this)">취소</button>' +
                             '</p></div></ul>');

                         index++;
                         
                         var index1 = 0;
                         for (var j = 0; j < response.length; j++) {

                             if (response[j].parentNum == commentNum) {
                                 $('#' + id).append(
                                     '<li id="' + id + index1 + '" class="col-12 row pt-3 ml-5 pl-2" style="display: none;">'+
                                     '<img src="/resources/img/'+userProfile+'" class="rounded-circle" style="width: 40px; height: 40px; float: left">'+
                                     '<div class="col-9 ml-2 pl-5">'+
                                     '<h5 class="mb-0">'+response[j].nickname+'</h5>'+
                                     response[j].content +'</div></li>'
                                 );

                                 index1++;
                             }
                         }
                     }
                 }
             },
             error: function(response){
                 console.log("error");
                 console.log(response)
             }
         }) 





</script>





























<div class="container">
		<jsp:include page="/common/footer.jsp" flush="false" />
	</div>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
	<!-- <script type="text/javascript" src="../resources/js/bootstrap.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script> 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>