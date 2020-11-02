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
<meta charset="utf-8">
<title>상풍등록</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>회원가입</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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

</head>
<script>
//1차 분류 선택시 2차 분류 셀렉트

	function selectprodcategory1(value){
	$("#prodcategory2").empty();
	if (value == 'a') {
		$("#prodcategory2")
				.append(
						"<br>"
								+ "<select id='prodcategory2'  name='prodcategory2' class='basic_btn btn-primary' onchange='selectprodcategory2(this.value)'>"
								+ "<option value=' '>2차분류 </option>"
								+ "<option value='d'>상의</option>"
								+ "<option value='e'>하의</option>"
								+ "<option value='f'>아우터</option>"
								+ "</select>");
	} else if (value == 'b') {
		$("#prodcategory2")
				.append(
						"<br>"
								+ "<select id='prodcategory2'  name='prodcategory2' class='basic_btn btn-primary' onchange='selectprodcategory2(this.value)'>"
								+ "<option value=' '>2차분류 </option>"
								+ "<option value='g'>모자</option>"
								+ "<option value='h'>양말</option>"
								+ "<option value='i'>가방</option>"
								+ "<option value='j'>신발</option>"
								+ "</select>");
	} else if (value == 'c') {
		$("#prodcategory2")
				.append(
						"<br>"
								+ "<select id='prodcategory2' name='prodcategory2' class='basic_btn btn-primary' onchange='selectprodcategory2(this.value)'>"
								+ "<option value=' '>2차분류 </option>"
								+ "<option value='k'>스틱</option>"
								+ "<option value='k'>장갑</option>"
								+ "<option value='k'>아이젠</option>"
								+ "<option value='k'>보호대</option>"
								+ "</select>");
		}
	
};

//3차분류
function selectprodcategory2(value){
	$("#prodcategory3").empty();
	if (value == 'd') {
		$("#prodcategory3")
				.append(
						"<br>"
								+ "<select id='category' name='prodcategory3' class='basic_btn btn-primary' onchange='category(this.value)'>"
								+ "<option value=' '>3차분류 </option>"
								+ "<option value='15'>반팔</option>"
								+ "<option value='16'>긴팔</option>"
								+ "<option value='17'>후드</option>"
								+ "</select>");
	} else if (value == 'e') {
		$("#prodcategory3")
				.append(
						"<br>"
								+ "<select id='category' name='prodcategory3' class='basic_btn btn-primary'  onchange='category(this.value)>"
								+ "<option value=' '>3차분류 </option>"
								+ "<option value='18'>반바지</option>"
								+ "<option value='19'>긴바지</option>"
								+ "</select>");
	} else if (value == 'f') {
		$("#prodcategory3")
				.append(
						"<br>"
								+ "<select id='category' name='prodcategory3' class='basic_btn btn-primary'  onchange='category(this.value)>"
								+ "<option value=' '>3차분류 </option>"
								+ "<option value='20'>패딩</option>"
								+ "<option value='21'>야상</option>"
								+ "<option value='22'>바람막이</option>"
								+ "</select>");
	} else if (value == 'g') {
		$("#prodcategory3")
				.append(
						"<br>"
								+ "<select id='category' name='prodcategory3' class='basic_btn btn-primary' onchange='category(this.value)>"
								+ "<option value=' '>3차분류 </option>"
								+ "<option value='23'>비니</option>"
								+ "<option value='24'>캡모자</option>"
								+ "<option value='25'>정글모</option>"
								+ "<option value='26'>썬캡</option>"
								+ "</select>");
	} else if (value == 'h') {
		$("#prodcategory3")
				.append(
						"<br>"
								+ "<select id='category' name='prodcategory3' class='basic_btn btn-primary'  onchange='category(this.value)>"
								+ "<option value=' '>3차분류 </option>"
								+ "<option value='27'>긴양말</option>"
								+ "<option value='28'>반양말</option>"
								+ "<option value='29'>발가락양말</option>"
								+ "</select>");
	} else if (value == 'i') {
		$("#prodcategory3")
				.append(
						"<br>"
								+ "<select id='category' name='prodcategory3' class='basic_btn btn-primary'  onchange='category(this.value)>"
								+ "<option value=' '>3차분류 </option>"
								+ "<option value='30'>백팩</option>"
								+ "<option value='31'>크로스백</option>"
								+ "</select>");
	} else if (value == 'j') {
		$("#prodcategory3")
				.append(
						"<br>"
								+ "<select id='category' name='prodcategory3' class='basic_btn btn-primary' onchange='category(this.value)>"
								+ "<option value=' '>3차분류 </option>"
								+ "<option value='32'>등산화</option>"
								+ "</select>");

	} else if (value == 'k') {
		$("#prodcategory3")
				.append(
						"<br>"
								+ "<select id='category' name='prodcategory3' class='basic_btn btn-primary' onchange='category(this.value)>"
								+ "<option value=' '>3차분류 </option>"
								+ "<option value='11'>스틱</option>"
								+ "<option value='12'>장갑</option>"
								+ "<option value='13'>아이젠</option>"
								+ "<option value='14'>보호대</option>"
								+ "</select>");
	}

};
	
