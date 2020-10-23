<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/header.jsp" />
<link href="//cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.4.0/css/bootstrap4-toggle.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
<!-- <link rel="stylesheet" type="text/css" href="../resources/css/views/group/form.css" /> -->
<style>
#groupForm-container{
    width: 600px;
}

div#groupForm {
border: 2px solid #04B4AE;
    background-color: #EFFBF8;
    border-radius: 5px 5px 5px 5px;
    /*border: grey solid 1px;*/
}

#increase{
    border-radius: 5px 5px 5px 5px;
}

.staff > i {
    display: inline-block;
}

.staff > h2 {
    display: inline-block;
}

i {
    color: dimgray;
}
</style>
<body class="pt-5 mt-5" >
<div id="groupForm-container" class="container" >
    <div id="groupForm">
        <h1 class="p-3 col-12">산모임 만들기</h1>
        <pre></pre>
        <div class="mb-3 col-12">
            <label for="name">산모임 이름</label>
            <input type="text" class="form-control" id="name">
        </div>
        <div class="mb-3 col-12">
            <label for="detail">모임 소개</label>
            <textarea class="form-control" rows="6" id="detail"></textarea><br>
        </div>
        <div class="mb-3 col-6">
            <label for="area">모임 지역</label>
            <select class="custom-select" id="area">
                <option value="0" selected>지역을 선택해주세요</option>
                <option value="전체">전체</option>
                <option value="서울">서울</option>
                <option value="경기">경기</option>
                <option value="강원">강원</option>
            </select>
        </div>
        <div class="mb-3 col-12">
            <label for="image">이미지</label>
            <div id="image" class="input_wrap">
                <form id="filesForm" method="post" enctype="multipart/form-data" >
               <input type="file" name="file" />
                </form>
                <div class="preview pt-3 row">
                </div>
            </div>
        </div>
        <pre></pre>
        <div class="panel-group" id="accordion">
            <div class="panel panel-default">
                <div class="panel-title col-12">
                    상세설정
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
    </div>
</div>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
<script src="//cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.4.0/js/bootstrap4-toggle.min.js"></script>
<script type="text/javascript" src="../resources/js/view/group/searchMt.js"></script>
<script>
/*     function fileUploadAction() {
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
 */

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
            data.append("userId","<%= request.getSession().getAttribute("LOGIN")%>")

            $.ajax({
                type: "POST",
                enctype: 'multipart/form-data',
                url: '/commu/insert.do',
                data: data,
                processData: false,
                contentType: false,
                cache: false,
                success(response){
                    console.log(response);
                    console.log(response.GROUPNUM);
                    alert("등록완료")
                    location.href = "/commu/commuPageView.do?groupNum="+(response.GROUPNUM)
                },
                error(response){
                    alert("등록 오류, 새로고침 후 다시 시도 해주세요")
                }
            });
        });
    });
</script>
</body>
</html>
