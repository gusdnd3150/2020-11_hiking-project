<!DOCTYPE html>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" 
    import ="java.util.*,project.*"%> --%>
    
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="ko">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style>


</style>
<!-- <script src="https://kit.fontawesome.com/e8913b960a.js" crossorigin="anonymous"></script> -->

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(document).ready(function () {
	

	$("#sortProduct").change(function(){
		var sorting= $(this).val();
		var searContent ='${paging.searchContent}' ;
		console.log(sorting);
		console.log(searContent);
		
			location.href="/shopMainCate.do?listType=200&sorting="+sorting+"&searchContent="+searContent+"";
/* 		if(sorting!='defualt'){
			
		} */
		
	});
	
	
	
	$("input[id=price]").keyup(function(){     //가격입력 정규식
		var req = new RegExp(/[^0-9]/g);
		var price =$(this);
		var text =$("#showText");
		if(req.test(price.val())==true){
			price.css("color","red");
			text.css("color","red");
			text.show();
		}else{
			price.css("color","black");
			text.hide();
		}
	});
	
	
	
	
     $("li[id=tap1]").on("click",function(){  //의류 클릭 시
    	 var dap1Top =$("li[id=dap1Top]");    //-상의 
	     var dap1Bottom = $("#dap1Bottom");  //-하의
	     var dap1Outter = $("#dap1Outter");  //-아우터
			var dap2Top_1 = $("li[id=dap2Top_1]"); //---반팔
		    var dap2Top_2 = $("li[id=dap2Top_2]"); //---긴팔
		    var dap2Top_3 = $("li[id=dap2Top_3]"); //---후드
		    var dap2Bottom_1 = $("li[id=dap2Bottom_1]"); //---반바지
		    var dap2Bottom_2 = $("li[id=dap2Bottom_2]"); //---긴바지
		    var dap2Outter_1 = $("#dap2Outter_1");  //-
			var dap2Outter_2 =$("#dap2Outter_2");  //-
			var dap2Outter_3 =$("#dap2Outter_3");  //-
	     
	       var tap1 =$("li[id=tap1]"); 
	       if(!tap1.is(".select")){
	    	   tap1.attr("class","select");
	    	   dap1Top.slideDown("slow");
	    	   dap1Bottom.slideDown("slow");
	    	   dap1Outter.slideDown("slow");
              tap1.css("color","red");
           return;
	       }
	       if(tap1.is(".select")){
	    	tap1.attr("class","");
	    	dap1Top.attr("class","");
	    	dap1Bottom.attr("class","");
	    	dap1Outter.attr("class","");
	    	   dap1Top.slideUp();
	    	   dap1Bottom.slideUp();
	    	   dap1Outter.slideUp();
	    	   dap2Top_1.slideUp();
	    	   dap2Top_2.slideUp();
	    	   dap2Top_3.slideUp();
	    	   dap2Bottom_1.slideUp();
	    	   dap2Bottom_2.slideUp();
	    	   dap2Outter_1.slideUp();
	    	   dap2Outter_2.slideUp();
	    	   dap2Outter_3.slideUp();
	        tap1.css("color","");
	        dap1Top.css("color","");
	    	dap1Bottom.css("color","");
	    	dap1Outter.css("color","");
	        return;
	       }
    });
    
     
	$("li[id=dap1Top]").on("click",function(){  //의류  (dap2 클릭 시)
		var dap1Top =$("li[id=dap1Top]");       //-상의 
		var dap2Top_1 = $("li[id=dap2Top_1]"); //---반팔
	    var dap2Top_2 = $("li[id=dap2Top_2]"); //---긴팔
	    var dap2Top_3 = $("li[id=dap2Top_3]"); //---후드
	    
	       if(!dap1Top.is(".selectDap1Top")){
	    	   dap1Top.attr("class","selectDap1Top");
	    	   dap1Top.css("color","red");
	    	   dap2Top_1.slideDown("slow");
	    	   dap2Top_2.slideDown("slow");
	    	   dap2Top_3.slideDown("slow");
           return;
	       }
	       if(dap1Top.is(".selectDap1Top")){
	    	   dap1Top.attr("class","");
	    	   dap1Top.css("color","");
	    	   dap2Top_1.slideUp();
	    	   dap2Top_2.slideUp();
	    	   dap2Top_3.slideUp();
	        return;
	       }
    });
	$("li[id=dap1Bottom]").click(function(){  // 하의
		var dap1Bottom = $("#dap1Bottom");  
		var dap2Bottom_1 = $("li[id=dap2Bottom_1]"); //---반바지
	    var dap2Bottom_2 = $("li[id=dap2Bottom_2]"); //---긴바지
	    console.log("클릭클릭");
	       if(!dap1Bottom.is(".selectBottom")){
	    	   dap1Bottom.attr("class","selectBottom");    //. 조심하자
	    	   dap2Bottom_1.slideDown("slow");
	    	   dap2Bottom_2.slideDown("slow");
	    	   dap1Bottom.css("color","red");
           return;
	       }
	       if(dap1Bottom.is(".selectBottom")){
	    	   dap1Bottom.attr("class","");
	    	   dap2Bottom_1.slideUp();
	    	   dap2Bottom_2.slideUp();
	    	   dap1Bottom.css("color","");
	        return;
	       }
    });	
	
	$("li[id=dap1Outter]").click(function(){  // 아우터
		var dap1Outter = $("#dap1Outter");  //-
		var dap2Outter_1 = $("#dap2Outter_1");  //-
		var dap2Outter_2 =$("#dap2Outter_2");  //-
		var dap2Outter_3 =$("#dap2Outter_3");  //-
		
	       if(!dap1Outter.is(".selectOutter")){
	    	   dap1Outter.attr("class","selectOutter");    //. 조심하자
	    	   dap2Outter_1.slideDown("slow");
	    	   dap2Outter_2.slideDown("slow");
	    	   dap2Outter_3.slideDown("slow");
	    	   dap1Outter.css("color","red");
           return;
	       }
	       if(dap1Outter.is(".selectOutter")){
	    	   dap1Outter.attr("class","");
	    	   dap2Outter_1.slideUp();
	    	   dap2Outter_2.slideUp();
	    	   dap2Outter_3.slideUp();
	    	   dap1Outter.css("color","");
	        return;
	       }
    });	
	
	$("li[id=tap2]").on("click",function(){  //잡화 클릭 시
   	     var dap1Cap =$("li[id=dap1Cap]");    //-모자 
	     var dap1Socse = $("#dap1Socse");  //-양말
	     var dap1Bag = $("#dap1Bag");  //가방
	     var dap1Shose = $("#dap1Shose");  //신발
	     
	       var tap2 =$("li[id=tap2]"); 
	       if(!tap2.is(".select2")){
	    	   tap2.attr("class","select2");
	    	   dap1Cap.slideDown("slow");
	    	   dap1Socse.slideDown("slow");
	    	   dap1Bag.slideDown("slow");
	    	   dap1Shose.slideDown("slow");
	    	   tap2.css("color","red");
          return;
	       }
	       if(tap2.is(".select2")){
	    	tap2.attr("class","");
	    	dap1Cap.attr("class","");
	    	dap1Socse.attr("class","");
	    	dap1Bag.attr("class","");
	    	dap1Shose.attr("class","");
	    	 var dapC2_1 =$("#dapC2_1").slideUp();
		     var dapC2_2 =$("#dapC2_2").slideUp();
		     var dapC2_3 =$("#dapC2_3").slideUp();
		     var dapC2_4 =$("#dapC2_4").slideUp();
		     var dap2S_1 = $("#dap2S_1").slideUp();
		     var dap2S_2 = $("#dap2S_2").slideUp();
		     var dap2S_3 = $("#dap2S_3").slideUp();
		     var dap2B_1 =$("#dap2B_1").slideUp();
		     var dap2B_2 =$("#dap2B_2").slideUp();
	         var dap2Sh=$("#dap2Sh").slideUp();
	   	   dap1Cap.slideUp();
    	   dap1Socse.slideUp();
    	   dap1Bag.slideUp();
    	   dap1Shose.slideUp();
	         
	    	   tap2.css("color","");
	    	   dap1Cap.css("color","");
	    	   dap1Socse.css("color","");
	    	   dap1Bag.css("color","");
	    	   dap1Shose.css("color","");
	        return;
	       }
   });  
	
	
	$("li[id=dap1Cap]").click(function(){  // 모자
		var dap1Cap =$("li[id=dap1Cap]");    //
		var dapC2_1 =$("#dapC2_1").hide();
	     var dapC2_2 =$("#dapC2_2").hide();
	     var dapC2_3 =$("#dapC2_3").hide();
	     var dapC2_4 =$("#dapC2_4").hide();
		
	       if(!dap1Cap.is(".selectCap")){
	    	   dap1Cap.attr("class","selectCap");    //. 조심하자
	     	   dapC2_1 =$("#dapC2_1").slideDown("slow");
			   dapC2_2 =$("#dapC2_2").slideDown("slow");
			   dapC2_3 =$("#dapC2_3").slideDown("slow");
			   dapC2_4 =$("#dapC2_4").slideDown("slow");
	    	   dap1Cap.css("color","red");
           return;
	       }
	       if(dap1Cap.is(".selectCap")){
	    	   dap1Cap.attr("class","");
	    	   dapC2_1 =$("#dapC2_1").slideUp();
			   dapC2_2 =$("#dapC2_2").slideUp();
			   dapC2_3 =$("#dapC2_3").slideUp();
			   dapC2_4 =$("#dapC2_4").slideUp();
	    	   dap1Cap.css("color","");
	        return;
	       }
    });	
	
	$("li[id=dap1Socse]").click(function(){  // 양말
		var dap1Socse = $("#dap1Socse");  
	     var dap2S_1 = $("#dap2S_1");
	     var dap2S_2 = $("#dap2S_2");
	     var dap2S_3 = $("#dap2S_3");
	     
	       if(!dap1Socse.is(".selectSocse")){
	    	   dap1Socse.attr("class","selectSocse");  
	    	   dap2S_1.slideDown("slow");
	    	   dap2S_2.slideDown("slow");
	    	   dap2S_3.slideDown("slow");
			   dap1Socse.css("color","red");
           return;
	       }
	       if(dap1Socse.is(".selectSocse")){
	    	   dap1Socse.attr("class","");
	    	   dap2S_1.slideUp();
	    	   dap2S_2.slideUp();
	    	   dap2S_3.slideUp();
			   dap1Socse.css("color","");
	        return;
	       }
    });	
	
	$("li[id=dap1Bag]").click(function(){  // 가방
	var dap1Bag = $("#dap1Bag");  //가방
	var dap2B_1 =$("#dap2B_1");
    var dap2B_2 =$("#dap2B_2");
	     
	       if(!dap1Bag.is(".selectBag")){
	    	   dap1Bag.attr("class","selectBag");  
	    	   dap2B_1.slideDown("slow");
	    	   dap2B_2.slideDown("slow");
	    	   dap1Bag.css("color","red");
           return;
	       }
	       if(dap1Bag.is(".selectBag")){
	    	   dap1Bag.attr("class","");
	    	   dap2B_1.slideUp();
	    	   dap2B_2.slideUp();
	    	   dap1Bag.css("color","");
	        return;
	       }
    });
	
	$("li[id=dap1Shose]").click(function(){  // 신발
		var dap1Shose = $("#dap1Shose");  //신발
		var dap2Sh=$("#dap2Sh").hide();
		       if(!dap1Shose.is(".selectShose")){
		    	   dap1Shose.attr("class","selectShose");  
		    	   dap2Sh.slideDown("slow");
		    	   dap1Shose.css("color","red");
	           return;
		       }
		       if(dap1Shose.is(".selectShose")){
		    	   dap1Shose.attr("class","");
		    	   dap2Sh.slideUp();
		    	   dap1Shose.css("color","");
		        return;
		       }
	    });		
	
	$("li[id=tap3]").on("click",function(){  //등산용품
		var dap1stuff_0=$("#dap1stuff_0");
		var dap1stuff_1=$("#dap1stuff_1");
		var dap1stuff_2=$("#dap1stuff_2");
		var dap1stuff_3=$("#dap1stuff_3");
		
	       var tap3 =$("li[id=tap3]"); 
	       if(!tap3.is(".select3")){
	    	   tap3.attr("class","select3");
	    	   dap1stuff_0.slideDown("slow");
	    	   dap1stuff_1.slideDown("slow");
	    	   dap1stuff_2.slideDown("slow");
	    	   dap1stuff_3.slideDown("slow");
	    	   tap3.css("color","red");
         return;
	       }
	       if(tap3.is(".select3")){
	    	   tap3.attr("class","");
	   	   dap1stuff_0.slideUp();
    	   dap1stuff_1.slideUp();
    	   dap1stuff_2.slideUp();
    	   dap1stuff_3.slideUp();
   	        tap3.css("color","");
	        return;
	       }
  });  
	
	
	
    $('#getSession').click(function(){
        $.ajax({
             type:"post",
             async:true,
             url:"/getSession.do",
             dataType:"json",
             success:function(data,textStatus){
               console.log(data.checkStatus);
               if(data.checkStatus == 'notEmpty'){
               location.href="/myShop/cartList.do";  
               }else{ 
            	   alert("로그인 후 이용가능합니다.");
               }
             },
             error:function(data,textStatus){
             }
           });
    }); 
    

	
});