//카테고리 수정 반영 (상품테이블)
function category (value){
	console.log("카테고리 수정");
	var _result = 'prodcategory';
	var _prodNum = $('#prodNum').val();
	var _prodcategorynum = value;
	
	console.log("_result    "+_result);
	console.log("_prodNum    "+_prodNum);
	console.log("_prodcategorynum    "+_prodcategorynum);
	
       $.ajax({
           type : 'get',
           url : 'updateDateProd.do',
           data : {
           	result : _result,
           	prodNum : _prodNum,
           	prodcategorynum : _prodcategorynum
           },
           success : function(data) {
           	if ("ok"== (data)) {
           		console.log("수정완료");
           		window.location.reload(true);
				} else {
					console.log("수정 실패");
				};
           	
           }
        })  
};



//상품명 수정 반영 (상품 테이블)
$(document).on("click", "#prodName1", function(){ 
	var _result = 'prodName';
	var _name = $('#prodName').val();
	var _prodNum = $('#prodNum').val();
	
	console.log("_result    "+_result);
	console.log("_name    "+_name);
	console.log("_prodNum    "+_prodNum);
	
       $.ajax({
           type : 'get',
           url : 'updateDateProd.do',
           data : {
           	result : _result,
           	name : _name,
           	prodNum : _prodNum
           },
           success : function(data) {
           	if ("ok"== (data)) {
           		console.log("수정완료");
           		window.location.reload(true);

				} else {
					console.log("수정 실패");
				};
           	
           }
        })  
	});

//가격 수정 반영 (상품 테이블)
$(document).on("click", "#price1", function(){ 
	var _result = 'price';
	var _price = $('#price').val();
	var _prodNum = $('#prodNum').val();
	
	console.log("_result    "+_result);
	console.log("_price    "+_price);
	console.log("_prodNum    "+_prodNum);
	
       $.ajax({
           type : 'get',
           url : 'updateDateProd.do',
           data : {
           	result : _result,
           	price : _price,
           	prodNum : _prodNum
           },
           success : function(data) {
           	if ("ok"== (data)) {
           		console.log("수정완료");
           		window.location.reload(true);

				} else {
					console.log("수정 실패");
				};
           	
           }
        })  
	});		
	
	
	
	
	
//재고 수정 반영 (옵션 테이블)
$(document).on("click", "#quantity1", function(){ 
	var _result = 'quantity';
	var _quantity = $('#quantity').val();
	var _optionNum = $('#optionNum').val();
	
	console.log("_result    "+_result);
	console.log("_quantity    "+_quantity);
	console.log("optionNum    "+_optionNum);
	
       $.ajax({
           type : 'get',
           url : 'updateDateProdOption.do',
           data : {
           	result : _result,
           	quantity : _quantity,
           	optionNum : _optionNum
           },
           success : function(data) {
           	if ("ok"== (data)) {
           		console.log("수정완료");
           		window.location.reload(true);

				} else {
					console.log("수정 실패");
				};
           	
           }
        })  
	});		
	
