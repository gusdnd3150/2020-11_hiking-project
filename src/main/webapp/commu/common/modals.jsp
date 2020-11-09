<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	request.setCharacterEncoding("UTF-8");
pageContext.setAttribute("loginID", request.getSession().getAttribute("LOGIN"));
%>
<!DOCTYPE html>
<html>
			<!-- MODAL -->
			    <div class="modal fade" id="listModal" style="z-index:9999;">
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
    <div class="modal fade" id="joinModal" style="z-index:9999;">
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
    <div class="modal fade" id="cancelAskModal" style="z-index:9999;">
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
	<div class="modal fade" id="withdrawAskModal" style="z-index:9999;">
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
	<div class="modal fade" id="deleteAskModal" style="z-index:9999;">
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
			

<!--게시글 수정 Modal -->
<div class="modal fade" id="postUpdateForm" tabindex="-1" style="z-index:9999;" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel"> 피드 수정하기</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			  <form action="/commu/updatePost.do" method="post">
			<div class="modal-body">
					 <div class="col-sm-5">
							<div class="input-group mb-2 row">
						    	 <p>&nbsp&nbsp공지게시글로 작성하기</p>
							     <input style="margin: 5px 20px;" type="checkbox" id="importantPost" name="type" value="1">
							</div>
					 </div> 
				<div class="row justify-content-md-center">
					<div class="col_c">
						<div class="input-group"   id="updateFeedContentDiv">
							<textarea class="form-control" name="updateFeedContent" id="updateFeedContent"></textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="submit" class="btn btn-success">게시글 수정</button>
			<input type="hidden" name="groupNum" value="${m1.GROUPNUM}" style="display: none;">
			<input type="hidden" id="postNum"name="postNum" value="" style="display: none;">
			</div>
			 </form>
		</div>
	</div>
</div>	













</html>