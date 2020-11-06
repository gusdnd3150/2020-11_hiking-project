<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/common/header.jsp" />
<body class="container pt-5">
<div class="pt-5">
    <h1>고객센터 게시판</h1>
</div>
<div class="row d-flex justify-content-between p-3">
    <div>
    </div>
    <div>
        <button id="returnToList"class="btn btn-dark" onclick="goBoard()">뒤로</button>
    </div>
</div>
<div class="responsive">
    <div class="form-group">
        <label for="type">
            <h2 id="type">${post[0].TYPE}</h2>
        </label>
        <div class="pt-2">
            <label for="title">제목</label>
            <div id="title" class="form-control">${post[0].TITLE}</div>
        </div>
        <div class="pt-1">
            <label for="status">진행 상황</label>
            <div id="status" class="form-control">${post[0].STATUS}</div>
        </div>
    </div>
    <div class="pt-1">
        <label for="content">내용</label>
        <div id="content" class="form-control" style="height: 500px;overflow-y: auto"></div>
    </div>
    <div class="text-right">수정 : ${post[0].CREATEDAT}</div>
</div>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/js/view/group/main.js"></script>
<script>
    $(document).ready(function (){
        $('#content').append('${post[0].CONTENT}')
    })

    function goBoard(){
        window.history.back();
    }
</script>
</body>
<jsp:include page="/common/footer.jsp" />