//사이즈 수정 반영 (옵션 테이블)
$(document).on("click", "#prodsize1", function(){ 
	var _result = 'prodsize';
	var _prodsize = $('#prodsize').val();
	var _optionNum = $('#optionNum').val();
	
	console.log("_result    "+_result);
	console.log("_prodsize    "+_prodsize);
	console.log("_optionNum    "+_optionNum);
	
       $.ajax({
           type : 'get',
           url : 'updateDateProdOption.do',
           data : {
           	result : _result,
           	prodsize : _prodsize,
           	optionNum : _optionNum
           },
           success : function(data) {
           	if ("ok"== (data)) {
           		console.log("수정완료");
           		window.location.reload(true);

				} else {
					console.log("수정 실패");
				};
           	
           }
        })  
	});	

//색상 수정 (옵션 테이블)
function colorUpdate (value){
	var _result = 'color';
	var _color = value;
	var _optionNum = $('#optionNum').val();
	
	console.log("_result    "+_result);
	console.log("_color    "+_color);
	console.log("_optionNum    "+_optionNum);
	
       $.ajax({
           type : 'get',
           url : 'updateDateProdOption.do',
           data : {
           	result : _result,
           	color : _color,
           	optionNum : _optionNum
           },
           success : function(data) {
           	if ("ok"== (data)) {
           		console.log("수정완료");
           		window.location.reload(true);
				} else {
					console.log("수정 실패");
				};
           	
           }
        })  
};

//구분 수정 (상품 테이블)
function typeUpdate (value){
	var _result = 'type';
	var _type = value;
	var _prodNum = $('#prodNum').val();
	
	console.log("_result    "+_result);
	console.log("_type    "+_type);
	console.log("_prodNum    "+_prodNum);
	
       $.ajax({
           type : 'get',
           url : 'updateDateProd.do',
           data : {
           	result : _result,
           	type : _type,
           	prodNum : _prodNum
           },
           success : function(data) {
           	if ("ok"== (data)) {
           		console.log("수정완료");
           		window.location.reload(true);
				} else {
					console.log("수정 실패");
				};
           	
           }
        })  
};

//상태 수정 (옵션 테이블)
function prodStatusUpdate (value){
	var _result = 'prodStatus';
	var _prodStatus = value;
	var _optionNum = $('#optionNum').val();
	
	console.log("_result    "+_result);
	console.log("_prodStatus    "+_prodStatus);
	console.log("_optionNum    "+_optionNum);
	
       $.ajax({
           type : 'get',
           url : 'updateDateProdOption.do',
           data : {
           	result : _result,
           	prodStatus : _prodStatus,
           	optionNum : _optionNum
           },
           success : function(data) {
           	if ("ok"== (data)) {
           		console.log("수정완료");
           		window.location.reload(true);
				} else {
					console.log("수정 실패");
				};
           	
           }
        })  
};

//상품 내용 (상품 테이블)
$(document).on("click", "#prodContent1", function(){ 
	var _result = 'prodContent';
	var _content = $('#content').val();
	var _prodNum = $('#prodNum').val();
	
	console.log("_result    "+_result);
	console.log("_content    "+_content);
	console.log("_prodNum    "+_prodNum);
	
       $.ajax({
           type : 'get',
           url : 'updateDateProd.do',
           data : {
           	result : _result,
           	content : _content,
           	prodNum : _prodNum
           },
           success : function(data) {
           	if ("ok"== (data)) {
           		console.log("수정완료");
           		window.location.reload(true);

				} else {
					console.log("수정 실패");
				};
           	
           }
        })  
	});	
	

//상품 메인 사진 수정
function modifyImageFileMain(mainImg,pphotonum){
 
 	var prodNum = $('#prodNum').val();
  
    var formData = new FormData();
    formData.append("main_file",$('#'+mainImg)[0].files[0]);
    formData.append("prodNum",prodNum);
    formData.append("pphotonum",pphotonum);
 
     $.ajax({
      url: 'upDateMainPhoto.do',
      processData: false,
      contentType: false,
      data: formData,
      type: 'POST',
	      success: function(data){
	        	if ("ok"== (data)) {
	           		console.log("수정완료");
	           		window.location.reload(true);
					} else {
						console.log("수정 실패");
					};
	      }
    }); 
 }

