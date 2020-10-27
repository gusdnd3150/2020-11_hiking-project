<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/header.jsp" />
<link href="//cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.4.0/css/bootstrap4-toggle.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
<link rel="stylesheet" type="text/css" href="../resources/css/views/group/form.css" />

<body class="pt-5 mt-5" >
<div id="groupForm-container" class="container" >
    <div id="groupForm">
        <h1 class="p-3">다함께 산오르기 등록</h1>
        <div class="col-12">
            <div class="form-inline">
                <input type="text" class="form-control" id="mtNm" placeholder="산/등산로" readonly>
                <button id="setPath" class="btn btn-info ml-1" data-toggle="modal" data-target="#pathModal">검색</button>
            </div>
        </div>
        <div class="col-12 pt-3">
            <input type="text" class="form-control" id="name" placeholder="모임 제목">
        </div>
        <div class="row p-3">
            <div class="col-12">
                <select class="custom-select" id="area">
                    <option value="0" selected>모임 지역</option>
                    <option value="서울">서울</option>
                    <option value="부산">부산</option>
                    <option value="대구">대구</option>
                    <option value="인천">인천</option>
                    <option value="광주">광주</option>
                    <option value="대전">대전</option>
                    <option value="울산">울산</option>
                    <option value="세종">세종</option>
                    <option value="경기">경기</option>
                    <option value="강원">강원</option>
                    <option value="충북">충북</option>
                    <option value="충남">충남</option>
                    <option value="전북">전북</option>
                    <option value="전남">전남</option>
                    <option value="경북">경북</option>
                    <option value="경남">경남</option>
                    <option value="제주">제주</option>
                </select>
                <input id="area-detail"type="text" class="form-control" placeholder="상세 집합 장소를 입력해주세요(선택)">
            </div>
        </div>
        <div class="col-6">
            <input type="text" class="form-control pr-3" id="startDay" placeholder="모임 시작 날짜">
        </div>
        <div class="col-6 p-3">
            <label for="staffMax">출발 인원</label>
            <div class="staff form-inline">
                <i id="decrease" class="fas fa-minus"></i>
                <h2 id="staffMax" class="m-0">2</h2><h2 class="m-0">인 출발</h2>
                <i id="increase"class="fas fa-plus" ></i>
            </div>
        </div>
        <div class="m-3">
            <label for="detail">모임 상세</label>
            <textarea class="form-control" rows="12" id="detail"></textarea><br>
        </div>
        <div class="mb-3 col-12">
            <label for="image">이미지</label>
            <div id="image" class="input_wrap">
                <a href="javascript:" onclick="fileUploadAction();" class="my_button btn btn-light ml-3">파일 업로드</a>
                <form id="filesForm" method="post" enctype="multipart/form-data" style="display: none">
                    <input type="file" accept="image/*" id="uploadFile" name="file" onchange="setPreview(event);" multiple>
                </form>
                <div class="preview pt-3 row">
                </div>
            </div>
        </div>
        <pre></pre>
        <div class="panel-group" id="accordion">
            <div class="panel panel-default">
                <div class="panel-title col-12">
                    상세 조건설정
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
                        <input class="toggle-btn" type="checkbox" data-toggle="toggle" data-onstyle="info" data-size="xs">
                    </a>
                </div>
                <div id="collapse1" class="panel-collapse collapse in">
                    <div class="panel-body">
                        <div class="col-12 p-3">
                            <label for="age">나이</label>
                            <div id="age" class="row col-12">
                                <select class="custom-select col-6" id="ageStart">
                                    <option value="0" selected>최소</option>
                                    <option value="10">10</option>
                                    <option value="20">20</option>
                                    <option value="30">30</option>
                                    <option value="40">40</option>
                                    <option value="50">50</option>
                                    <option value="60">60</option>
                                    <option value="70">70</option>
                                    <option value="80">80</option>
                                </select>
                                <select class="custom-select col-6" id="ageEnd">
                                    <option value="0" selected>최대</option>
                                    <option value="10">10</option>
                                    <option value="20">20</option>
                                    <option value="30">30</option>
                                    <option value="40">40</option>
                                    <option value="50">50</option>
                                    <option value="60">60</option>
                                    <option value="70">70</option>
                                    <option value="80">80</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="mb-3 col-6">
                            <label for="sex">성별</label>
                            <select class="custom-select" id="sex">
                                <option value="무관" selected>무관</option>
                                <option value="남자">남자만</option>
                                <option value="여자">여자만</option>
                            </select>
                        </div>
                    </div>
                    <div class="panel-body">
                        <div class="mb-3 col-9">
                            <label for="connect">산모임에만 공유</label>
                                <div class="form-inline">
                                    <input type="text" class="form-control" id="connectGroupName" placeholder="산모임 이름" readonly>
                                    <input type="text" class="form-control" id="connectGroupNum" placeholder="산모임 번호" hidden>
                                    <button id="connect" class="btn btn-info" data-toggle="modal" data-target="#connectModal">검색</button>
                                </div>
                            </div>
                    </div>
                    <div></div>
                </div>
            </div>
            <div class="p-3" style="text-align: right">
                <input type="reset" class="btn btn-light" style="width: 75px" value="취소">
                <input type="button" class="btn btn-info" id="submit" style="width: 75px" value="등록">
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="pathModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">산/등산로 찾기</h4>
                        <button type="button" class="close" data-dismiss="modal">x</button>
                    </div>
                    <div class="modal-body row">
                        <select class="custom-select col-3 ml-3" id="searchType">
                            <option value="mtnm" selected>산</option>
                            <option value="nmtnm">등산로</option>
                        </select>
                        <input type="text" class="form-control col-6" placeholder="산/등산로 이름 입력" id="mountainName">
                        <button id="searchByMtnm" class="btn btn-info ml-3">검색</button>
                    </div>
                    <ul class="mountainList"></ul>
                </div>

            </div>
        </div>
        <div class="modal fade" id="connectModal" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">나의 산모임 찾기</h4>
                        <button type="button" class="close" data-dismiss="modal">x</button>
                    </div>
                    <div class="modal-body">
                        <ul class="connectGroupList"></ul>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
