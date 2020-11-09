<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>
#SSpace {
	width: 280px;
}
</style>
 <div class="tab-pane fade" id="schedule" role="tabpanel" aria-labelledby="list-schedule-list">
<div class="row pt-3">
		<h3>&nbsp&nbsp&nbsp산악회 일정</h3>
		<div id="SSpace" ></div>
		<button type="file" style="float: right;" class="btn btn-outline-success" data-toggle="modal" data-target="#createModal">등산일정 계획하기</button>
	</div>

<div class="card-list" ></div>

<div class="modal fade" id="createModal" role="dialog">
    <div class="modal-dialog" style="max-width: 100%; width: auto; display: table">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">인원 설정</h4>
                <button type="button" class="close" data-dismiss="modal">x</button>
            </div>
            <div class="modal-body row" style="text-align: center">
                <div class="col-6">
                    <img src="../resources/img/select1.png" style="width: 250px; height: 250px; display: block;">
                    <button class="btn btn-primary" onclick="create1()">1인</button>
                </div>
                <div class="col-6" style="text-align: center">
                    <img src="../resources/img/select2.png" style="width: 250px; height: 250px; display: block">
                    <button class="btn btn-primary" onclick="create2()">2인이상</button>
                </div>
            </div>
        </div>
    </div>
</div>






</div>
</html>