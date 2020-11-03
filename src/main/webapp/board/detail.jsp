<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/common/header.jsp" />
<body class="container pt-5">
<div class="pt-5">
    <h1>고객센터 게시판</h1>
</div>
<div class="p-3">
    <button id="csBoardBtn"class="btn btn-info">고객센터</button>
    <button id="noticeBoardBtn" class="btn btn-outline-secondary">공지사항</button>
    <button id="eventBoardBtn" class="btn btn-outline-secondary">이벤트</button>
</div>
<div class="responsive">
    ${post}
</div>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/js/view/group/main.js"></script>
</body>
<jsp:include page="/common/footer.jsp" />