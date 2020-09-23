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
 
    <!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
    <!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


</head>
<body>


     <div class="container">
    <div class="row">
    <div class="col-sm-12 text-center" >
    <div class="col-sm-3"></div>
     
    <div class="col-sm-6">
    <h2>회원가입</h2>
    <form action="addUser.do" method="post">
        <table class="table table-boardered">
            <tr>
                <th>아이디</th>
                <td><input type="text" class="form-control" name="id" placeholder="id를 넣으세요"></td>        
            </tr>
            <tr>
                <th>패스워드</th>
                <td><input type="password" class="form-control" name="password" placeholder="비밀번호는 영문만 넣어주세요"></td>      
            </tr>
            <tr>
                <th>이름</th>
                <td><input type="text" class="form-control" name="name"></td>      
            </tr>

            <tr>
                <th>이메일</th>
                <td><input type="text" class="form-control" name="email"></td>       
            </tr>

            <tr>
                <th>주소</th>
                <td><input type="text" class="form-control" name="address"></td>       
            </tr>
             
            <tr>
                <th>전화번호</th>
                <td><input type="text" class="form-control" name="phone" placeholder="010-0000-0000"></td>       
            </tr>
         
            <tr>
                <th>성별</th>
                <td>
                <input type="radio"  name="Sex" value="1">남성 &nbsp;&nbsp;
                <input type="radio"  name="Sex" value="2">여성 &nbsp;&nbsp;
                </td>     
            </tr>
            <tr>
                <th>고객 유형</th>
                <td>
                <input type="radio"  name="type" value="100">관리자 &nbsp;&nbsp;
                <input type="radio"  name="type" value="200">회원&nbsp;&nbsp;
                <input type="radio"  name="type" value="300">비회원 &nbsp;&nbsp;
                </td>     
            </tr>
            
            <tr>
                <td colspan="2">
                <input type="submit" class="btn btn-primary" value="가입">
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