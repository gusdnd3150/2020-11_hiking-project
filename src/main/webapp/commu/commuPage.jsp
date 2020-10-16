<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="ko">
<jsp:include page="/commu/common/leftSide.jsp" flush="false" />


<!-- middle div -->
<c:choose>
<c:when test="${empty m2.USERSTATUS && 1 eq m4.BOARDACCESS}">
<jsp:include page="/commu/commuIntro.jsp" flush="false" />
	</c:when>
	<c:otherwise>
	<div class="col-md-6 tab-content" id="nav-tabContent">
		<div class="tab-pane fade show active" id="commuPage" role="tabpanel"
			aria-labelledby="list-commuPage-list">
			<c:if test="${0 eq m2.USERSTATUS}">
			<div id="search" class="row pl-3 pb-2">
				<input class="form-control " type="search"
					style="width: 473px; height: 40px; margin: 3px; border-color: green; !important;"
					placeholder="Search" aria-label="Search">
				<button type="submit" class="btn btn-primary"
					style="background-color: green; border-color: green; margin: 3px; width: 50xp; height: 40px; !important;">
					<img src="../resources/img/search.png" width="25" height="25"
						onclick="">
				</button>
			</div>

			<div class="card" style="border-color: green;">
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
			<hr>
			</c:if>
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
					우리 청솔 산모임 9월 정모 너무 행복했어요~~우리 청솔 산모임 9월 정모 너무 행복했어요~~우리 청솔 산모임 9월 정모
					너무 행복했어요~~우리 청솔 산모임 9월 정모 너무 행복했어요~~우리 청솔 산모임 9월 정모 너무 행복했어요~~우리 청솔
					산모임 9월 정모 너무 행복했어요~~
					<hr class="my-4">
					댓글 부분
				</div>
			</div>
		</div>
			<c:if test="${0 eq m2.USERSTATUS}">
		<jsp:include page="/commu/calender.jsp" flush="false" />
		<jsp:include page="/commu/album.jsp" flush="false" />
		<jsp:include page="/commu/files.jsp" flush="false" />
		<jsp:include page="/commu/member.jsp" flush="false" />
	</div>
<jsp:include page="/commu/common/rightSide.jsp" flush="false" />
</c:if>
	</c:otherwise>
</c:choose>


		</div>
	</div>

<div style="height:230px;"></div>


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

<script>
$(document).ready(function (){
	if(${0 eq m2.USERTYPE}){
	var data = {
	        "groupNum" : "${m1.GROUPNUM}",
	        "userId" : "<%= request.getSession().getAttribute("LOGIN")%>"
	    }
		var selectWaitingList = document.getElementsByClassName('selectWaitingList');
	    $.ajax({
	        type: "POST",
	        url: "/group/selectWaitingList.do",
	        data: JSON.stringify(data),
	        dataType: 'json',
	        contentType: "application/json; charset=utf-8;",
	        success: function (response){
	            for(var i=0;i<response.length;i++){
	                var id = "waitingUser"+i;
	                if((response[i].USERSTATUS==1) == ""){
	                	console.log("??");
	                	selectWaitingList[0].disabled = true;
	                	 /* $('.selectWaitingList').attr(disabled, true); */
	                }else{
	                	selectWaitingList[0].disabled = false;
	                	console.log("??????");
	                	 /* $('.selectWaitingList').attr(disabled, false); */
	                }
	            }
	        }
	     });
	  } 
	
	
    $(document).on('click','.joinGroupBtn',function (){
        var data = {
            "groupNum": "${m1.GROUPNUM}",
            "userId" : "<%= request.getSession().getAttribute("LOGIN")%>",
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
    $(document).on('click','.withdrawGroupBtn',function (){
        $("#cancelModal").show();
    })
    $(document).on('click','.cancelModalBtn',function (){

        var data = {
            "groupNum": ${m1.GROUPNUM},
            "userId" : "<%= request.getSession().getAttribute("LOGIN")%>",
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

    });
    
$(document).on('click','.selectWaitingList',function (){

    var data = {
        "groupNum" : "${m1.GROUPNUM}",
        "userId" : "<%= request.getSession().getAttribute("LOGIN")%>"
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
                    .append('<li class="row pt-1" style="list-style: none"><div id="waitingUser" class="col-10 pt-1" style="font-size: 22px">'+response[i].USERID+'</div></li>');

                $('#waitingUser').attr('id',id);
						
                $('#'+id).after('<button class="userAllowed btn btn-light col-2">승인</button>');
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
        userId : (this.parentNode).childNodes[0].innerHTML,
        groupNum : ${m1.GROUPNUM},
   		action : "plus"
    }

    $.ajax({
        type: "GET",
        url: "/group/userAllowed.do",
        data: data,
        dataType: 'json',
        contentType: "application/json; charset=utf-8;",
        success: function (response){
            e.target.className ="userDisallowed btn btn-dark col-2";
            e.target.innerText = "취소";
        },
        error: function(response){
            console.log("error");
            alert("새로고침 후 다시 시도해주세요")
        }
    })
})

$(document).on('click','.userDisallowed',function (e){
    var data = {
        userId : (this.parentNode).childNodes[0].innerHTML,
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
            e.target.className ="userAllowed btn btn-light col-2";
            e.target.innerText = "승인";
        },
        error: function(response){
            console.log("error");
            alert("새로고침 후 다시 시도해주세요")
        }
    })
})
		</script>  
</html>