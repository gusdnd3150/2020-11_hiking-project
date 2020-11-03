<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<jsp:include page="/common/header.jsp" flush="false" />
<style>
		.card {
	margin: 10px auto;
}

#space {
	width: 50px;
}

.list-group-item.active {
	background-color: green;
	border-color: green;
}

#leftSide {
	position: fixed;
} 

 #rightSide {
	width: 100px;
	position: fixed;
} 
</style>
			<div class="container mt-4">
	<div class="row pt-5">
			<div class="col-md-3"  >
			<div id="leftSide">
				<div class="card col-sm-12" style="border: 2px solid green; width: 15rem; padding:0;">
					<img src="/resources/img/${m3.STOREDFILENAME}" style="width:100%; height:200px;"
						class="card-img-top" alt="산모임 기본 이미지">
					<div class="card-body">
						<h5 class="card-title">${m1.NAME}</h5>
						<small>멤버 ${m1.STAFFCURRENT}</small> <br>
						<small>지역 ${m1.AREA}</small> <br> 
						<small>성별 ${m1.SEX}</small> <br>
						<c:choose>
						   <c:when test="${0 eq m1.AGESTART && 0 eq m1.AGEEND}">
						   <small>연령 무관</small> <br> <br>
						   </c:when>
						   <c:otherwise>
						<small>연령 ${m1.AGESTART}~${m1.AGEEND}</small> <br> <br>
						</c:otherwise>
						</c:choose>
						<p class="card-text" style="display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis">${m1.DETAIL}</p>
						<small>시작일 ${fn:substring(m1.CREATEDAT, 0, 10)}</small> <br>
						<c:choose>
                    <c:when test="${0 eq m2.USERTYPE}">
                    <br>
				
					  <a style=" color: gray;" id="list-setting-list" data-toggle="list" href="#setting" role="tab" aria-controls="setting" > 관리하기> </a><br>
				
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
				<div>
			</div>
			
			<!-- MODAL -->
			    <div class="modal fade" id="listModal">
        <div class="modal-dialog modal-lg" id="modal1">
            <div class="modal-content">
                <!-- header -->
                <div class="modal-header">
                    <h4 class="modal-title">가입 	요청 리스트</h4>
                    <!-- 닫기(x) 버튼 -->
                    <button type="button" class="close" data-dismiss="modal" onclick="window.location.reload();">×</button>
                    <!-- header title -->
                </div>
                <!-- body -->
                <div class="modal-body">
                    <ul id="waitingList" class="pl-3 pr-3" style="font-size: 18px">
                    </ul>
                </div>
                <!-- Footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.location.reload();">닫기</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="joinModal">
        <div class="modal-dialog" id="modal2">
            <div class="modal-content">
                <!-- header -->
                <div class="modal-header">
                    <h4 class="modal-title">${m1.NAME} 참여하기</h4>
                  <!--   <!-- 닫기(x) 버튼 -->
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <!-- header title -->
                </div>
                <!-- body -->
                <div class="modal-body">
                    <textarea id="userComment" class="form-control col-xs-12" placeholder="요청 메시지를 입력해주세요"></textarea>
                </div>
                <!-- Footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                    <button type="button" class="joinGroupBtn btn btn-success">신청</button>
                </div>
            </div>
        </div>
    </div>
    
    
<!--    가입신청확인 모달 -->
    <div class="modal fade" id="cancelAskModal">
        <div class="modal-dialog" id="modal3">
            <div class="modal-content">
                <!-- header -->
                <div class="modal-header">
                    <h4 class="modal-title">${m1.NAME} 가입 신청 취소하기</h4>
                    <!-- 닫기(x) 버튼 -->
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <!-- header title -->
                </div>
                <!-- body -->
                <div class="modal-body">
                    정말로 취소하시겠습니까?
                </div>
                <!-- Footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                    <button type="button" class="cancelAskBtn btn btn-outline-success">확인</button>
                </div>
            </div>
        </div>
    </div>
	
			
	<!-- 탈퇴 확인모달 -->
	<div class="modal fade" id="withdrawAskModal">
        <div class="modal-dialog" id="modal4">
            <div class="modal-content">
                <!-- header -->
                <div class="modal-header">
                    <h4 class="modal-title">${m1.NAME} 탈퇴하기</h4>
                    <!-- 닫기(x) 버튼 -->
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <!-- header title -->
                </div>
                <!-- body -->
                <div class="modal-body">
                    정말로 탈퇴하시겠습니까?
                </div>
                <!-- Footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                    <button type="button"id="withdrawBtn" class=" btn btn-outline-success">확인</button>
                </div>
            </div>
        </div>
    </div>
    
    
    <!-- 산모임 삭제 확인모달 -->
	<div class="modal fade" id="deleteAskModal">
        <div class="modal-dialog" id="modal5">
            <div class="modal-content">
                <!-- header -->
                <div class="modal-header">
                    <h4 class="modal-title">산모임 ${m1.NAME} 삭제하기</h4>
                    <!-- 닫기(x) 버튼 -->
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <!-- header title -->
                </div>
                <!-- body -->
                <div class="modal-body">
                    정말로 산모임을 지우시겠습니까?
                </div>
                <!-- Footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                    <button type="button"id="deleteCommuBtn" class=" btn btn-outline-success">확인</button>
                </div>
            </div>
        </div>
    </div>
			
			
