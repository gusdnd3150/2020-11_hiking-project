<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<jsp:include page="/common/header.jsp" />
<link rel="stylesheet" type="text/css" href="/resources/css/views/group/main.css" />
<body class="pt-5 mt-5">
<div class="container">
    <div class="btn-group" role="group" aria-label="...">
        <button type="button" class="btn btn-info" id="group" onclick="goMain1()">등산모임</button>
        <button type="button" class="btn btn-outline-secondary" id="path" onclick="goMain2()">등산로</button>
    </div>
    <button type="button" class="btn btn-dark" id="create" style="float:right;" data-toggle="modal" data-target="#createModal">등산하기</button>
    <p></p>
    <div class="row">
        <h1 class="col-md-8 col-lg-10 mb-0">등산모임 리스트</h1>
        <div class="col-sm-12 col-md-4 col-lg-2 pt-2 pb-2 btn-group btn-group-toggle" data-toggle="buttons">
            <label class="btn btn-outline-secondary active">
                <input type="radio" name="options" id="sort_lately" checked> 최신순
            </label>
            <label class="btn btn-outline-secondary">
                <input type="radio" name="options" id="sort_like"> 인기순
            </label>
        </div>
    </div>
    <div class="responsive">
        <div class="card-list row"></div>
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
                    <button class="btn btn-primary" onclick="create1()">1인</button>
                </div>
                <div class="col-6" style="text-align: center">
                    <img src="../resources/img/select2.png" style="width: 250px; height: 250px; display: block">
                    <button class="btn btn-primary" onclick="create2()">2인이상</button>
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
        $('#sort_lately').click();
    })
    $('#sort_lately').on('click',function (){

        var data = {
            'keyword' : 'lately'
        }

        $.ajax({
            type: "GET",
            url: "/group/sortGroup.do",
            data: data,
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){
                $('.card-list').empty();

                for(var i=0;i<response.length;i++){

                    if(response[i].STATUS == '진행중'){
                        $('.card-list').append(
                            '<div class="pt-3 col-lg-4 col-sm-6" id="groupList">' +
                            '<div class="card border-0" >' +
                            '<a href="/group/'+response[i].GROUPNUM+'">' +
                            '<img class="card-img-top" src="/resources/img/' + response[i].STOREDFILENAME + '" alt="..." style="width:100%" /></a>' +
                            '<div class="card-body row p-1 pl-4">' +
                            '<a href="/profile/'+response[i].ID+'" onclick="window.open(this.href,\'\',\'width=450, height=600\'); return false;">' +
                            '<img src="/resources/img/' + response[i].CONTENT2 + '" class="rounded-circle" style="width: 40px;height: 40px;"></a>' +
                            '<div class="col-10 p-0 pl-2 m-0">' +
                            '<h5 class="card-title m-0" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">'+
                            '<b style="color: limegreen">['+response[i].STATUS+']</b> ' +response[i].NAME +'</h5>' +
                            '<p class="card-text text-muted mb-1" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">'+ response[i].DETAIL +'</p>' +
                            '<p class="text-muted">'+response[i].STARTDAY+' 출발</p>' +
                            '</div></div></div></div>'
                        )
                    }else if(response[i].STATUS == '마감'){
                        $('.card-list').append(
                            '<div class="pt-3 col-lg-4 col-sm-6" id="groupList">' +
                            '<div class="card border-0" >' +
                            '<a href="/group/'+response[i].GROUPNUM+'">' +
                            '<img class="card-img-top" src="/resources/img/' + response[i].STOREDFILENAME + '" alt="..." style="width:100%" /></a>' +
                            '<div class="card-body row p-1 pl-4">' +
                            '<a href="/profile/'+response[i].ID+'" onclick="window.open(this.href,\'\',\'width=450, height=600\'); return false;">' +
                            '<img src="/resources/img/' + response[i].CONTENT2 + '" class="rounded-circle" style="width: 40px;height: 40px;"></a>' +
                            '<div class="col-10 p-0 pl-2 m-0">' +
                            '<h5 class="card-title m-0" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">'+
                            '<b style="color:red">['+response[i].STATUS+']</b> ' +response[i].NAME +'</h5>' +
                            '<p class="card-text text-muted mb-1" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">'+ response[i].DETAIL +'</p>' +
                            '<p class="text-muted">'+response[i].STARTDAY+' 출발</p>' +
                            '</div></div></div></div>'
                        )
                    }
                }
            },
            error: function(response){
                console.log("error");
            }
        })
    });

    $('#sort_like').on('click',function (){

        var data = {
            'keyword' : 'like'
        }

        $.ajax({
            type: "GET",
            url: "/group/sortGroup.do",
            data: data,
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){
                $('.card-list').empty();

                console.log(response)

                for(var i=0;i<response.length;i++){

                    if(response[i].STATUS == '진행중'){
                        $('.card-list').append(
                            '<div class="pt-3 col-lg-4 col-sm-6" id="groupList">' +
                            '<div class="card border-0" >' +
                            '<a href="/group/'+response[i].GROUPNUM+'">' +
                            '<img class="card-img-top" src="/resources/img/' + response[i].STOREDFILENAME + '" alt="..." style="width:100%" /></a>' +
                            '<div class="card-body row p-1 pl-4">' +
                            '<img src="/resources/img/' + response[i].CONTENT2 + '" class="rounded-circle" style="width: 40px;height: 40px; border: 1px solid grey">' +
                            '<div class="col-10 p-0 pl-2 m-0">' +
                            '<h5 class="card-title m-0" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">'+
                            '<b style="color: limegreen">['+response[i].STATUS+']</b> ' +response[i].NAME +'</h5>' +
                            '<p class="card-text text-muted mb-1" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">'+ response[i].DETAIL +'</p>' +
                            '<p class="text-muted">'+response[i].STARTDAY+' 출발</p>' +
                            '</div></div></div></div>'
                        )
                    }else if(response[i].STATUS == '마감'){
                        $('.card-list').append(
                            '<div class="pt-3 col-lg-4 col-sm-6" id="groupList">' +
                            '<div class="card border-0" >' +
                            '<a href="/group/'+response[i].GROUPNUM+'">' +
                            '<img class="card-img-top" src="/resources/img/' + response[i].STOREDFILENAME + '" alt="..." style="width:100%" /></a>' +
                            '<div class="card-body row p-1 pl-4">' +
                            '<img src="/resources/img/' + response[i].CONTENT2 + '" class="rounded-circle" style="width: 40px;height: 40px; border: 1px solid grey">' +
                            '<div class="col-10 p-0 pl-2 m-0">' +
                            '<h5 class="card-title m-0" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">'+
                            '<b style="color:red">['+response[i].STATUS+']</b> ' +response[i].NAME +'</h5>' +
                            '<p class="card-text text-muted mb-1" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">'+ response[i].DETAIL +'</p>' +
                            '<p class="text-muted">'+response[i].STARTDAY+' 출발</p>' +
                            '</div></div></div></div>'
                        )
                    }
                }
            },
            error: function(response){
                console.log("error");
            }
        })
    });
</script>
</body>