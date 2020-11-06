<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>취소요청상세보기</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
.basic_btn {
	display: inline-block;
	max-width: 110px;
	width: 100%;
	line-height: 35px;
	font-size: 15px;
	border: 1px solid #007bff;
	border-radius: 10px;
}

.basic_btn1 {
	display: inline-block;
	max-width: 110px;
	width: 100%;
	line-height: 17px;
	font-size: 15px;
	border: 1px solid #007bff;
	border-radius: 10px;
}
</style>
<script type="text/javascript">
//중고거래 취소 사유 모달창
$(document).on('click', '#_usedComment', function(e) {
	var userNum = $("#_userNum").val();
	e.preventDefault();
	$('#recipient-name').val(userNum);
});

//취소사유 등록
$(document).on('click', '#comment', function(e) {
	e.preventDefault();
	$.ajax({
		type : 'post',
		url : 'usedComment.do',
		data : {
			comment : $('#message-text').val(),
			userNum : $('#recipient-name').val(),
			prodNum : $('#_prodNum').val()
		},
		success : function(data) {
			if ("ok"== (data)) {
				alert("중고 취소 사유 등록완료");
				end();
				
			}
		}
	})

});

//팝업창 종료
function end(){
	  opener.location.reload();
	    close();
};
	 
//중고거래 승인 포인트 지급
 function insertPoint(){
	 //e.preventDefault();
		$.ajax({
			type : 'post',
			url : 'insertPoint.do',
			data : {
				userNum : $('#_userNum').val(), //고객번호
				point : $('#_point').val(),	//지급 포인트
				phone : $('#_phone').val(),	//문자발송 전화번호
				userName : $('#_userName').val(),	//문자발송 고객이름
				prodNum : $('#_prodNum').val()
			},
			success : function(data) {
				if ("ok"== (data)) {
					
					alert("거래승인 포인트 지급");
					end();
					
				}
			}
		})
 }
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
		<div class="row">
			<div class="col-sm-12 text-center">
				<div class="col-sm-3"></div>

				<div class="col-sm-6">
				
					<h2>취소 요청 상세 정보</h2>
					
					<table class="b_table">
						<colgroup>
							<col style="width: 20%">
							<col style="width: 15%">
							<col style="width: 20%">
							<col style="width: 20%">
							<col style="width: 25%">
						
						</colgroup>			
						<thead>		
							<tr>
								<th>요청일자</th>
								<th>번호</th>
								<th>이름</th>
								<th>아이디</th>
								<th>연락처</th>
								
							</tr>
						</thead>
						<c:forEach var="usedProd" items="${list}" >
						<tbody>						
							<tr>
								<td><input type="text" class="form-control" value="${usedProd.createdAtString}" disabled></td>
								<td><input type="text" class="form-control" id="_userNum"value="${usedProd.userNum}" disabled></td>
								<td><input type="text" class="form-control" id="_userName" value="${usedProd.userName}" disabled></td>				
								<td><input type="text" class="form-control" value="${usedProd.id}" disabled></td>
								<td><input type="text" class="form-control" id="_phone" value="${usedProd.phone}" disabled></td>
								
							</tr>				
						</tbody>
						
					</table>
				
					<table class="table table-boardered">
					
						<tr>
							<th>상품번호</th>
								<td><input type="text" class="form-control"  id="_prodNum"value="${usedProd.prodNum}"></td>
						</tr>
						<tr>
							<th>상품내용</th>
							<td><input type="text" class="form-control"  value="${usedProd.content}"></td>
						</tr>
						<tr>
							<th>판매가격</th>
							<td><input type="text" class="form-control"  id = "_point" value="${usedProd.priceString}"></td>
						</tr>
						</c:forEach>
						
						<c:forEach var="prodOption" items="${list2}" >
						<tr>
							<th>옵션번호</th>
								<td><input type="text" class="form-control" value="${prodOption.optionNum}"></td>
						</tr>
						<tr>
							<th>사이즈</th>
							<td><input type="text" class="form-control"  value="${prodOption.prodsize}"></td>
						
						</tr>
						<tr>
							<th>색상</th>
							<td><input type="text" class="form-control"  value="${prodOption.color}"></td>
							
						</tr>
						<tr>
							<th>수량</th>
							<td><input type="text" class="form-control"  value="${prodOption.quantity}"></td>
							
						</tr>
						</c:forEach>
						<tr>
							<th></th>
							<td><h4>상품사진</h4></td>
						</tr>
						<c:forEach var="photoMain" items="${list3}" >
						<tr>
							<th>대표 이미지</th>
							<td><center><img src="/resources/img/${photoMain.pcontent}"  style="width: 250px; height: 250px; display: block;"></center>
							</td>
							</td>
						</tr>
						</c:forEach>
						<c:forEach var="photoDetail" items="${list4}" >
						<tr>
							<th>상세 이미지</th>
							<td><center><img src="/resources/img/${photoDetail.pcontentDetail}"  style="width: 250px; height: 250px; display: block;"></center>
							</td>
						</tr>
						<tr>
							<th></th>
							<td></td>
						</tr>
						</c:forEach>
						<tr>
							<th>거래 선택</th>
							<td><button type="button"  id="_usedComment"class="basic_btn1 btn-primary btn-xs"data-toggle="modal" data-target="#exampleModal" >거래취소</button>
							<button type="button"  class="basic_btn1 btn-primary btn-xs" onclick="insertPoint()" >거래승인</button>
							</td>
						</tr>
						<tr>
							<th></th>
							<td> <center> <button type="button" id="end"class="basic_btn1 btn-primary btn-xs" onclick="end()">확인</button></center></td>
						</tr>
					</table>
					<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog" role="document">
							 <%@ include file="../admin/e_p002_usedModal.jsp"%>		
					  </div>

				</div>

			</div>
		</div>
	</div>
	</div>

</body>
</html>