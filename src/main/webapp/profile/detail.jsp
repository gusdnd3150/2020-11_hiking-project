<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>${userInfo.NICKNAME}의 프로필</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../resources/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../resources/css/views/profile/detail.css" />
</head>
<body class="m-3">
    <div class="p-3">
        <h1>${userInfo.NICKNAME}의 프로필</h1>
        <div class="box box-primary">
            <div class="box-body box-profile">
                <div class="row col-12 m-0 p-0">
                    <img class="rounded-circle" src="/resources/img/${userInfo.CONTENT2}" width="70px" height="70px" alt="프로필사진">
                    <div id="profile1" class="ml-3" style="width: auto">
                        <p class="m-3">${userInfo.PROFILE}</p>
                    </div>
                </div>
                <div id="button-groups" class="pt-3">
                    <button type="button" id="followUser" class="btn btn-outline-secondary">
                        <i class="fas fa-user-friends">팔로우</i>
                    </button>
                    <button type="button" id="blockUser" class="btn btn-outline-danger">
                        <i class="fas fa-ban">차단</i>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12 pt-3">
                <h5 class="mt-2">${userInfo.NICKNAME}님이 작성한 글</h5>
                <div class="">작성한 글이 없습니다</div>
    </div>
        <div class="p-3 col-12 text-muted" style="text-align:right">
            가입일 : ${userInfo.CREATEDAT}
        </div>
    </div>
</body>
</html>
