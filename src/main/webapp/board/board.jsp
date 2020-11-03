<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/common/header.jsp" />
<body class="container pt-5">
<div class="pt-5">
    <h1>고객센터 게시판</h1>
</div>
<div class="p-3">
    <button id="csBoardBtn"class="btn btn-info">고객센터</button>
    <button id="noticeBoardBtn" class="btn btn-outline-secondary">공지사항</button>
    <button id="eventBoardBtn" class="btn btn-outline-secondary">이벤트</button>
</div>
<div class="responsive">
    <table id="boardList"class="table table-hover">
    </table>
    <div id="pagination"></div>
</div>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/js/view/group/main.js"></script>
<script>

    var type = '';
    sortASC(1);

    function CS(){
        $('#trailList').empty()
        $('#pagination').empty()
        selectTrailListSortASC(rowNum);
        type = 'asc';
        pagingInit(rowNum);
    }

    function sortCS(rowNum){
        $('#trailList').empty()
        $('#pagination').empty()
        selectTrailListSort(rowNum);
        type = 'dffl';
        pagingInit(rowNum);
    }

    function selectTrailListSortASC(rowNum){
        var data = {
            "rowNum": rowNum,
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

    function selectTrailListSortDFFL(rowNum){
        var data = {
            "rowNum": rowNum,
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
            html += '<th width="80">'+response[i].RNUM+'</th>';
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

        $('#trailList').append(html);
    }

    // 모듈화 시킬 것
    function pagingInit(curPage){
        $.ajax({
            type: "GET",
            url: "/trail/allCount.do",
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){
                paging(response, curPage);
            },
            error: function(response){
                console.log("error");
            }
        })
    }

    var rangeSize = 10; // 10개씩 뿌릴거임
    var curRange;
    var startPage;
    var endPage;
    var pageCnt;
    var rangeCnt;
    var prevPage;
    var nextPage;

    function paging(listCnt, curPage){
        pageCnt = Math.ceil((listCnt*1)/10);
        rangeCnt = Math.ceil((pageCnt*1)/rangeSize);
        setRange(curPage);
    }

    function setRange(curPage){
        curRange = Math.floor((curPage-1)/rangeSize)+1;
        startPage = ((curRange-1)*rangeSize)+1;
        endPage = startPage + rangeSize - 1;

        if(endPage > pageCnt){
            endPage = pageCnt;
        }

        prevPage = curPage - 1;
        nextPage = curPage + 1;

        var html = '';

        html += '<nav aria-label="Page navigation example">';
        html += '<ul class="pagination justify-content-center text-info">';

        if(curPage == 1){
            html += '<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>';
        }else {
            if(type=='asc') {
                html += '<li class="page-item"><a class="page-link" href="#" onclick="sortASC(prevPage)">이전</a></li>';
            }else if(type=='dffl'){
                html += '<li class="page-item"><a class="page-link" href="#" onclick="sortDFFL(prevPage)">이전</a></li>';
            }
        }

        for(var i=startPage;i<=endPage;i++){
            if(type=='asc'){
                if(i==curPage){
                    html += '<li class="page-item active"><a class="page-link" href="#" onclick="sortASC('+i+')">'+Math.ceil(i)+'</a></li>';
                }else {
                    html += '<li class="page-item"><a class="page-link" href="#" onclick="sortASC('+i+')">'+Math.ceil(i)+'</a></li>';
                }
            }else if(type=='dffl'){
                if(i==curPage){
                    html += '<li class="page-item active"><a class="page-link" href="#" onclick="sortDFFL('+i+')">'+Math.ceil(i)+'</a></li>';
                }else {
                    html += '<li class="page-item"><a class="page-link" href="#" onclick="sortDFFL('+i+')">'+Math.ceil(i)+'</a></li>';
                }
            }
        }

        if(curPage == pageCnt){
            html += '<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>';
        }else if(curPage < pageCnt){
            if(type=='asc'){
                html += '<li class="page-item"><a class="page-link" href="#" onclick="sortASC(nextPage)">다음</a></li>';
            }else if(type=='dffl'){
                html += '<li class="page-item"><a class="page-link" href="#" onclick="sortDFFL(nextPage)">다음</a></li>';
            }
        }

        $('#pagination').append(html);
    }

</script>
</body>
</html>