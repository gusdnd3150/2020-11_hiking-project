<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%
   request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
<head>
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
 <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">

    
    </script>


</head>
<body>
     <div class="container">
    <div class="row">
    <div class="col-sm-12 text-center" >
    <div class="col-sm-3"></div>
     
    <div class="col-sm-6">
    <h2>회원가입</h2>
    <form action="upDate.do" method="post"> 
        <table class="table table-boardered">
        <c:forEach var="user" items="${upDateUser}" > 
         	<tr>
                <th>회원번호</th>
                <td><input type="text" class="form-control" name="userNum" placeholder="${user.userNum}" disabled ></td>        
            </tr>
            <tr>
                <th>아이디</th>
                <td><input type="text" class="form-control" value="${user.id}" name="id" readonly></td>        
            </tr>
            <tr>
                <th>패스워드</th>
                <td><input type="password" class="pwd1" value="${user.password}" name="password" disabled></td>      
            </tr>
            <tr>
                <th>이름</th>
                <td><input type="text" class="form-control" name="name" value="${user.name}"></td>      
            </tr>

            <tr>
                <th>이메일</th>
                <td><input type="text" class="form-control" name="email"  value="${user.email}"></td>       
            </tr>

            <tr>
                <th>주소</th>
                <td><input type="text" class="form-control" name="address" value="${user.address}"></td>       
            </tr>
             
            <tr>
                <th>전화번호</th>
                <td><input type="text" class="form-control" name="phone" value="${user.phone}"></td>       
            </tr>
             <tr>
                <th>등록일자</th>
                <td><input type="text" class="form-control" name="createdAt" value="${user.createdAtString}" disabled></td>       
            </tr>
            <tr>
                <th>수정일자</th>
                <td><input type="text" class="form-control" name="updatedAt" value="${user.updatedAtString}" disabled></td>       
            </tr>
         
            <tr>
                <th>성별</th>
                <td>
                <input type="radio"  name="sex" value="1">남성 &nbsp;&nbsp;
                <input type="radio"  name="sex" value="2">여성 &nbsp;&nbsp;
                </td>
            </tr> 
             <tr>
                <th>고객유형</th>
                <td>
                <input type="radio"  name="type" value="100">관리자 &nbsp;&nbsp;
                <input type="radio"  name="type" value="200">회원&nbsp;&nbsp;
                <input type="radio"  name="type" value="300">비회원&nbsp;&nbsp;
                </td>
            </tr> 
            <tr>
            	<th>회원상태</th>
                <td>
                <input type="radio"  name="status" value="10">휴먼 &nbsp;&nbsp;
                <input type="radio"  name="status" value="20">활동중 &nbsp;&nbsp;
                </td>          
             </tr> 
             </c:forEach>
            <tr>
                <td colspan="2">
                <input type="submit" class="btn btn-primary" value="수정"> 
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