/* 모달 영역 */

var cnt=1;
function fn_addFile(){
	  $("#d_file").append("<br>"+"<input type='file' name='content'  />");
	cnt++;
}


var cnt2=1;
 function addFileDetail(){
	  $("#d_file2").append("<br>"+"<input type='file' name='contentDetail' />");
		cnt2++;
 }
 
 var cnt3=1;
 function addOption(){
	  $("#addOption").append("<br>"+"<label for='title'>색상:</label>");
	  //$("#addOption").append("<input type='text' name='color[]' value=''>");
	  $("#addOption").append("<select name='color[]' >"
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
      +"</select>");
	  
	  $("#addOption").append("<label for='title'>사이즈:</label>");
	  $("#addOption").append("<input type='text' name='prodSize[]' style='width: 75px;' value=''>");
	  $("#addOption").append("<label for='title'>수량:</label>");
	  $("#addOption").append("<input type='text' id='quantityCheck'  class='quantityCheck2' name='quantity[]'  style='width: 75px;' value=''>");
	  $("#addOption").append("<input type='hidden' name='prodstatus[]' value='3'>");
		cnt3++;
 }

 
 
 
 
 function checkUsedForm(){
	 /* <form name="usedForm" method="post" action="/addUsedPro" enctype="multipart/form-data"> */

 $.ajax({
          type:"post",
          async:true,
          url:"/getSession.do",
          dataType:"json",
          success:function(data,textStatus){
            console.log(data.checkStatus);
            
            if(data.checkStatus == 'notEmpty'){
            	
            var frmPro = document.usedForm;
             var req = new RegExp(/[^0-9]/g);
             
             var mainImage= $("input[name=content]");
             var detailImage= $("input[name=contentDetail]");
             var name= $("input[name=name]");
             var name= $("input[name=content]");


     			
             if(mainImage.length==0 || detailImage.length==0){
               alert("대표사진 및 상품사진을 확인하여 주시기 바랍니다.");
               return;
             }else if(req.test(price)==true) {
            	 alert("상품가격은 숫자만 입력 가능합니다.");
             }
             
             
             // Get form
             var form = $('#addForm')[0];
     	    // Create an FormData object 
             var data = new FormData(form);
             
             $.ajax({
                 type:"post",
                 async:true,
                 enctype: 'multipart/form-data',
                 processData: false,
                 contentType: false,
                 url:"/myShop/addUsedPro.do",
                 dataType:"json",
                 data: data,
                 cache: false,
                 success:function(data,textStatus){
                	 location.reload();
                 },
                 complete:function(){
                	 location.reload();
                 }
               });
            }else{ 
         	   alert("로그인 후 이용가능합니다.");
         	   return false;
            }
          }
        });
}


 function setPreview(event){
     for(var image of event.target.files) {
         var reader = new FileReader();

         reader.onload = function (event) {
             var img = document.createElement("img");
             img.setAttribute("src", event.target.result);
             img.setAttribute("class","col-4")
             document.querySelector("div.preview").appendChild(img);
         };
         reader.readAsDataURL(image);
     }
 }
 
 
 function setPreview2(event){
     for(var image of event.target.files) {
         var reader = new FileReader();

         reader.onload = function (event) {
             var img = document.createElement("img");
             img.setAttribute("src", event.target.result);
             img.setAttribute("class","col-4")
             document.querySelector("div.preview2").appendChild(img);
         };
         reader.readAsDataURL(image);
     }
 }
 
 function resetForm(){
	 document.usedForm.reset();
 }
 
