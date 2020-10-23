<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
    
  
<!doctype html>
<html lang="en">
<head>
<%@ include file="../include/head.jsp" %>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css" />
</head>
<body>
     
  <div class="box box-primary">
            <div class="box-body box-profile">
            <c:forEach var="userInfo" items="${list}" > 
               <img class="profile-user-img img-responsive img-circle" src="/resources/img/${userInfo.content2}" alt="User profile picture">
            
                          <h3 class="profile-username text-center">${userInfo.name}</h3>
            
                          <p class="text-muted text-center">${userInfo.nickname}</p>
                          
                           <p class="text-muted text-center">${userInfo.profile}</p>
   
                          <ul class="list-group list-group-unbordered">
                          <li class="list-group-item">
                              <b>아이디</b> <a class="pull-right">${userInfo.id}</a>
                            </li>
                            <li class="list-group-item">
                              <b>성별</b> <a class="pull-right">${userInfo.sexType}</a>
                            </li>
                            <li class="list-group-item">
                              <b>전화번호</b> <a class="pull-right">${userInfo.phone}</a>
                            </li>
                            <li class="list-group-item">
                              <b>이메일</b> <a class="pull-right">${userInfo.email}</a>
                            </li>
                              <li class="list-group-item">
                              <b>우편번호</b> <a class="pull-right">${userInfo.zoneCode}</a>
                            </li>
                            <li class="list-group-item">
                              <b>주소</b> <a class="pull-right">${userInfo.address}</a>
                            </li>
                             <li class="list-group-item">
                              <b>상세주소</b> <a class="pull-right">${userInfo.address2}</a>
                            </li>
                             <li class="list-group-item">
                              <b>상태</b> <a class="pull-right">${userInfo.statusType}</a>
                            </li>
                            <li class="list-group-item">
                              <b>유형</b> <a class="pull-right">${userInfo.usersType}</a>
                            </li>
                            <li class="list-group-item">
                              <b>가입일자</b> <a class="pull-right">${userInfo.createdAtString}</a>
                            </li>
                          </ul>  
                    
                          </c:forEach>
            </div>
            <!-- /.box-body -->
      
          </div>
                    
</body>
</html>

