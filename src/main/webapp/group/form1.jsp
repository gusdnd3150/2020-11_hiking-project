<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/header.jsp" />
<link href="//cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.4.0/css/bootstrap4-toggle.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
<link rel="stylesheet" type="text/css" href="../resources/css/views/group/form.css" />

<body class="pt-5 mt-5" >
<div id="groupForm-container" class="container" >
    <div id="groupForm">
        <h1 class="p-3 col-12">혼자 산오르기 등록</h1>
        <pre></pre>
        <div class="mb-3 col-12">
            <label for="mtNm">산/등산로 설정</label>
            <div class="mb-3">
                <input type="text" class="form-control mb-3" id="mtNm" readonly>
                <button id="setPath" class="btn btn-info mb-3" data-toggle="modal" data-target="#pathModal">등산로 설정</button>
            </div>
        </div>
        <div class="mb-3 col-12">
            <label for="name">모임 제목</label>
            <input type="text" class="form-control" id="name">
        </div>
        <div class="mb-3 col-12">
            <label for="detail">모임 상세</label>
            <textarea class="form-control" rows="6" id="detail" placeholder="최대 4000자까지 가능합니다"></textarea><br>
        </div>
        <div class="mb-3 col-6" >
            <label for="startDay">모임 시작 날짜</label>
            <input type="date" class="form-control" id="startDay">
        </div>
        <div class="mb-3 col-6">
            <label for="area">집합 지역</label>
            <select class="custom-select" id="area">
                <option value="0" selected>지역을 선택해주세요</option>
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
                    상세 설정
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
                        <input class="toggle-btn" type="checkbox" data-toggle="toggle" data-onstyle="info" data-size="xs">
                    </a>
                </div>
                <div id="collapse1" class="panel-collapse collapse in">
                    <div class="panel-body">
                        <div class="mb-3 col-6">
                            <pre></pre>
                            <label for="age">나이대 설정</label>
                            <div id="age">
                                <select class="custom-select" id="ageStart">
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
                                <select class="custom-select" id="ageEnd">
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
                                <option value="무관" selected>성별</option>
                                <option value="남자">남자</option>
                                <option value="여자">여자</option>
                            </select>
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
                        <h4 class="modal-title">등산로 설정하기</h4>
                        <button type="button" class="close" data-dismiss="modal">x</button>
                    </div>
                    <div class="modal-body row">
                        <input type="text" class="form-control ml-3 col-6" placeholder="산/등산로 이름 입력" id="mountainName">
                        <button id="searchByMtnm" class="btn btn-info">검색</button>
                    </div>
                    <div class="modal-content">
                        <ul class="mountainList"></ul>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
<script src="//cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.4.0/js/bootstrap4-toggle.min.js"></script>
<script type="text/javascript" src="../resources/js/view/group/searchMt.js"></script>
<script>
    ClassicEditor
        .create( document.querySelector( '#detail' ), {
            extraPlugins: [MyCustomUploadAdapterPlugin],
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
                ImageCaption: {

                },
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
            ckfinder: {
                options: {
                    uploadUrl: '/after/uploadImage.do'
                }
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


    $(document).ready(function () {
        // 추가입력 토글버튼
        $(function () {
            $('.toggle-btn').bootstrapToggle({
                on: 'Enabled',
                off: 'Disabled'
            });
        })

        $('#submit').click(function (e){
            e.preventDefault();

            var form = $('#filesForm')[0];
            var data = new FormData(form);

            data.append("mtNm",$('#mtNm').val());
            data.append("name",$('#name').val());
            data.append("detail",$('#detail').val());
            data.append("startDay",$('#startDay').val());
            data.append("area",$('#area').val());
            data.append("ageStart",$('#ageStart').val());
            data.append("ageEnd",$('#ageEnd').val());
            data.append("sex",$('#sex').val());
            data.append("staffMax",1);
            data.append("userId","<%= request.getSession().getAttribute("LOGIN")%>")

            $.ajax({
                type: "POST",
                enctype: 'multipart/form-data',
                url: '/group/insert.do',
                data: data,
                processData: false,
                contentType: false,
                cache: false,
                success(response){
                    alert("등록 성공")
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
