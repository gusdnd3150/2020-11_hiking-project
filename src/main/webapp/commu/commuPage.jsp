<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%
	request.setCharacterEncoding("UTF-8");
	pageContext.setAttribute("loginID", request.getSession().getAttribute("LOGIN"));
%>
<!doctype html>
<html lang="ko">
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<jsp:include page="/common/header.jsp" flush="false" />
<style>
body{ -ms-overflow-style: none; } 
::-webkit-scrollbar { display: none; }

div#posts img {
	width: auto !important;
	height: auto !important;
	max-width: 500px !important;
	max-height: 500px !important;
}
.ck-editor__editable {
    min-height: 300px;
}
.ck.ck-editor{
	max-width: 100%;
}
.card {
	margin: 10px auto;
}

#space {
	width: 50px;
}

.list-group-item.active {
	background-color: green;
	border-color: green;
}

#leftSide {
position: fixed;

} 

 #rightSide {
	width: 100px;
	position: fixed;
} 
</style>
<script>
function selectCommentByPostNum(postNum){
    var data = {
        "postNum" : postNum
    }

    $.ajax({
        type: "GET",
        url: "/group/selectCommentByPostNum.do",
        data: data,
        dataType: 'json',
        contentType: "application/json; charset=utf-8;",
        success: function (response){

            var index = 0;

            for(var i=0;i<response.length;i++) {

                var rootNum = response[i].parentNum;
                var commentNum = response[i].commentNum;
                var postNum = response[i].postNum
                var selector = 'commentBoard'+postNum;

                var id = postNum + '-depts-' + index;

                if(rootNum == 0){
                    var html = '';
                    html += '<ul id="' + id + '" class="col-12 pl-5 row">'
                    html += '<img src="/resources/img/' + response[i].content2 + '" class="rounded-circle" style="width: 50px;height: 50px">';
                    html += '<div class="col-10">';
                    html += '<pre style="display: none">'+response[i].commentNum+'</pre>';
                    html += '<h5 class="m-0">'+response[i].nickname+'</h5>';
                    html += '<div>'+response[i].content +'</div>';
                    html += '<button id ='+response[i].commentNum+' class="'+id+' p-0 btn btn-default text-muted" onclick="toggleSubComment(this)">[답글 '+ response[i].subCommentCount +'개 더보기]</button>'
                    html += '<button class="'+id+'subComment p-0 btn btn-default text-muted" onclick="toggleWriteSubComment(this)">[답글 작성]</button>';
                    html += '<p style="display: none"><input type="text" class="form-control" placeholder="댓글 내용 입력"/>';
                    html += '<button id="writeSubCommentBtn" class="btn btn-info" onclick="writeSubComment(this,'+response[i].postNum+')">작성</button>';
                    html += '<button class="btn btn-light" onclick="cancelwriteSubComment(this)">취소</button>';
                    html += '</p></div></ul>';


                    $('#'+selector).append(html);

                    index++;

                    var index1 = 0;
                    for (var j = 0; j < response.length; j++) {

                        if (response[j].parentNum == commentNum) {
                            var html = '';
                            html += '<li id="' + id + index1 + '" class="col-12 row pt-3 ml-5 pl-2" style="display: none;">';
                            html += '<img src="/resources/img/'+response[j].content2+'" class="rounded-circle" style="width: 40px; height: 40px; float: left">';
                            html += '<div class="col-9 ml-2 pl-5">';
                            html += '<h5 class="mb-0">'+response[j].nickname+'</h5>'
                            html += response[j].content +'</div></li>';

                            $('#' + id).append(html);

                            index1++;
                        }
                    }
                }
            }
        },
        error: function(response){
            console.log("error");
        }
    })
}
</script>
<div class="container mt-4" >
	<div class="row pt-5">
<jsp:include page="/commu/common/leftSide.jsp" flush="false" />
			
<!-- middle div -->
<c:choose>
	<c:when test="${(empty m2.USERSTATUS || 1 eq m2.USERSTATUS || 2 eq m2.USERSTATUS) && 1 eq m4.BOARDACCESS}">
		  <jsp:include page="/commu/commuIntro.jsp" flush="false" /> 
	</c:when>
	<c:otherwise>
	 <c:if test="${((empty m2.USERSTATUS || 1 eq m2.USERSTATUS || 2 eq m2.USERSTATUS) && 0 eq m4.BOARDACCESS) || 0 eq m2.USERSTATUS}">
		<div class="col-md-6 tab-content" id="nav-tabContent">
		<div class="tab-pane fade show active" id="commuPage" role="tabpanel" aria-labelledby="list-commuPage-list">
	</c:if>
	 <c:if test="${(empty m2.USERSTATUS || 1 eq m2.USERSTATUS || 2 eq m2.USERSTATUS) && 0 eq m4.BOARDACCESS}">
	  <jsp:include page="/commu/commuIntro2.jsp" flush="false" /> 
     </div>
	</c:if>
	<c:if test="${0 eq m2.USERSTATUS}">
					<form action="/commu/commuSearch.do" method="Get">
					<div id="search" class="row pl-3 pb-2">
						<input class="form-control " type="search" style="width: 473px; height: 40px; margin: 3px; border-color: green; !important;" placeholder="Search" name="keyword" aria-label="Search">
						<button type="submit" class="btn btn-primary" style="background-color: green; border-color: green; margin: 3px; width: 50xp; height: 40px; !important;">
							<img src="../resources/img/search.png" width="25" height="25" onclick="">
						</button>
					</div>
						<input name="groupNum" type="hidden" value="${m1.GROUPNUM}">
						</form>
						
						
						
					<button type="button" class="btn btn-outline-success" id="insertPostBtn" data-toggle="modal" data-target="#postCreateForm" style="padding: 10px 10px; margin: 10px 10px 10px 0px; width: 100%; height: 100px;">
	<div class="row">
		<svg width="3em" height="3em" viewBox="0 0 16 16"
			class="bi bi-pencil-square mr-3" fill="currentColor"
			xmlns="http://www.w3.org/2000/svg" style="margin: 0% 0% 0% 28%;">
  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
</svg>
		<h3 style="margin: 1% 0% 0% 0%;">&nbsp&nbsp&nbsp&nbsp산악회 피드 쓰기</h3>
	</div>
</button>

<!-- Modal -->
<div class="modal fade" id="postCreateForm" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">산악회 피드 쓰기</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
				<form action="/commu/insertPost.do" method="post" >
			<div class="modal-body">
				 <div class="col-sm-5">
								<div class="input-group mb-2 row">
								<p style="margin-left:20%">&nbsp&nbsp공지게시글로 작성하기</p>
								<input style="margin: 5px 20px;" type="checkbox" id="importantPost" name="type" value="1">
								</div>
							</div> 
				<div class="row justify-content-md-center" id="feedContentDiv">
							<textarea class="form-control" name="feedContent" id="feedContent"></textarea>
				</div>
			</div>

			<div class="modal-footer">
				<input type="submit" class="btn btn-success" value="피드 작성">
			</div>
			<input type="hidden" name="groupNum" value="${m1.GROUPNUM}">
			</form>
		</div>
	</div>
