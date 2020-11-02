<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<jsp:include page="/common/header.jsp" />
<link rel="stylesheet" type="text/css" href="../resources/css/views/after/main.css" />
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
<script>
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

                    var commentNum = response[i].COMMENTNUM;

                        var id = 'depts' + index

                        var html = '';
                        html += '<ul id="' + id + '" class="col-12 pl-5 row">'
                        html += '<img src="/resources/img/' + response[i].CONTENT2 + '" class="rounded-circle" style="width: 50px;height: 50px">';
                        html += '<div class="col-10">';
                        html += '<pre style="display: none">'+response[i].COMMENTNUM+'</pre>';
                        html += '<h5 class="m-0">'+response[i].NICKNAME+'</h5>';
                        html += '<div>'+response[i].CONTENT +'</div>';
                        html += '<button class="'+id+'subComment p-0 btn btn-default text-muted" onclick="toggleWriteSubComment(this)">[답글 작성]</button>';
                        html += '<p style="display: none"><input type="text" class="form-control" placeholder="댓글 내용 입력"/>';
                        html += '<button id="writeSubCommentBtn" class="btn btn-info" onclick="writeSubComment(this)">작성</button>';
                        html += '<button class="btn btn-light" onclick="cancelwriteSubComment(this)">취소</button>';
                        html += '</p></div></ul>';

                        $('#commentBoard').append(html);

                        index++;

                }
            },
            error: function(response){
                console.log("error");
            }
        })
    }

    function submitComment(afterNum){
        var data = {
            "parentNum" : 0,
            "depts" : 1,
            "afterNum" : afterNum,
            "content" : $('#commentContent').val(),
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
                    html += '<button class="'+id+' p-0 btn btn-default text-muted"></button>'
                    html += '<button class="'+id+'subComment p-0 btn btn-default text-muted" onclick="toggleWriteSubComment(this)">[답글 작성]</button>'
                    html += '<p style="display: none"><input type="text" class="form-control" placeholder="댓글 내용 입력"/>'
                    html += '<button id="writeSubCommentBtn" class="btn btn-info" onclick="writeSubComment(this)">작성</button>'
                    html += '<button class="btn btn-light" onclick="cancelwriteSubComment(this)">취소</button>'
                    html += '</p></div></ul>';

                    $('#commentBoard').append(html);

                    index++;
                }
            },
            error: function(response){
                alert("다시 시도해주세요")
            }
        })
    }

</script>
<body class="container pt-5">
    <div class="col-12 pt-5">
        <c:forEach var="after" items="${after}">
        <div class="afterBox" style="width: 100%">
            <div class="after-title row m-3">
                <a href="/profile/${after.USERNUM}">
                    <img class="rounded-circle" src="/resources/img/${after.CONTENT2}" style="width: 45px;height: 45px">
                </a>
                <h3 class="pl-2 mt-1 mb-0">[${after.MTNM}] ${after.TITLE}</h3>

            </div>
            <hr />
            <div class="after-content p-4 m-4">${after.CONTENT}</div>
            <p class="pr-3 text-muted text-right">${after.CREATEDAT}</p>
            <hr />
            <div class="m-3">
                <h3 class="mt-2 pb-1">댓글</h3>
                <div id="commentBoard" class="row">
                </div>
            </div>
            <!-- 댓글 입력 -->
            <div id="commentInput" class="row col-12 pb-4" style="justify-content: center">
                <c:choose>
                    <c:when test="${sessionIdImage eq null}">
                        <img src="/resources/img/basic_profile.PNG" class="rounded-circle" style="width: 50px;height: 50px" />
                        <input id="commentContent" class="form-control form-control-lg col-lg-9 col-md-8 col-10 col-10 ml-2 mr-2" type="text" placeholder="로그인 먼저 해주세요" onclick="location.href=('/user/logInView.do')">
                        <button id="commentSubmit" class="btn btn-info col-lg-1 col-md-2 col-sm-11" onclick="location.href=('/user/logInView.do')">등록</button>
                    </c:when>
                    <c:when test="${sessionIdImage ne null}">
                        <img src="/resources/img/${sessionIdImage}" class="rounded-circle" style="width: 50px;height: 50px" />
                        <input id="commentContent" class="form-control form-control-lg col-lg-9 col-md-8 col-10 col-10 ml-2 mr-2" type="text" placeholder="내용을 입력해주세요">
                        <button id="commentSubmit" class="btn btn-info col-lg-1 col-md-2 col-sm-11" onclick="submitComment(${after.AFTERNUM})">등록</button>
                    </c:when>
                </c:choose>
            </div>
        </div>
            <script>
                selectCommentByAfterNum(${after.AFTERNUM})
            </script>
        </c:forEach>
    </div>
</body>
</html>
