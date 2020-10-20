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
<div>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>조회수</th>
        </tr>
        </thead>
        <c:forEach items="${list}" var="Board" >
            <tr>
                <th width="50">${Board.row_num}</th>
                <th width="300"><a href="/board?paramPage=getBoard&article_no=${Board.article_no}">${Board.title}</a></th>
                <th width="80">${Board.writer_name}</th>
                <th width="80">${Board.read_cnt}</th>
            </tr>
        </c:forEach>
        <tr>
            <th colspan="4">
            </th>
        </tr>
    </table>
</div>
</body>
</html>