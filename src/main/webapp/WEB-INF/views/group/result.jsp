<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<%=request.getParameter("vo")%>
<c:forEach var="image" items="${vo}">
    <img src="data:image/jpg;base64,<c:out value="${vo}" />" alt="" />
</c:forEach>
</body>
</html>