//상풍 디테일 사진 수정
function modifyImageFileDetail(detail_img,pphotonum){
	 
 	var prodNum = $('#prodNum').val();
 
    var formData = new FormData();
    formData.append("detail_file",$('#'+detail_img)[0].files[0]);
    formData.append("prodNum",prodNum);
    formData.append("pphotonum",pphotonum);
    
    console.log("prodNum" + prodNum);
    console.log("pphotonum    "+ pphotonum);

    
      $.ajax({
      url: 'upDateDetailPhoto.do',
      processData: false,
      contentType: false,
      data: formData,
      type: 'POST',
	      success: function(data){
	        	if ("ok"== (data)) {
	           		console.log("수정완료");
	           		window.location.reload(true);
					} else {
						alert("잘못된 입력입니다.")
					};
	      	}
   	 });  
  }


//상품 메인이미지선택 삭제
function removeImgMainImageFile(_pphotonum){
	
	var _prodNum = $('#prodNum').val();
	
    $.ajax({
        type : 'get',
        url : 'deleteImg.do',
        data : {
        	pphotonum : _pphotonum,
        	prodNum : _prodNum
        },
        success : function(data) {
        	if ("ok"== (data)) {
        		console.log("수정완료");
        		window.location.reload(true);

				} else {
					console.log("수정 실패");
				};
        	
        }
     })  
	
}

//상품 디테일이미지 선택 삭제
function removeImgDetailImageFile(_pphotonum){
	
	var _prodNum = $('#prodNum').val();
	
    $.ajax({
        type : 'get',
        url : 'deleteImg.do',
        data : {
        	pphotonum : _pphotonum,
        	prodNum : _prodNum
        },
        success : function(data) {
        	if ("ok"== (data)) {
        		console.log("수정완료");
        		window.location.reload(true);

				} else {
					console.log("수정 실패");
				};
        	
        }
     })  
	
}

//상품 메인 이미지 추가
  $(document).on( 'click', '#addMainImg', function () {
	  
		var form = $('#addMainImg')[0];
	 	var prodNum = $('#prodNum').val();
	 
	    var formData = new FormData(form);
	    formData.append("prodNum",prodNum);
	    
	    console.log("prodNum" + prodNum);

	       $.ajax({
	      url: 'upDateAddMainImg.do',
	      processData: false,
	      contentType: false,
	      data: formData,
	      type: 'POST',
		      success: function(data){
		        	if ("ok"== (data)) {
		           		console.log("수정완료");
		           		window.location.reload(true);
						} else {
							console.log("수정 실패");
						};
		      	}
	   	 });   
  })

//상품 디테일 이미지 추가
  $(document).on( 'click', '#addDetailImg', function () {
	  
		var form = $('#addDetailImg')[0];
	 	var prodNum = $('#prodNum').val();
	 
	    var formData = new FormData(form);
	    formData.append("prodNum",prodNum);

	       $.ajax({
	      url: 'upDateAddDetailImg.do',
	      processData: false,
	      contentType: false,
	      data: formData,
	      type: 'POST',
		      success: function(data){
		        	if ("ok"== (data)) {
		           		console.log("수정완료");
		           		window.location.reload(true);
						} else {
							console.log("수정 실패");
						};
		      	}
	   	 });   
  })	 