</div>
					<hr>
					</c:if>
						<c:if test="${not empty m9.POSTNUM}">
				<div class="card" style="border: 1px solid orange;">
					<div class="card-title row">
						 <div class="row" style="width:500px; margin-left:7px;">
						<h5 style="color: orange; padding: 25px 0 0 30px;">[공지사항]</h5>
							<a href='/profile/${m9.ID}' style='color: black;' onclick="window.open(this.href,'','width=450, height=600'); return false;">
							<img class="rounded-circle mt-4" style="margin-left: 20px;" src="/resources/img/${m9.CONTENT2}" width="30" height="30" alt=""></a>
							<h6 style="margin-top: 30px">&nbsp${m9.NICKNAME}</h6>
							&nbsp&nbsp
							<h6 style="margin-top: 30px;">
								<small id="FcreatedAt">${fn:substring(m9.CREATEDAT, 0, 19)}</small>
							</h6>
								</div>
							<c:choose>
							<c:when test="${m9.ID eq loginID}">
							<!-- <button type="button" id="updateBtn" data-toggle="modal" data-target="#postUpdateForm" class="btn btn-link" style="margin-top: 20px; color: gray;">수정</button> -->
							<form action="/commu/deletePost.do?postNum=${m9.POSTNUM}" method="get" id="removefrm">
							<button type="button" id="${m9.POSTNUM}" class="btn btn-link" onclick="removeCheck(this)" style="float: right; margin-top: 20px; color: gray;">삭제</button>
							</form>
							</c:when>
							<c:otherwise>
							
							<button type="button" id="reportBtn" class="btn btn-link" style="float: right; margin-top: 20px; color: gray;">신고</button>
							</c:otherwise>
							</c:choose>
						<!-- </div> -->
						</div>
						<div class="card-body" id="posts" style="padding-bottom: 0px !important;">
							${m9.CONTENT} <br> 
							<c:if test="${not empty m9.UPDATEDAT}">
								<small> / 수정 ${m9.UPDATEDAT}</small>
								<br>
							</c:if>
							</div>
					<%--  	<div id="commentShow">
							<hr />
					 	<button type="button" id="showCommentBtn${m9.POSTNUM}" name="${m9.POSTNUM}" class=" btn btn-link" onclick="showComment(this);" style="color: orange; text-align:left; padding:0 0 0 20px;">댓글보기</button> 
						 </div>
						 	<div id="mainCommentBoard${m9.POSTNUM}" class="row" style="display: none; width: 28rem; overflow:scroll;"></div> 
					<hr />
					<div id="mainCommentInput" class="row" style="text-align: center">
						<img src="/resources/img/${sessionIdImage}" class="rounded-circle mt-1" style="margin-left: 27px; margin-bottom:20px; width: 30px; height: 30px" > 
							<input id="mainCommentContent${m9.POSTNUM}" class="form-control form-control-md col-lg-9 col-md-9 col-sm-10 col-10 ml-2 mr-2" type="text" placeholder="내용을 입력해주세요">
							<button id="${m9.POSTNUM}" class="btn btn-warning btn-sm" style="height:37px;">입력</button>
					</div> --%>
					 
					
					</div> 

				<hr>
				</c:if>
				<c:choose>
				<c:when test="${not empty postList}">
				<c:forEach var="postList" items="${postList}">
					<div class="card ">
					<div class="card-title row">
						 <div class="row" style="width:450px; margin-left:7px;">
							<a href='/profile/${postList.ID}' style='color: black;' onclick="window.open(this.href,'','width=450, height=600'); return false;">
							<img class="rounded-circle mt-3" style="margin-left: 25px" src="/resources/img/${postList.CONTENT2}" width="50" height="50" alt="프로필사진"></a>
							<h6 style="margin-top: 40px">&nbsp${postList.NICKNAME}</h6>
							&nbsp&nbsp&nbsp&nbsp
							<h6 style="margin-top: 40px;">
								<small id="FcreatedAt">${fn:substring(postList.CREATEDAT, 0, 19)}</small>
							</h6>
							</div>
							<c:choose>
							<c:when test="${postList.ID eq loginID}">
							<button type="button" id="${postList.POSTNUM}" data-toggle="modal" onclick="postUpdateForm(this)" class="btn btn-link" style="margin-top: 30px; color: gray;">수정</button>
							
							<form action="/commu/deletePost.do?postNum=${postList.POSTNUM}" method="get" id="removefrm">
							<button type="button" id="${postList.POSTNUM}" class="btn btn-link" onclick="removeCheck(this)" style="margin-top: 30px; color: gray;">삭제</button>
							</form>
							</c:when>
							<c:otherwise>
							<button type="button" id="reportBtn" class="btn btn-link" style="margin-left:50px; margin-top: 30px; color: gray;">신고</button>
							</c:otherwise>
							</c:choose>
						</div>
						<div class="card-body" id="posts" style="padding-bottom: 0px !important;">
							${postList.CONTENT} <br> 
							<c:if test="${not empty postList.UPDATEDAT}">
								<small> / 수정 ${postList.UPDATEDAT}</small>
								<br>
							</c:if>
							</div>
						 <c:if test="${0 eq m2.USERSTATUS}">
							<c:if test="${not empty postList.POSTNUMCNT}">
							<hr />
							<div id="commentShow">
					 	<button type="button" id="showCommentBtn${postList.POSTNUM}" name="${postList.POSTNUM}" class="btn btn-link" onclick="showComment(this)" style="color: seaGreen; text-align:left; padding:0 0 0 20px;">댓글보기</button> 
						 </div>
						 </c:if>
						 	<div id="commentBoard${postList.POSTNUM}" class="row" style="display: none; width: 28rem; max-height: 30rem; overflow:scroll;"></div> 
					<hr />
					<div id="mainCommentInput" class="row" style="text-align: center">
						<img src="/resources/img/${sessionIdImage}" class="rounded-circle mt-1" style="margin-left: 27px; margin-bottom:20px; width: 30px; height: 30px" > 
							<input id="commentContent-${postList.POSTNUM}" class="form-control form-control-md col-lg-9 col-md-9 col-sm-10 col-10 ml-2 mr-2" type="text" placeholder="내용을 입력해주세요">
							<button id="${postList.POSTNUM}" class="btn btn-success btn-sm" onclick="submitComment(this.id)" style="height:37px;">입력</button>
					</div>
					</c:if>
					</div>
					<script>
					     selectCommentByPostNum(${postList.POSTNUM});
               		</script>
				</c:forEach>
			    </c:when>
			    <c:otherwise>
			    <center>
			    <a href="/commu/commuPageView.do?groupNum=${m1.GROUPNUM}" style="color: orange;"> 게시글이 존재하지 않습니다. </a>
			    </center>
			    </c:otherwise>
			    </c:choose>
				
			</div>



			<jsp:include page="/commu/setting.jsp" flush="false" />
				<jsp:include page="/commu/schedule.jsp" flush="false" />
				<jsp:include page="/commu/album.jsp" flush="false" />
				<jsp:include page="/commu/intro.jsp" flush="false" />
				<jsp:include page="/commu/member.jsp" flush="false" />
			</div>
			<c:if test="${0 eq m2.USERSTATUS}">
		<jsp:include page="/commu/common/rightSide.jsp" flush="false" />
		</c:if>
	</c:otherwise>
</c:choose>


</div>
</div>

<jsp:include page="/commu/common/modals.jsp" flush="false" />

<script src="../resources/ckeditor5/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/js/bootstrap.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
	integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
	crossorigin="anonymous"></script>
</body>
<script>

