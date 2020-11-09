<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/common/header.jsp" />
<link rel="stylesheet" type="text/css" href="../resources/css/views/group/after.css">
<body class="container pt-5">
<div class="pt-5">
    <div>
        <h2>[${group.MTNM}]<span class="text-muted">${group.NAME}의 후기</span></h2>
        <div class="p-3">
            <h5>작성자</h5>
            <img src="/resources/img/${group.CONTENT2}" class="rounded-circle" style="width: 50px;height: 50px">
            <span class="pl-1">${group.NICKNAME}</span>
        </div>
    </div>
    <form id="afterForm" class="form-group" method="POST" action="/after/insert.do" enctype="multipart/form-data">
        <div class="p-3">
            <label class="label control-label" for="title"><h5>후기 제목</h5></label>
            <input id="title" name="title" type="text" class="form-control" placeholder="후기 제목 입력">
            </div>
        <div class="p-3">
            <label class="label control-label" for="editor"><h5>후기 내용</h5></label>
            <textarea name="content" id="editor">
            </textarea>
        </div>
    </form>
    <div class="p-3" style="float: right">
        <button id="reset" class="btn btn-light">다시 작성</button>
        <button id="submit" class="btn btn-info">작성 완료</button>
    </div>
</div>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script src="../resources/ckeditor5/ckeditor.js"></script>
<script>
    // var imageList;

    ClassicEditor
        .create( document.querySelector( '#editor' ), {
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

    function MyCustomUploadAdapterPlugin(editor) {
        editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
            return new UploadAdapter(loader)
        }
    }

    class UploadAdapter {
        constructor(loader) {
            this.loader = loader;
        }

        upload() {
            return this.loader.file.then( file => new Promise(((resolve, reject) => {
                this._initRequest();
                this._initListeners( resolve, reject, file );
                this._sendRequest( file );
            })))
        }

        _initRequest() {
            const xhr = this.xhr = new XMLHttpRequest();
            xhr.open('POST', '/after/uploadImage.do', true);
            xhr.responseType = 'json';
        }

        _initListeners(resolve, reject, file) {
            const xhr = this.xhr;
            const loader = this.loader;
            const genericErrorText = '파일을 업로드 할 수 없습니다.'

            xhr.addEventListener('error', () => {reject(genericErrorText)})
            xhr.addEventListener('abort', () => reject())
            xhr.addEventListener('load', () => {
                const response = xhr.response

                if(!response || response.error) {
                    return reject( response && response.error ? response.error.message : genericErrorText );
                }

                resolve({
                    default: response.url //업로드된 파일 주소
                })
            })
        }

        _sendRequest(file) {
            const data = new FormData()
            data.append('upload',file)
            this.xhr.send(data)
        }
    }
    $('#reset').on("click",function (){
        $('#title').val("");
        window.editor.setData("");
    })

    $('#submit').on("click",function (){

        var data = {
            "title" : $('#title').val(),
            "content" : window.editor.getData(),
            "groupNum" : localStorage.getItem("groupNum")*1,
            "mtNm" : localStorage.getItem("mtNm"),
            "userId" : "<%= request.getSession().getAttribute("LOGIN")%>"
        }

        $.ajax({
            type: "POST",
            url: "/after/insertAfter.do",
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success : function (response){
                console.log(response);

                if(response==0){
                    alert("회원당 후기는 1개만 작성가능합니다")
                    return;
                }
                alert("작성 완료")
                location.href="../group/main.jsp"
            },
            error : function (response){
                alert("오류 발생! 다시 시도해주세요");
            }
        })
    })
</script>
</body>
</html>
