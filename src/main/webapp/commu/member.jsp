<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <div class="tab-pane fade" id="member" role="tabpanel" aria-labelledby="list-member-list">
	<div class="row pt-3">
		<h3>&nbsp&nbsp&nbsp오름 멤버</h3>
		<div style="width:43%"></div>
		<c:if test='${0 eq m2.USERTYPE}'>
      <!-- <button id='" + userId + "' onclick='forceWithdrawCheckModalBtn(this.id)' class='btn btn-link'  data-toggle='modal' data-target='#withdrawAskModal' style='color: lightGray;'>멤버 강퇴</button> -->   
           <button id="mandate" class="btn btn-link" data-toggle="modal" data-target="#mandateModal" style='color: Gray;'>대표 위임</button>               		
           <button id="forceWithdraw" class="btn btn-link" data-toggle="modal" data-target="#forceWithdrawModal" style='color: Gray;'>멤버 강퇴</button>               		
        <!-- <button id='" + userId + "' onclick='mandate(this.id)' class='btn btn-link'  data-toggle='modal' data-target='#withdrawAskModal' style='color: lightGray;'>대표 위임</button> -->                  		
        </c:if>
	</div>
<ul class="list-group mt-4" id="memberList" >
<div id="leader"></div>
<div id="members"></div>
</ul>


</div>

    <!-- 강퇴 모달 -->
	<div class="modal fade" id="forceWithdrawModal">
        <div class="modal-dialog modal-lg" id="modal6">
            <div class="modal-content">
                <!-- header -->
                <div class="modal-header">
                    <h4 class="modal-title">강퇴 할 멤버</h4>
                    <!-- 닫기(x) 버튼 -->
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <!-- header title -->
                </div>
                <div class="modal-body">
                     <ul class="commuMemberList1"></ul>
                </div>
            </div>
        </div>
    </div>
    
    
    <!-- 대표 위임모달 -->
<div class="modal fade" id="mandateModal">
        <div class="modal-dialog modal-lg" id="modal7">
            <div class="modal-content">
                <!-- header -->
                <div class="modal-header">
                    <h4 class="modal-title">대표를 위임 할 멤버</h4>
                    <!-- 닫기(x) 버튼 -->
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <!-- header title -->
                </div>
                <div class="modal-body">
                     <ul class="commuMemberList2"></ul>
                </div>
            </div>
        </div>
    </div>
</html>

   