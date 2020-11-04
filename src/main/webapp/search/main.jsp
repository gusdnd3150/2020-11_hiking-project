<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/header.jsp" />
<link rel="stylesheet" type="text/css" href="../resources/css/views/search/main.css">
<body class="container pt-5">
    <div class="pt-5">
        <h1>통합 검색</h1>
        <div class="pt-3">
            <div class="form-inline">
                <input id="keyword" type="text" class="form-control col-3" placeholder="검색어를 입력해주세요">
                <button class="btn btn-info" onclick="search()">검색</button>
                <a class="btn btn-light" data-toggle="collapse" href="#searchCondition" role="button" aria-expanded="false" aria-controls="collapseExample">
                    조건 검색
                </a>
            </div>
            <div id="suggestion" class="col-3"></div>
            <ul id="keywordRank" class="p-1"></ul>
            <div class="collapse" id="searchCondition">
                <div class="row card-body">
                    <div class="col-4">
                        <h4>유형</h4>
                        <select id="type" style="width: 100%">
                            <option value="none">무관</option>
                            <option value="mt">산</option>
                            <option value="path">등산로</option>
                            <option value="group">등산모임</option>
                            <option value="moim">산모임</option>
                        </select>
                    </div>
                    <div class="col-4">
                        <h4>기간</h4>
                        <select id="period" style="width: 100%">
                            <option value="none">무관</option>
                            <option value="hour">최근 1시간</option>
                            <option value="day">최근 1일</option>
                            <option value="week">최근 1주일</option>
                            <option value="month">최근 1달</option>
                        </select>
                    </div>
                    <div class="col-4">
                        <h4>정렬</h4>
                        <select id="sort" style="width: 100%">
                            <option value="none">무관</option>
                            <option value="new">최근 순</option>
                            <option value="old">오래된 순</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
        <hr />
        <div id="resultList" style="display: none"><!-- result List 버튼 누르기 전까지 style none -->
            <h2 id="result"></h2>
            <hr />
            <div id="mtBoard" class="mt-3">
                <label for="mtList">
                    <h2>산</h2>
                    <i id="mtCount"></i>
                </label>
                <div id="mtList" class="row"></div>
            </div>
            <hr />
            <div id="trailBoard" class="mt-3">
                <label for="trailList">
                    <h2>등산로</h2>
                    <i id="trailCount"></i>
                </label>
                <div id="trailList" class="row"></div>
            </div>
            <hr />
            <div id="groupBoard" class="mt-3">
                <label for="groupList">
                    <h2>등산 모임</h2>
                    <i id="groupCount"></i>
                </label>
                <div id="groupList" class="row"></div>
            </div>
            <hr />
            <div id="moimBoard" class="mt-3">
                <label for="moimList">
                    <h2>산모임</h2>
                    <i id="moimCount"></i>
                </label>
                <div id="moimList" class="row"></div>
            </div>
            <hr />
        </div>
    </div>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function (){
        keywordRank();
        ticker();
        tickerover();
    })
    function ticker(){
        timer = setTimeout(function (){
            $('#keywordRank li:first').animate({marginTop: '-20px'}, 400, function (){
                $(this).detach().appendTo('ul#keywordRank').removeAttr('style');
            });
            ticker();
        },2000);
    }

    function tickerover(){
        $('#keywordRank').mouseover(function (){
            clearTimeout(timer);
        });
        $('#keywordRank').mouseout(function (){
            ticker();
        })
    }
    $(function () {
        $('#keyword').keyup(function () {

            if($('#keyword').val()==''){
                return;
            }

            var data = {
                "keyword": $('#keyword').val()
            }

            $.ajax({
                type: "GET",
                url: "/search/suggestion.do",
                data: data,
                dataType: 'json',
                contentType: "application/json; charset=utf-8;",
                minLength: 1,
                success:function (response){
                    $('#suggestion').empty();
                    for(var i=0;i<response.length;i++){
                        var html = '';
                        html += '<li class="suggestKeyword pl-1" onclick="setKeyword(this)">'+response[i].NAME+'</li>'
                        $('#suggestion').append(html)
                    }
                },
                error:function (response){
                    console.log("error")
                }
            })
        })
    })

    function keywordRank(){
        $.ajax({
            type: "GET",
            url: "/search/rank.do",
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){
                for(var i=0;i<response.length;i++){
                    var html = '';

                    html += '<li>';
                    html += '<span style="color: lightseagreen">'+ (i+1) + '</span>'+ ' ';
                    html += '<a onclick="quickSearch(\''+response[i].KEYWORD+'\')">'+response[i].KEYWORD + '</a>';
                    html += '</li>';
                    $('#keywordRank').append(html)
                }
            },
            error: function (response){
                console.log("error")
            }
        })
    }
    function quickSearch(data){
        $('#keyword').val(data);
        search();
    }
    function setKeyword(e){
        $('#keyword').val(e.innerText);
        search();
    }

    function search(){

        var keyword = $('#keyword').val();

        if(keyword == '' || keyword == null){
            alert('검색어를 입력해주세요');
            return
        }else if(keyword == '산'){
            alert('검색할 수 없는 검색어 입니다')
        }

        $('#resultList').css('display','block');

        $('#suggestion').empty()

        $('#result').empty();
        $('#mtCount').empty();
        $('#trailCount').empty();
        $('#groupCount').empty();
        $('#moimCount').empty();

        $('#mtList').empty();
        $('#trailList').empty();
        $('#groupList').empty();
        $('#moimList').empty();

        var data = {
            "type" : $('#type').val(),
            "period" : $('#period').val(),
            "sort" : $('#sort').val(),
            "keyword" : keyword
        }
        $.ajax({
            type: "GET",
            url: "/search.do",
            data: data,
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){
                if(response.length != 0){
                    appendGroupList(response)
                }
            },
            error: function(response){
                console.log("error");
            }
        })
    }

    function appendGroupList(data) {
        console.log(data)
        var userId = '${LOGIN}';


        if (data.mountainList.length != 0) {
            for(var i = 0; i < data.mountainList.length; i++){
                var mountainInfo = data.mountainList[i];

                var html = '';

                html += '<a href="/mountain/'+ mountainInfo.mntnm +'.do?userId=' + userId + '" class="col-6" style="color: black;">';
                html += '<h3>'+mountainInfo.mntnm+'</h3>';
                html += '<div>'+mountainInfo.subnm+'</div>';
                html += '<div style="color: gray;">'+ mountainInfo.areanm +'</div>';
                html += '</a>';
                html += '<hr />';
                $('#mtList').append(html)
            }
        }

        if(data.trailList.length != 0){
            for(var i = 0; i < data.trailList.length; i++){
                var trailInfo = data.trailList[i];

                var html = '';
                html += '<a href="/trail/'+ trailInfo.MNTN_CODE +'.do?userId=' + userId + '" class="col-6" style="text-decoration:none; color: black;">';
                html += '<h3>'+trailInfo.MNTN_NM+' - '+trailInfo.PMNTN_NM+'</h3>'
                html += '<div style="color:gray">'+trailInfo.PMNTN_DFFL+'</div>'
                html += '</a>'

                $('#trailList').append(html)
            }
        }

        if(data.groupList.length != 0){
            for(var i = 0; i < data.groupList.length; i++){
                var groupInfo = data.groupList[i];

                var detail = groupInfo.DETAIL;
                var convertDetail = detail.replace(/(<([^>]+)>)/ig,"");

                var html = '';

                html += '<div class="col-sm-12 col-md-6 col-lg-6 mt-2">'
                html += '<a href="/group/' + groupInfo.GROUPNUM + '" style="text-decoration: none;color: black">';
                html += '<div class="media">';
                html += '<img src="/resources/img/'+groupInfo.STOREDFILENAME+'" style="width: 120px; height: 100px;" class="rounded" alt="...">'
                html += '<div class="media-body" class="col-6">';
                html += '<div class="col-12" style="height: 100px">';
                html += '<h3 style="width:200px; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis">';
                html += groupInfo.NAME;
                html += '</h3>';
                html += '<div class="text-muted" style="width:250px; display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis">'+convertDetail+'</div>';
                html += '<span class="align-self-end">[' + groupInfo.STATUS + ']</span>';
                html += '</div></div></div></a>';

                if (groupInfo.STATUS == '모집중') {
                    html += '<span style="color: limegreen">';
                } else if (groupInfo.STATUS == '마감') {
                    html += '<span style="color: red">';
                }

                $('#groupList').append(html);

            }
        }

        if(data.moimList.length != 0){

            for(var i=0; i<data.moimList.length;i++){

                var moimInfo = data.moimList[i];

                var html = '';

                html += '<a href="/commu/commuPageView.do?groupNum=' + moimInfo.GROUPNUM + '" style=" color: black;">';
                html += '<div class="media" style=" padding: 10px 10px;">';
                html += '<img src="/resources/img/'+moimInfo.STOREDFILENAME+'" style="width: 120px; height: 100px;" class="rounded mr-3" alt="...">'
                html += '<div class="media-body" style="width:100px;">';
                html += '<h6 class="mt-0 mb-1">';
                html += '<strong>'+moimInfo.NAME+'</strong>';
                html += '</h6>';
                html += '<small class="card-text text-mute" style="display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis">'+moimInfo.DETAIL+'</small>';
                html += '<small style="color: gray;">멤버'+ moimInfo.STAFFCURRENT +'/ 지역 '+ moimInfo.AREA+ '</small>';
                html += '</div></div></a>';

                $('#moimList').append(html)
            }
        }
        $('#mtCount').text('총 '+ data.mountainList.length +' 건의 검색결과');
        $('#trailCount').text('총 '+ data.trailList.length +' 건의 검색결과');
        $('#groupCount').text('총 '+ data.groupList.length +' 건의 검색결과');
        $('#moimCount').text('총 '+ data.moimList.length +' 건의 검색결과');

        var allCount = data.mountainList.length + data.trailList.length + data.groupList.length + data.moimList.length;
        $('#result').append('전체 <i>'+ allCount + '</i> 건의 검색결과')
    }
</script>
</body>
<jsp:include page="/common/footer.jsp" />

