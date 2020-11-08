<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 

			<div class="col-md-3"  >
			<div id="leftSide">
				<div class="card col-sm-12" style="border: 2px solid green; height:40rem; width: 15rem; padding:0;">
					<img src="/resources/img/${m3.STOREDFILENAME}" style="width:100%; height:200px;"
						class="card-img-top" alt="산모임 기본 이미지">
					<div class="card-body">
						<h5 class="card-title">${m1.NAME}</h5>
						<%-- <small>멤버 ${m1.STAFFCURRENT}</small> <br>
						<small>지역 ${m1.AREA}</small> <br> 
						<small>성별 ${m1.SEX}</small> <br>
						<c:choose>
						   <c:when test="${0 eq m1.AGESTART && 0 eq m1.AGEEND}">
						   <small>연령 무관</small> <br> <br>
						   </c:when>
						   <c:otherwise>
						<small>연령 ${m1.AGESTART}~${m1.AGEEND}</small> <br> <br>
						</c:otherwise>
						</c:choose> --%>
						<div class="mb-4" style="height: 17rem; overflow:scroll; margin: 20px 0px;">
						<p class="card-text" style=" text-overflow: ellipsis">${m1.DETAIL}</p>
						</div>
						<small>시작일 ${fn:substring(m1.CREATEDAT, 0, 10)}</small>
						<div style="height:10px"></div>
						<c:choose>
                    <c:when test="${0 eq m2.USERTYPE}">
					  <a style="color: gray; margin-top:10px;" id="list-setting-list" data-toggle="list" href="#setting" role="tab" aria-controls="setting" > 관리하기> </a><br>
					</c:when>
                      <c:when test="${1 eq m2.USERTYPE && 0 eq m2.USERSTATUS }">
                      <br>
                      <button type="button" id="withdrawCheckModalBtn" class="btn btn-link"  data-toggle="modal" data-target="#withdrawAskModal" style="color: gray;">탈퇴하기></button><br>
						</c:when>
						</c:choose>
					</div>
				<div style="height:5px"></div>
				</div>
			    <center>
				<c:choose>
                        <c:when test="${0 eq m2.USERTYPE}"><button class="selectWaitingList btn btn-success col-11" disabled="" data-toggle="modal" data-target="#listModal">새로운 가입 요청</button></c:when>
                        <c:when test="${1 eq m2.USERSTATUS}"><button class="cancelAskModalBtn btn btn-dark col-11" data-toggle="modal" data-target="#cancelAskModal">요청 취소하기</button></c:when>
                        <c:when test="${empty m2.USERSTATUS || 2 eq m2.USERSTATUS}"><button class="joinButton btn btn-outline-info col-11" data-toggle="modal" data-target="#joinModal">참여 신청하기</button></c:when>
                    </c:choose>
				</center>
				</div>
				</div>
			

