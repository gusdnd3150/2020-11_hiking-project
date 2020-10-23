<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
.container3 {
	padding: 20px 10px;
}
</style>

<div class="tab-pane fade" id="setting" role="tabpanel"
	aria-labelledby="list-setting-list">
 	<div style="border: 1px solid green;" >
		<!-- <div style="padding:30px;">
		</div> -->
				<h3 class="mt-3">&nbsp&nbsp&nbsp산모임 설정</h3>
		<div class="container3 row text-center">
		<div style="width:20px;"></div>
			<h5 class="mt-2">산모임 공개</h5>
			<div style="width:20px;"></div>
			<div class="btn-group_t" role="group" aria-label="...">
				<button type="button" id="open"
					class="btn btn-primary button-class1">공개</button>
				<button type="button" id="close"
					class="btn btn-default button-class2">비공개</button>
			</div>
		</div>
		<div>
		  <h5 for="detail">&nbsp&nbsp&nbsp산모임 소개</h5>
		  <div class="row">
          	<div style="width:50px;"></div><textarea class="form-control" style="width:82%;" rows="4" id="detail">${m1.DETAIL}</textarea><br>
		</div>
		<div style="height:25px;"></div>
		</div> 
		  <div class="mb-3 col-6">
            <h5 for="area">모임 지역</h5>
            <select class="custom-select" id="area">
                <option value="전체">전체</option>
                <option value="서울">서울</option>
                <option value="경기">경기</option>
                <option value="강원">강원</option>
            </select>
        </div>
        		<div style="height:25px;"></div>
        <div class="mb-3 col-12">
            <h5 for="image">이미지</h5>
            <div id="image" class="input_wrap">
                <form id="filesForm" method="post" enctype="multipart/form-data" >
               <input type="file" name="file" />
                </form>
                <div class="preview pt-3 row">
                </div>
            </div>
        </div>
        		<div style="height:25px;"></div>
                        <div class="mb-3 col-6">
                            <pre></pre>
                            <h5 for="age">나이대 설정</h5>
                            <div id="age">
                                <select class="custom-select" id="ageStart">
                                    <option value="0" >최소</option>
                                    <option value="10">10</option>
                                    <option value="20">20</option>
                                    <option value="30">30</option>
                                    <option value="40">40</option>
                                    <option value="50">50</option>
                                    <option value="60">60</option>
                                    <option value="70">70</option>
                                    <option value="80">80</option>
                                </select>
                                <select class="custom-select" id="ageEnd">
                                    <option value="0" >최대</option>
                                    <option value="10">10</option>
                                    <option value="20">20</option>
                                    <option value="30">30</option>
                                    <option value="40">40</option>
                                    <option value="50">50</option>
                                    <option value="60">60</option>
                                    <option value="70">70</option>
                                    <option value="80">80</option>
                                </select>
                            </div>
                        </div>
		<div style="height:25px;"></div>
                        <div class="mb-3 col-6">
                            <h5 for="sex">성별</h5>
                            <select class="custom-select" id="sex">
                                <option value="무관" selected>무관</option>
                                <option value="남자">남자</option>
                                <option value="여자">여자</option>
                            </select>
                        </div>
            <div class="p-3" style="text-align: right">
                <input type="reset" class="btn btn-light" style="width: 75px" value="취소">
                <input type="button" class="btn btn-primary" id="update" style="width: 75px" value="등록">
            </div>
        </div>
   </div>



	
