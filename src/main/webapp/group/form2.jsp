<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/header.jsp" />
<link href="//cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.4.0/css/bootstrap4-toggle.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet"> <!--CDN 링크 -->
<link rel="stylesheet" type="text/css" href="../resources/css/views/group/form.css" />

<body class="pt-5 mt-5" >
<div id="groupForm-container" class="container" >
    <div id="groupForm">
    <h1 class="p-3 col-12">여럿이서 산오르기 등록</h1>
        <pre></pre>
        <div class="mb-3 col-12">
            <label for="mtnm">등산로설정</label>
            <div class="mb-3 col-6 row">
                <input type="text" class="form-control mb-3 col-6" id="mtnm" readonly>
                <button id="setPath" class="btn btn-info mb-3" data-toggle="modal" data-target="#pathModal">등산로 설정</button>
            </div>
        </div>
        <div class="mb-3 col-12">
            <label for="name">모임 제목</label>
            <input type="text" class="form-control" id="name">
        </div>
        <div class="mb-3 col-6">
            <label for="staffMax">모임 인원</label>
            <div class="staff">
                <i id="decrease" class="fas fa-minus"></i>
                <h2 id="staffMax" style="margin-bottom: 0">2명</h2>
                <i id="increase"class="fas fa-plus" ></i>
            </div>
        </div>
        <div class="mb-3 col-12">
            <label for="detail">모임 상세</label>
            <textarea class="form-control" rows="6" id="detail"></textarea><br>
        </div>
        <div class="mb-3 col-6" >
            <label for="startDay">모임 시작 날짜</label>
            <input type="date" class="form-control" id="startDay">
        </div>
        <div class="mb-3 col-6">
            <label for="area">모임 지역</label>
            <select class="custom-select" id="area">
                <option selected>지역을 선택해주세요</option>
                <option value="Seoul">서울</option>
                <option value="Gyeonggi">경기</option>
                <option value="Gangwon">강원</option>
            </select>
        </div>
        <div class="mb-3 col-12">
            <label for="image">이미지</label>
            <div class="drag_drop_zone" id="image" />
        </div>
        <pre></pre>
        <div class="panel-group" id="accordion">
            <div class="panel panel-default">
                <div class="panel-title">
                    상세설정
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
                        <input class="toggle-btn" type="checkbox" data-toggle="toggle" data-onstyle="info" data-size="xs">
                    </a>
                </div>
                <div id="collapse1" class="panel-collapse collapse in">
                    <div class="panel-body">
                        <div class="mb-3 col-6">
                            <label for="age">나이대 설정</label>
                            <div id="age">
                                <select class="custom-select" id="minAge">
                                    <option selected>최소</option>
                                    <option value="1">1</option>
                                    <option value="10">10</option>
                                    <option value="20">20</option>
                                    <option value="30">30</option>
                                    <option value="40">40</option>
                                    <option value="50">50</option>
                                    <option value="60">60</option>
                                    <option value="70">70</option>
                                    <option value="80">80</option>
                                </select>
                                <select class="custom-select" id="maxAge">
                                    <option selected>최대</option>
                                    <option value="1">1</option>
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
                                <option selected>성별</option>
                                <option value="1">남</option>
                                <option value="2">여</option>
                            </select>
                        </div>
                    </div>
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
                        <input type="text" class="form-control ml-3 col-6" placeholder="산/등산로 이름 입력">
                        <button id="searchPath" class="btn btn-info">검색</button>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
<script src="//cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.4.0/js/bootstrap4-toggle.min.js"></script>
<script type="text/javascript" src="../resources/js/view/group/form2.js"></script>
<script>
    $(document).on('click','#searchPath', function (){
        var data = "";

        $.ajax({
            type: "GET",
            url: "/apitest2",
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success : function (response){
                console.log("success");
                console.log(response);
            },
            error : function (response){
                console.log("error!")
                console.log(response);
            }
        })
    })
</script>
</body>
</html>
