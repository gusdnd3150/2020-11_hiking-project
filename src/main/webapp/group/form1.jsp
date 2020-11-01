<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/header.jsp" />
<link href="//cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.4.0/css/bootstrap4-toggle.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
<link rel="stylesheet" type="text/css" href="../resources/css/views/group/form.css" />

<body class="pt-5 mt-5" >
<div id="groupForm-container" class="container" >
    <div id="groupForm">
        <h1 class="p-3">혼자 산오르기 등록</h1>
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
        <div class="m-3">
            <label for="detail">모임 상세</label>
            <textarea class="form-control" rows="12" id="detail"></textarea><br>
        </div>
        <div class="mb-3 col-12">
            <label for="image">이미지</label>
            <div id="image" class="input_wrap">
                <a href="javascript:" onclick="fileUploadAction();" class="my_button btn btn-light ml-3">사진 첨부하기</a>
                <form id="filesForm" method="post" enctype="multipart/form-data" style="display: none">
                    <input type="file" accept="image/*" id="uploadFile" name="file" onchange="setPreview(event);" multiple>
                </form>
                <div class="preview pt-3 row">
                </div>
            </div>
        </div>
        <pre></pre>
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
                            <option value="mountain" selected>산</option>
                            <option value="trail">등산로</option>
                        </select>
                        <input type="text" class="form-control col-6" placeholder="산/등산로 이름 입력" id="keyword">
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
<script type="text/javascript" src="../resources/js/view/group/validation.js"></script>
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

        $('#submit').click(function (e){
            e.preventDefault();

            if(validation()==null){
                return;
            }

            var form = $('#filesForm')[0];
            var data = new FormData(form);

            data.append("mtNm",$('#mtNm').val());
            data.append("name",$('#name').val());
            data.append("detail",window.editor.getData());
            data.append("startDay",$('#startDay').val());
            data.append("area",$('#area').val() + ' ' +$('#area-detail').val());
            data.append("staffMax",1);
            data.append("userId","<%= request.getSession().getAttribute("LOGIN")%>");

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
