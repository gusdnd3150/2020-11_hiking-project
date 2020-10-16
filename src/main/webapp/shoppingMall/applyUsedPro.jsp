<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%> 

<!DOCTYPE html >
<html>
<head>
<meta "charset=utf-8">
<title>파일업로드 하기</title>


<link rel="stylesheet" type="text/css" href="../resources/css/bootstrap-datepicker.css" />
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>


var cnt=1;
function fn_addFile(){
	  $("#d_file").append("<br>"+"<input type='file' name='content' />");
	cnt++;
}


var cnt2=1;
 function addFileDetail(){
	  $("#d_file2").append("<br>"+"<input type='file' name='contentDetail' />");
		cnt2++;
 }
 
 var cnt3=1;
 function addOption(){
	  $("#addOption").append("<br>"+"<label for='title'>색상:</label>");
	  //$("#addOption").append("<input type='text' name='color[]' value=''>");
	  $("#addOption").append("<select name='color[]'class='basic_btn btn-warning dropdown-toggle'>"
      +"<option value=' '>color</option>"
      +"<option value='white'>white</option>"
      +"<option value='black'>black</option>"
      +"<option value='red'>red</option>"
      +"<option value='blue'>blue</option>"
      +"<option value='ogrange'>ogrange</option>"
      +"<option value='yellow'>yellow</option>"
      +"<option value='green'>green</option>"
      +"<option value='violet'>violet</option>"
      +"<option value='pink'>pink</option>"
      +"<option value='navy'>navy</option>"
      +"<option value='gray'>gray</option>"
      +"<option value='etc'>etc</option>"
  +"</select>");
	  
	  $("#addOption").append("<label for='title'>사이즈:</label>");
	  $("#addOption").append("<input type='text' name='prodSize[]' value=''>");
	  $("#addOption").append("<label for='title'>수량:</label>");
	  $("#addOption").append("<input type='text' name='quantity[]' value=''>");
	  $("#addOption").append("<input type='hidden' name='prodstatus[]' value='1'>");
		cnt3++;
 }
 
 
 
</script>
</head>
<body>
<jsp:include page="/common/header.jsp" />

<br>
<br>
<br>
<br>
<div class="container">
    <h1 align="center">중고물품 등록</h1>
    
    <form name="frm" method="post" action="/E_P002_D003/addUsedPro" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="title">상품이름</label>
            <input type="text" class="form-control" name="name" id="name">
        </div>
       <div class="mb-3">
            <label for="title">상품가격</label>
            <input type="text" class="form-control" name="price" id="price">
        </div>
        <div class="mb-3">
            <label for="title">상품내용</label>
            <input type="text" class="form-control" name="content" id="content">
        </div>
         <label>상품구분(중고/신품):</label>
            <select id="type" name="type">
             <option value="1">중고</option>    
             <option value="2">신품</option>
             <option value="3">물품 검수</option>
            </select><br>
            
         <label>상품분류</label>              
            <select id="parentCategoryNum" name="parentCategoryNum">
             <option value="15">반팔</option>    
             <option value="16">긴팔</option>
             <option value="17">후드</option>
             <option value="18">반바지</option>
             <option value="19">긴바지</option>
             <option value="20">패딩</option>
             <option value="21">야상</option>
             <option value="22">바람막이</option>
             <option value="23">비니</option>
             <option value="24">캡모자</option>
             <option value="25">정글모</option>
             <option value="26">선캡</option>
             <option value="27">긴양말</option>
             <option value="28">반양말</option>
             <option value="29">발가락양말</option>
             <option value="30">백팩</option>
             <option value="31">크로스백</option>
             <option value="32">등산화</option>
             <option value="11">스틱</option>
             <option value="12">장갑</option>
             <option value="13">아이젠</option>
             <option value="14">보호대</option>
            </select><br>   
            
            <!-- prodOption table 추가내용 -->
         <input type="button"  value="옵션추가" onClick="addOption()"/><br>   
          <div id="addOption">
          <label for="title">색상:</label>
          <!-- <input type="text" name="color[]" value=""> -->
          <select id="color" name="color[]" class="basic_btn btn-warning dropdown-toggle">
           <option value=' '>color</option>
      <option value='white'>white</option>
      <option value='black'>black</option>
      <option value='red'>red</option>
      <option value='blue'>blue</option>
      <option value='ogrange'>ogrange</option>
      <option value='yellow'>yellow</option>
      <option value='green'>green</option>
      <option value='violet'>violet</option>
      <option value='pink'>pink</option>
      <option value='navy'>navy</option>
      <option value='gray'>gray</option>
      <option value='etc'>etc</option>
            </select>
          
          <label for="title">사이즈:</label>
          <input type="text" name="prodSize[]" value="">
          <label for="title">수량:</label>
          <input type="text" name="quantity[]" value="">
          <input type="hidden" name="prodstatus[]" value="1">
         <br>
          </div>   
          <hr>
        <input type="button"  value="섬네일 사진추가" onClick="fn_addFile()"/><br>
           <div id="d_file">
         <br>
          </div>
          <hr>
          <input type="button"  value="상세내용 사진추가" onClick="addFileDetail()"/><br>
          <div id="d_file2">
           <br>
          </div>
           <input type="submit"  value="중고등록 신청"/>
      </form>
</div>
</body>
</html>