</script>


  <head>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css" rel="stylesheet">
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <link rel="icon" href="/resources/shop/img/favicon.png" type="image/png" />
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/resources/shop/css/bootstrap.css" />
    <link rel="stylesheet" href="/resources/shop/vendors/linericon/style.css" />
    <!-- <link rel="stylesheet" href="/resources/shop/css/font-awesome.min.css" /> -->
    <link rel="stylesheet" href="/resources/shop/css/themify-icons.css" />
    <link rel="stylesheet" href="/resources/shop/vendors/owl-carousel/owl.carousel.min.css" />
    <link rel="stylesheet" href="/resources/shop/vendors/lightbox/simpleLightbox.css" />
    <link rel="stylesheet" href="/resources/shop/vendors/nice-select/css/nice-select.css" />
    <link rel="stylesheet" href="/resources/shop/vendors/animate-css/animate.css" />
    <link rel="stylesheet" href="/resources/shop/vendors/jquery-ui/jquery-ui.css" />
    <link rel="stylesheet" href="/resources/shop/css/style.css" />
    <link rel="stylesheet" href="/resources/shop/css/responsive.css" />
  </head>

  <body>
    <!-- 해더 자리 -->
<jsp:include page="/common/header.jsp" />
  <br><br><br>
  
    <!--================탑 5 메인 =================-->
  
  <!--================ End New Product Area =================-->

    <!--================End Home Banner Area =================-->
      <div class="container">
        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div id ="selector"class="carousel-item active">
              <img class="d-block img-fluid" src="/resources/img/newMain.jpg" alt="First slide" >
            </div>
            <div id ="selector" class="carousel-item">
              <img class="d-block img-fluid" src="/resources/img/newMain2.png" alt="Second slide" >
            </div>
            <div id ="selector" class="carousel-item">
              <img class="d-block img-fluid" src="/resources/img/newMain3.png" alt="Third slide">
              <!-- <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Third slide"> -->
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
            </div>
    <!--================Category Product Area =================-->
    <section class="cat_product_area section_gap" style="padding-top: 23px;">
      <div class="container">
        <div class="row flex-row-reverse">
          <div class="col-lg-9">
            <div class="product_top_bar">
              <div class="left_dorp">
              
              <table>
              <tr>
              <form action="/shopMainCate.do" method="get" name="searchForm" align="right">
  
                 <td><input type="text" class="form-control" name= "searchContent" style="border-radius:10px;border-color:green" >
                 </td> 
                 <input type="hidden" name= "listType" value="200" >
                 <td><input type="image" src="/resources/img/search.png"  width="25px" height="25px"></td>
              </form>

              
              </tr>
            
              </table>
              </div>
              <div class="sortingPrice" style="margin-left: 400px;">
                   <c:if test="${paging.listType==200 }">
                   <ul>
                <li style="float:right">
                 <select id="sortProduct" name="sort">
                 <option value="defualt">정렬</option>
                 <option value="heightPrice">가격 오름차순</option>
                 <option value="lowPrice">가격 내림차순</option>
                 </select>
                 </li>
                 </ul>
              </c:if>  
              
              </div>
            </div>
            
            <div class="latest_product_inner">
              <div class="row">
             <!-- for문 반복구간 -->
             
             
          <c:choose>
             <c:when test="${empty viewAll }">
               <h>상품이 없습니다</h>
             </c:when>
          <c:when test="${not empty viewAll }">
             <c:forEach var="data" items="${viewAll }">
             
                    <%--   <input type="hidden" name="prodNum" value="${data.PRODNUM}">
                      <input type="hidden" name="prodName" value="${data.NAME}">
                      <input type="hidden" name="price" value="${data.PRICE}">
                      <input type="hidden" name="addType" value="main"> --%>
                      
                <div class="col-lg-4 col-md-6">
                  <div class="single-product">
                    <div class="product-img">
                      <a href="/productDetail.do?prodNum=${data.PRODNUM}"><img
                        class="card-img"
                        src="/resources/img/${data.IMAGE }"
                        alt=""
                      /></a>
                      <div class="p_icon">
                      <c:if test="${data.TYPE ==2 || data.TYPE==5 }">
                        <a href="#">
                          <i>old</i>
                        </a> 
                      </c:if>
                      <c:if test="${data.TYPE ==1 }">
                        <a href="#">
                          <i >new</i>
                        </a> 
                      </c:if>
                      
                      <c:if test="${not empty data.USERNUM }">
                      <a href="">
                          <img src="/resources/img/shop_heart2.png" width="20px" height="20px" >
                          </a>
                      </c:if>
                      
                        <c:if test="${empty data.USERNUM}">
                        <a href="/myShop/addCartMain.do?prodNum=${data.PRODNUM}&prodName=${data.NAME}&prodPrice=${data.PRICE}&addType=wish">
                          <img src="/resources/img/shop_heart.png" width="20px" height="20px" style="color:black">
                        </a>
                      </c:if>
                      
                          <a id="addcart1" href="/myShop/addCartMain.do?prodNum=${data.PRODNUM}&prodName=${data.NAME}&prodPrice=${data.PRICE}&addType=cart" > 
                           <img src="/resources/img/cart_icon.png" width="20px" height="20px" style="color:black">
                          </a>
                      </div>
                      
                    </div>
                    <div class="product-btm">
                      <a href="#" class="d-block">
                        <h4>${data.NAME }</h4>
                      </a>
                      <div class="mt-3">
                        <span class="mr-4"> ${data.PRICE } 원</span>
                        <%-- <del>${data.PRICE }</del> --%>
                        <c:if test="${data.TYPE ==1 }">
                        <p>신상</p>
                        </c:if>
                        <c:if test="${data.TYPE ==2 }">
                        <p>중고</p>
                        </c:if>
                        <c:if test="${data.TYPE ==5 }">
                        <p>중고</p>
                        </c:if>
                      </div>
                    </div>
                  </div>
                </div>
                <input type="hidden" name="addProdNum" value="${data.PRODNUM}">
                <input type="hidden" name="addName" value="${data.NAME}">
                <input type="hidden" name="addPrice" value="${data.PRICE}">
              </c:forEach>
      </c:when>
          </c:choose>
          
                
           <!-- for문 반복구간 -->
                
              </div>
            </div>
            <div>
            <br><br><br>
            
           <!-- 페이징 -->
           
           
            <div style="display: block; text-align: center;" class="pagination">
	<c:if test="${paging.startPage != 1 }">
			<a href="/shopMainCate.do?sorting=${paging.sorting }&searchContent=${paging.searchContent }&listType=${paging.listType}&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/shopMainCate.do?sorting=${paging.sorting }&searchContent=${paging.searchContent }&listType=${paging.listType}&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/shopMainCate.do?sorting=${paging.sorting }&searchContent=${paging.searchContent }&listType=${paging.listType}&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
			<p> ${paging.listType}</p>
		</c:if>
	</div>
	       

	<!-- 페이징 끝-->
	          </div>
             </div>

          <div class="col-lg-3">
            <div class="left_sidebar_area">
              <aside class="left_widgets p_filter_widgets">
                  <div class="l_w_title">
                  <h3><a id="getSession"> <img src="/resources/img/cart_icon.png" width="20px" height="20px" style="color:black">
                  </a> 장바구니 </h3>
                </div>
                <div class="l_w_title">
                  <h3><img src="/resources/img/shop_category.png" width="25px" height="25px"> 카테고리  </h3>
                </div>
                <div class="widgets_inner">
                
                  <ul class="list" >
                  <!-- 의류 -->
                    <li id="tap1"><bold>의류</bold></li>
                    <li id="dap1Top" style="display:none;">-상의</li>
                    <li id="dap2Top_1" style="display:none;"><a href="/shopMainCate.do?listType=15">반팔</a></li>
                    <li id="dap2Top_2" style="display:none;"><a href="/shopMainCate.do?listType=16">긴팔</a></li>
                    <li id="dap2Top_3" style="display:none;"><a href="/shopMainCate.do?listType=17">후드</a></li>
                    
                    <li id="dap1Bottom" style="display:none;">-하의</li>
                    <li id="dap2Bottom_1" style="display:none;"><a href="/shopMainCate.do?listType=18">반바지</a></li>
                    <li id="dap2Bottom_2" style="display:none;"><a href="/shopMainCate.do?listType=19">긴바지</a></li>
                    
                    <li id="dap1Outter" style="display:none;">-아우터</li>
                    <li id="dap2Outter_1" style="display:none;"><a href="/shopMainCate.do?listType=20">패딩</a></li>
                    <li id="dap2Outter_2" style="display:none;"><a href="/shopMainCate.do?listType=21">야상</a></li>
                    <li id="dap2Outter_3" style="display:none;"><a href="/shopMainCate.do?listType=22">바람막이</a></li>
                    <!-- 의류 -->
                    <!-- 잡화 -->
                    <li id="tap2">잡화</li>
                    <li id="dap1Cap" style="display:none;">-모자</li>
                    <li id="dapC2_1" style="display:none;"><a href="/shopMainCate.do?listType=23">비니</a></li>
                    <li id="dapC2_2" style="display:none;"><a href="/shopMainCate.do?listType=24">캡모자</a></li>
                    <li id="dapC2_3" style="display:none;"><a href="/shopMainCate.do?listType=25">정글모</a></li>
                    <li id="dapC2_4" style="display:none;"><a href="/shopMainCate.do?listType=26">선캡</a></li>
                    
                    <li id="dap1Socse" style="display:none;">-양말</li>
                    <li id="dap2S_1" style="display:none;"><a href="/shopMainCate.do?listType=27">긴양말</a></li>
                    <li id="dap2S_2" style="display:none;"><a href="/shopMainCate.do?listType=28">반양말</a></li>
                    <li id="dap2S_3" style="display:none;"><a href="/shopMainCate.do?listType=29">발가락</a></li>
                    
                    <li id="dap1Bag" style="display:none;">-가방</li>
                    <li id="dap2B_1" style="display:none;"><a href="/shopMainCate.do?listType=30">백팩</a></li>
                    <li id="dap2B_2" style="display:none;"><a href="/shopMainCate.do?listType=31">크로스백</a></li>
                    
                    <li id="dap1Shose" style="display:none;">-신발</li>
                    <li id="dap2Sh" style="display:none;"><a href="/shopMainCate.do?listType=32">등산화</a></li>
                    <!-- 잡화 -->
                    
                    <!-- 등산용품 -->
                    <li id="tap3">등산용품</li>
                    <li id="dap1stuff_0" style="display:none;"><a href="/shopMainCate.do?listType=11">스틱</a></li>
                    <li id="dap1stuff_1" style="display:none;"><a href="/shopMainCate.do?listType=12">장갑</a></li>
                    <li id="dap1stuff_2" style="display:none;"><a href="/shopMainCate.do?listType=13">아이젠</a></li>
                    <li id="dap1stuff_3" style="display:none;"><a href="/shopMainCate.do?listType=14">보호대</a></li>
                    <!-- 등산용품 -->
                    
                  </ul>
                </div>
              </aside>

            <aside class="left_widgets p_filter_widgets">
                <div class="l_w_title">
                  <!-- <h3><a href="/addUsedForm">중고등록</a></h3> -->
                  <h3><a data-toggle="modal" data-target="#myModal">중고등록</a></h3>
                </div>
                <div class="widgets_inner">
                </div>
              </aside> 

               
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================End Category Product Area =================-->


  <!--================ new Product Area =================-->
  <section class="inspired_product_area section_gap_bottom_custom">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-12">
          <div class="main_title">
            <h2><span>New Products</span></h2>
            <!-- <p>오름마!!</p> -->
          </div>
        </div>
      </div>
      <div class="row">
       <!-- 반복 -->      
       
       <c:choose>
         <c:when test="${empty lastItems }">
          <h> 상품이 없습니다. </h>
         </c:when>
          <c:when test="${not empty lastItems }">
          <c:forEach var="items" items="${lastItems }">
        <div class="col-lg-3 col-md-6">
          <div class="single-product">
            <div class="product-img">
            <a href="/productDetail.do?prodNum=${items.PRODNUM}"><img class="img-fluid w-100" src="/resources/img/${items.IMAGE }" alt=""/></a>
              <div class="p_icon">
       <c:if test="${items.TYPE ==2 || items.TYPE==5 }">
                        <a href="#">
                          <i>old</i>
                        </a> 
                      </c:if>
                      <c:if test="${items.TYPE ==1 }">
                        <a href="#">
                          <i >new</i>
                        </a> 
                      </c:if>
              
                
                       <c:if test="${not empty items.USERNUM }">
                      <a href="">
                          <img src="/resources/img/shop_heart2.png" width="20px" height="20px" >
                          </a>
                      </c:if>
                      
                        <c:if test="${empty items.USERNUM}">
                        <a href="/myShop/addCartMain.do?prodNum=${data.PRODNUM}&prodName=${data.NAME}&prodPrice=${data.PRICE}&addType=wish">
                          <!-- <i class="ti-heart"></i> -->
                          <img src="/resources/img/shop_heart.png" width="20px" height="20px" style="color:black">
                        </a>
                      </c:if>
                
                
                
                <a  href="/myShop/addCartMain.do?prodNum=${items.PRODNUM}&prodName=${items.NAME}&prodPrice=${items.PRICE}&addType=cart" >
                  <img src='/resources/img/cart_icon.png' width='20px' height='20px' style='color:black'>
                </a>
              </div>
            </div>
            <div class="product-btm">
              <a href="#" class="d-block">
                <h4>${items.NAME }</h4>
              </a>
              <div class="mt-3">
                <span class="mr-4"> ${items.PRICE }</span>
                <del>$35.00</del>
              </div>
            </div>
          </div>
        </div>
           </c:forEach>
          </c:when>
       </c:choose>