<script src="//cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.4.0/js/bootstrap4-toggle.min.js"></script>
<script src="../resources/ckeditor5/ckeditor.js"></script>
<script type="text/javascript" src="../resources/js/view/group/searchMt.js"></script>
<script>
    ClassicEditor
        .create( document.querySelector( '#detail' ), {
            removePlugins: ['ImageUpload'],
            heading: {
                options: [
                    { model: 'paragraph', title: '본문', class: 'ck-heading_paragraph' },
                    { model: 'heading1', view: 'h1', title: '제목 1', class: 'ck-heading_heading1' },
                    { model: 'heading2', view: 'h2', title: '제목 2', class: 'ck-heading_heading2' },
                    { model: 'heading3', view: 'h3', title: '제목 3', class: 'ck-heading_heading3' }
                ]
            },
            language: 'ko',
            image: {
                resizeUnit: 'px',
                toolbar: [
                    'imageTextAlternative',
                    'imageStyle:alignLeft',
                    'imageStyle:full',
                    'imageStyle:side'
                ],
                styles: [ 'full','alignLeft','alignRight','side' ]
            },
            table: {
                contentToolbar: [
                    'tableColumn',
                    'tableRow',
                    'mergeTableCells'
                ]
            },
            alignment: {
                options: [ 'left', 'center', 'right']
            }
        } )
        .then( editor => {
            window.editor = editor;

        } )
        .catch( err => {
            console.error( err.stack );
        } );

    function fileUploadAction() {
        $('#uploadFile').trigger('click');
    }

    function setPreview(event){
        for(var image of event.target.files) {
            var reader = new FileReader();

            reader.onload = function (event) {
                var img = document.createElement("img");
                img.setAttribute("src", event.target.result);
                img.setAttribute("class","col-4")
                document.querySelector("div.preview").appendChild(img);
            };
            reader.readAsDataURL(image);
        }
    }
    function selectGroup(e){
        $('#connectGroupName').val(e.parentNode.childNodes[2].textContent)
        $('#connectGroupNum').val(e.parentNode.childNodes[0].textContent)
        $('#connectModal').modal("hide");

    }

    $(document).ready(function () {

        $('#startDay').click(function (){
            $(this).attr({type: 'datetime-local'});
        })

        var staffMax = 2;

        $('#increase').on('click',function (){
            staffMax++;
            $('#staffMax').text(parseInt(staffMax));
            if(staffMax>50) {
                alert("지정 가능한 최대 인원 수를 초과 했습니다.")
                return
            }
        })
        $('#decrease').on('click',function (){
            staffMax--;
            $('#staffMax').text(parseInt(staffMax));
            if(staffMax<2){
                alert("2인 이상 지정해야 합니다")
                staffMax++;
                $('#staffMax').text(parseInt(staffMax));
                return;
            }
        })

        // 추가입력 토글버튼
        $(function () {
            $('.toggle-btn').bootstrapToggle({
                on: 'Enabled',
                off: 'Disabled'
            });
        })
        $('#connect').click(function (e){

            var data = {
                'userId' : '<%= request.getSession().getAttribute("LOGIN")%>'
            }

            $.ajax({
                type: "GET",
                url: "/commu/searchByUserId.do",
                data: data,
                dataType: 'json',
                contentType: "application/json; charset=utf-8;",
                success : function (response){
                    $('.connectGroupList').children().remove()

                    for(var i=0;i<response.length;i++){

                        for(var j=0;j<response[i].length;j++){

                            if(response[i][j].GROUPNUM != 0){
                                var html = '';

                                html += '<li class="row pt-2">';
                                html += '<span style="display: none">'+response[i][j].GROUPNUM+'</span>';
                                html += '<img src="/resources/img/'+response[i][j].STOREDFILENAME+'" style="width: 50px;height: 50px" />';
                                html += '<div class="col-8" style="font-size: 24px">'+response[i][j].NAME+'</div>';
                                html += '<button class="btn btn-outline-secondary col-2" onclick="selectGroup(this)">선택</button>';
                                html += '</li>'

                                $('.connectGroupList').append(html);
                            }
                        }
                    }
                },
                error : function (response){
                    console.log("error")
                }
            })
        })

        $('#submit').click(function (e){
            e.preventDefault();

            var form = $('#filesForm')[0];
            var data = new FormData(form);

            data.append("mtNm",$('#mtNm').val());
            data.append("name",$('#name').val());
            data.append("detail",window.editor.getData()),
            data.append("startDay",$('#startDay').val());
            data.append("area",$('#area').val() + ' ' +$('#area-detail').val());
            data.append("ageStart",$('#ageStart').val());
            data.append("ageEnd",$('#ageEnd').val());
            data.append("sex",$('#sex').val());
            data.append("staffMax",$('#staffMax')[0].innerText);
            data.append("userId","<%= request.getSession().getAttribute("LOGIN")%>");
            data.append("connectGroupNum",$('#connectGroupNum').val());


            $.ajax({
                type: "POST",
                enctype: 'multipart/form-data',
                url: '/group/insert.do',
                data: data,
                processData: false,
                contentType: false,
                cache: false,
                success(response){
                    alert("등록완료")
                    location.href = "/group/result.jsp"
                },
                error(response){
                    alert("등록 오류, 새로고침 후 다시 시도 해주세요")
                }
            })
        })
    })
</script>
</body>
</html>
