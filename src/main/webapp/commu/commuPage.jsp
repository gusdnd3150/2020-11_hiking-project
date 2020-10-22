<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!doctype html>
<html lang="ko">
<script type="text/javascript"
	src="/resources/ckeditor/ckeditor/ckeditor.js"></script>
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
					<jsp:include page="/commu/common/postCreateForm.jsp" flush="false" />
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
				<style>
div#posts img {
	width: auto !important;
	height: auto !important;
	max-width: 500px !important;
	max-height: 500px !important;
}
</style>
				<c:forEach var="postList" items="${postList}">
					<div class="card">
						<div class="row col-sm-4">
							<img class="rounded-circle mt-3" style="margin-left: 10px"
								src="http://localhost:8080/resources/img/${postList.CONTENT2}"
								width="50" height="50" alt="프로필사진">
							<h6 style="margin-top: 40px">&nbsp${postList.NICKNAME}</h6>
						</div>
						<div class="card-body" id="posts">
							${postList.CONTENT} <br> <small>작성
								${postList.CREATEDAT}</small>
							<c:if test="${not empty postList.UPDATEDAT}">
								<small> / 수정 ${postList.UPDATEDAT}</small>
								<br>
							</c:if>
							<hr class="my-4">
							댓글 부분
						</div>
					</div>
				</c:forEach>
			</div>



			<jsp:include page="/commu/setting.jsp" flush="false" />
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
<div style="height: 230px;"></div>

<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
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

