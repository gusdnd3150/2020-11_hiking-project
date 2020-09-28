<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<%
  request.setCharacterEncoding("UTF-8");
%> 
<jsp:include page="/common/header.jsp" />
<!DOCTYPE html >
<html>
<head>
<meta "charset=utf-8">
<title>파일업로드 하기</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
var cnt=1;
function fn_addFile(){
	  //$("#d_file").append("<br>"+"<input type='file' name='CONTENT"+cnt+"' />");
	  $("#d_file").append("<br>"+"<input type='file' name='CONTENTImage' />");
	  //$("#d_file").append("<input type='hidden' name='PPHOTONUM' value='"+cnt+"' />"); 
	//$("#d_file").append("<br>"+"<input type='file' name='CONTENT"+cnt+"' />");
	  /* $("#d_file").append("<br>"+"<input multiple ='multiple' type='file' name='CONTENT1[]' />"); */
	  /* $("#d_file").append("<br>"+"<input multiple ='multiple' type='file' name='pPhotoContent' />"); */
	cnt++;
}




</script>
</head>
<body>
<h1>파일 업로드 하기</h1>
<form name="frm" method="post" action="${contextPath}/E_P002_D003/addProduct.do" enctype="multipart/form-data">
	    <label>상품분류코드:</label>
    <!-- <input type="text" name="PCATEGORYNUM"><br> -->
    <select id="pcateGoryNum" name="pcateGoryNum">
         <option value="1">양말</option>    
         <option value="2">등산 가방</option>
         <option value="3">아웃도어</option>
         <option value="4">등산스틱</option>
         <option value="5">등산화</option>
         <option value="6">등산 장갑</option>
         <option value="7">보호대</option>
         </select><br>
        <label>상품구분(중고/신품):</label>
     <select id="type" name="type">
         <option value="1">중고</option>    
         <option value="2">신품</option>
         </select><br>
    	<label>상품명:</label>
    <input type="text" name="name"><br>
    	<label>상품가격:</label>
    <input type="text" name="price"><br>
    	<label>상품수량:</label>
    <input type="text" name="quantity"><br>
    	<label>상품내용:</label>
    <textarea name="content" rows="" cols=""></textarea>
    <br>
    <br>
	<input type="button"  value="파일추가" onClick="fn_addFile()"/><br>
	<div id="d_file">
	<br>
  </div>
	<input type="submit"  value="업로드"/>
</form>
<br>
<br>
<br>

 <a href="/B_P002_D001/shopMainCate?ListType=10">메인 목록</a>

</body>
</html>

