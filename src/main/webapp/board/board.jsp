<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/common/header.jsp" />
<link rel="stylesheet" type="text/css" href="../resources/css/views/board/board.css">
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

    $(document).ready(function (){
        selectCSBoard(1);
    })

    function selectCSBoard(rowNum){
        $('#boardList').empty()
        $('#pagination').empty()
        selectCSBoardAjax(rowNum);
        pagingInit(rowNum,100);
    }

    // function selectNoticeBoard(rowNum){
    //     $('#boardList').empty()
    //     $('#pagination').empty()
    //     selectNoticeBoardAjax(rowNum);
    //     pagingInit(rowNum);
    // }
    //
    // function selectEventBoard(rowNum){
    //     $('#boardList').empty()
    //     $('#pagination').empty()
    //     selectEventBoardAjax(rowNum);
    //     pagingInit(rowNum)
    // }

    function selectCSBoardAjax(rowNum){
        var data = {
            "rowNum": rowNum,
            "csPostType":100,
        }
        $.ajax({
            type: "GET",
            url: "/board/select.do",
            data: data,
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
    <%--function selectNoticeBoardAjax(rowNum){--%>
    <%--    var data = {--%>
    <%--        "rowNum": rowNum,--%>
    <%--        "csPostType":200,--%>
    <%--    }--%>
    <%--    $.ajax({--%>
    <%--        type: "GET",--%>
    <%--        url: "/board/select.do",--%>
    <%--        data: data,--%>
    <%--        dataType: 'json',--%>
    <%--        contentType: "application/json; charset=utf-8;",--%>
    <%--        success: function (response){--%>
    <%--            // appendList(response);--%>
    <%--            console.log(response)--%>
    <%--        },--%>
    <%--        error: function(response){--%>
    <%--            console.log("error");--%>
    <%--        }--%>
    <%--    })--%>
    <%--}--%>
    <%--function selectEventBoardAjax(rowNum){--%>
    <%--    var data = {--%>
    <%--        "rowNum": rowNum,--%>
    <%--        "csPostType":300,--%>
    <%--    }--%>
    <%--    $.ajax({--%>
    <%--        type: "GET",--%>
    <%--        url: "/board/select.do",--%>
    <%--        data: data,--%>
    <%--        dataType: 'json',--%>
    <%--        contentType: "application/json; charset=utf-8;",--%>
    <%--        success: function (response){--%>
    <%--            // appendList(response);--%>
    <%--            console.log(response)--%>
    <%--        },--%>
    <%--        error: function(response){--%>
    <%--            console.log("error");--%>
    <%--        }--%>
    <%--    })--%>
    <%--}--%>
    function appendList(response){
        var userId = '<%= session.getAttribute("LOGIN")%>';

        var html = '';
        html += '<thead>';
        html += '<tr>';
        html += '<th>번호</th>';
        html += '<th>제목</th>';
        html += '<th>작성 시간</th>';
        html += '</tr>';
        html += '</thead>';

        for(var i=0;i<response.length;i++){

            html += '<tr style="font-size: 20px">';
            html += '<th width="100">'+response[i].RNUM+'</th>';
            html += '<th width="400" style="font-weight: normal"><a href="/board/'+response[i].CSPOSTNUM+'.do?userId='+userId+'" class="text-muted p-0">'+response[i].TITLE+'</a></th>';
            html += '<th width="200" style="font-weight: lighter">'+response[i].CREATEDAT+'</th>';
            html += '</tr>';

        }

        $('#boardList').append(html);
    }

    <%--// 모듈화 시킬 것--%>
    function pagingInit(curPage,csPostType){
        var data = {
            "csPostType":csPostType
        }

        $.ajax({
            type: "GET",
            url: "/board/allCount.do",
            data: data,
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
            html += '<li class="page-item"><a class="page-link" href="#" onclick="selectCSBoard(prevPage)">이전</a></li>';
        }

        for(var i=startPage;i<=endPage;i++){
            if(i==curPage){
                html += '<li class="page-item active"><a class="page-link" href="#" onclick="selectCSBoard('+i+')">'+Math.ceil(i)+'</a></li>';
            }else {
                html += '<li class="page-item"><a class="page-link" href="#" onclick="selectCSBoard('+i+')">'+Math.ceil(i)+'</a></li>';
            }
        }

        if(curPage == pageCnt){
            html += '<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>';
        }else if(curPage < pageCnt){
            html += '<li class="page-item"><a class="page-link" href="#" onclick="selectCSBoard(nextPage)">다음</a></li>';
        }

        $('#pagination').append(html);
    }

</script>
</body>
<jsp:include page="/common/footer.jsp" />