function create1() {
	location.href ="/group/form1.jsp";
}

 function create2() {
	 location.href ="/group/form2.jsp";
 }

const userProfile = '${sessionIdImage}';

function postUpdateForm(e){
 var data = {
	          "postNum" : e.id
		};

$.ajax({
    type: "GET",
    url: "/commu/selectACommuPost.do",
    data: data,
    dataType: 'text',
    contentType: "application/json; charset=utf-8;",
    success: function (response){
    	var str = response;
    	 $('#updateFeedContentDiv').empty();
    	 $('#updateFeedContentDiv').append(
		 '<textarea class="form-control" name="updateFeedContent" id="updateFeedContent"></textarea>');
    	ckEditor('updateFeedContent');
    	 $("#updateFeedContent").val(str);
    	 $('#postNum').val(e.id);
		 $("#postUpdateForm").modal();
    },
    error: function(request,status,error){
       alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }
})  
}


function removeCheck(e){ 
	if(confirm("정말 삭제하시겠습니까?")==true){

		var data = {
		    "postNum" : e.id
	  		};
	  
	  $.ajax({
	      type: "GET",
	      url: "/commu/deletePost.do",
	      data: data,
	      dataType: 'json',
	      contentType: "application/json; charset=utf-8;",
	      success: function (response){
	          alert("게시글이 삭제되었습니다.");
	         history.go(0);
	      },
	      error: function(response){
	          alert("삭제 실패. 새로고침 후 다시 시도해주세요.");
	      }
	  })
		
	}else{
		return false;
	}
	
}
   
    $(document).on('click','#AremoveBtn',function (e){ 
    	console.log("?????:   " + $('#AremoveBtn').data('postNum'));
	  if(confirm("정말 삭제하시겠습니까?")==true){ 
	   var data = {
		          "postNum" : $('#AremoveBtn').data('postNum')
	   };
	   $.ajax({
           type: "GET",
           url: "/commu/deletePost.do",
           data: data,
           dataType: 'json',
           contentType: "application/json; charset=utf-8;",
           success: function (response){
               alert("사진이 삭제되었습니다.");
               document.getElementsByClassName('close')[0].click();
             	 location.reload();
             	$('#list-album-list').click();
           },
           error: function(response){
               alert("삭제 실패. 새로고침 후 다시 시도해주세요.");
           }
       })
	  }else{
	  		return false;
	  }
   })
    
  
  $(document).on('click','div#rightSide a',function (){ 
	  if(document.getElementById('list-setting-list')){
	  if(document.getElementById('list-setting-list').classList.contains('active')){
	  document.getElementById('list-setting-list').classList.remove('active');  
	  } 
	  }
  })
  
   $(document).on('click','#list-setting-list',function (){ 
	   var listGroup = document.getElementById("rightSide");
       for (let i of listGroup.children){
           i.classList.remove('active');
       }
   })
	  
    	
   $(document).on('click','#withdrawCheckModalBtn',function (){
        $("#withdrawCheckModal").show();
    })
    
    $(document).on('click','#withdrawBtn',function (){
    	withdraw('${loginID}');
    	alert("탈퇴가 완료되었습니다.");
    	location.reload();
    })
   
     $(document).on('click','.cancelAskModalBtn',function (){
        $("#cancelAskModal").show();
    })
    $(document).on('click','.cancelAskBtn',function (){
		withdraw(${loginID});
		alert("요청이 취소되었습니다.");
    	location.reload();
    })
   
    
       function withdraw(userId){
        var data = {
            "groupNum": ${m1.GROUPNUM},
            "userId" : userId,
            "action" : "minus"
        }

        $.ajax({
            type: "POST",
            url: "/group/withdraw.do",
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
        })
        .done ()
        .fail ();
  }
    
  
  
  $(document).on('click','#deleteCommu',function (){
      $("#deleteAskModal").show();
  })
  $(document).on('click','#deleteCommuBtn',function (){
		deleteCommu();
  })
 
  
function deleteCommu(){	
 	var data = {
     			"groupNum": ${m1.GROUPNUM}
 				}

 	$.ajax({
     	type: "POST",
     	url: "/group/delete.do",
     	data: JSON.stringify(data),
     	dataType: 'json',
     	contentType: "application/json; charset=utf-8;",
     	success : function (response){
     		alert("산모임 삭제가 완료되었습니다.");
     		self.location="/commu/commuMainView.do"; 
     	},
    	 error : function (response){
         console.log("error")
     	}
 	})
     
}
  
  $(document).on('click','.joinGroupBtn',function (){
      var data = {
          "groupNum": "${m1.GROUPNUM}",
          "userId" : "${loginID}",
          "userComment" : $('#userComment').val()
      }

      $.ajax({
          type: "POST",
          url: "/group/join.do",
          data: JSON.stringify(data),
          dataType: 'json',
          contentType: "application/json; charset=utf-8;",
          success : function (response){
              alert("신청 처리 되었습니다");
              location.reload();
          },
          error : function (response){
              alert("오류 발생! 다시 시도해주세요");
          }
      })
  })
  
  $(document).on('click','a#withdrawCommu',function (){
      $("#cancelModal").show();
  })
  $(document).on('click','.cancelModalBtn',function (){

      var data = {
          "groupNum": ${m1.GROUPNUM},
          "userId" : "${loginID}",
      }

      $.ajax({
          type: "POST",
          url: "/group/withdraw.do",
          data: JSON.stringify(data),
          dataType: 'json',
          contentType: "application/json; charset=utf-8;",
          success : function (response){
              location.reload();
          },
          error : function (response){
              console.log("error")
          }
      })
  })

  
