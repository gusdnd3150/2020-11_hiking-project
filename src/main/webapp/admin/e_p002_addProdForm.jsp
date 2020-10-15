<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>상풍등록</title>
    <script src="http://code.jquery.com/jquery-latest.js"></script>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>회원가입</title>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <style>
        .basic_btn{display:inline-block;max-width:110px;width:100%;line-height:35px;font-size:15px;border:1px solid #007bff;border-radius:10px;}

    </style>

</head>
<script>

    // 사이즈 선택 신발 선택시 셀렉트창 보이게
    function selectSize(value){
        if (value=="shoes"){
            $("#shoesSelect").append("<br>"+"<select name='shoesSize' class='basic_btn btn-primary' >"
                +"<option value='220mm>220mm</option>"
                +"<option value='230mm'>230mm</option>"
                +"<option value='240mm'>240mm</option>"
                +"<option value='250mm'>250mm</option>"
                +"<option value='260mm'>260mm</option>"
                +"<option value='270mm'>270mm</option>"
                +"<option value='280mm'>280mm</option>"
                +"<option value='290mm'>290mm</option>"
                +"<option value='300mm'>300mm</option>"
                +"</select>" );
        }else{
            $('#shoesSelect').empty();

        }
    }

    //1차 분류 선택시 2차 분류 셀렉트
    function selectprodcategory1(value){
        $("#prodcategory2").empty();

        if(value=='a'){
            $("#prodcategory2").append("<br>"+ "<select name='prodcategory2' class='basic_btn btn-primary' onchange='selectprodcategory2(this.value)'>"
                +"<option value=' '>2차분류 </option>"
                +"<option value='d'>상의</option>"
                +"<option value='e'>하의</option>"
                +"<option value='f'>아우터</option>"
                +"</select>"
            );
        }else if (value=='b'){
            $("#prodcategory2").append("<br>"+ "<select name='prodcategory2' class='basic_btn btn-primary' onchange='selectprodcategory2(this.value)'>"
                +"<option value=' '>2차분류 </option>"
                +"<option value='g'>모자</option>"
                +"<option value='h'>양말</option>"
                +"<option value='i'>가방</option>"
                +"<option value='j'>신발</option>"
                +"</select>"
            );
        }else if (value=='c') {
            $("#prodcategory2").append("<br>"+ "<select name='prodcategory2' class='basic_btn btn-primary' onchange='selectprodcategory2(this.value)'>"
                +"<option value=' '>2차분류 </option>"
                +"<option value='k'>스틱</option>"
                +"<option value='k'>장갑</option>"
                +"<option value='k'>아이젠</option>"
                +"<option value='k'>보호대</option>"
                +"</select>"
            );
        }
    }

    //2차 분류 선택시 3차 분류 셀렉트
    function selectprodcategory2(value){
        $("#prodcategory3").empty();
        if(value=='d'){
            $("#prodcategory3").append("<br>"+ "<select name='prodcategory3' class='basic_btn btn-primary' >"
                +"<option value=' '>3차분류 </option>"
                +"<option value='15'>반팔</option>"
                +"<option value='16'>긴팔</option>"
                +"<option value='17'>후드</option>"
                +"</select>"
            );
        }else if (value=='e'){
            $("#prodcategory3").append("<br>"+ "<select name='prodcategory3' class='basic_btn btn-primary'>"
                +"<option value=' '>3차분류 </option>"
                +"<option value='18'>반바지</option>"
                +"<option value='19'>긴바지</option>"
                +"</select>"
            );
        }else if (value=='f') {
            $("#prodcategory3").append("<br>"+ "<select name='prodcategory3' class='basic_btn btn-primary' >"
                +"<option value=' '>3차분류 </option>"
                +"<option value='20'>패딩</option>"
                +"<option value='21'>야상</option>"
                +"<option value='22'>바람막이</option>"
                +"</select>"
            );
        }else if (value=='g') {
            $("#prodcategory3").append("<br>"+ "<select name='prodcategory3' class='basic_btn btn-primary'>"
                +"<option value=' '>3차분류 </option>"
                +"<option value='23'>비니</option>"
                +"<option value='24'>캡모자</option>"
                +"<option value='25'>정글모</option>"
                +"<option value='26'>썬캡</option>"
                +"</select>"
            );
        }else if (value=='h') {
            $("#prodcategory3").append("<br>"+ "<select name='prodcategory3' class='basic_btn btn-primary' >"
                +"<option value=' '>3차분류 </option>"
                +"<option value='27'>긴양말</option>"
                +"<option value='28'>반양말</option>"
                +"<option value='29'>발가락양말</option>"
                +"</select>"
            );
        }else if (value=='i') {
            $("#prodcategory3").append("<br>"+ "<select name='prodcategory3' class='basic_btn btn-primary' >"
                +"<option value=' '>3차분류 </option>"
                +"<option value='30'>백팩</option>"
                +"<option value='31'>크로스백</option>"
                +"</select>"
            );
        }else if (value=='j') {
            $("#prodcategory3").append("<br>"+ "<select name='prodcategory3' class='basic_btn btn-primary'>"
                +"<option value=' '>3차분류 </option>"
                +"<option value='32'>등산화</option>"
                +"</select>"
            );

        }else if (value=='k') {
            $("#prodcategory3").append("<br>"+ "<select name='prodcategory3' class='basic_btn btn-primary'>"
                +"<option value=' '>3차분류 </option>"
                +"<option value='11'>스틱</option>"
                +"<option value='12'>장갑</option>"
                +"<option value='13'>아이젠</option>"
                +"<option value='14'>보호대</option>"
                +"</select>"
            );
        }
    };
    var cnt3=1;
    function addOption(){
        $("#sizeMain").append("<br><br>"+"<div id='sizeMain'>"
            +"<label for='title'>색상:</label>"
            +"<input type='color' name='color[]' value=''><br>"
            +"<label for='title'>사이즈:</label>"
            +"<input type='text' name='prodSize[]' value=''><br>"
            +"<label for='title'>수량:</label>"
            +"<input type='text' name='quantity[]' value=''>"
            +"</div>"
        );
        cnt3++;
    };
</script>
<body>


<div class="container">
    <div class="row">
        <div class="col-sm-12 text-center" >
            <div class="col-sm-3"></div>

            <div class="col-sm-6">
                <h2>상품 등록</h2>
                <form action="insertProd.do" method="post" enctype="multipart/form-data">
                    <table class="table table-boardered">
                        <tr>
                            <th>상품 분류</th>
                            <td>
                                <div>
                                    <select name="prodcategory1" class="basic_btn btn-primary" onchange="selectprodcategory1(this.value)">
                                        <option value=" ">1차 분류</option>
                                        <option value="a">의류</option>
                                        <option value="b">잡화</option>
                                        <option value="c">등산용품</option>
                                    </select>
                                </div>
                                <!-- 2차 분류 생성 -->
                                <div id="prodcategory2" >
                                </div>
                                <!--3차 분류 생성  -->
                                <div id="prodcategory3" >
                                </div>
                            </td>

                        </tr>
                        <tr>
                            <th>상품명</th>
                            <td><input type="text" class="form-control" name="name" placeholder="상품이름"></td>
                        </tr>
                        <tr>
                            <th>상품설명</th>
                            <td><input type="text" class="form-control" name="content" placeholder="상품설명"></td>
                        </tr>
                        <tr>
                            <th>가격</th>
                            <td><input type="text" class="form-control" name="price"placeholder="가격"></td>
                        </tr>
                        <tr>

                            <th>상품 옵션 </th>

                            <td>
                                <button  type="button" id="_addSize" class="btn btn-info btn-flat"  onClick="addOption()" >옵션 추가</button>
                                <div id="sizeMain">
                                    <label for="title">색상:</label>
                                    <input type="color" name="color[]" value=""><br>
                                    <label for="title">사이즈:</label>
                                    <input type="text" name="prodSize[]" value=""><br>
                                    <label for="title">수량:</label>
                                    <input type="text" name="quantity[]" value="">

                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th>상품구분</th>
                            <td>
                                <input type="radio"  name="type" value="1">신상품 &nbsp;&nbsp;
                                <input type="radio"  name="type" value="2">중고품&nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <th>상품상태</th>
                            <td>
                                <input type="radio"  name="prodStatus" value="1">판매중 &nbsp;&nbsp;
                                <input type="radio"  name="prodStatus" value="2">품절&nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <th>대표 이미지</th>
                            <td>
                                <input type='file' id="file" name='file' multiple maxlength="3" />
                            </td>
                        </tr>
                        <tr>
                            <th>상세 이미지</th>
                            <td>
                                <input type='file' id="file2" name='file2' multiple  maxlength="1"/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input class="btn btn-primary" type="submit"  value="등록"/>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>

        </div>
    </div>
</div>
</body>
</html>