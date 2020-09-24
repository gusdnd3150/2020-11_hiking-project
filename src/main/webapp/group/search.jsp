<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>상세 검색</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-4">
            <div class="list_title">
                <h1>등산모임 검색결과</h1>
            </div>
            <div class="list_content">
                <c:forEach var="group" items="${group}">
                    <li class="item">
                        <img class="image" src="/group/media/${group.groupNum}"></img>
                        <div class="cont">
                            <strong>${group.name}</strong>
                            <p>${group.detail}</p>
                            <a href="#">바로가기</a>
                        </div>
                    </li>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</body>
</html>