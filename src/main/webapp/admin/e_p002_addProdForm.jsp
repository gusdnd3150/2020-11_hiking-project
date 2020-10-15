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
<title>파일업로드 하기</title>
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
                <th>상품명</th>
                <td><input type="text" class="form-control" name="name" placeholder="상품이름"></td>        
            </tr>
            <tr>
                <th>가격</th>
                <td><input type="text" class="form-control" name="price"placeholder="가격"></td>      
            </tr>
            <tr>
                <th>수량</th>
                <td><input type="text" class="form-control" name="quantity"placeholder="수량"></td>       
            </tr>

            <tr>
                <th>내용</th>
                <td> <textarea name="content" rows="5" cols="50"></textarea></td>       
            </tr>
            <tr>
                <th>상품구분</th>
                <td>
                <input type="radio"  name="type" value="1">신상품 &nbsp;&nbsp;
                <input type="radio"  name="type" value="2">중고품&nbsp;&nbsp;
                </td>          
            </tr>
         
            <tr>
                <th>상품분류 코드</th>
                <td>
                	<select name="pCategoryNum" class="basic_btn btn-primary">
            		      	<option value="1">양말</option>    
					        <option value="2">등산 가방</option>
					        <option value="3">아웃도어</option>
					        <option value="4">등산스틱</option>
					        <option value="5">등산화</option>
					        <option value="6">등산 장갑</option>
					        <option value="7">보호대</option>
        			</select>  
                </td>
            </tr>
            <tr>
                <th>상품 이미지</th>
                <td>
                
            <input type='file' id="file" name='file' multiple  />
				
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