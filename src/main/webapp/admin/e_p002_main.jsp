<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
     <%
     request.setCharacterEncoding("utf-8");
      %>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp"%>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- 데이터 테이블 -->
<!-- 데이터 테이블 css -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css" />

<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>

<script src=https://cdn.datatables.net/buttons/1.5.2/js/dataTables.buttons.min.js></script>
<!--  이거 없으면 버튼 안생김  -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<!--  //엑셀 -->
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script>
<!-- // 카피+ pdf -->
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>
<!--  // 프린트 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<!--  // pdf -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<!--  //pdf -->

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>

<!-- datatable-editor js 파일 -->
<script type="text/javascript" src="../resources/js/view/admin/datatable-editor.js"></script>
<script type="text/javascript">
/* 상품 조회 데이터 테이블 */
var	table = null;
$(document).ready(function() {
   table= $('#foo-table').DataTable({
    	"scrollY":        "200px",
        "scrollCollapse": true,
        "paging":         false,
        dom: 'Blfrtip',
  
		buttons: [
			{
				extend:'excel',
				text:'excel',
				filename:'상품관리',
				title:'오름마켓 상품목록'
			},
			{
				extend:'copy',
				text:'copy',
				title:'상품목록'
			},			
                'pdf', 'print'
            ]
    	});
   
   datatableEdit({
		dataTable : table,
		columnDefs : [
			
			{
				targets : 4
			},
			{
				targets : 5
			}
			
		],
		onEdited : function(prev, changed, index, cell) {
		
           console.log(prev, changed, index, cell);
           console.log(prev );
           console.log(changed);
           console.log(index);
           console.log(index['column']);
           
           var _value = changed;
           var _result = null;
           
           if(index['column']==4){
           	_result='quantity';
           }else if (index['column']==5){
           	_result='prodSize';
           }else if (index['column']==6){
           	_result='color';
           }else if (index['column']==9){
           	_result='prodstatus';
           }
          
           var  date =  index['row'];
           var date1 = date+1;
          
           var tr = $("#foo-table tr:eq("+date1+")");
           console.log(tr);
           var _prodNum = tr.find('td:eq(0)').text();
           var _optionNum = tr.find('td:eq(1)').text();
           var _quantity = tr.find('td:eq(4)').text();
           var _prodSize = tr.find('td:eq(5)').text();
           
            $.ajax({
               type : 'get',
               url : 'updateOption.do',
               data : {
               	optionNum : _optionNum,
               	prodNum : _prodNum,
               	quantity : _quantity,
               	prodSize : _prodSize

               	
               },
               success : function(data) {
               	if ("ok"== (data)) {
               		console.log("수정완료");

					} else {
						console.log("수정 실패");
					};
               	
               }
            })  
		}
	});
   
     $('#foo-table tbody').on( 'click', 'tr', function () {
	    if ( $(this).hasClass('selected') ) {
	        $(this).removeClass('selected');
	    }
	    else {
	        table.$('tr.selected').removeClass('selected');
	        $(this).addClass('selected');
	    }
	}); 

   
});
/* 중고품 요청폼 데이터 테이블 */
var	table2 = null;
$(document).ready(function() {
	table2=$('#foo-table2').DataTable({
		pagingType:"full_numbers",
    	   autoWidth: false,
		dom : 'Blfrtip',
		buttons : [ {
			extend : 'excel',
			text : 'excel',
			filename : '중고품 정보',
			title : '중고품 정보'
		}, {
			extend : 'copy',
			text : 'copy',
			title : '중고품 정보'
		}, 'pdf', 'print' ]
	});
	  $('#foo-table tbody2').on( 'click', 'tr', function () {
		    if ( $(this).hasClass('selected1') ) {
		        $(this).removeClass('selected1');
		    }
		    else {
		        table.$('tr.selected1').removeClass('selected1');
		        $(this).addClass('selected1');
		    }
		});
	  

});
	
	// 데이터테블 함수 끝----------------------------------------------------------------
	
	
	/* 중고품 입력창 막기 */
	  function used_searchOption(str) {
		    if(str=='a'){
		        $('#used_key_word').prop('disabled', true);
		    }else if(str=='b'){
		    	 $('#used_key_word').prop("disabled",true);
		    }else if (str=='c'){
		    	 $('#used_key_word').prop("disabled",true);
		    }else{
		    	  $('#used_key_word').prop("disabled",false);
		    
		    }
	};

	/* 상품 조회  입력창 막기 */
	function prodsearchOption(value){
		  if(value=='type1'){
		        $('#prod_key_word').prop('disabled', true);
		    }else if(value=='type2'){
		    	 $('#prod_key_word').prop("disabled",true);
		    }else if (value=='prodstatus1'){
		    	 $('#prod_key_word').prop("disabled",true);
		    }else if (value=='prodstatus2'){
		    	 $('#prod_key_word').prop("disabled",true);
		    }else if (value=='prodcategorynum1'){
		    	 $('#prod_key_word').prop("disabled",true);
		    }else if (value=='prodcategorynum2'){
		    	 $('#prod_key_word').prop("disabled",true);
		    }else if (value=='prodcategorynum3'){
		    	 $('#prod_key_word').prop("disabled",true);
		    }else{
		    	  $('#prod_key_word').prop("disabled",false);
		    
		    }
		
	};

	$(function insertProdMsg() { // 상품등록알림창
		var insertMsg = "<c:out value="${msg}" />";
		if (insertMsg == "ok") {
			alert("상품 등록 완료");
		}
	});




	//상품 상태 수정
	function prodStatus1(value, optionNum){
		var _result = 'prodStatus';
		var _optionNum = optionNum;
		var _prodStatus = value;
	$.ajax({
        type : 'get',
        url : 'updateDateProdOption.do',
        data : {
        	result : _result,
        	optionNum : _optionNum,
        	prodStatus : _prodStatus
        },
        success : function(data) {
        	if ("ok"== (data)) {
        		console.log("상품 상태 수정완료");
        		//window.location.reload(true);
				} else {
					console.log("상품 상태 수정 실패");
				};
       	 }
     })   
	
	};
	
	//상품 색상 수정
	function prodColor1(value, optionNum){
		var _result = 'color';
		var _optionNum = optionNum;
		var _color = value;
	$.ajax({
        type : 'get',
        url : 'updateDateProdOption.do',
        data : {
        	result : _result,
        	optionNum : _optionNum,
        	color : _color
        },
        success : function(data) {
        	if ("ok"== (data)) {
        		console.log("상품 색상 수정완료");
        		//window.location.reload(true);
				} else {
					console.log("상품 색상 수정 실패");
				};
       	 }
     })   
	
	};
	
	//상품 상세보기
	function viewProd (optionNum, prodNum){
		window.open('viewProdList.do?optionNum='+optionNum+'&prodNum='+prodNum, '상품상세정보','width=800px,height=800px,scrollbars=yes');
	};
	
	//중고품 상세보기
	function viewUsedList (prodNum, userNum){
		window.open('viewUsedList.do?prodNum='+prodNum+'&userNum='+userNum, '중고품거래요청','width=800px,height=800px,scrollbars=yes');
	};
	

