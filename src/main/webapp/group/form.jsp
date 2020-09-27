<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/header.jsp" />
<link rel="stylesheet" type="text/css" href="../resources/css/bootstrap-datepicker.css" />
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
<body class="pt-5 mt-5">
<div class="container">
    <h1>모임 등록</h1>
    <form name="groupForm" id="groupForm" method="post" action="">
        <div class="mb-3">
            <label for="title">모임 제목</label>
            <input type="text" class="form-control" name="title" id="title">
        </div>
        <div class="mb-3">
            <label for="maxStaff">모임 최대 인원</label>
            <input type="text" class="form-control" name="maxStaff" id="maxStaff">
        </div>
        <div class="mb-3">
            <label for="detail">모임 상세</label>
            <textarea class="form-control" rows="5" name="detail" id="detail"></textarea><br>
        </div>
        모임 시작 날짜 :
        <div class="mb-3">
                <input class="datepicker form-control" type="text"/>
        </div>
        모임 지역 :<br><br>
        이미지 :
        <div class="drag_drop_zone">
        </div>
        -상세 설정-<br>
        나이대 설정 :<br>
        최소:<br>
        최대:<br>
        성별:<br>
    </form>
</div>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap-datepicker.js"></script>
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
</body>
</html>
