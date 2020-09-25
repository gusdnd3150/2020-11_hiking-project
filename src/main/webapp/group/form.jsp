<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .drag_drop_zone{
            outline: 2px solid white ;
            outline-offset:-5px;
            text-align: center;
            transition: all .15s ease-in-out;
            width: 300px;
            height: 200px;
            background-color: lightgrey;
        }
    </style>
    <link href="/resources/css/bootstrap.css" rel="stylesheet" />
    <link href="/resources/css/bootstrap-datepicker.css" rel="stylesheet" />
    <script src="/resources/js/bootstrap.js" type="text/javascript"></script>
    <script src="/resources/js/bootstrap-datepicker.js" type="text/javascript"></script>
    <script src="resources/js/jquery-1.10.2.js" type="text/javascript"></script>

    <script>
        $('.datepicker').datepicker({
            weekStart:1,
            color: 'red'
        })

        $('.drag_drop_zone')
            .on("dragover", dragOver)
            .on("dragleave", dragOver)
            .on("drop", uploadFiles);

        function dragOver(e){
            e.stopPropagation();
            e.preventDefault();
            if (e.type == "dragover") {
                $(e.target).css({
                    "background-color": "black",
                    "outline-offset": "-20px"
                });
            } else {
                $(e.target).css({
                    "background-color": "lightgray",
                    "outline-offset": "-5px"
                });
            }
        }

        function uploadFiles(e) {
            e.stopPropagation();
            e.preventDefault();
            dragOver(e);

            e.dataTransfer = e.originalEvent.dataTransfer;
            var files = e.target.files || e.dataTransfer.files;
            if (files.length > 1) {
                alert('하나만 올려라.');
                return;
            }
            if (files[0].type.match(/image.*/)) {
                $(e.target).css({
                    "background-image": "url(" + window.URL.createObjectURL(files[0]) + ")",
                    "outline": "none",
                    "background-size": "100% 100%"
                });
            }else{
                alert('이미지가 아닙니다.');
                return;
            }
        }
    </script>
</head>
<body>
    <div class="container">
        모임 제목 : <input type="text"><br>
        모임 최대 인원 : <input type="text"><br>
        모임 상세 :<textarea></textarea><br>
        모임 시작 날짜 :<div class="col-xs-3">
                        <div class="controls">
                            <input class="datepicker form-control" type="text"/>
                        </div>
                        </div><br>
        모임 지역 :<br><br>
        이미지 :
        <div class="drag_drop_zone">
<%--                <div>이미지를 올려주세요</div>--%>
        </div>
        -상세 설정-<br>
        나이대 설정 :<br>
        최소:<br>
        최대:<br>
        성별:<br>
    </div>

</body>
</html>