// --------------------------상품등록-----------------------------------------------

    //1차 분류 선택시 2차 분류 셀렉트
    function selectprodcategory1(value){
        $("#prodcategory2").empty();
        
        if(value=='a'){
            $("#prodcategory2").append( "<select name='prodcategory2' class='basic_btn btn-primary' onchange='selectprodcategory2(this.value)'>"
                +"<option value=' '>2차분류 </option>"
                +"<option value='d'>상의</option>"
                +"<option value='e'>하의</option>"
                +"<option value='f'>아우터</option>"
                +"</select>"
            );
        }else if (value=='b'){
            $("#prodcategory2").append("<select name='prodcategory2' class='basic_btn btn-primary' onchange='selectprodcategory2(this.value)'>"
                +"<option value=' '>2차분류 </option>"
                +"<option value='g'>모자</option>"
                +"<option value='h'>양말</option>"
                +"<option value='i'>가방</option>"
                +"<option value='j'>신발</option>"
                +"</select>"
            );
        }else if (value=='c') {
            $("#prodcategory2").append("<select name='prodcategory2' class='basic_btn btn-primary' onchange='selectprodcategory2(this.value)'>"
                +"<option value=' '>2차분류 </option>"
                +"<option value='k'>스틱</option>"
                +"<option value='l'>장갑</option>"
                +"<option value='m'>아이젠</option>"
                +"<option value='n'>보호대</option>"
                +"</select>"
            );
        }
    }

    //2차 분류 선택시 3차 분류 셀렉트
    function selectprodcategory2(value){
        $("#prodcategory3").empty();
        if(value=='d'){
            $("#prodcategory3").append( "<select name='prodcategory3' class='basic_btn btn-primary' id='category'>"
                +"<option value=' '>3차분류 </option>"
                +"<option value='15'>반팔</option>"
                +"<option value='16'>긴팔</option>"
                +"<option value='17'>후드</option>"
                +"</select>"
            );
        }else if (value=='e'){
            $("#prodcategory3").append( "<select name='prodcategory3' class='basic_btn btn-primary'id='category'>"
                +"<option value=' '>3차분류 </option>"
                +"<option value='18'>반바지</option>"
                +"<option value='19'>긴바지</option>"
                +"</select>"
            );
        }else if (value=='f') {
            $("#prodcategory3").append( "<select name='prodcategory3' class='basic_btn btn-primary' id='category'>"
                +"<option value=' '>3차분류 </option>"
                +"<option value='20'>패딩</option>"
                +"<option value='21'>야상</option>"
                +"<option value='22'>바람막이</option>"
                +"</select>"
            );
        }else if (value=='g') {
            $("#prodcategory3").append("<select name='prodcategory3' class='basic_btn btn-primary'id='category'>"
                +"<option value=' '>3차분류 </option>"
                +"<option value='23'>비니</option>"
                +"<option value='24'>캡모자</option>"
                +"<option value='25'>정글모</option>"
                +"<option value='26'>썬캡</option>"
                +"</select>"
            );
        }else if (value=='h') {
            $("#prodcategory3").append( "<select name='prodcategory3' class='basic_btn btn-primary' id='category'>"
                +"<option value=' '>3차분류 </option>"
                +"<option value='27'>긴양말</option>"
                +"<option value='28'>반양말</option>"
                +"<option value='29'>발가락양말</option>"
                +"</select>"
            );
        }else if (value=='i') {
            $("#prodcategory3").append( "<select name='prodcategory3' class='basic_btn btn-primary' id='category'>"
                +"<option value=' '>3차분류 </option>"
                +"<option value='30'>백팩</option>"
                +"<option value='31'>크로스백</option>"
                +"</select>"
            );
        }else if (value=='j') {
            $("#prodcategory3").append("<select name='prodcategory3' class='basic_btn btn-primary'id='category'>"
                +"<option value=' '>3차분류 </option>"
                +"<option value='32'>등산화</option>"
                +"</select>"
            );

        }else if (value=='k') {
            $("#prodcategory3").append( "<select name='prodcategory3' class='basic_btn btn-primary'id='category'>"
                +"<option value=' '>3차분류 </option>"
                +"<option value='11'>스틱</option>"
                +"</select>"
            );
        }else if (value=='l') {
            $("#prodcategory3").append( "<select name='prodcategory3' class='basic_btn btn-primary'id='category'>"
                +"<option value=' '>3차분류 </option>"
                +"<option value='12'>장갑</option>"
                +"</select>"
            );
        }else if (value=='m') {
            $("#prodcategory3").append( "<select name='prodcategory3' class='basic_btn btn-primary'id='category'>"
                    +"<option value=' '>3차분류 </option>"
                    +"<option value='14'>아이젠</option>"
                    +"</select>"
                );
            }else if (value=='n') {
                $("#prodcategory3").append( "<select name='prodcategory3' class='basic_btn btn-primary' id='category'>"
                        +"<option value=' '>3차분류 </option>"
                        +"<option value='15'>보호대</option>"
                        +"</select>"
                    );
                }
    };
    var cnt3=1;
    
    //옵션 추가
    function addOption(){
        $("#sizeMain").append("<br><br>"+"<label for='title'>색상:</label><select name='color[]'class='basic_btn btn-default dropdown-toggle'>"
                +"<option value=' '>color</option>"
                +"<option value='white'>white</option>"
                +"<option value='black'>black</option>"
                +"<option value='red'>red</option>"
                +"<option value='blue'>blue</option>"
                +"<option value='ogrange'>ogrange</option>"
                +"<option value='yellow'>yellow</option>"
                +"<option value='green'>green</option>"
                +"<option value='violet'>violet</option>"
                +"<option value='pink'>pink</option>"
                +"<option value='navy'>navy</option>"
                +"<option value='gray'>gray</option>"
                +"<option value='etc'>etc</option>"
            +"</select>"
           +"<label for='title'>사이즈:</label>"
	       +"<input type='text' name='prodSize[]' value=''>"
	       +"<label for='title'>수량:</label>"
	       +"<input type='text' name='quantity[]' value=''>"

        );
        cnt3++;
    };
    

 //상품 가격 정규식
