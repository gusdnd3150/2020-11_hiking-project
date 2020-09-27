<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<jsp:include page="/common/header.jsp" />
<link rel="stylesheet" type="text/css" href="/resources/css/views/group/main.css" />
<body class="pt-5 mt-5">
<div class="container">
    <div class="btn-group" role="group" aria-label="...">
        <button type="button" class="btn btn-outline-info button-class1" id="path">등산로</button>
        <button type="button" class="btn btn-outline-secondary button-class2" id="group">등산모임</button>
    </div>
    <button type="button" class="btn btn-dark" id="create" style="float:right;" onclick="create()">산모임 만들기</button>
    <p></p>
    <h1>등산모임 리스트</h1>
    <div class="responsive">
        <div class="row">
            <c:forEach var="group" items="${group}">
                <div class="col-lg-4">
                    <div class="card" >
                        <img class="card-img-top" src="/group/media/${group.groupNum}" alt="..." style="width: 100%"/>
                        <div class="card-body">
                            <h5 class="card-title">${group.name}</h5>
                            <p class="card-text text-muted" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">${group.detail}</p>
                            <a href="/group/${group.groupNum}" class="btn btn-info">바로가기</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
<script>
    function create(){
        location.href='./form.jsp';
    }

    $(function() {

        $('.button-class1').click(function(){
            if( $(this).hasClass('btn-outline-secondary') ) $(this).removeClass('btn-outline-secondary');
            if( !$(this).hasClass('btn-outline-info') ) $(this).addClass('btn-outline-info');
            if( $('.button-class2').hasClass('btn-outline-info') ) $('.button-class2').removeClass('btn-outline-info');
            if( !$('.button-class2').hasClass('btn-outline-secondary') ) $('.button-class2').addClass('btn-outline-secondary');
        });

        $('.button-class2').click(function(){
            if( $(this).hasClass('btn-outline-secondary') ) $(this).removeClass('btn-outline-secondary');
            if( !$(this).hasClass('btn-outline-info') ) $(this).addClass('btn-outline-info');
            if( $('.button-class1').hasClass('btn-outline-info') ) $('.button-class1').removeClass('btn-outline-info');
            if( !$('.button-class1').hasClass('btn-outline-secondary') ) $('.button-class1').addClass('btn-outline-secondary');
        });

    });
</script>
</body>