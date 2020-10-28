<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<jsp:include page="/common/header.jsp" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/css/views/group/main.css" />
<body class="pt-5 mt-5">
<div class="container">
    <div class="btn-group" role="group" aria-label="...">
        <button type="button" class="btn btn-outline-secondary" id="group" onclick="goMain1()">등산모임</button>
        <button type="button" class="btn btn-info" id="path" onclick="goMain2()">등산로</button>
    </div>
    <button type="button" class="btn btn-dark" id="create" style="float:right;" data-toggle="modal" data-target="#createModal">등산하기</button>
    <p></p>
    <div class="row">
        <h1 class="col-md-6 col-lg-9 mb-0">등산로 리스트</h1>
        <div class="col-md-6 col-lg-3 pt-2 pb-2 btn-group btn-group-toggle" data-toggle="buttons">
            <input id="searchKeyword" type="text" class="col-8" placeholder="산/등산로">
            <button class="btn btn-info col-4" onclick="searchMtnm()">검색</button>
        </div>
    </div>
    <div class="responsive">
        <div class="row">
            <i id="timeNow" class="col-md-12"></i>
            <div class="col-sm-12 col-md-6 pt-5 p-3">
                <div>
                    <h2>주간 산 순위</h2>
                </div>
                <div id="mtRank" class="form-inline"></div>
            </div>
            <div class="col-sm-12 col-md-6 pt-5 p-3">
                <h2>주간 등산로 순위</h2>
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

    var userId = "<%= request.getSession().getAttribute("LOGIN")%>"

    $(document).ready(function (){
        mtRank();

        let today = new Date();
        let today_result = date_to_str(today);
        $('#timeNow').text('조회 기준 : ' + lastWeek() +' ~ '+ today_result.toLocaleString())

        console.log()

        setInterval(function (){
            $('#timeNow').text(today_result.toLocaleString())
            location.reload();
        },58000)
    })

    function lastWeek(){
        var d = new Date();
        var dayOfMonth = d.getDate();
        d.setDate(dayOfMonth-7);
        return date_to_str(d);
    }

    function date_to_str(format) {
        var year = format.getFullYear();
        var month = format.getMonth() + 1;
        if(month<10) month = '0' + month;
        var date = format.getDate();
        if(date<10) date = '0' + date;
        var hour = format.getHours();
        if(hour<10) hour = '0' + hour;
        var min = format.getMinutes();
        if(min<10) min = '0' + min;
        var sec = format.getSeconds();
        if(sec<10) sec = '0' + sec;
        return +year + "-" + month + "-" + date + " " + hour + ":" + min;
    }


    function searchMtnm(){
        var keyword = $('#searchKeyword').val()
        var userId = "<%= request.getSession().getAttribute("LOGIN")%>";

        location.href = "/mountain/"+keyword+".do?userId="+userId+"";

    }

    function mtRank(){

        $.ajax({
            type: "GET",
            url: "/mountain/rank.do",
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){
                for(var i=0;i<response.length;i++){
                    var html = '';
                    html += '<div class="col-3 p-2">';
                    html += '<h4 class="pl-4"><i>'+(i+1)+'</i></h4>';
                    html += '</div>';
                    html += '<div class="col-3">';
                    html += '<h4 style="font-weight: lighter">'+response[i].MTNM + '</h4>';
                    html += '</div>';
                    html += '<div class="col-3">';
                    if(response[i].CHANGERANK == 0){
                        html += '<i class="fas fa-minus"></i>';
                    }else if(response[i].CHANGERANK == -999){
                        html += '<span class="badge badge-success">New</span>'
                    }else if(response[i].CHANGERANK > 0){
                        html += '<i class="fas fa-angle-up pl-1" style="color: green">'+response[i].CHANGERANK+'</i>';
                    }else if(response[i].CHANGERANK < 0){
                        html += '<i class="fas fa-chevron-down pl-1" style="color: red">'+response[i].CHANGERANK+'</i>';
                    }
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