function end(){
		var upDate = "<c:out value="${upDatemsg}" />";
		if (upDate ==="ok") {
			 opener.location.reload();
			close();
		}
};
</script>
<body>


	<div class="container">
		<div class="row">
			<div class="col-sm-12 text-center">
				<div class="col-sm-3"></div>

				<div class="col-sm-6">
				
					<h2>상품 상세정보</h2>
			<c:forEach var="view" items="${viewList}" >
					<table class="b_table">
						<colgroup>
							<col style="width: 20%">
							<col style="width: 20%">
							<col style="width: 30%">
							<col style="width: 30%">
						</colgroup>			
						<thead>		
							<tr>
								<th>상품번호</th>
								<th>옵션번호</th>
								<th>등록일자</th>
								<th>수정일자</th>
							</tr>
						</thead>
						<tbody>						
							<tr>
								<td><input type="text" class="form-control" id="prodNum" value="${view.prodNum}" disabled></td>
								<td><input type="text" class="form-control" id="optionNum" value="${view.optionNum}" disabled></td>
								<td><input type="text" class="form-control"  value="${view.createdAtString}" disabled></td>				
								<td><input type="text" class="form-control"  value="${view.updatedatString}" disabled></td>
							</tr>				
						</tbody>
					</table>
					</c:forEach>
					<table class="table table-boardered">
					 <c:forEach var="viewList" items="${viewDetaList}" >
						<tr>
							<th>상품 분류</th>
							<td><input type="text" class="form-control"  id="prodcategorynum" value="${viewList.prodcategorynumString}" disabled></td>
							<td>
								<div>
									<select id="prodcategory1" name="prodcategory1" class="basic_btn btn-primary" onchange="selectprodcategory1(this.value)">
										<option value=" ">1차 분류</option>
										<option value="a">의류</option>
										<option value="b">잡화</option>
										<option value="c">등산용품</option>
									</select>
								</div> <!-- 2차 분류 생성 -->
								<div id="prodcategory2"></div> 
									<!--3차 분류 생성  -->
								<div id="prodcategory3"></div>

							</td>
						</tr>
						<tr>
							<th>상품명</th>
							<td><input type="text" class="form-control" id="prodName" value="${viewList.name}"></td>
							<td>
								<button type="button" id="prodName1"class="basic_btn1 btn-primary btn-xs">수정</button>
							</td>
						</tr>
						<tr>
							<th>상품가격</th>
							<td><input type="text" class="form-control" id="price" value="${viewList.priceString}"></td>
							<td>
								<button type="button" id="price1" class="basic_btn1 btn-primary btn-xs" >수정</button>
							</td>
						</tr>
						<tr>
							<th>재고</th>
							<td><input type="text" class="form-control" id="quantity" value="${viewList.quantity}"></td>
							<td>
								<button type="button" id="quantity1" class="basic_btn1 btn-primary btn-xs" >수정</button>
							</td>
						</tr>
						<tr>
							<th>사이즈</th>
							<td><input type="text" class="form-control" id="prodsize" value="${viewList.prodsize}"></td>
							<td>
								<button type="button" id="prodsize1" class="basic_btn1 btn-primary btn-xs">수정</button>
							</td>
						</tr>
						<tr>						 
							<th>색상</th>
							<td><select id="color" class="basic_btn btn-primary" onchange="colorUpdate(this.value)">
									<option value="white" ${viewList.color == 'white' ? 'selected="selected"' : ''}>white</option>
									<option value="black" ${viewList.color == 'black' ? 'selected="selected"' : ''}>black</option>
									<option value="red" ${viewList.color == 'red' ? 'selected="selected"' : ''}>red</option>
									<option value="blue" ${viewList.color == 'blue' ? 'selected="selected"' : ''}>blue</option>
									<option value="ogrange" ${viewList.color == 'ogrange' ? 'selected="selected"' : ''}>ogrange</option>
									<option value="yellow" ${viewList.color == 'yellow' ? 'selected="selected"' : ''}>yellow</option>
									<option value="green" ${viewList.color == 'green' ? 'selected="selected"' : ''}>green</option>
									<option value="violet" ${viewList.color == 'violet' ? 'selected="selected"' : ''}>violet</option>
									<option value="pink" ${viewList.color == 'pink' ? 'selected="selected"' : ''}>pink</option>
									<option value="navy" ${viewList.color == 'navy' ? 'selected="selected"' : ''}>navy</option>
									<option value="gray" ${viewList.color == 'gray' ? 'selected="selected"' : ''}>gray</option>
									<option value="etc" ${viewList.color == 'etc' ? 'selected="selected"' : ''}>etc</option>
							</select></td>
						</tr>
						<tr>
							<th>상품구분</th>
							<td><select id="type"  class="basic_btn btn-primary" onchange="typeUpdate(this.value)">
									<option value="1" ${viewList.type == 1 ? 'selected="selected"' : ''}>신상품</option>
									<option value="2" ${viewList.type == 2 ? 'selected="selected"' : ''}>중고품</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>상품상태</th>
							<td><select  id="prodStatus1" class="basic_btn btn-primary" onchange="prodStatusUpdate(this.value)">					
									<option value="1" ${viewList.prodstatus == 1 ? 'selected="selected"' : ''}>판매중</option>
									<option value="2" ${viewList.prodstatus == 2 ? 'selected="selected"' : ''}>품절</option>
							</select>
							</td>
						</tr>
						<tr>
							<th>상품내용</th>
							<td><textarea class="form-control" rows="5" name="content" id="content"  placeholder="${viewList.content}"></textarea></td>
							<td>
								<button type="button" id="prodContent1" class="basic_btn1 btn-primary btn-xs" >수정</button>
							</td>							
						</tr>
						</c:forEach>
						<form id="file_main" method="post" enctype="multipart/form-data"  >						
						  <c:forEach var="photoMainList" items="${viewPhotoMainList}" varStatus="itemNum" >   	 
						<tr>
							<th>대표 이미지</th>
							<td><img src="http://localhost:8090/resources/img/${photoMainList.pcontent}"  style="width: 250px; height: 250px; display: block;">
							<input type="file"  id="main_img${photoMainList.pphotonum}"  name="file"  />
							</td>
							<td>
								<button type="button" id="modifyImgMain" class="basic_btn1 btn-primary btn-xs"
								onClick="modifyImageFileMain('main_img${photoMainList.pphotonum}',${photoMainList.pphotonum})" >수정</button>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" id="removeImgMain" class="basic_btn1 btn-danger btn-xs"
								onClick="removeImgMainImageFile(${photoMainList.pphotonum})" >삭제</button>
							</td>					
						</tr>
						</c:forEach>		
							</form>
						<form id="file_detail" method="post" enctype="multipart/form-data"  >
						 <c:forEach var="photoDetailList" items="${viewPhotoDetail}" >  
						<tr>
							<th>상세 이미지</th>
							<td><img src="http://localhost:8090/resources/img/${photoDetailList.pcontentDetail}" style="width: 250px; height: 250px; display: block;">
							<input type='file'  id="detail_img${photoDetailList.pphotonum}" name='file2' />
							</td>
							<td>
								<button type="button" id="modifyImgDetail" class="basic_btn1 btn-primary btn-xs"
								onClick="modifyImageFileDetail('detail_img${photoDetailList.pphotonum}',${photoDetailList.pphotonum})" >수정</button>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<button type="button" id="modifyImgDetail" class="basic_btn1 btn-danger btn-xs"
								onClick="removeImgDetailImageFile(${photoDetailList.pphotonum})" >삭제</button>
							</td>	
						</tr>
						</c:forEach>
						</form>
						<form id="addMainImg" method="post" enctype="multipart/form-data"  >
						<tr>
							<th>대표 이미지 추가</th>
                            <td>
                                <input type='file' id="main_img_add" name='file' multiple />
                            </td>
                            <td>
                                <button type="button" id="addMainImg" class="basic_btn1 btn-primary btn-xs">추가</button>
                            </td>
						</tr>
						</form>
						
						<form id="addDetailImg" method="post" enctype="multipart/form-data"  >
						<tr>
							<th>상세 이미지 추가</th>
                            <td>
                                <input type='file' id="detail_img_add" name='file2' multiple  />
                            </td>
                             <td>
                                 <button type="button" id="addDetailImg" class="basic_btn1 btn-primary btn-xs">추가</button>
                            </td>
						</tr>	         
						</form>
						<tr>
							<th></th>
							<td> </center> <button type="button" id="end"class="basic_btn1 btn-primary btn-xs" onclick="end()">확인</button><center></td>
						</tr>
					</table>

				</div>

			</div>
		</div>
	</div>
</body>
</html>