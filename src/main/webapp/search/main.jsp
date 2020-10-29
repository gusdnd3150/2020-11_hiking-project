<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/header.jsp" />
<link rel="stylesheet" type="text/css" href="../resources/css/views/home.css">
<body class="container pt-5">
    <div class="pt-5">
        <h1>상세 검색</h1>
        <div class="pt-3">
            <div class="form-inline">
                <input id="keyword" type="text" class="form-control col-3" placeholder="검색어를 입력해주세요">
                <button class="btn btn-info" onclick="search()">검색</button>
                <a class="btn btn-light" data-toggle="collapse" href="#searchCondition" role="button" aria-expanded="false" aria-controls="collapseExample">
                    상세 검색
                </a>
            </div>
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
            <div id="mtList">
                <h2>산 리스트</h2>
                <div id="mtResult"></div>
            </div>
            <div id="pathList">
                <h2>등산로 리스트</h2>
                <div id="pathResult"></div>
            </div>
            <div class="pt-3">
                <label for="groupResult">
                    <h2>등산 모임</h2>
                    <i id="groupCount"></i>
                </label>
                <div id="groupResult" class="row"></div>
            </div>
            <div id="moimList">
                <h2>산모임 리스트</h2>
                <i id="moimCount"></i>
                <div id="moimResult"></div>
            </div>
        </div>
    </div>
    <!-- 쇼핑몰 상품 추천 (랜덤) -->
<%--    <div class="text-center" style="width:100%; height: 200px; display: flex;justify-content: center;flex-direction: column">--%>
<%--        <p>결과가 없습니다</p>--%>
<%--    </div>--%>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
<script>
    function search(){

        var keyword = $('#keyword').val();

        if(keyword == '' || keyword == null){
            alert('검색어를 입력해주세요');
            return
        }

        var typeCount1 = 0;
        var typeCount2 = 0;

        $('#resultList').css('display','block');

        $('#groupCount').empty();
        $('#moimCount').empty();

        $('#groupResult').empty();
        $('#moimResult').empty();

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
                console.log("success")
                console.log(response)
                if(response.groupList.length != 0){
                    appendGroupList(response.groupList)
                }else{
                    $('#groupCount').text('총 '+typeCount1+' 건의 검색결과')
                    $('#moimCount').text('총 '+typeCount2+' 건의 검색결과')
                }
            },
            error: function(response){
                console.log("error");
            }
        })
    }

    function appendGroupList(data){
        console.log(data)
        var typeCount1 = 0;
        var typeCount2 = 0;

        for(var i=0;i<data.length;i++){

            var editorContent = data[i].DETAIL;
            var covertContent = editorContent.replace(/(<([^>]+)>)/ig,"");

            if(data[i].TYPE == 1){

                typeCount1++;

                var html = '';

                html += '<div class="col-md-6">'
                html += '<a href="/group/' + data[i].GROUPNUM + '">';
                html += '<div class="media" style=" padding: 10px 10px;">';
                html += '<img src="/resources/img/'+data[i].STOREDFILENAME+'" style="width: 120px; height: 100px;" class="rounded mr-3" alt="...">'
                html += '<div class="media-body" class="col-md-6">';
                html += '<a href="/profile/' + data[i].ID + '" onclick=\"window.open(this.href,\'\',\'width=500, height=600\'); return false;">';
                html += '<img src="/resources/img/' + data[i].CONTENT2 + '" class="rounded" style="width: 40px;height: 40px;">';
                html += '<span style="color: black">'+data[i].NICKNAME+'</span>'
                html += '</a>';
                html += '<h6 class="mt-0 mb-1">';
                html += '<strong>'+data[i].NAME+'</strong>';
                html += '</h6>';
                html += '<small class="card-text text-mute" style="display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis">'+covertContent+'</small>';
                html += '[' + data[i].STATUS + ']</span>';
                html += '</div></div></a>';

                if (data[i].STATUS == '모집중') {
                    html += '<span style="color: limegreen">';
                } else if (data[i].STATUS == '마감') {
                    html += '<span style="color: red">';
                }

                $('#groupCount').text('총 '+typeCount1+' 건의 검색결과')
                $('#groupResult').append(html);

            }else if(data[i].TYPE == 2){
                typeCount2++;

                var html2 = '';

                html2 += '<a href="/commu/commuPageView.do?groupNum=' + data[i].GROUPNUM + '" style=" color: black;">';
                html2 += '<div class="media" style=" padding: 10px 10px;">';
                html2 += '<img src="/resources/img/'+data[i].STOREDFILENAME+'" style="width: 120px; height: 100px;" class="rounded mr-3" alt="...">'
                html2 += '<div class="media-body" style="width:100px;">';
                html2 += '<h6 class="mt-0 mb-1">';
                html2 += '<strong>'+data[i].NAME+'</strong>';
                html2 += '</h6>';
                html2 += '<small class="card-text text-mute" style="display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis">'+covertContent+'</small>';
                html2 += '<small style="color: gray;">멤버'+ data[i].STAFFCURRENT +'/ 지역 '+ data[i].AREA+ '</small>';
                html2 += '</div></div></a>';

                $('#moimCount').text('총 '+typeCount2+' 건의 검색결과')
                $('#moimResult').append(html2)
            }
        }
    }
</script>
</body>
<jsp:include page="/common/footer.jsp" />

