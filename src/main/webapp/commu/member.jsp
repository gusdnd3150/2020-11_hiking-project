<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <div class="tab-pane fade" id="member" role="tabpanel" aria-labelledby="list-member-list">
<form action="/commu/selectMemberList.do" method="post" id="memberList">
<input type="hidden" value="${m1.GROUPNUM}" name="groupNum">
</form>
<ul class="list-group">
  <li class="list-group-item">
  <img src="" class="mr-3" alt="...">
    <div class="media-body">
      <h5 class="mt-0 mb-1">List-based media object</h5>
      Cras sit amet nibh libero, in gravida nulla. 
    </div>
  </li>
</ul>


</div>
</html>

   