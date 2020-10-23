<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />	    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
<script type="text/javascript" src="${contextPath}/resources/ckeditor/ckeditor/ckeditor.js"></script>
</head>
<body>

<div class="container">
    <div class="content" style="width: 70%">
    
        <div class="row justify-content-md-center">
            <div class="col-sm-9">
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <label class="input-group-text">제목</label>
                  </div>            
                  <input type="text" class="form-control">              
                </div>
            </div>
            <div class="col-sm-3">
                <div class="input-group mb-3">
                    <select class="custom-select" id="inputGroupSelect03">
                    <option selected>분류</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                  </select>  
                </div>
            </div>            
      </div>
      
      <hr>
      
      <div class="row justify-content-md-center">
          <div class="col_c" style="margin-bottom: 30px">
                <div class="input-group">                 
                  <textarea class="form-control" id="p_content"></textarea>
                  <script type="text/javascript">
                  CKEDITOR.replace('p_content' , {height: 100, width:600});
                  </script>
                </div>
            </div> 
      </div>
      
      
      <div class="row justify-content-md-center">
            <div class="input-group mb-3">
              <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroupFileAddon01">썸네일</span>
              </div>
              <div class="custom-file">
                  &nbsp;<input type="file" class="form-control-file" id="exampleFormControlFile1">
              </div>
            </div>
      </div>
      
      
      <h1>파일 업로드 하기</h1>
<form method="post" action="${contextPath}/upload" enctype="multipart/form-data">
	<input type="button"  value="파일추가" onClick="fn_addFile()"/><br>
	<div id="d_file">
  </div>
<!-- 	<input type="submit"  value="업로드"/> -->
</form>
      
      
      
      
      <div class="row justify-content-md-center">
        <button type="submit" class="btn btn-outline-secondary" style="width: 20%; font-weight: bold">
             등   록          
            </button>
        </div>
  </div>
</div>
</body>
</html>