$(document).on('click','.selectWaitingList',function (){

  var data = {
      "groupNum" : "${m1.GROUPNUM}",
      "userId" : "${loginID}"
  }

  $.ajax({
      type: "POST",
      url: "/group/selectWaitingList.do",
      data: JSON.stringify(data),
      dataType: 'json',
      contentType: "application/json; charset=utf-8;",
      success: function (response){
          $('#waitingList').empty()

          for(var i=0;i<response.length;i++){

              var id = "waitingUser"+i;

              if(response[i].USERSTATUS==1){
              $('#waitingList')
                  .append(
                  "<li class='row pt-1' style='list-style: none'><div id='waitingUser' class='col-8 pt-1 row' style='font-size: 22px; margin-left:10px'>"
                  +"<a href='/profile/"+response[i].USERID+"' style='color: black;'onclick='window.open(this.href,'','width=450, height=600'); return false;'>"+response[i].USERID+"</a>&nbsp&nbsp&nbsp&nbsp<h6 style='margin-top:8px'>"+response[i].USERCOMMENT+"</h6></div></li>");

              $('#waitingUser').attr('id',id);
						
              $('#'+id).after('<button class="userAllowed btn btn-light col-2">승인</button>');
              $('#'+id).after('<button class="userDisallowed btn btn-light col-2">거절</button>'); 
                  }
          }
      },
      error: function(response){
          console.log("error");
          alert("새로고침 후 다시 시도해주세요")
      }
  })
})

	$(document).on('click','.userAllowed',function (e){
	  var data = {
	      userId :(this.parentNode).childNodes[0].childNodes[0].innerHTML,
	      groupNum : ${m1.GROUPNUM},
	 		action : "plus"
	  };
	  
	  $.ajax({
	      type: "GET",
	      url: "/group/userAllowed.do",
	      data: data,
	      dataType: 'json',
	      contentType: "application/json; charset=utf-8;",
	      success: function (response){
	      	e.target.disabled=true;
	      	alert("승인이 완료되었습니다.");
	      e.target.parentNode.remove();
	      },
	      error: function(response){
	          console.log("error");
	          alert("새로고침 후 다시 시도해주세요")
	      }
	   })
	 })

	$(document).on('click','.userDisallowed',function (e){
		if(confirm("정말 거절 하시겠습니까?")==true){
	
	
	  var data = {
	      userId :(this.parentNode).childNodes[0].childNodes[0].innerHTML,
	      groupNum : ${m1.GROUPNUM},
	      action : "minus"
	  }
	
	  $.ajax({
	      type: "GET",
	      url: "/group/userDisallowed.do",
	      data: data,
	      dataType: 'json',
	      contentType: "application/json; charset=utf-8;",
	      success: function (response){
	          e.target.disabled=true;
	          alert("거절이 완료되었습니다.");
	          e.target.parentNode.remove();
	       
	      },
	      error: function(response){
	          console.log("error");
	          alert("새로고침 후 다시 시도해주세요")
	      }
	    })
	  }
	})


	$('.button-class1').click(function(){
		 var data ={
				 groupNum:${m1.GROUPNUM},
				 boardAccess:0
		 };
	    if( $(this).hasClass('btn-default') ) $(this).removeClass('btn-default');
	    if( !$(this).hasClass('btn-primary') ) $(this).addClass('btn-primary');
	    if( $('.button-class2').hasClass('btn-primary') ) $('#close').removeClass('btn-primary');
	    if( !$('.button-class2').hasClass('btn-default') ) $('#close').addClass('btn-default');
	    $.ajax({
	        type: "GET",
	        url: "/commu/updateBoardAccess.do",
	        data: data,
	        dataType: 'text',
	        contentType: "application/json; charset=utf-8;",
	        success: function (request){
	        	console.log("boardAccess: + 0 컨트롤러 다녀옴")
	        },
	            error:function(request,status,error){
	               console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	            alert("새로고침 후 다시 시도해주세요")
	        }
	    })
	});
  
  $('.button-class2').click(function(){
  	 var data ={
  			 groupNum:${m1.GROUPNUM},
  			 boardAccess:1
  	 };
      if( $(this).hasClass('btn-default') ) $(this).removeClass('btn-default');
      if( !$(this).hasClass('btn-primary') ) $(this).addClass('btn-primary');
      if( $('.button-class1').hasClass('btn-primary') ) $('#open').removeClass('btn-primary');
      if( !$('.button-class1').hasClass('btn-default') ) $('#open').addClass('btn-default');
      $.ajax({
          type: "GET",
          url: "/commu/updateBoardAccess.do",
          data: data,
          dataType: 'text',
          contentType: "application/json; charset=utf-8;",
          success: function (response){
          	console.log("boardAccess: + 1 컨트롤러 다녀옴");
          },
          error:function(request,status,error){
              console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
              alert("새로고침 후 다시 시도해주세요")
          }
      })
  });


  if('${m4.BOARDACCESS}' == 0) {
  if( $('#open').hasClass('btn-default') ) $('#open').removeClass('btn-default');
  if( !$('#open').hasClass('btn-primary') ) $('#open').addClass('btn-primary');
  if( $('.button-class2').hasClass('btn-primary') ) $('#close').removeClass('btn-primary');
  if( !$('.button-class2').hasClass('btn-default') ) $('#close').addClass('btn-default');
  } else {
	if( $('#close').hasClass('btn-default') ) $('#close').removeClass('btn-default');
  if( !$('#close').hasClass('btn-primary') ) $('#close').addClass('btn-primary');
  if( $('.button-class1').hasClass('btn-primary') ) $('#open').removeClass('btn-primary');
  if( !$('.button-class1').hasClass('btn-default') ) $('#open').addClass('btn-default');
  }
  
  $('#update').click(function (e){
      e.preventDefault();

      var form = $('#filesForm')[0];
      var data = new FormData(form);
      data.append("groupNum",${m1.GROUPNUM});
      data.append("detail",$('#detail').val());
      data.append("area",$('#area').val());
      data.append("ageStart",$('#ageStart').val());
      data.append("ageEnd",$('#ageEnd').val());
      data.append("sex",$('#sex').val());
      data.append("userId","${loginID}")

      $.ajax({
          type: "POST",
          enctype: 'multipart/form-data',
          url: '/commu/update.do',
          data: data,
          processData: false,
          contentType: false,
          cache: false,
          success(response){
              console.log(response);
              alert("산모임 정보 수정 완료!")
             self.location ="/commu/commuPageView.do?groupNum=${m1.GROUPNUM}";
          },
          error(response){
              alert("수정 오류, 새로고침 후 다시 시도 해주세요")
          }
      });
  });   
 
  $("#sex option").each(function(){
  	if($(this).val()== "${m1.SEX}"){
  		$(this).attr("selected", "selected");
  	} 
  });

  $("#area option").each(function(){
  	if($(this).val()== "${m1.AREA}"){
  		$(this).attr("selected", "selected");
  	} 
  });

  $("#ageStart option").each(function(){
  	if($(this).val()== "${m1.AGESTART}"){
  		$(this).attr("selected", "selected");
  	} 
  });

  $("#ageEnd option").each(function(){
  	if($(this).val()== "${m1.AGEEND}"){
  		$(this).attr("selected", "selected");
  	} 
  });   
  
  
  var totalData = ${vM.total};    // 총 데이터 수
  console.log("언제찍히나:   " +${vM.total});
  var dataPerPage = 12;   // 한 페이지에 나타낼 데이터 수
  var pageCount = 10;        // 한 화면에 나타낼 페이지 수   
