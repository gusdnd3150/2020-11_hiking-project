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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
var cnt=1;
function fn_addFile(){
	  $("#d_file").append("<br>"+"<input type='file' name='CONTENT"+cnt+"' />");
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
<form method="post" action="${contextPath}/E_P002_D003/addProduct.do" enctype="multipart/form-data">
	    <label>상품분류코드:</label>
    <input type="text" name="PCATEGORYNUM"><br>
    	<label>상품명:</label>
    <input type="text" name="NAME"><br>
    	<label>상품가격:</label>
    <input type="text" name="PRICE"><br>
    	<label>상품수량:</label>
    <input type="text" name="QUANTITY"><br>
        	<label>상품구분(중고/신품):</label>
    <input type="text" name="TYPE"><br>
    	<label>상품내용:</label>
    <input type="textarea" name="CONTENT"><br>
    <br><br>
	<input type="button"  value="파일추가" onClick="fn_addFile()"/><br>
	<div id="d_file">
  </div>
	<input type="submit"  value="업로드"/>
	
</form>
</body>
</html>
