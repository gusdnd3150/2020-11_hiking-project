<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<jsp:include page="/common/header.jsp" />
    <meta charset='utf-8' />
    <link href='https://use.fontawesome.com/releases/v5.0.6/css/all.css' rel='stylesheet'>
    <link href='../resources/full-calendar/core/main.css' rel='stylesheet' />
    <link href='../resources/full-calendar/bootstrap/main.css' rel='stylesheet' />
    <link href='../resources/full-calendar/timegrid/main.css' rel='stylesheet' />
    <link href='../resources/full-calendar/daygrid/main.css' rel='stylesheet' />
    <link href='../resources/full-calendar/list/main.css' rel='stylesheet' />
    <link href='../resources/css/views/calendar/main.css' rel="stylesheet" />
<body class="container pt-5">
    <div class="pt-5">
        <h1>내 등산일정</h1>
        <div id='calendar'></div>
    </div>
</body>
<script src='../resources/full-calendar/core/main.js'></script>
<script src='../resources/full-calendar/interaction/main.js'></script>
<script src='../resources/full-calendar/bootstrap/main.js'></script>
<script src='../resources/full-calendar/daygrid/main.js'></script>
<script src='../resources/full-calendar/timegrid/main.js'></script>
<script src='../resources/full-calendar/list/main.js'></script>
<script src='../resources/js/view/calendar/main.js'></script>
</html>


