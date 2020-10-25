<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<jsp:include page="/common/header.jsp" />
<link rel="stylesheet" type="text/css" href="/resources/css/views/group/main.css" />
<body class="pt-5 mt-5">
<div class="container">
    <div class="btn-group" role="group" aria-label="...">
        <button type="button" class="btn btn-outline-secondary button-class2" id="group" onclick="goMain1()">등산모임</button>
        <button type="button" class="btn btn-info button-class1" id="path" onclick="goMain2()">등산로</button>
    </div>
    <button type="button" class="btn btn-dark" id="create" style="float:right;" data-toggle="modal" data-target="#createModal">등산하기</button>
    <p></p>
    <div class="row">
        <h1 class="col-md-6 col-lg-9 mb-0">등산로 리스트</h1>
        <div class="col-md-6 col-lg-3 pt-2 pb-2 btn-group btn-group-toggle" data-toggle="buttons">
            <input type="text" class="col-8" placeholder="산/등산로">
            <button class="btn btn-info col-4">검색</button>
        </div>
    </div>
    <div class="responsive">
        현재시간
        <div class="row">
            <div class="col-sm-12 col-md-6 pt-5 p-3">
                <h2>산 인기 순위</h2>
                <div id="mtRank" class="form-inline">
                </div>
            </div>
            <div class="col-sm-12 col-md-6 pt-5 p-3">
                <h2>등산로 인기 순위</h2>
                <div id="pathRank"></div>
            </div>
<%--            <div class="col-4 p-3">--%>
<%--                <h2>나만의 등산로 추천</h2>--%>
<%--                <div id="recommendRank"></div>--%>
<%--            </div>--%>
        </div>
    </div>
</div>
<div class="modal fade" id="createModal" role="dialog">
    <div class="modal-dialog" style="max-width: 100%; width: auto; display: table">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">인원 설정</h4>
                <button type="button" class="close" data-dismiss="modal">x</button>
            </div>
            <div class="modal-body row" style="text-align: center">
                <div class="col-6">
                    <img src="../resources/img/select1.png" style="width: 250px; height: 250px; display: block;">
                    <button class="btn btn-primary" onclick="create1()">혼자 가기</button>
                </div>
                <div class="col-6" style="text-align: center">
                    <img src="../resources/img/select2.png" style="width: 250px; height: 250px; display: block">
                    <button class="btn btn-primary" onclick="create2()">다른사람과 가기</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/js/view/group/main.js"></script>
<script>
    $(document).ready(function (){
        mtRank(1);

    })

    function mtRank(rowNum){

        var data = {
            "rowNum" : rowNum
        }

        $.ajax({
            type: "GET",
            url: "/mountain/rank.do",
            data: data,
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){

                for(var i=0;i<response.length;i++){
                    var userId = "<%= request.getSession().getAttribute("LOGIN")%>"
                    var html = '';
                    html += '<div class="col-3 p-2">';
                    html += '<h4 class="pl-4"><i>'+response[i].ROWNUM+'</i></h4>';
                    html += '</div>';
                    html += '<div class="col-6">';
                    html += '<h4 style="font-weight: lighter">'+response[i].MTNM + '</h4>';
                    html += '</div>';
                    html += '<a href="/mountain/'+response[i].MTNM+'.do?userId='+userId+'" class="text-muted col-3">더보기></a>';
                    html += '<hr />'

                    $('#mtRank').append(html);
                }
            },
            error: function(response){
                console.log("error");
            }
        })
    }
</script>
</body>