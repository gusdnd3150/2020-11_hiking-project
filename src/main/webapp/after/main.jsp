<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<jsp:include page="/common/header.jsp" />
<link rel="stylesheet" type="text/css" href="../resources/css/views/after/main.css" />
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
            <div>
                댓글란
            </div>
        </div>
        </c:forEach>
    </div>
</body>
</html>
