<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/common/header.jsp" />

<link rel="stylesheet" type="text/css" href="../resources/css/views/group/result.css">
<body class="flex-container">
<div class="result-box">
    <div>
        <h1 class="font-weight-bold">등록완료!</h1>
        <img src="../resources/img/result.jpg">
        ${groupNum}
    </div>
    <a class="btn btn-outline-info" href="/main.do">메인 페이지로</a>
    <a class="btn btn-danger" href="/calendar.do">나의 등산일정에 추가하기</a>
</div>
</body>
</html>