var regexp = /^[0-9]*$/
	function priceCheck(value){
		    if(regexp.test(value)){
		   	 $("#msg").html("");
			 $("#addProd").attr("disabled", false);
		 }else{
			 $("#msg").html("숫자만 입력해주세요");
			 $("#msg").css("color", "red");
			 $("#addProd").attr("disabled", true);
	 	}
};

//상품 수량 정규식
var regexp = /^[0-9]*$/
	function quantityCheck(value){
		    if(regexp.test(value)){
		   	 $("#msg1").html("");
			 $("#addProd").attr("disabled", false);
		 }else{
			 $("#msg1").html("숫자만 입력해주세요");
			 $("#msg1").css("color", "red");
			 $("#addProd").attr("disabled", true);
	 	}
};

//상품 등록 값 체크
function add(){
	var name = $("#name").val();
	var category = $("#category").val();
	var content = $("#content").val();
	var price = $("#price").val();
	var color = $("#color").val();
	var quantity = $("#quantity").val();
	var size = $("#size").val();
	var file = $("#file").val();
	var file2 = $("#file2").val();
	
	if(name == "" || name == null || name == undefined || ( name != null && typeof name == "object" && !Object.keys(name).length )){
		alert("상품명을 입력해주세요");
	}else if(category == "" || category == null || category == undefined || ( category != null && typeof category == "object" && !Object.keys(category).length )){
		alert("카테고리 값을 끝까지 선택해주세요");
	}else if(content == "" || content == null || content == undefined || ( content != null && typeof content == "object" && !Object.keys(content).length )){
		alert("상품 내용을 입력해주세요");
	}else if(price == "" || price == null || price == undefined || ( price != null && typeof price == "object" && !Object.keys(price).length )){
		alert("상품 가격을 입력해주세요");
	}else if(color == "" || color == null || price == undefined || ( color != null && typeof color == "object" && !Object.keys(color).length )){
		alert("컬러를 선택해주세요");
	}else if(quantity == "" || color == null || quantity == undefined || ( quantity != null && typeof quantity == "object" && !Object.keys(quantity).length )){
		alert("재고 수량을 입력해주세요");
	}else if(size == "" || size == null || size == undefined || ( size != null && typeof size == "object" && !Object.keys(size).length )){
		alert("사이즈를 입력해주세요");
	}else if(file == "" || file == null || file == undefined || ( file != null && typeof file == "object" && !Object.keys(file).length )){
		alert("메인 사진을 1장 이상 등록해주세요");
	}else if(file2 == "" || file2 == null || file2 == undefined || ( file2 != null && typeof file2 == "object" && !Object.keys(file2).length )){
		alert("디테일 사진을 1장 이상 등록해주세요");
	}else{
		prodForm.submit();
	}
	

}
//박스 닫기
function updateClass(value){
	console.log("박스 닫기 함수 실행")
	$('#'+value).attr('class','box box-info collapsed-box');
}
//박스 열기
function updateClass1(value){
	console.log("박스 닫기 함수 실행")
	$('#'+value).attr('class','box box-info');
}
</script>
<style>
.main_common{
    display: inline-block !important;

}
</style>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Main Header -->
  <%@ include file="../include/main_header.jsp" %>
  <!-- Left side column. contains the logo and sidebar -->
  <%@ include file="../include/left_column.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
  	<section class="content-header">
     
        <small>상품 관리</small>
     
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Forms</a></li>
        <li class="active">Editors</li>
      </ol>
    </section>

    <!-- Main content -->
 <section class="content">
      <div class="row">
        <div class="col-md-12">
        <!-- 1페이지 시작 -->
           <div class="box box-info" id="prodBox">

            <div class="box-header">
              <h3 class="box-title">상품 조회
                <small></small>
              </h3>
              <!-- tools box -->
              <div class="pull-right box-tools">
                <button type="button" class="btn btn-info btn-sm" data-widget="collapse" data-toggle="tooltip" title="" data-original-title="Collapse">
                  <i class="fa fa-minus"></i></button>
              </div>
              <!-- /. tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body pad" style="">
            <form action="selectProd.do" method="get">
			<div class="input-group margin">
				<div class="input-group-btn">
					<select name="searchOption" id="searchOption"class="btn btn-info dropdown-toggle" onchange="prodsearchOption(this.value)">
						<option value="all">전체조회</option>
						<option value="name">상품명</option>
						<option value="type1">신상품</option>
						<option value="type2">중고품</option>
						<option value="prodstatus1">판매중</option>
						<option value="prodstatus2">품절</option>
						<option value="prodstatus3">대기</option>
						<option value="prodcategorynum1">의류</option>
						<option value="prodcategorynum2">잡화</option>
						<option value="prodcategorynum3">등산용품</option>
					</select>
				</div>
					<input type="text" name="key_word" id="prod_key_word"class="form-control" placeholder="조회내용을 입력하세요">
						<span class="input-group-btn">
                    	 	<button type="submit" id="serch"class="btn btn-info btn-flat" >조회</button>
                    	</span>
				</div>
			</form>
       <div class="box">
    
            <!-- /.box-header -->
		<div class="box-body">
				<div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">	
							<table id="foo-table" class="display" style="width:100%">
								<thead>
								<tr>
									<th>번호</th>
									<th>옵션번호</th>
									<th>상품명</th>
									<th>가격</th>
									<th>재고</th>
									<th>사이즈</th>
									<th>색상</th>
									<th>타입</th>
									<th>분류</th>
									<th>상태</th>
									<th>등록일</th>
									<th>상세 보기 </th>
								</tr>
								</thead>
								 <tbody>
					                <c:forEach var="prod" items="${list}" >   
					                <tr>
					                  <td>${prod.prodNum}</td>
					                  <td>${prod.optionNum}</td>
					                  <td>${prod.name}</td>
					                  <td>${prod.priceString}</td>
					                  <td>${prod.quantity}</td>
					                  <td>${prod.prodsize}</td>
									  <td>
					                   <select  id="prodStatus1" class="basic_btn btn btn-default" onchange="prodColor1(this.value,${prod.optionNum})">
											<option value="white" ${prod.color == 'white' ? 'selected="selected"' : ''}>white</option>
											<option value="black" ${prod.color == 'black' ? 'selected="selected"' : ''}>black</option>
											<option value="red" ${prod.color == 'red' ? 'selected="selected"' : ''}>red</option>
											<option value="blue" ${prod.color == 'blue' ? 'selected="selected"' : ''}>blue</option>
											<option value="ogrange" ${prod.color == 'ogrange' ? 'selected="selected"' : ''}>ogrange</option>
											<option value="yellow" ${prod.color == 'yellow' ? 'selected="selected"' : ''}>yellow</option>
											<option value="green" ${prod.color == 'green' ? 'selected="selected"' : ''}>green</option>
											<option value="violet" ${prod.color == 'violet' ? 'selected="selected"' : ''}>violet</option>
											<option value="pink" ${prod.color == 'pink' ? 'selected="selected"' : ''}>pink</option>
											<option value="navy" ${prod.color == 'navy' ? 'selected="selected"' : ''}>navy</option>
											<option value="gray" ${prod.color == 'gray' ? 'selected="selected"' : ''}>gray</option>
											<option value="etc" ${prod.color == 'etc' ? 'selected="selected"' : ''}>etc</option>
										</select>
										</td>
					                  <td>${prod.typeString}</td>
					                  <td>${prod.prodcategorynumString}</td>
					                 <td>
					                 	<select  id="prodStatus1" class="basic_btn btn btn-default" onchange="prodStatus1(this.value,${prod.optionNum})">
											<option value="1"${prod.prodstatusString == '판매중' ? 'selected="selected"' : ''}>판매중</option>
											<option value="2"${prod.prodstatusString == '품절' ? 'selected="selected"' : ''}>품절</option>
											<option value="3"${prod.prodstatusString == '대기' ? 'selected="selected"' : ''}>대기</option>
										</select>
									</td>
									
					                  <td>${prod.createdAtString}</td>
					                  <td><button class="btn btn-primary btn-xs" id ="view" onclick="viewProd(${prod.optionNum},${prod.prodNum})">상세보기</button></td> 		
					                </tr>
					                 </c:forEach>
					                </tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
            <!-- /.box-body -->
          	  </div>              
            </div>
          </div>
         
          <!-- 1페이지 끝 -->
          <!-- /.box -->
          <!-- 2페이지 중고품 요청폼 -->
           <div class="box box-info" id="usedBox">
            <div class="box-header">
              <h3 class="box-title">중고품 관리
                <small></small>
              </h3>
              <!-- tools box -->
              <div class="pull-right box-tools">
                <button type="button" class="btn btn-info btn-sm" data-widget="collapse" data-toggle="tooltip" title="" data-original-title="Collapse">
                  <i class="fa fa-plus"></i></button>
              </div>
              <!-- /. tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body pad" style="">
		               <form action="selectUsedProd.do" method="get">
					<div class="input-group margin">
						<div class="input-group-btn">
							<select name="searchOption" id="searchOption1"class="btn btn-info dropdown-toggle" onchange="used_searchOption(this.value)">
								<option value="all">전체조회</option>
								<option value="p_prodName">상품명</option>
								<option value="p_prodNum">상품번호</option>
								<option value="u_userNum">고객번호</option>
								<option value="a">거래요청</option>
								<option value="b">취소상품</option>
								<option value="c">승인상품</option>
							</select>
						</div>
							<input type="text" name="key_word" class="form-control" id="used_key_word" placeholder="조회내용을 입력하세요">
								<span class="input-group-btn">
		                    	 	<button type="submit" id="serch"class="btn btn-info btn-flat" >조회</button>
		                    	</span>
						</div>
					</form>
		       <div class="box">
		    
		            <!-- /.box-header -->
				<div class="box-body">
						 <!-- 데이터 테이블 -->
               <div id="example1_wrapper"class="dataTables_wrapper form-inline dt-bootstrap">
                           <table id="foo-table2" class="display" style="width:100%">
                              <thead align=center>
                              <tr>
                                 <th>요청일자</th>
                                 <th>상품번호</th>
                                 <th>고객번호</th>
                                 <th>상품정보</th>
                                 <th>이미지</th>
                                 <th>상태</th>
                                 <th>상세보기</th>
                              </tr>
                              </thead>
                               <tbody align=center>
                               <c:if test="${used ==null}">
								<script>
								updateClass("usedBox");
								</script>
								</c:if>
								<c:if test="${used !=null}">
								<script>
								updateClass1("usedBox");
								</script>
								</c:if>
                                     <c:forEach var="used" items="${used}" >   
                                     <tr>
                                       <td>${used.createdAtString}</td>
                                       <td>${used.prodNum}</td>
                                       <td>${used.userNum}</td>
                                   
                                       <td>
                                           <strong>상품명:${used.name}</strong><br>
                                           <strong>판매가격:${used.priceString}</strong><br>
                                           <strong>카테고리:${used.prodcategorynumString}</strong><br>
                                       </td>
                                       <td>
                                          <strong><img src="/resources/img/${used.pcontent}" style="width: 80px; height: 80px; display: block;"></strong><br>
                                       </td>
                                       <td>${used.prodstatusString}</td>
                                   <td><button class="btn btn-primary btn-xs" id="viewUsedList" onclick="viewUsedList(${used.prodNum},${used.userNum})" >상세보기</button></td>      
                                     </tr>
                                      </c:forEach>
                                     </tbody>
                           </table>
                        </div>
                        <!--// 데이터 테이블  -->
					</div>
		            <!-- /.box-body -->
		          	  </div>    
         
            		</div>
          		</div>
          		<!--// 2페이 중고품 요청폼 -->
			<!-- 3페이지 -->
			 <div class="box box-info collapsed-box">
            <div class="box-header">
              <h3 class="box-title">상품 등록
                <small></small>
              </h3>
              <!-- tools box -->
              <div class="pull-right box-tools">
                <button type="button" class="btn btn-info btn-sm" data-widget="collapse" data-toggle="tooltip" title="" data-original-title="Collapse">
                  <i class="fa fa-plus"></i></button>
              </div>
              <!-- /. tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body pad" style="">
     			 <form name="prodForm"action="insertProd.do" method="post" enctype="multipart/form-data">
                    <table class="table table-boardered">
                        <tr>
                            <th>상품 분류</th>
                            <td>
                            <div >
                                <div  class="m1 main_common">
                                    <select name="prodcategory1" class="basic_btn btn-primary" onchange="selectprodcategory1(this.value)">
                                        <option value=" ">1차 분류</option>
                                        <option value="a">의류</option>
                                        <option value="b">잡화</option>
                                        <option value="c">등산용품</option>
                                    </select>
                                </div>
                                <!-- 2차 분류 생성 -->
                                <div id="prodcategory2"  class="m2 main_common">
                                </div>
                                <!--3차 분류 생성  -->
                                <div id="prodcategory3" class="m3 main_common">
                                </div>
                              </div>  
                            </td>

                        </tr>
                        <tr>
                            <th>상품명</th>
                            <td><input type="text" class="form-control" name="name" id="name" placeholder="상품이름"></td>
                        </tr>
                        <tr>
                            <th>상품설명</th>
                            <td><input type="text" class="form-control" name="content"  id="content" placeholder="상품설명"></td>
                        </tr>
                        <tr>
                            <th>가격 <p id="msg" style="font-size:8px"></th>
                            <td><input type="text" class="form-control" name="price" id="price" placeholder="가격" onkeyup="priceCheck(this.value)"></td>
                        </tr>
                        <tr>
                            <th>상품 옵션 <br> <button  type="button" id="_addSize" class="basic_btn1 btn-danger btn-xs"  onClick="addOption()" >옵션 추가</button>
                             <p id="msg1" style="font-size:8px">
                             </th>
                            <td>
                                
                                <div id="sizeMain">
                                    <label for="title">색상:</label>
                                    <select name="color[]"class="basic_btn btn-default dropdown-toggle" id="color">
                                        <option value="">color</option>
                                        <option value="white">white</option>
                                        <option value="black">black</option>
                                        <option value="red">red</option>
                                        <option value="blue">blue</option>
                                        <option value="ogrange">ogrange</option>
                                        <option value="yellow">yellow</option>
                                        <option value="green">green</option>
                                        <option value="violet">violet</option>
                                        <option value="pink">pink</option>
                                        <option value="navy">navy</option>
                                        <option value="gray">gray</option>
                                        <option value="etc">etc</option>
                                    </select>
                                    <label for="title">사이즈:</label>
                                    <input type="text" name="prodSize[]" value="" id=size>
                                    <label for="title">수량:</label>
                                    <input type="text" name="quantity[]" value="" id="quantity" onkeyup="quantityCheck(this.value)">

                                </div>
                            </td>
                        </tr>

                        <tr>
                            <th>상품구분</th>
                            <td>
                                <input type="radio"  name="type" value="1" checked>신상품 &nbsp;&nbsp;
                                <input type="radio"  name="type" value="2">중고품&nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <th>상품상태</th>
                            <td>
                                <input type="radio"  name="prodStatus" value="1" checked>판매중 &nbsp;&nbsp;
                                <input type="radio"  name="prodStatus" value="2">품절&nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <th>대표 이미지</th>
                            <td>
                                <input type='file' id="file" name='file' multiple  maxlength="3" accept="image/*"/>
                            </td>
                        </tr>
                        <tr>
                            <th>상세 이미지</th>
                            <td>
                                <input type='file' id="file2" name='file2' multiple maxlength="3" accept="image/*"/>
                            </td>
                        </tr>
                     
                        <tr>
                            <td colspan="2">
                              <center>
                                <input class="btn btn-primary" type="button"  id="addProd" onclick="add()" value="등록"/>
                                 </center>
                            </td>
                        </tr>
                       
                    </table>
                </form>
            </div>
          </div>
       
          <!-- //3페이 -->
          
          
        </div>
        <!-- /.col-->
      </div>
      <!-- ./row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
 <%@ include file="../include/main_footer.jsp" %>
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->
<%@ include file="../include/plugin_js.jsp" %>

</body>
</html>