/*   댓글 */
const userProfile = '${sessionIdImage}';
    
	function toggleSubComment(e){
     console.log("답글 작성 토글 e"+ e);
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

      function writeSubComment(e){

          $root = e.parentNode.parentNode;
          $parentNum = $root.getElementsByTagName("pre")[0];

          var data = {
              "parentNum" : $parentNum.innerHTML,
              "depts" : 2,
              "groupNum" : "${m1.GROUPNUM}",
              "content" : e.previousSibling.value,
              "userId" : "<%= request.getSession().getAttribute("LOGIN")%>",
              "postNum" : $('#oC').data('postNum').replace(/\"/g, "")
          }


          $.ajax({
              type: "POST",
              url: "/group/insertSubComment.do",
              data: JSON.stringify(data),
              dataType: 'json',
              contentType: "application/json; charset=utf-8;",
              success: function (response){
                  var id = $root.parentNode.id;
                  console.log(id)
                  $('#'+id).append(
                      '<li id="temp" class="col-12 row pt-3 ml-5 pl-2">'+
                      '<img src="/resources/img/${sessionIdImage}" class="rounded-circle" style="width: 40px;height: 40px;float: left">'+
                      '<div class="col-9">'+
                      '<h5 class="mb-0 pl-0">'+response.userId+'</h5>'+
                      response.content +'</div></li>'
                  );
              },
              error: function(response){
                  alert("다시 시도해주세요")
              }
          })


      }

      function cancelwriteSubComment(e){
          e.previousSibling.previousSibling.value=null;
      }
      
      


  $(document).on('click','#commentSubmit',function (){

      var data = {
          "parentNum" : 0,
          "depts" : 1,
          "groupNum" : ${m1.GROUPNUM},
          "content" : $('#commentContent').val(),
          "userId" : "<%= request.getSession().getAttribute("LOGIN")%>",
          "postNum" : $('#oC').data('postNum').replace(/\"/g, "")
      }

      $.ajax({
          type: "POST",
          url: "/group/insertComment.do",
          data: JSON.stringify(data),
          dataType: 'json',
          contentType: "application/json; charset=utf-8;",
          success: function (response){

              var index = 0;
              var count = response.subCommentCount;

                  var rootNum = response.parentNum;

                  if (rootNum == 0) {
                      var id = 'depts' + index

                      $('#commentBoard').append(
                          '<ul id="' + id + '" class="col-12 pl-5 row">' +
                          '<img src="/resources/img/${sessionIdImage}" class="rounded-circle" style="width: 50px;height: 50px">'+
                          '<div class="col-10">'+
                          '<pre style="display: none">'+response.commentNum+'</pre>'+
                          '<h5>'+response.userId+'</h5>'+
                          '<div>'+response.content +'</div>' +
                          '<button class="'+id+' p-0 btn btn-default text-muted" onclick="toggleSubComment(this)">[답글 '+ count +'개 더보기]</button>' +
                          '<button class="'+id+'subComment p-0 btn btn-default text-muted" onclick="toggleWriteSubComment(this)">[답글 작성]</button>' +
                          '<p style="display: none"><input type="text" class="form-control" placeholder="댓글 내용 입력"/>' +
                          '<button id="writeSubCommentBtn" class="btn btn-success btn-sm" onclick="writeSubComment(this)">작성</button>' +
                          '<button class="btn btn-light btn-sm" onclick="cancelwriteSubComment(this)">취소</button>' +
                          '</p></div></ul>');

                      index++;
                  }
          },
          error: function(response){
              alert("다시 시도해주세요")
          }
      })

  })/* $(document).on('click','#commentSubmit',function (){ */

	  
	  
/*    function checkOCID(event){
  var click = event.target.id;
  var i = click.slice(7,9);
 console.log("click_id: "+ i);
  picDetail(i)
  }  
  */
  
     
    	  
$(document).ready(function (){
		var selectWaitingList = document.getElementsByClassName('selectWaitingList');
	if(${0 eq m2.USERTYPE}){
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
				if(!response.length) {
					selectWaitingList[0].innerText = "새로운 가입 요청 없음";
                	selectWaitingList[0].disabled = true;
				}else{
	            for(var i=0;i<response.length;i++){
	                if((response[i].USERSTATUS==1) == "" || response==null){
	                	console.log("??");
	                	selectWaitingList[0].innerText = "새로운 가입 요청 없음";
	                	selectWaitingList[0].disabled = true;
	                	/*  $('.selectWaitingList').attr(disabled, true);    이거 왜 안되지? */
	                }else{
	                	console.log("??????");
	                	selectWaitingList[0].innerText = "새로운 가입 요청";
	                	selectWaitingList[0].disabled = false;
                	     /*  $('.selectWaitingList').attr(disabled, false);  */
	                }
	            }
            }
        }
     })
  }; 
	
	
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
    };

    $.ajax({
        type: "GET",
        url: "/group/userAllowed.do",
        data: data,
        dataType: 'json',
        contentType: "application/json; charset=utf-8;",
        success: function (response){
            selectWaitingList[0].innerText = "새로운 가입 요청 없음";
        	selectWaitingList[0].disabled = false;
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

 $(function() {
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
}); 

    if('${m4.BOARDACCESS}' == 0) {
    if( $('#open').hasClass('btn-default') ) $('#open').removeClass('btn-default');
    if( !$('#open').hasClass('btn-primary') ) $('#open').addClass('btn-primary');
    if( $('.button-class2').hasClass('btn-primary') ) $('#close').removeClass('btn-primary');
    if( !$('.button-class2').hasClass('btn-default') ) $('#close').addClass('btn-default');
    } else {
    	console.log("비공개 까메ㅐ진다아")
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
        data.append("userId","<%= request.getSession().getAttribute("LOGIN")%>")

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
                alert("등록완료!")
               self.location ="/commu/commuPageView.do?groupNum=${m1.GROUPNUM}";
            },
            error(response){
                alert("등록 오류, 새로고침 후 다시 시도 해주세요")
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
    
 
  
  /* 페이징 처리 */
    var totalData = ${vM.total};    // 총 데이터 수
    var dataPerPage = 16;   // 한 페이지에 나타낼 데이터 수
    var pageCount = 10;        // 한 화면에 나타낼 페이지 수   
    if((totalData/dataPerPage) < pageCount){pageCount = Math.ceil(totalData/dataPerPage)}
     /*  위 세대는 예시 내가 해당 파람터에 값을 넣을 생각을 해야함. 위에 없애자고 해보자 */
    
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
        
        if(prev > 0)
            html += "<a href=# id='prev'><</a> ";
            
            
        if(first<1){first==1}
        for(var i=first; i <= last; i++){
            html += "<a href=# id=" + i + ">" + i + "</a> ";
        }
        
        if(last < totalPage)
            html += "<a href=# id='next'>></a>";
        
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
       	data["userId"] = "<%= request.getSession().getAttribute("LOGIN") %>" ;
      		data["total"] = ${vM.total}; 
       	$.ajax({
       		contentType:'application/json',
       		dataType:'json',
       		data:JSON.stringify(data),
       		url:'/commu/commuAlbumPaging.do',
       		type:'POST',
       		success:function(data){
       			 for(var i=0 in data){  
       	
       			var nickName = JSON.stringify(data[i].nickName);
       			var createdAt = JSON.stringify(data[i].createdAt);
       			var content = JSON.stringify(data[i].content).replace(/\"/g, "");
       			var content2 = JSON.stringify(data[i].content2);
       			var groupNum = JSON.stringify(data[i].groupNum);
       			var boardType = JSON.stringify(data[i].boardType);
       			var rn = JSON.stringify(data[i].rn);
       			var postNum = JSON.stringify(data[i].postNum);
       			var type = JSON.stringify(data[i].type);
       			var userNum = JSON.stringify(data[i].userNum);
   				html = "   <div class='col-lg-3 col-md-4 col-6' >" ;
   				html += "<a href='#originalContent' id='oC' class='d-block mb-4 h-100' data-toggle='modal' >" ;
   				html += " <img id='content' class='img-fluid img-thumbnail' src='http://localhost:8080/resources/ckstorage/images/";
   				html += content ;
   				html += "' alt='사진'></a></div>";
   				html += postNum;
   				htmlC += html;
   				document.getElementById('albumList').innerHTML=htmlC;     		
       				$('#content').data('nickName',nickName);
       				$('#content').data('content2',content2);
       				$('#content').data('createdAt',createdAt);
       				$('#content').data('postNum',postNum);
       				console.log("html:  " + html);
       			 }   
       		},
       		error:function(request, status, error){
       			alert(request.message);
       		}
       	})
       	
        $("#paging a").click(function(){
            var $item = $(this);
            var $id = $item.attr("id");     
            var selectedPage = $item.text();
            selectedPage *= 1;
            
            if($id == "next")    selectedPage = next;  
            if($id == "prev")    selectedPage = prev;

            paging(totalData, dataPerPage, pageCount, selectedPage);
        });
     }/* function paging(totalData, dataPerPage, pageCount, currentPage){ */
    
        paging(totalData, dataPerPage, pageCount, 1);
     
     
   /* album 사진 상세보기 */
$(document).on( 'click', 'a#oC' , function(e){ 
    $('a#oC').each(function(){
        $('a#oC').click(function(){
             $("#originalContent").modal();
            })  /*  $('a#oC').click(function(){ */
     }) /*      $('a#oC').each(function(){ */

     var modal = document.getElementById('originalContent');
     var img = document.querySelectorAll('#content');
     var modalImg = document.getElementById('OContent');
     img.forEach(function(showOC){
     	showOC.addEventListener('click', function(){
     		  modal.style.display = 'block';
     	      modalImg.src = this.src;
     	   var click =this.id;
  		  console.log("click_id: "+ $(this).data('postNum'));
        	var nickName = $(this).data('nickName').replace(/\"/g, "");
        	var content2 = $(this).data('content2').replace(/\"/g, "");
        	var createdAts = $(this).data('createdAt').replace(/\"/g, "");
        	var postNum = $('#oC').data('postNum').replace(/\"/g, "");
        	var createdAt = createdAts.slice(0,19);
        	var src = ("http://localhost:8080/resources/img/"+content2).replace(/\"/g, "");
        	console.log("클릭이벤트 먹었니: "+ nickName +"    ;///   "+postNum);                
        	document.getElementById('nickName').innerHTML=nickName;
        	document.getElementById('content2').src=src;
        	document.getElementById('createdAt').innerHTML=createdAt;
        	
        	
          
         var data = {
                   "postNum" : $('#oC').data('postNum').replace(/\"/g, "")
                };
          var  postNum = $('#oC').data('postNum').replace(/\"/g, "");
		console.log("postNum"+postNum);
		
        $.ajax({
            type: "GET",
            url: "/group/selectCommentByPostNum.do",
            data: data,
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){

                var index = 0;
                for(var i=0;i<response.length;i++) {

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
                            '<h5>'+response[i].userId+'</h5>'+
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
                                    '<h5 class="mb-0">'+response[j].userId+'</h5>'+
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
        }) /* selectCommentByPostNum 아작스 */   
     })
    })
   })  /* $(document).on( 'click', 'a#oC' , function(e){  */
                	
                	
   
        
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
           		},
           		error:function(request, status, error){
           			alert(request.message);
           		}
        
         	})
        	
        })
        
      


}); /* document ready */

</script>
</html>