<!-- 반복 -->
      </div>
    </div>
  </section>
  
  
  
  
  
  <!-- 모달창 -->
  
  <div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content" style="width: 128%;">
      <div class="modal-header">
       <h2>중고 물품 등록신청</h2>
        <button type="reset" class="close" data-dismiss="modal" onclick="resetForm()">&times;</button>
      </div>
      <div class="modal-body">
               
               
<div class="container">
    
    <!-- method="post" action="/addUsedPro"  -->
    <form name="usedForm" id="addForm" action="/myShop/addUsedPro.do" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="title">상품이름</label>
            <input type="text" class="form-control" name="name" id="name" required="required">
        </div>
       <div class="mb-3">
            <label for="title">상품가격</label>
            <input type="text" class="form-control" name="price" id="price" required="required">
            <p id="showText" style="display:none">숫자만 입력 가능합니다.</p>
        </div>
        <div class="mb-3">
            <label for="title">상품내용</label>
            <input type="text" class="form-control" name="content" id="content" required="required">
        </div>
        
         <div class="mb-3">
            <label for="title">상품구분</label><br>
            <select style="float:left"  id="parentCategoryNum" name="parentCategoryNum">
             <option value="15">반팔</option>    
             <option value="16">긴팔</option>
             <option value="17">후드</option>
             <option value="18">반바지</option>
             <option value="19">긴바지</option>
             <option value="20">패딩</option>
             <option value="21">야상</option>
             <option value="22">바람막이</option>
             <option value="23">비니</option>
             <option value="24">캡모자</option>
             <option value="25">정글모</option>
             <option value="26">선캡</option>
             <option value="27">긴양말</option>
             <option value="28">반양말</option>
             <option value="29">발가락양말</option>
             <option value="30">백팩</option>
             <option value="31">크로스백</option>
             <option value="32">등산화</option>
             <option value="11">스틱</option>
             <option value="12">장갑</option>
             <option value="13">아이젠</option>
             <option value="14">보호대</option>
            </select>
        </div>
        <div>
        <input type="hidden" name="type" value="1">
            </div>
              <hr>
            <br>
            <br>
         <input  type="button"  value="옵션추가" onClick="addOption()"/>  
         <br>
          <div id="addOption">
          
          <label for="title">색상:</label>
          <select id="color" name="color[]" >
           <option value='etc'>color선택</option>
      <option value='white'>white</option>
      <option value='black'>black</option>
      <option value='red'>red</option>
      <option value='blue'>blue</option>
      <option value='ogrange'>ogrange</option>
      <option value='yellow'>yellow</option>
      <option value='green'>green</option>
      <option value='violet'>violet</option>
      <option value='pink'>pink</option>
      <option value='navy'>navy</option>
      <option value='gray'>gray</option>
      <option value='etc'>etc</option>
            </select>
          
          <label for="title">사이즈:</label>
          <input type="text" name="prodSize[]" value="" style="width: 75px;">
          <label for="title">수량:</label>
          <input type="text" id="quantityCheck" class="quantityCheck2" name="quantity[]" value="" style="width: 75px;">
          <input type="hidden" name="prodstatus[]" value="3">
         <br>
          </div>   
          <hr>
          <label>대표사진 </label><br>
        <input type="file" accept="image/*" id="uploadFile" name="content" onchange="setPreview(event);" multiple>
           <div class="preview" id="d_file">
          </div>
          <hr>
          <label>기타 </label><br>
          <input type="file" accept="image/*" id="uploadFile" name="contentDetail" onchange="setPreview2(event);" multiple>
             <div class="preview2" id="d_file">
          </div>
      </form>
      
         <div class="modal-footer" align="center">
        <button onclick="checkUsedForm()" class="btn btn-default" >중고등록 신청</button>
      </div>
