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
            <input id="searchKeyword" type="text" class="col-8" placeholder="산이름 간편검색">
            <button class="btn btn-info col-4" onclick="searchMtnm()">검색</button>
        </div>
    </div>
    <div class="responsive">
        <div class="row">
            <i id="timeNow" class="col-12"></i>
            <div class="col-sm-12 col-md-8 p-4">
                <div id="trailRankBoard" class="row m-0">
                    <div id="trailRankHigh" class="col-sm-12 col-md-6 m-0" style="border-right: 1px solid lightgrey">
                        <p>1 ~ 10위</p>
                    </div>
                    <div id="trailRankLow" class="col-sm-12 col-md-6 m-0" style="height: 30%">
                        <p>11 ~ 20위</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-4">
                <h2>주간 산 순위</h2>
                <div id="mtRankBoard" class="row m-0"></div>
            </div>
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
        trailRank();

        let today = new Date();
        let today_result = date_to_str(today);
        $('#timeNow').text('조회 기준 : ' + lastWeek() +' ~ '+ today_result.toLocaleString())

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

        if(keyword == '' || keyword == null){
            alert('검색어를 입력해주세요');
            return;
        }
        location.href = "/mountain/"+keyword+".do?userId="+userId+"";

    }


    // css 수정 요망
    function mtRank(){

        $.ajax({
            type: "GET",
            url: "/mountain/rank.do",
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){

                for(var i=0;i<response.length;i++){

                    var html = '';
                    html += '<div class="form-inline col-12 m-0">';
                    html += '<h4 class="col-2"><i>'+(i+1)+'</i></h4>';
                    html += '<div class="col-4 pr-0">';
                    html += '<h5 style="font-weight: lighter">'+response[i].MTNM + '</h5>';
                    html += '</div>';
                    html += '<div class="col-3 p-0">';

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
                    html += '<a href="/mountain/'+response[i].MTNM+'.do?userId='+userId+'" class="text-muted text-right col-3 p-0">더보기></a>';
                    html += '</div>';

                    $('#mtRankBoard').append(html);
                }
            },
            error: function(response){
                console.log("error");
            }
        })
    }

    // 작성중
    function trailRank(){
        $.ajax({
            type: "GET",
            url: "/mountain/trail/rank.do",
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){
                console.log(response)

                for(var i=0;i<10;i++){
                    var html = '';

                    html += '<li class="form-inline col-12 pl-0 pr-0">';
                    html += '<h4 class="col-2"><i>'+(i+1)+'</i></h4>';
                    html += '<div class="col-7 pr-0">';
                    html += '<h5 style="font-weight: lighter">'+response[i].PMNTN_NM + '</h5>';
                    html += '</div>';
                    html += '<a href="/trail/'+response[i].MNTN_CODE+'.do?FID='+response[i].FID+'&userId='+userId+'" class="text-muted text-right col-3 p-0">더보기></a>';
                    html += '<hr />'

                    $('#trailRankHigh').append(html)

                }

                for(var i=10;i<20;i++){
                    var html = '';

                    html += '<li class="form-inline col-12 pl-0 pr-0">';
                    html += '<h4 class="col-2"><i>'+(i+1)+'</i></h4>';
                    html += '<div class="col-7 pr-0">';
                    html += '<h5 style="font-weight: lighter">'+response[i].PMNTN_NM + '</h5>';
                    html += '</div>';
                    html += '<a href="/trail/'+response[i].MNTN_CODE+'.do?FID='+response[i].FID+'&userId='+userId+'" class="text-muted text-right col-3 p-0">더보기></a>';
                    html += '<hr />'

                    $('#trailRankLow').append(html)

                }
            },
            error: function(response){
                console.log("error");
            }
        })
    }
</script>
</body>