/* 페이징 처리 */
  $('#list-album-list').click(function (e){
  if((totalData/dataPerPage) < pageCount){
	  pageCount = Math.ceil(totalData/dataPerPage)
	  }
  
  paging(totalData, dataPerPage, pageCount, 1);
  });

  function paging(totalData, dataPerPage, pageCount, currentPage){
/*         console.log("totalData : " + totalData);
      console.log("dataPerPage : " + dataPerPage);
      console.log("currentPage : " + currentPage); */
      
      var totalPage = Math.ceil(totalData/dataPerPage);    // 총 페이지 수
      var section = Math.ceil(currentPage/pageCount);    // 페이지 그룹
      
 /*      console.log("section : " + section); */
      
      var last = section * pageCount;    // 화면에 보여질 마지막 페이지 번호
      if(last > totalPage)
          last = totalPage;
      var first = last - (pageCount-1);    // 화면에 보여질 첫번째 페이지 번호
      var next = last+1;
      var prev = first-1;
      
     /*  console.log("last : " + last);
      console.log("first : " + first);
      console.log("next : " + next);
      console.log("prev : " + prev); */

      var $pingingView = $("#paging");
      
      var html = "";
      
      if(prev > 0) { 
    	  html += "<a href=# id='prev'><</a> "
    	  };
          
          
      if(first<1){first==1}
      for(var i=first; i <= last; i++){
          html += "<a href=# id=" + i + ">" + i + "</a> ";
      }
      
      if(last < totalPage){
          html += "<a href=# id='next'>></a>"
          };
      
      $("#paging").html(html);    // 페이지 목록 생성
      $("#paging a").css("color", "black");
      $("#paging a#" + currentPage).css({"text-decoration":"none", 
                                         "color":"green", 
                                         "font-weight":"bold"});    // 현재 페이지 표시
                  
         /* 페이징 아작스 */
         var html;
         var htmlC ="";
         var data={}
     	data["groupNum"] = ${m1.GROUPNUM};
     	data["nowPage"] = currentPage;
     	data["cntPerPage"] = dataPerPage;
     	data["userId"] = "${loginID}" ;
    		data["total"] = ${vM.total}; 
     	$.ajax({
     		contentType:'application/json',
     		dataType:'json',
     		data:JSON.stringify(data),
     		url:'/commu/commuAlbumPaging.do',
     		type:'POST',
     		success:function(data){
     				 $('#albumList').empty();
     			 for(var i=0 in data){ 
     				var content = JSON.stringify(data[i].content).replace(/\"/g, "");
     				  $('#albumList').append(
 						"<div class='col-lg-3 col-md-4 col-6' >" +
 						"<a id='oC' class='d-block mb-4 h-100' data-toggle='modal' >" +
 						" <img id='content"+ i +
 						"' class='img-fluid img-thumbnail' src='/resources/img/"+ content +
 					    "' alt='사진'></a></div>");
     			 }

 				for(var j=0 in data){ 
     			var nickName = JSON.stringify(data[j].nickName);
     			var createdAt = JSON.stringify(data[j].createdAt);
     			var content2 = JSON.stringify(data[j].content2);
     			var groupNum = JSON.stringify(data[j].groupNum);
     			var boardType = JSON.stringify(data[j].boardType);
     			var rn = JSON.stringify(data[j].rn);
     			var postNum = JSON.stringify(data[j].postNum);
     			var type = JSON.stringify(data[j].type);
     			var userNum = JSON.stringify(data[j].userNum);
     			
     			$('#content'+ j ).data('nickName',nickName);
 				$('#content'+ j ).data('content2',content2);
 				$('#content'+ j ).data('createdAt',createdAt);
 				$('#content'+ j ).data('postNum',postNum);
 				$('#content'+ j ).data('userNum',userNum);
 				
 				//console.log("content" + j+":" + $('#content'+ j ).data('content'));
 				}
     		},
     		error:function(request, status, error){
     			alert(request.message);
     		}
     	})
   } /* function paging */
  
   $(document).on('click','#paging a',function (e){
     var $item = $(this);
     var $id = $item.attr("id");     
     var selectedPage = $item.text();
     selectedPage *= 1;
     
     if($id == "next")    selectedPage = next;  
     if($id == "prev")    selectedPage = prev;

     paging(totalData, dataPerPage, pageCount, selectedPage);
 });
   

/* 엘범 사진 업로드 */  
      $('#uploadPics').click(function(){
      	var formData = new FormData();
      	var inputFile=$('input[name="pics"]');
      	var files=inputFile[0].files;
      	formData.append('key1', 'value1');
      	formData.append('key2', 'value2');
      	formData.append('groupNum', ${m1.GROUPNUM});
      	
      	for(var i=0; i<files.length; i++){
      		formData.append('pics', files[i]);
      	}
      	
       	$.ajax({
         		contentType: false,
         		processData: false,
         		data: formData,
         		url:'/commu/insertAlbum.do',
         		type:'POST',
         		success:function(result){
         		console.log("result: "+ result);	
         		var totalData = result;
         		document.getElementById('closeUploadModal').click();
         		 paging(totalData, dataPerPage, pageCount, 1); 
         		document.getElementById('pics').value = null;
         		alert("사진이 정상적으로 업로드되었습니다.");
         		location.reload(); 
         		//$('#list-album-list').click();
         		},
         		error:function(request, status, error){
         			alert(request.message);
         		}
       	})
      })
     
   /* album 사진 상세보기 */
$(document).on( 'click', 'a#oC img', function(e){ 
              console.log("this.id: "+this.id); 
         	var nickName = $(this).data('nickName').replace(/\"/g, "");
         	var content2 = $(this).data('content2')
         	var createdAts = $(this).data('createdAt').replace(/\"/g, "");
         	var postNum = $(this).data('postNum').replace(/\"/g, "");
         	var userNum = $(this).data('userNum').replace(/\"/g, "");
         	var createdAt = createdAts.slice(0,19);
         	var src = "/resources/img/"+content2.replace(/\"/g, "");
         	 var modal = document.getElementById('originalContent');
         	 var modalImg = document.getElementById('OContent');
         	document.getElementById('nickName').innerHTML=nickName;
         	document.getElementById('profilePic').src=src;
         	document.getElementById('createdAt').innerHTML=createdAt;
         	$('#AremoveBtn').data('postNum', postNum);
         	  modal.style.display = 'block';
         	 modalImg.src = this.src;
         	 
         	 
         	var data = {
         		  	"userId" : "${loginID}"
                 }; 
         	 $.ajax({
                 type: "GET",
                 url: "/commu/checkWriter.do",
                 data: data,
                 dataType: 'json',
                 contentType: "application/json; charset=utf-8;",
                 success: function (response){
         	 if(userNum != response){
         		$('#AremoveBtn').css('display','none');
         		$('#AreportBtn').css('display','inline');
         	 } else {
         		$('#AremoveBtn').css('display','inline');
         		$('#AreportBtn').css('display','none');
         		 }
         	 }
  	  })    
  	  document.getElementById('commentBoard').setAttribute('id',"commentBoard"+postNum);
      document.getElementById('commentContent').setAttribute('id',"commentContent-"+postNum);
      document.getElementById('commentSubmit').setAttribute("onclick","submitComment("+postNum+")");
      document.getElementById('ocClose').setAttribute("onclick","oCModalClose("+postNum+")");
      selectCommentByPostNum(postNum);
   	 
      $("#originalContent").modal();
         
   })  /* 'click', 'a#oC' */
   
   function oCModalClose(postNum){
	   document.getElementById("commentBoard"+postNum).setAttribute('id',"commentBoard");
	   document.getElementById("commentContent-"+postNum).setAttribute('id',"commentContent");
	   $('#commentBoard').empty();
	   $('#originalContent').modal("hide"); //닫기 
   }
                	
  
  $('#list-member-list').click(function(){
	  selectMemberList();
	  $('#list-member-list').off('click');
   })

    function selectMemberList(){
  
	var data =  {
			"groupNum" : ${m1.GROUPNUM}
	};
	
	 $.ajax({
         type: "POST",
         url: "/commu/selectLeader.do",
         data: JSON.stringify(data),
         dataType: 'json',
         contentType: "application/json; charset=utf-8;",
         success : function (response){
        	 $('div#leader').append(
             		'<li class=" list-group-item ">'
             		+'<div class="row">'
        			+"<a href='/profile/"+response.USERID+"' style='color: black;'onclick='window.open(this.href,'','width=450, height=600'); return false;'>"
             		+'<img src="/resources/img/'+response.CONTENT2+'" class="rounded-circle mr-3" width="50" height="50" style="margin-left:30px;" alt="멤버사진">'
             		+'</a><div class="media-body row mt-3">'
             		+"<a href='/profile/"+response.USERID+"' style='color: black;'onclick='window.open(this.href,'','width=450, height=600'); return false;'>"
            		+'<p class="mt-0 mb-1" style="margin:10px;">'+ response.USERID
            		+'</p></a><h5 class="mt-0 mb-1" style="margin:10px;">'+response.NICKNAME+'</h5>'
             		+'<svg style="margin:5px; color: red;" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-flag-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">'
            		+' <path fill-rule="evenodd" d="M14.778.085A.5.5 0 0 1 15 .5V8a.5.5 0 0 1-.314.464L14.5 8l.186.464-.003.001-.006.003-.023.009a12.435 12.435 0 0 1-.397.15c-.264.095-.631.223-1.047.35-.816.252-1.879.523-2.71.523-.847 0-1.548-.28-2.158-.525l-.028-.01C7.68 8.71 7.14 8.5 6.5 8.5c-.7 0-1.638.23-2.437.477A19.626 19.626 0 0 0 3 9.342V15.5a.5.5 0 0 1-1 0V.5a.5.5 0 0 1 1 0v.282c.226-.079.496-.17.79-.26C4.606.272 5.67 0 6.5 0c.84 0 1.524.277 2.121.519l.043.018C9.286.788 9.828 1 10.5 1c.7 0 1.638-.23 2.437-.477a19.587 19.587 0 0 0 1.349-.476l.019-.007.004-.002h.001"/>'
            	    +'</svg>'
             		+'</div>'
             		+'</div>'
             		+'</li>'
             		);
        	 
        	 if(response.USERID == '${loginID}'){
        		 $('div#leaderBtn').append(
        		  '<button id="mandate" class="btn btn-link" data-toggle="modal" data-target="#mandateModal" style="color: Gray;">리더 위임</button>'            		
                  +'<button id="forceWithdraw" class="btn btn-link" data-toggle="modal" data-target="#forceWithdrawModal" style="color: Gray;">멤버 강퇴</button>'        
                  );
        	 }
        	 
        	 
         },
         error : function (request, status, error){
        	  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
         }
     })

     $.ajax({
         type: "POST",
         url: "/commu/selectMemberList.do",
         data: JSON.stringify(data),
         dataType: 'json',
         contentType: "application/json; charset=utf-8;",
         success : function (response){
         
             for(var i=0; i<response.length; i++) {
             
                 var userId = response[i].USERID;
                 var content2 = response[i].CONTENT2;
                 var nickName = response[i].NICKNAME;
            	 console.log("asdfasdf:   "+userId);
                     $('div#members').append(
                    		'<li class=" list-group-item ">'
                    		+'<div class="row">'
                    		+"<a href='/profile/"+userId+"' style='color: black;'onclick='window.open(this.href,'','width=450, height=600'); return false;'>"
                    		+'<img src="/resources/img/'+content2+'" class="rounded-circle mr-3" width="50" height="50" style="margin-left:30px;" alt="멤버사진">'
                    		+'</a><div class="media-body row mt-3">'
                    		+"<a href='/profile/"+userId+"' style='color: black;'onclick='window.open(this.href,'','width=450, height=600'); return false;'>"
                    		+'<p class="mt-0 mb-1" style="margin:10px;">'+ userId
                    		+'</p></a><h5 class="mt-0 mb-1" style="margin:10px;">'+nickName+'</h5>'
                    		+'</div>'
                    		+'<div class="row">'
                    		+'</div>'
                     		+'</div>'
                    		+'</li>'
                    		);
                 }
             },
         error : function (request, status, error){
        	  alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
         }
     })
	  }
  
  $(document).on("click", "#forceWithdraw", function(e){
  /* $('#forceWithdraw').click(function (e){ */
	  var data =  {
				"groupNum" : ${m1.GROUPNUM} 
		};

            $.ajax({
                type: "POST",
                url: "/commu/selectMemberList.do",
                data: JSON.stringify(data),
                dataType: 'json',
                contentType: "application/json; charset=utf-8;",
                success : function (response){
                    $('.commuMemberList1').children().remove()

                    for(var i=0;i<response.length;i++){
                    	if(response.length > 0){
                    	var html = '';

                                html += '<li class="row pt-2">';
                                html += '<span style="display: none">'+response[i].USERID+'</span>';
                                html += '<img src="/resources/img/'+response[i].CONTENT2+'" style="margin-left: 10%; width: 50px; height: 50px" />';
                                html += '<div style="width:3%"></div>'
                                html += '<div class="col-6" style="font-size: 20px">'+response[i].USERID+'&nbsp&nbsp&nbsp&nbsp'+response[i].NICKNAME+'</div>';
                                html += '<button class="btn btn-outline-secondary col-2" onclick="forceWithdrawCheck(this)">강제탈퇴</button>';
                                html += '</li>'

                            } else if(response.length == 0){
                                var html = '';
                                html += '<li>';
                                html += '산모임 멤버가 없습니다'
                                html += '</li>';
                            }

                            $('.commuMemberList1').append(html);
                        }
                },
                error : function (response){
                    console.log("error")
                }
            })
        })
        
        $(document).on("click", "#mandate", function(e){
       /*    $('#mandate').click(function (e){ */
        	  var data =  {
        				"groupNum" : ${m1.GROUPNUM} 
        		};

            $.ajax({
            	  type: "POST",
                  url: "/commu/selectMemberList.do",
                  data: JSON.stringify(data),
                  dataType: 'json',
                  contentType: "application/json; charset=utf-8;",
                  success : function (response){
                    $('.commuMemberList2').children().remove()

                    for(var i=0;i<response.length;i++){
                    	if(response.length > 0){
                                var html = '';

                                html += '<li class="row pt-2">';
                                html += '<span style="display: none">'+response[i].USERID+'</span>';
                                html += '<img src="/resources/img/'+response[i].CONTENT2+'" style="margin-left: 10%; width: 50px;height: 50px" />';
                                html += '<div style="width:3%"></div>'
                                html += '<div class="col-6" style="font-size: 20px">'+response[i].USERID+'&nbsp&nbsp&nbsp&nbsp'+response[i].NICKNAME+'</div>';
                                html += '<button class="btn btn-outline-secondary col-2" onclick="mandateCheck(this)">대표위임</button>';
                                html += '</li>'

                            } else if(response.length == 0){
                                var html = '';
                                html += '<li>';
                                html += '산모임 멤버가 없습니다'
                                html += '</li>';
                            }

                            $('.commuMemberList2').append(html);
                        }
                },
                error : function (response){
                    console.log("error")
                }
            })
        })
  
        
        
      function forceWithdrawCheck(e){
	  console.log("forceWithdrawCheck:    " + e.parentNode.childNodes[0].textContent );
        forceWithdrawDo(e.parentNode.childNodes[0].textContent);
  	 }
  
	   function forceWithdrawDo(userId){
	    	console.log("forceWithdrawCheckModalBtn :  "+ userId);
	    	if(confirm("정말 멤버를 강퇴하시겠습니까?")==true){
	    		  withdraw(userId);
	    		  alert("강퇴가 완료되었습니다.");
	    		  $('#forceWithdrawModal').modal("hide");
	    		  $('#leader').children().remove();
	    		   $('#members').children().remove();
	    		  selectMemberList();
	    	}else{
	    		return false;
	    	}
	   }
    
  
  function mandateCheck(e){
	  //mandateCheckDo(e.parentNode.childNodes[0].textContent, e.parentNode.childNodes[1].textContent);
	  
	  	var data = {
    			"groupNum" : ${m1.GROUPNUM}, 
	  	 		"userId" : e.parentNode.childNodes[0].textContent
    	};
	  	 
	 if(confirm("정말 "+e.parentNode.childNodes[0].textContent+"님에게 리더를 위임하시겠습니까?")==true){
	  $.ajax({
          type: "POST",
          url: "/commu/commuMandate.do",
          data: JSON.stringify(data),
          dataType: 'json',
          contentType: "application/json; charset=utf-8;",
          success: function (response){
          if(response =="1"){
              alert("리더가 위임되었습니다.");
              location.reload();
          }
          },
          error: function(response){
              console.log("error");
          }
       })
	 }
  }
  
  
    $('#list-schedule-list').click(function(){
    	 var data =  {
    			"groupNum" : ${m1.GROUPNUM} 
    	};

    	 var isEnd = false;

    	        if(isEnd == true){
    	            return ;
    	        }
    	    
    	        $.ajax({
    	            type: "POST",
    	            url: "/commu/selectScheduleList.do",
    	            data: JSON.stringify(data),
    	            dataType: 'json',
    	            contentType: "application/json; charset=utf-8;",
    	            success: function (response){
    	                if(response.length!=0){
    	                    appendSortList(response);
    	                }else if(response.length==0) {
    	                    isEnd = true;
    	                    window.removeEventListener('scroll', function (){
    	                        $('#result')
    	                            .append('<div>없어요</div>');
    	                    })
    	                }
    	            },
    	            error: function(response){
    	                console.log("error");
    	            }
    	        })
    	    /* }; */
    	    
    	 function appendSortList(response){
    	        for(var i=0;i<response.length;i++){
    	             var status1 = '<div class="pt-4 col-lg-12 col-sm-6" id="groupList">' + 
    	            	           '<div class="card mb-6" style="max-width: 540px;" > '+
    	            	           '<a href="/group/'+response[i].GROUPNUM+'">' +
    	                           '<div class="row no-gutters">'+
    	                           '<div class="col-md-5">'+
    	                           '<img class="card-img-" src="/resources/img/' + response[i].STOREDFILENAME + '" alt="..." style="width:100%; height: 200px;" /></a></div>'+
    	                           '<div class="col-md-7">'+
    	                           '<div class="card-body"><div class="row">'+
   	                               '<img src="/resources/img/' + response[i].CONTENT2 + '" class="rounded-circle" style="width:40px; height:40px; border:1px solid grey; margin-left: 20px">'+
   	                               '<p style="margin-top: 10px; margin-left: 5px">'+response[i].NICKNAME+'</p>'+
       	                           '</div><div class="col-10 p-0 pl-2 m-0">' +
       	                           '<h6 class="card-title m-0" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">'+
       	                           '<span style="color: limegreen">['+response[i].STATUS+']</span> <br>' +response[i].NAME +'</h6>'+
       	                           '<p class="card-text text-muted mb-1" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">'+ response[i].DETAIL +'</p>'+
       	                           '<p class="m-0 text-muted">'+response[i].STARTDAY+' 출발</p>' +
       	                           '</div></div> </div> </div> </div>';


       	             var status2 = '<div class="pt-4 col-lg-12 col-sm-6" id="groupList">' + 
       	            	           '<div class="card mb-6" style="max-width: 540px;" > '+
       	            	           '<a href="/group/'+response[i].GROUPNUM+'">' +
       	                           '<div class="row no-gutters">'+
       	                           '<div class="col-md-5">'+
       	                           '<img class="card-img-" src="/resources/img/' + response[i].STOREDFILENAME + '" alt="..." style="width:100%; height: 200px;" /></a></div>'+
       	                           '<div class="col-md-7">'+
       	                           '<div class="card-body"><div class="row">'+
	                               '<img src="/resources/img/' + response[i].CONTENT2 + '" class="rounded-circle" style="width:40px; height:40px; border:1px solid grey; margin-left: 20px">' +
	                               '<p style="margin-top: 10px; margin-left: 5px">'+response[i].NICKNAME+'</p>'+
    	                           '<div class="col-10 p-0 pl-2 m-0">' +
    	                           '<h6 class="card-title m-0" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">'+
    	                           '<span style="color:red">['+response[i].STATUS+']</span> <br>' +response[i].NAME +'</h6>' +
    	                           '<p class="card-text text-muted mb-1" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">'+ response[i].DETAIL +'</p>' +
    	                           '<p class="m-0 text-muted">'+response[i].STARTDAY+' 출발</p>' +
    	                           '</div></div> </div> </div> </div>';
    	                            

    	            if(response[i].STATUS == '진행중'){
    	                $('.card-list').append(status1);
    	            }else if(response[i].STATUS == '마감'){
    	                $('.card-list').append(status2)
    	            }
    	        }
    	    }
    	        $('#list-schedule-list').off('click');
     });
/*     function infiniteScroll(data){
            var curHeight = $(window).height() + $(window).scrollTop();
            var docHeight = $(document).height();

            if (curHeight == docHeight) {
                closeLoading();
                loadingImage();

                setTimeout(function (){
                    data.rowNum += 1;
                    sortList(data);
                },1500)
            }
    } */
    
    $('#insertPostBtn').click(function(){ 
     $('#feedContentDiv').empty();
     $('#feedContentDiv').append(
    		 '<textarea class="form-control" name="feedContent" id="feedContent"></textarea>');
    	ckEditor('feedContent');
    });
    
function ckEditor(e){
	var eid = e.id;
	console.log(e);
	  
		ClassicEditor
	    .create( document.querySelector( '#'+e ), {
	        extraPlugins: [MyCustomUploadAdapterPlugin],
	        heading: {
	            options: [
	                { model: 'paragraph', title: '본문', class: 'ck-heading_paragraph' },
	                { model: 'heading1', view: 'h1', title: '제목 1', class: 'ck-heading_heading1' },
	                { model: 'heading2', view: 'h2', title: '제목 2', class: 'ck-heading_heading2' },
	                { model: 'heading3', view: 'h3', title: '제목 3', class: 'ck-heading_heading3' }
	            ]
	        },
	        language: 'ko',
	        image: {
	            ImageCaption: {
	
	            },
	            resizeUnit: 'px',
	            toolbar: [
	                'imageTextAlternative',
	                'imageStyle:alignLeft',
	                'imageStyle:full',
	                'imageStyle:side'
	            ],
	            styles: [ 'full','alignLeft','alignRight','side' ]
	        },
	        table: {
	            contentToolbar: [
	                'tableColumn',
	                'tableRow',
	                'mergeTableCells'
	            ]
	        },
	        ckfinder: {
	            options: {
	                uploadUrl: '/after/uploadImage.do'
	            }
	        },
	        alignment: {
	            options: [ 'left', 'center', 'right']
	        }
	    } )
	    .then( editor => {
	        window.editor = editor;
	    } )
	    .catch( err => {
	        console.error( err.stack );
	    } );
	
	function MyCustomUploadAdapterPlugin(editor) {
	    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
	        return new UploadAdapter(loader);
	    }
	}
	
	
	class UploadAdapter {
	    constructor(loader) {
	        this.loader = loader;
	    }
	
	    upload() {
	        return this.loader.file.then( file => new Promise(((resolve, reject) => {
	            this._initRequest();
	            this._initListeners( resolve, reject, file );
	            this._sendRequest( file );
	        })))
	    }
	
	    _initRequest() {
	        const xhr = this.xhr = new XMLHttpRequest();
	        xhr.open('POST', '/after/uploadImage.do', true);
	        xhr.responseType = 'json';
	    }
	
	    _initListeners(resolve, reject, file) {
	        const xhr = this.xhr;
	        const loader = this.loader;
	        const genericErrorText = '파일을 업로드 할 수 없습니다.'
	
	        xhr.addEventListener('error', () => {reject(genericErrorText)})
	        xhr.addEventListener('abort', () => reject())
	        xhr.addEventListener('load', () => {
	            const response = xhr.response
	
	            if(!response || response.error) {
	                return reject( response && response.error ? response.error.message : genericErrorText );
	            }
	
	            resolve({
	                default: response.url //업로드된 파일 주소
	            })
	        })
	    }
	
	    _sendRequest(file) {
	        const data = new FormData()
	        data.append('upload',file)
	        this.xhr.send(data)
	    }
	}
}

//comment
function showComment(e){ 
	console.log("showComment:    " +e.getAttribute('name') );
         var postNum =  e.getAttribute('name');
         
         /* $('#commentBoard'+postNum+" ul").remove(); */
     	if( $('#commentBoard'+postNum)[0].style.display == "block"){
            $('#commentBoard'+postNum)[0].style.display = "none";
        }else if( $('#commentBoard'+postNum)[0].style.display  == "none"){
        		  $('#commentBoard'+postNum)[0].style.display  = "block";
        }
    }
     
function toggleSubComment(e){
    $commentRoot = e.parentNode.parentNode;
    $subComments = $commentRoot.getElementsByTagName("li");

    for(var i=0;i<$subComments.length;i++){
        if($subComments[i].style.display == "block"){
            $subComments[i].style.display = "none";
        }else if($subComments[i].style.display == "none"){
            $subComments[i].style.display = "block";
        }
    }
}

function toggleWriteSubComment(e){
    $inputSubComment = e.parentNode.getElementsByTagName("p")[0]

    if($inputSubComment.style.display == "block"){
        $inputSubComment.style.display = "none";
    }else if($inputSubComment.style.display == "none"){
        $inputSubComment.style.display = "block";
    }
}


function submitComment(postNum){
    var content = 'commentContent-'+postNum;
    console.log(postNum)
    var data = {
        "parentNum" : 0,
        "depts" : 1,
        "postNum" : postNum,
        "content" : $('#'+content).val(),
        "userId" : "<%= request.getSession().getAttribute("LOGIN")%>",
        "groupNum": ${m1.GROUPNUM}
    }

    $.ajax({
        type: "POST",
        url: "/group/insertComment.do",
        data: JSON.stringify(data),
        dataType: 'json',
        contentType: "application/json; charset=utf-8;",
        success: function (response){
            console.log(response)
            var index = 0;
            var selector = 'commentBoard'+response.postNum;
            var rootNum = response.parentNum;

            if (rootNum == 0) {
                var id = postNum +'-depts-' + index

                var html = '';
                html += '<ul id="' + id + '" class="col-12 pl-5 row">'
                html += '<img src="/resources/img/${sessionIdImage}" class="rounded-circle" style="width: 50px; height: 50px">'
                html += '<div class="col-10">'
                html += '<pre style="display: none">'+response.commentNum+'</pre>'
                html += '<h5>'+response.nickname+'</h5>'
                html += '<div>'+response.content +'</div>'
                html += '<button id ='+response.commentNum+'class="'+id+' p-0 btn btn-default text-muted" onclick="toggleSubComment(this)">[답글 '+ response.subCommentCount +'개 더보기]</button>'
                html += '<button class="'+id+'subComment p-0 btn btn-default text-muted" onclick="toggleWriteSubComment(this)">[답글 작성]</button>'
                html += '<p style="display: none"><input type="text" class="form-control" placeholder="댓글 내용 입력"/>'
                html += '<button id="writeSubCommentBtn" class="btn btn-info" onclick="writeSubComment(this,'+response.postNum+')">작성</button>'
                html += '<button class="btn btn-light" onclick="cancelwriteSubComment(this)">취소</button>'
                html += '</p></div></ul>';

                $('#'+selector).append(html);
                $('#commentContent-'+postNum).val("");
                index++;
                location.reload();
            }
        },
        error: function(response){
            alert("다시 시도해주세요")
        }
    })
}

function writeSubComment(e, postNum){
    $root = e.parentNode.parentNode;
    $parentNum = $root.getElementsByTagName("pre")[0];

    var data = {
        "parentNum" : $parentNum.innerHTML,
        "depts" : 2,
        "postNum" : postNum,
        "content" : e.previousSibling.value,
        "userId" : "<%= request.getSession().getAttribute("LOGIN")%>",
        "groupNum": ${m1.GROUPNUM}
    }

    $.ajax({
        type: "POST",
        url: "/group/insertSubComment.do",
        data: JSON.stringify(data),
        dataType: 'json',
        contentType: "application/json; charset=utf-8;",
        success: function (response){
            var id = $root.parentNode.id;

            var html = '';

            html += '<li id="temp" class="col-12 row pt-3 ml-5 pl-2">';
            html += '<img src="/resources/img/${sessionIdImage}" class="rounded-circle" style="width: 40px;height: 40px;float: left">';
            html += '<div class="col-9">';
            html += '<h5 class="mb-0 pl-0">'+response.nickname+'</h5>';
            html += response.content +'</div></li>';

            $('#'+id).append(html);
            countSubComment($parentNum.innerHTML);
            e.previousSibling.value="";
        },
        error: function(response){
            alert("다시 시도해주세요")
        }
    })
}

function countSubComment(parentNum){
	 var data = {
		        "commentNum" : parentNum
		    }

    $.ajax({
        type: "POST",
        url: "/group/countSubComment.do",
        data: JSON.stringify(data),
        dataType: 'json',
        contentType: "application/json; charset=utf-8;",
        success: function (response){
		$('#'+parentNum).text('[답글 '+ response +'개 더보기]');
        },
        error: function(response){
            alert("다시 시도해주세요")
        }
    })
}



$(document).ready(function (){
	
	
	var selectWaitingList = document.getElementsByClassName('selectWaitingList');
if(${0 eq m2.USERTYPE}){
var data = {
        "groupNum" : "${m1.GROUPNUM}",
        "userId" : "${loginID}"
    }
	 $.ajax({
        type: "POST",
        url: "/group/selectWaitingList.do",
        data: JSON.stringify(data),
        dataType: 'json',
        contentType: "application/json; charset=utf-8;",
        success: function (response){
			if(!response.length) {
				selectWaitingList[0].innerText = "새로운 가입 요청 없음";
            	selectWaitingList[0].disabled = true;
			}else{
            for(var i=0;i<response.length;i++){
                if((response[i].USERSTATUS==1) == "" || response==null){
                	selectWaitingList[0].innerText = "새로운 가입 요청 없음";
                	selectWaitingList[0].disabled = true;
                	/*  $('.selectWaitingList').attr(disabled, true);    이거 왜 안되지? */
                }else{
                	selectWaitingList[0].innerText = "새로운 가입 요청";
                	selectWaitingList[0].disabled = false;
            	     /*  $('.selectWaitingList').attr(disabled, false);  */
                }
            }
        }
    }
 })
}; 
}) /* document ready */
</script>
</html>