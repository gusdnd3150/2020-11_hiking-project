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
    <div id="result"></div>
<%--    <div class="text-center" style="height: 150px">--%>
<%--        <p class="text-muted">더 이상 모임이 없습니다</p>--%>
<%--    </div>--%>
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
    var loading = true;
    var rowNum = 2;
    var keyword = '';

    $(document).ready(function (){
        $('#sort_lately').click();
    })
    $(document).scroll(function (){
        var curHeight = $(window).height() + $(window).scrollTop();
        var docHeight = $(document).height();

        console.log(curHeight)
        console.log(docHeight)

        if (curHeight > docHeight-1) {

            setTimeout(function (){
                loadingImage();

                setTimeout(function (){
                    if(loading){
                        sortList(keyword,rowNum)
                        rowNum += 1;
                        closeLoading();
                    }else{
                        $(document).removeEventListener('scroll',function(){
                            closeLoading();
                            loadingEndImage();
                        })
                    }
                },3000)

            },1000)
        }
    })

    $('#sort_lately').on('click',function (){
        $('.card-list').empty();

        keyword = 'lately';
        var rowNum = 1;

        sortList(keyword, rowNum);
    });

    $('#sort_like').on('click',function (){
        $('.card-list').empty();

        keyword = 'like';
        var rowNum = 1;

        sortList(keyword, rowNum);
    });
    var isEnd = false;

    function sortList(keyword, rowNum){
        var data = {
            'keyword' : keyword,
            'rowNum' : rowNum
        }
        $.ajax({
            type: "POST",
            url: "/group/sortGroup.do",
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){
                console.log(response)
                appendSortList(response);
                if(response.length==0){
                    loading = false;
                    closeLoading();
                    loadingEndImage();
                }
            },
            error: function(response){
                console.log("error");
            }
        })
    };

    function appendSortList(response){
        for(var i=0;i<response.length;i++){

            var editorContent = response[i].DETAIL;
            var covertContent = editorContent.replace(/(<([^>]+)>)/ig,"");

            var status1 =  '<div class="pt-3 col-lg-4 col-sm-6" id="groupList">' +
                            '<div class="card border-0" >' +
                            '<a href="/group/'+response[i].GROUPNUM+'">' +
                            '<img class="card-img-top" src="/resources/img/' + response[i].STOREDFILENAME + '" alt="..." style="width:100%" /></a>' +
                            '<div class="card-body row p-1 pl-4">' +
                            '<img src="/resources/img/' + response[i].CONTENT2 + '" class="rounded-circle" style="width: 40px;height: 40px; border: 1px solid grey">' +
                            '<div class="col-10 p-0 pl-2 m-0">' +
                            '<h5 class="card-title m-0" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">'+
                            '<span style="color: limegreen">['+response[i].STATUS+']</span> ' +response[i].NAME +'</h5>' +
                            '<p class="card-text text-muted text- mb-1" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">'+ covertContent +'</p>' +
                            '<p class="m-0 text-muted">'+response[i].STARTDAY+' 출발</p>' +
                            '</div></div></div></div>';

            var status2 = '<div class="pt-3 col-lg-4 col-sm-6" id="groupList">' +
                            '<div class="card border-0" >' +
                            '<a href="/group/'+response[i].GROUPNUM+'">' +
                            '<img class="card-img-top" src="/resources/img/' + response[i].STOREDFILENAME + '" alt="..." style="width:100%" /></a>' +
                            '<div class="card-body row p-1 pl-4">' +
                            '<img src="/resources/img/' + response[i].CONTENT2 + '" class="rounded-circle" style="width: 40px;height: 40px; border: 1px solid grey">' +
                            '<div class="col-10 p-0 pl-2 m-0">' +
                            '<h5 class="card-title m-0" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">'+
                            '<span style="color:red">['+response[i].STATUS+']</span> ' +response[i].NAME +'</h5>' +
                            '<p class="card-text text-muted mb-1" style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">'+ covertContent +'</p>' +
                            '<p class="m-0 text-muted">'+response[i].STARTDAY+' 출발</p>' +
                            '</div></div></div></div>';

            if(response[i].STATUS == '진행중'){
                $('.card-list').append(status1);
            }else if(response[i].STATUS == '마감'){
                $('.card-list').append(status2)
            }
        }
    }

    function loadingImage() {
        var loadingImg ='';

        loadingImg +="<div id='loadingImg' class='pt-5' style='width: 100%'>";
        loadingImg +="<img src='/resources/img/loading.gif' style='position: relative; margin: 0px auto;display: block'/>";
        loadingImg +="</div>";

        $('#result').append(loadingImg);

    }

    function closeLoading() {
        $('#loadingImg').remove();
    }

    function loadingEndImage() {
        $('#result').append('<div class="text-center">더이상 결과가 없습니다</div>')
    }

</script>
</body>
<jsp:include page="/common/footer.jsp" />