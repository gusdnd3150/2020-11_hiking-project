<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/common/header.jsp" />
<link rel="stylesheet" type="text/css" href="../resources/css/views/group/after.css">
<body class="container pt-5">
<div class="pt-5">
    <h1>후기</h1>
<%--    <form id="afterForm" class="form-group" method="POST" action="/after/insert.do" enctype="multipart/form-data">--%>
        <div class="p-3">
            <label class="label control-label" for="title"><h5>후기 제목</h5></label>
            <div id="title"></div>
        </div>
        <div class="p-3">
            <label class="label control-label" for="content"><h5>후기 내용</h5></label>
            <div id="content"></div>
        </div>
<%--    </form>--%>
<%--    <div class="p-3" style="float: right">--%>
<%--        <button id="reset" class="btn btn-light">다시 작성</button>--%>
<%--        <button id="submit" class="btn btn-info">작성 완료</button>--%>
<%--    </div>--%>
</div>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script>
</script>
</body>
</html>