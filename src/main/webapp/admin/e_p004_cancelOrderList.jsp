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



function end(){
	  opener.location.reload();
	    close();
};

function cancelPay() {

    $.ajax({
      type:"post",
       async:true,
       url:"/E_P003_D001/cancelPay",
       data:{imp_uid:$('#imp_uid').val(),
    	   		merchant:$('#merchant_uid').val()
    	   		},
		       success:function(data,textStatus){
		   		if ("ok"== (data)) {
					console.log("결제 취소 완료");
					 var queryString = $('#option').serialize();
				       $.ajax({
				          type : 'post',
				          url : 'upDateCancel.do',
				          data : queryString,
				          success : function(data){
				        		if ("ok"== (data)) {
				        			$.ajax({
				        				type : 'post',
				        				url : 'cancelMessage.do',
				        				data : {
				        					phone : $("#custPhone").val(),
				        					name : $("#custName").val()
				        				},
				        				success : function(data) {
				        					if ("ok"== (data)) {
				        						alert("문자 발송 완료");
				        						
				        					}
				        				}
				        			});
									
								}
				          }
				      });  

					}
       			},
      		 error:function(data,textStatus){
       		}
  	 	});  

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
							<col style="width: 40%">
							<col style="width: 30%">
							<col style="width: 10%">
							<col style="width: 20%">
						</colgroup>			
						<thead>		
							<tr>
								<th>결제번호</th>
								<th>주문일자</th>
								<th>고객이름</th>
								<th>결제금액</th>
								<!-- <th>배송비</th> -->
							</tr>
						</thead>
						<c:forEach var="viewList" items="${list}" >
						<tbody>						
							<tr>
								<td><input type="text" class="form-control" id = "merchant_uid" value="${viewList.merchant_uid}" disabled></td>
								<td><input type="text" class="form-control" value="${viewList.orderDatString}" disabled></td>
								<td><input type="text" class="form-control" id ="custName" value="${viewList.custName}" disabled></td>				
								<td><input type="text" class="form-control" value="${viewList.totalpay}" disabled></td>
								<td><input type="hidden"  id="imp_uid"  id = "imp_uid" value="${viewList.imp_uid}"></td>
							</tr>				
						</tbody>
					</table>
				
					<table class="table table-boardered">
						<tr>
							<th>취소 사유</th>
								<td><input type="text" class="form-control"  value="${viewList.preason}"></td>
						</tr>
						<tr>
							<th>전화번호</th>
								<td><input type="text" class="form-control" id="custPhone" value="${viewList.custPhone}"></td>
						</tr>
						<tr>
							<th>우편번호</th>
							<td><input type="text" class="form-control"  value="${viewList.zoneCode}"></td>
							
						</tr>
						<tr>
							<th>주소</th>
							<td><input type="text" class="form-control"  value="${viewList.address}"></td>
						
						</tr>
						<tr>
							<th>상세주소</th>
							<td><input type="text" class="form-control"  value="${viewList.address2}"></td>
							
						</tr>
						</c:forEach>
							<tr>
							<th></th>
							
							<td><h4>상품 정보</h4></td>
							
						</tr>
						<form name ="option" id="option" method="post" >
						<c:forEach var="viewList2" items="${list2}" >
					
						<tr>
							<th>상품명</th>
							<td><input type="text" class="form-control"  value="${viewList2.prodName}"></td>
						</tr>
						<tr>
							<th>주문번호</th>
							<td><input type="text" class="form-control"  id="orderNum" name ="orderNum" value="${viewList2.orderNum}"></td>
						</tr>
						
						<tr>
							<th>옵션번호</th>
							<td><input type="text" class="form-control" id="optionnum" name ="optionnum" value="${viewList2.optionnum}"></td>
							
						</tr>
						<tr>						 
							<th>사이즈</th>
							<td><input type="text" class="form-control"  value="${viewList2.prodSize}"></td>
						</tr>
						<tr>
							<th>색상</th>
							<td><input type="text" class="form-control"  value="${viewList2.color}"></td>
						</tr>
						<tr>
							<th>주문수량</th>
							<td><input type="text" class="form-control"  id="quantity" name ="quantity"value="${viewList2.quantity}"></td>
						</tr> 	
						
						<tr>
							<th>대표 이미지</th>
							<td><img src="http://localhost:8090/resources/img/${viewList2.content}"  style="width: 250px; height: 250px; display: block;">
							</td>
						</tr>
						<tr>
							<th></th>
							<td></td>
						</tr>
						
						</c:forEach>
						</form> 
						<tr>
							<th>취소요청</th>
							<td><button type="button" id="cancelPay" class="basic_btn1 btn-primary btn-xs" onclick="cancelPay()" >승인</button></td>
						</tr>
						<tr>
						
							<th></th>
							<td> <center> <button type="button" id="end"class="basic_btn1 btn-primary btn-xs" onclick="end()">확인</button></center></td>
						</tr>
					</table>

				</div>

			</div>
		</div>
	</div>

</body>
</html>