</div>
               
      </div>
    </div>

  </div>
</div>
  
  
  
  
  <!--================ End Inspired Product Area =================-->
    <!--================ start footer Area  =================-->
    <jsp:include page="../common/footer.jsp" flush="false" />
    <!--================ End footer Area  =================-->

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="/resources/shop/js/jquery-3.2.1.min.js"></script>
    <script src="/resources/shop/js/popper.js"></script>
    <script src="/resources/shop/js/bootstrap.min.js"></script>
    <script src="/resources/shop/js/stellar.js"></script>
    <script src="/resources/shop/vendors/lightbox/simpleLightbox.min.js"></script>
    <script src="/resources/shop/vendors/nice-select/js/jquery.nice-select.min.js"></script>
    <script src="/resources/shop/vendors/isotope/imagesloaded.pkgd.min.js"></script>
    <script src="/resources/shop/vendors/isotope/isotope-min.js"></script>
    <script src="/resources/shop/vendors/owl-carousel/owl.carousel.min.js"></script>
    <script src="/resources/shop/js/jquery.ajaxchimp.min.js"></script>
    <script src="/resources/shop/js/mail-script.js"></script>
    <script src="/resources/shop/vendors/jquery-ui/jquery-ui.js"></script>
    <script src="/resources/shop/vendors/counter-up/jquery.waypoints.min.js"></script>
    <script src="/resources/shop/vendors/counter-up/jquery.counterup.js"></script>
    <script src="/resources/shop/js/theme.js"></script>
  </body>
</html>
