<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/common/header.jsp" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../resources/css/views/after/main.css" />
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
<script>

    $(document).on('click','.like',function (){
        var afterNum = this.getAttribute("id")
        var data = {
            "afterNum": afterNum,
            "userId" : "${LOGIN}",
            "likeYN" :  "Y"
        }
        $.ajax({
            type: "POST",
            url: "/after/insertAfterLike.do",
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response) {
                var id = 'likebox-'+afterNum;
                $('#'+afterNum).attr('class','dislike fas fa-thumbs-up');
                $('#'+id).text(response)
            },
            error: function (response){
                console.log("error")
            }
        })
    });

    $(document).on('click','.dislike',function (){
        var afterNum = this.getAttribute("id")
        var data = {
            "afterNum": afterNum,
            "userId" : "${LOGIN}",
            "likeYN" :  "N"
        }
        $.ajax({
            type: "POST",
            url: "/after/updateAfterLike.do",
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response) {
                var id = 'likebox-'+afterNum;
                $('#'+afterNum).attr('class','like far fa-thumbs-up');
                $('#'+id).text(response)
            },
            error: function (response){
                console.log("error")
            }
        })
    })

    function deleteAfter(afterNum){
        var data = {
            "afterNum": afterNum
        }
        $.ajax({
            type: "POST",
            url: "/after/delete.do",
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response) {
                if(response==1){
                    alert('후기가 삭제되었습니다.')
                    location.href = "/after/main.do"
                }
            },
            error: function (response){
                console.log("error")
            }
        })
    }
    function selectLikeCount(afterNum){
        var data = {
            "afterNum": afterNum
        }
        $.ajax({
            type: "GET",
            url: "/after/selectLikeCount.do",
            data: data,
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response) {
                var id = 'likebox-'+afterNum;
                $('#'+id).append(response)
            },
            error: function (response){
                console.log("error")
            }
        })
    }

    function checkAfterLike(afterNum){
        var data = {
            "afterNum" : afterNum,
            "userId" : "<%= request.getSession().getAttribute("LOGIN")%>"
        }
        $.ajax({
            type: "GET",
            url: "/after/checkAfterLike.do",
            data: data,
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response) {
                if(response==1){
                    $('#like-'+afterNum).append('<i id="'+afterNum+'" class="dislike fas fa-thumbs-up" style="color:skyblue"></i>')
                }else if(response==0){
                    $('#like-'+afterNum).append('<i id="'+afterNum+'" class="like far fa-thumbs-up" style="color:skyblue"></i>')
                }
            },
            error: function (response){
                console.log("error")
            }
        })
    }

    //comment
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
    function selectCommentByAfterNum(afterNum){
        var data = {
            "afterNum" : afterNum
        }

        $.ajax({
            type: "GET",
            url: "/after/selectCommentByAfterNum.do",
            data: data,
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){
                console.log(response)

                var index = 0;

                for(var i=0;i<response.length;i++) {

                    var rootNum = response[i].PARENTNUM;
                    var commentNum = response[i].COMMENTNUM;
                    var afterNum = response[i].AFTERNUM
                    var selector = 'commentBoard'+afterNum;

                    var id = afterNum+'-depts-' + index;

                    if(rootNum == 0){
                        var html = '';
                        html += '<ul id="' + id + '" class="col-12 pl-5 row">'
                        html += '<img src="/resources/img/' + response[i].CONTENT2 + '" class="rounded-circle" style="width: 50px;height: 50px">';
                        html += '<div class="col-10">';
                        html += '<pre style="display: none">'+response[i].COMMENTNUM+'</pre>';
                        html += '<h5 class="m-0">'+response[i].NICKNAME+'</h5>';
                        if(response[i].DELETED==1){
                            html += '<div class="text-muted">'+response[i].CONTENT +'</div>';
                        }else{
                            html += '<div>'+response[i].CONTENT +'</div>';
                        }
                        html += '<button id ='+response[i].COMMENTNUM+' class="'+id+' p-0 btn btn-default text-muted" onclick="toggleSubComment(this)">[답글 '+ response[i].SUBCOMMENTCOUNT +'개 더보기]</button>'
                        html += '<button class="'+id+'subComment p-0 btn btn-default text-muted" onclick="toggleWriteSubComment(this)">[답글 작성]</button>';
                        if(response[i].DELETED==1){
                        }else if(response[i].DELETED==0 && response[i].ID=='${LOGIN}'){
                            html += '<button class="'+id+'deleteBtn p-0 btn btn-default text-muted" onclick="deleteComment(this)">[삭제]</button>'
                        }
                        html += '<p style="display: none"><input type="text" class="form-control" placeholder="댓글 내용 입력"/>';
                        html += '<button id="writeSubCommentBtn" class="btn btn-info" onclick="writeSubComment(this,'+response[i].AFTERNUM+')">작성</button>';
                        html += '<button class="btn btn-light" onclick="cancelwriteSubComment(this)">취소</button>';
                        html += '</p></div></ul>';


                        $('#'+selector).append(html);

                        index++;

                        var index1 = 0;
                        for (var j = 0; j < response.length; j++) {

                            if (response[j].PARENTNUM == commentNum) {
                                var html = '';
                                html += '<li id="' + id + index1 + '" class="col-12 row pt-3 ml-5 pl-2" style="display: none;">';
                                html += '<img src="/resources/img/'+response[j].CONTENT2+'" class="rounded-circle" style="width: 40px; height: 40px; float: left">';
                                html += '<div class="col-9 ml-2 pl-5">';
                                html += '<pre style="display: none">'+response[j].COMMENTNUM+'</pre>';
                                html += '<h5 class="mb-0">'+response[j].NICKNAME+'</h5>'
                                if(response[j].DELETED==1){
                                    html += '<div class="text-muted">'+response[j].CONTENT +'</div>';
                                }else{
                                    html += '<div>'+response[j].CONTENT +'</div>';
                                }
                                if(response[j].DELETED==1){
                                }else if(response[j].DELETED==0 && response[j].ID=='${LOGIN}'){
                                    html += '<button class="'+id+'deleteBtn p-0 btn btn-default text-muted" onclick="deleteComment(this)">[삭제]</button>'
                                }
                                html += '</div></li>';

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
    function submitComment(afterNum){
        var content = 'commentContent-'+afterNum;
        var data = {
            "parentNum" : 0,
            "depts" : 1,
            "afterNum" : afterNum,
            "content" : $('#'+content).val(),
            "userId" : "<%= request.getSession().getAttribute("LOGIN")%>",
            "postNum": 0
        }

        $.ajax({
            type: "POST",
            url: "/after/insertComment.do",
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){
                var index = 0;
                var selector = 'commentBoard'+response.AFTERNUM;
                var rootNum = response.PARENTNUM;

                if (rootNum == 0) {
                    var id = 'depts' + index

                    var html = '';
                    html += '<ul id="' + id + '" class="col-12 pl-5 row">'
                    html += '<img src="/resources/img/${sessionIdImage}" class="rounded-circle" style="width: 50px;height: 50px">'
                    html += '<div class="col-10">'
                    html += '<pre style="display: none">'+response.COMMENTNUM+'</pre>'
                    html += '<h5>'+response.NICKNAME+'</h5>'
                    html += '<div>'+response.CONTENT +'</div>'
                    html += '<button id ='+response.COMMENTNUM+' class="'+id+' p-0 btn btn-default text-muted" onclick="toggleSubComment(this)">[답글 '+ response.SUBCOMMENTCOUNT +'개 더보기]</button>'
                    html += '<button class="'+id+'subComment p-0 btn btn-default text-muted" onclick="toggleWriteSubComment(this)">[답글 작성]</button>'
                    html += '<p style="display: none"><input type="text" class="form-control" placeholder="댓글 내용 입력"/>'
                    html += '<button id="writeSubCommentBtn" class="btn btn-info" onclick="writeSubComment(this,'+response.AFTERNUM+')">작성</button>'
                    html += '<button class="btn btn-light" onclick="cancelwriteSubComment(this)">취소</button>'
                    html += '</p></div></ul>';

                    $('#'+selector).append(html);
                    $('#'+content).val("");
                    index++;
                }
            },
            error: function(response){
                alert("로그인 해주세요")
            }
        })
    }
    function writeSubComment(e,afterNum){

        $root = e.parentNode.parentNode;
        $parentNum = $root.getElementsByTagName("pre")[0];

        var data = {
            "parentNum": $parentNum.innerHTML,
            "depts": 2,
            "afterNum": afterNum,
            "content": e.previousSibling.value,
            "userId": '${LOGIN}'
        }

        $.ajax({
            type: "POST",
            url: "/after/insertSubComment.do",
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){
                var id = $root.parentNode.id;

                var html = '';

                html += '<li id="temp" class="col-12 row pt-3 ml-5 pl-2">';
                html += '<img src="/resources/img/${sessionIdImage}" class="rounded-circle" style="width: 40px;height: 40px;float: left">';
                html += '<div class="col-9">';
                html += '<h5 class="mb-0 pl-0">'+response.NICKNAME+'</h5>';
                html += response.CONTENT +'</div></li>';

                $('#'+id).append(html);
                countSubComment($parentNum.innerHTML);
                e.previousSibling.value ="";
            },
            error: function(response){
                alert("로그인 해주세요")
            }
        })
    }
    
	function countSubComment(parentNum){
	 var data = {
		        "commentNum" : parentNum
		    }
	
	    $.ajax({
	        type: "POST",
	        url: "/after/countSubComment.do",
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
    function deleteComment(e){
        var data = {
            commentNum : e.parentNode.childNodes[0].innerText
        }

        $.ajax({
            type: "POST",
            url: "/after/deleteComment.do",
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success : function (response){
                alert('삭제 되었습니다')
                location.reload();
            },
            error : function (response){
                alert("오류 발생! 다시 시도해주세요");
            }
        })

    }

</script>
<body class="container pt-5">
    <div class="col-12 pt-5">
        <c:forEach var="after" items="${after}">
        <div class="afterBox" style="width: 100%">
            <div class="after-title row d-flex justify-content-between m-3">
                <div class="titlebox form-inline">
                    <a href="/profile/${after.USERNUM}">
                        <img class="rounded-circle" src="/resources/img/${after.CONTENT2}" style="width: 45px;height: 45px">
                    </a>
                    <h3 class="pl-2 mt-1 mb-0">[${after.MTNM}] ${after.TITLE}</h3>
                </div>
                <div id="like-${after.AFTERNUM}" class="align-self-center" style="font-size: 22px">
                    <span id="likebox-${after.AFTERNUM}" style="margin: 5px 5px 5px 5px;"></span>
                </div>
            </div>
            <hr />
            <div class="after-content p-4 m-4">${after.CONTENT}</div>
                <div class="pr-3 text-muted text-right">
                    <button class="btn btn-danger" class="btn btn-danger" data-toggle="modal" data-target="#cancelModal">후기 삭제</button>
                    <div>${after.CREATEDAT}</div>
                </div>
            <hr />
            <div class="m-3">
                <h3 class="mt-2 pb-1">댓글</h3>
                <div id="commentBoard${after.AFTERNUM}" class="row">
                </div>
            </div>
            <!-- 댓글 입력 -->
            <div id="commentInput" class="row col-12 pb-4" style="justify-content: center">
                <c:choose>
                    <c:when test="${sessionIdImage eq null}">
                        <img src="/resources/img/basic_profile.PNG" class="rounded-circle" style="width: 50px;height: 50px" />
                        <input id="commentContent-${after.AFTERNUM}" class="form-control form-control-lg col-lg-9 col-md-8 col-10 col-10 ml-2 mr-2" type="text" placeholder="로그인 먼저 해주세요" onclick="location.href=('/user/logInView.do')">
                        <button id="commentSubmit" class="btn btn-info col-lg-1 col-md-2 col-sm-11" onclick="location.href=('/user/logInView.do')">등록</button>
                    </c:when>
                    <c:when test="${sessionIdImage ne null}">
                        <img src="/resources/img/${sessionIdImage}" class="rounded-circle" style="width: 50px;height: 50px" />
                        <input id="commentContent-${after.AFTERNUM}" class="form-control form-control-lg col-lg-9 col-md-8 col-10 col-10 ml-2 mr-2" type="text" placeholder="내용을 입력해주세요">
                        <button id="commentSubmit" class="btn btn-info col-lg-1 col-md-2 col-sm-11" onclick="submitComment(${after.AFTERNUM})">등록</button>
                    </c:when>
                </c:choose>
            </div>
        </div>
            <div class="modal fade" id="cancelModal">
                <div class="modal-dialog" id="modal">
                    <div class="modal-content">
                        <div class="modal-body">
                            정말로 삭제할까요?
                        </div>
                        <!-- Footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                            <button type="button" class="btn btn-danger" onclick="deleteAfter(${after.AFTERNUM})">삭제</button>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                selectCommentByAfterNum(${after.AFTERNUM})
                selectLikeCount(${after.AFTERNUM})
                checkAfterLike(${after.AFTERNUM})
            </script>
        </c:forEach>
    </div>
</body>
</html>
