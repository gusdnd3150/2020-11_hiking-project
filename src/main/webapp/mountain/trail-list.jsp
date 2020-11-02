<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <h1 class="col-md-7 col-lg-9 mb-0">등산로 리스트</h1>
        <div class="col-sm-12 col-md-5 col-lg-3 pt-2 pb-2 btn-group btn-group-toggle" data-toggle="buttons">
            <label class="btn btn-outline-secondary active">
                <input type="radio" name="options" id="sort_asc" checked> 가나다순
            </label>
            <label class="btn btn-outline-secondary">
                <input type="radio" name="options" id="sort_DFFL"> 난이도별
            </label>
        </div>
    </div>
    <div class="responsive pt-5">
        <table id="trailList"class="table table-hover">
        </table>
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
                <c:choose>
                    <c:when test="${LOGIN ne null}">
                        <div class="col-6">
                            <img src="../resources/img/select1.png" style="width: 250px; height: 250px; display: block;">
                            <button class="btn btn-primary" onclick="create1()">혼자 가기</button>
                        </div>
                        <div class="col-6" style="text-align: center">
                            <img src="../resources/img/select2.png" style="width: 250px; height: 250px; display: block">
                            <button class="btn btn-primary" onclick="create2()">다른사람과 가기</button>
                        </div>
                    </c:when>
                    <c:when test="${LOGIN eq null}">
                        <div class="p-5">
                            <h2>로그인 해주세요</h2>
                            <a class="btn btn-info m-5" href="/user/logInView.do" onclick="this.href">로그인 페이지로</a>
                        </div>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/js/view/group/main.js"></script>
<script>
    selectTrailListSortASC();

    $('#sort_asc').on('click',function (){
        $('#trailList').empty()
        selectTrailListSortASC();
    })

    $('#sort_DFFL').on('click',function (){
        $('#trailList').empty()
        selectTrailListSortDFFL();
    })

    function selectTrailListSortASC(){
        var data = {
            "rowNum": 1,
            "sort":"asc",
        }
        $.ajax({
            type: "POST",
            url: "/trail/list.do",
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){
                appendList(response);
            },
            error: function(response){
                console.log("error");
            }
        })
    }

    function selectTrailListSortDFFL(){
        var data = {
            "rowNum": 1,
            "sort":"dffl",
        }
        $.ajax({
            type: "POST",
            url: "/trail/list.do",
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){
                appendList(response);
            },
            error: function(response){
                console.log("error");
            }
        })
    }

    function appendList(response){
        var userId = '<%= session.getAttribute("LOGIN")%>';

        var html = '';
        html += '<thead>';
        html += '<tr>';
        html += '<th>번호</th>';
        html += '<th>산이름</th>';
        html += '<th>난이도</th>';
        html += '<th>바로가기</th>';
        html += '</tr>';
        html += '</thead>';

        for(var i=0;i<response.length;i++){

            html += '<tr style="font-size: 20px">';
            html += '<th width="80">'+response[i].ROWNUM+'</th>';
            html += '<th width="500"><a href="/trail/'+response[i].MNTN_CODE+'.do?userId='+userId+'" class="text-muted p-0">'+response[i].MNTN_NM+' 등산로 </a></th>';
            if(response[i].PMNTN_DFFL=='쉬움'){
                html += '<th width="100" style="color: green">'+response[i].PMNTN_DFFL+'</th>';
            }else if(response[i].PMNTN_DFFL=='중간'){
                html += '<th width="100" style="color: rgb(247, 222, 2)">'+response[i].PMNTN_DFFL+'</th>';
            }else if(response[i].PMNTN_DFFL=='어려움') {
                html += '<th width="100" style="color: red">'+response[i].PMNTN_DFFL+'</th>';
            }
            html += '<th width="100"><a href="/trail/'+response[i].MNTN_CODE+'.do?userId='+userId+'" class="text-muted p-0">더보기></a></th>';
            html += '</tr>';

        }

        $('#trailList').append(html)
    }
</script>
</body>