<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" 
    import ="java.util.*,project.*"%>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style>


</style>
<script src="https://kit.fontawesome.com/e8913b960a.js" crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(document).ready(function () {
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
             url:"/B_P003_D001/getSession",
             success:function(data,textStatus){
               console.log(data.userNum);
               if(data.userNum != 'ok'){
            	   alert("로그인 해야합니다.");
               }else{
               //location.href="/B_P003_D001/cartList";     세션문제있는듯??
               }
               location.href="/B_P003_D001/cartList"; 
             },
             error:function(data,textStatus){
             }
           });
    }); 

	
});



</script>


  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <link rel="icon" href="/resources/shop/img/favicon.png" type="image/png" />
    <title>Eiser ecommerce</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/resources/shop/css/bootstrap.css" />
    <link rel="stylesheet" href="/resources/shop/vendors/linericon/style.css" />
    <link rel="stylesheet" href="/resources/shop/css/font-awesome.min.css" />
    <link rel="stylesheet" href="/resources/shop/css/themify-icons.css" />
    <link rel="stylesheet" href="/resources/shop/vendors/owl-carousel/owl.carousel.min.css" />
    <link rel="stylesheet" href="/resources/shop/vendors/lightbox/simpleLightbox.css" />
    <link rel="stylesheet" href="/resources/shop/vendors/nice-select/css/nice-select.css" />
    <link rel="stylesheet" href="/resources/shop/vendors/animate-css/animate.css" />
    <link rel="stylesheet" href="/resources/shop/vendors/jquery-ui/jquery-ui.css" />
    <!-- main css -->
    <link rel="stylesheet" href="/resources/shop/css/style.css" />
    <link rel="stylesheet" href="/resources/shop/css/responsive.css" />
  </head>

  <body>
  <jsp:include page="/common/header.jsp" />
    <!-- 해더 자리 -->

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
    <section class="cat_product_area section_gap">
      <div class="container">
        <div class="row flex-row-reverse">
          <div class="col-lg-9">
            <div class="product_top_bar">
              <div class="left_dorp">
              
              <form action="/B_P002_D001/shopMainCate" method="get" name="searchForm">
              
                <select class="sorting" name="search">
                  <option value="10">전체검색</option>
                  <option value="1">의류</option>
                  <option value="2">잡화</option>
                  <option value="3">등산용품</option>
                </select>
                <select class="sorting" name="searchType">
                  <option value="name">제목</option>
                  <option value="content">내용</option>
                </select>
                 <input type="text" name= "searchContent" placeholder="검색어를 입력해 주세요" >
                 
                 <input type="hidden" name= "listType" value="200" >
                 <input class="btn btn-info" type="submit" value="검색"> 
              </form>
              
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
                      <a href="/B_P003_D001/productDetail?prodNum=${data.PRODNUM}"><img
                        class="card-img"
                        src="/resources/img/${data.IMAGE }"
                        alt=""
                      /></a>
                      <div class="p_icon">
                        <a href="#">
                          <i class="ti-eye"></i>
                        </a>
                        <a href="#">
                          <i class="ti-heart"></i>
                        </a>
                          <a  href="/B_P003_D001/addCart?prodNum=${data.PRODNUM}&prodName=${data.NAME}&prodPrice=${data.PRICE}&addType=main" > 
                           <i class="ti-shopping-cart"></i>
                          </a>
                      </div>
                    </div>
                    <div class="product-btm">
                      <a href="#" class="d-block">
                        <h4>${data.NAME }</h4>
                      </a>
                      <div class="mt-3">
                        <span class="mr-4"> ${data.PRICE } .원</span>
                        <del>${data.PRICE }</del>
                      </div>
                    </div>
                  </div>
                </div>
                
</c:forEach>
      </c:when>
          </c:choose>
          
                
           <!-- for문 반복구간 -->
                
              </div>
            </div>
            <div>
            <br><br><br>
            
           <!-- 페이징 -->
           
           
           <c:if test="${paging.listType != 200  }">   <!--  검색결과가 아닌 일반 페이징 -->
            <div style="display: block; text-align: center;">
	<c:if test="${paging.startPage != 1 }">
			<a href="/B_P002_D001/shopMainCate?listType=${paging.listType}&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/B_P002_D001/shopMainCate?listType=${paging.listType}&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/B_P002_D001/shopMainCate?listType=${paging.listType}&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
			<p> ${paging.listType}</p>
		</c:if>
	</div>
	       </c:if>
	       
	         <c:if test="${paging.listType == 200  }">  <!--  검색 결과 페이징 -->
	         
            <div style="display: block; text-align: center;">
	<c:if test="${paging.startPage != 1 }">
			<a href="/B_P002_D001/shopMainCate?listType=${paging.listType}&nowPage=${paging.startPage - 1 }&searchContent=${paging.searchContent }&searchType=${paging.searchType }&search=${paging.search }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/B_P002_D001/shopMainCate?listType=${paging.listType}&nowPage=${p }&searchContent=${paging.searchContent }&searchType=${paging.searchType }&search=${paging.search }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/B_P002_D001/shopMainCate?listType=${paging.listType}&nowPage=${paging.endPage+1 }&searchContent=${paging.searchContent }&searchType=${paging.searchType }&search=${paging.search }&cntPerPage=${paging.cntPerPage}">&gt;</a>
			<p> ${paging.listType}</p>
		</c:if>
	</div>
	       </c:if>
	<!-- 페이징 끝-->
	          </div>
             </div>

          <div class="col-lg-3">
            <div class="left_sidebar_area">
              <aside class="left_widgets p_filter_widgets">
                  <div class="l_w_title">
                  <h3>장바구니<a class="fas fa-shopping-cart" id="getSession"></a></h3>
                </div>
                <div class="l_w_title">
                  <h3>카테고리</h3>
                </div>
                <div class="widgets_inner">
                
                  <ul class="list" >
                  <!-- 의류 -->
                    <li id="tap1"><bold>의류</bold></li>
                    <li id="dap1Top" style="display:none;">-상의</li>
                    <li id="dap2Top_1" style="display:none;"><a href="/B_P002_D001/shopMainCate?listType=15">반팔</a></li>
                    <li id="dap2Top_2" style="display:none;"><a href="/B_P002_D001/shopMainCate?listType=16">긴팔</a></li>
                    <li id="dap2Top_3" style="display:none;"><a href="/B_P002_D001/shopMainCate?listType=17">후드</a></li>
                    
                    <li id="dap1Bottom" style="display:none;">-하의</li>
                    <li id="dap2Bottom_1" style="display:none;"><a href="/B_P002_D001/shopMainCate?listType=18">반바지</a></li>
                    <li id="dap2Bottom_2" style="display:none;"><a href="/B_P002_D001/shopMainCate?listType=19">긴바지</a></li>
                    
                    <li id="dap1Outter" style="display:none;">-아우터</li>
                    <li id="dap2Outter_1" style="display:none;"><a href="/B_P002_D001/shopMainCate?listType=20">패딩</a></li>
                    <li id="dap2Outter_2" style="display:none;"><a href="/B_P002_D001/shopMainCate?listType=21">야상</a></li>
                    <li id="dap2Outter_3" style="display:none;"><a href="/B_P002_D001/shopMainCate?listType=22">바람막이</a></li>
                    <!-- 의류 -->
                    <!-- 잡화 -->
                    <li id="tap2">잡화</li>
                    <li id="dap1Cap" style="display:none;">-모자</li>
                    <li id="dapC2_1" style="display:none;"><a href="/B_P002_D001/shopMainCate?listType=23">비니</a></li>
                    <li id="dapC2_2" style="display:none;"><a href="/B_P002_D001/shopMainCate?listType=24">캡모자</a></li>
                    <li id="dapC2_3" style="display:none;"><a href="/B_P002_D001/shopMainCate?listType=25">정글모</a></li>
                    <li id="dapC2_4" style="display:none;"><a href="/B_P002_D001/shopMainCate?listType=26">선캡</a></li>
                    
                    <li id="dap1Socse" style="display:none;">-양말</li>
                    <li id="dap2S_1" style="display:none;"><a href="/B_P002_D001/shopMainCate?listType=27">긴양말</a></li>
                    <li id="dap2S_2" style="display:none;"><a href="/B_P002_D001/shopMainCate?listType=28">반양말</a></li>
                    <li id="dap2S_3" style="display:none;"><a href="/B_P002_D001/shopMainCate?listType=29">발가락</a></li>
                    
                    <li id="dap1Bag" style="display:none;">-가방</li>
                    <li id="dap2B_1" style="display:none;"><a href="/B_P002_D001/shopMainCate?listType=30">백팩</a></li>
                    <li id="dap2B_2" style="display:none;"><a href="/B_P002_D001/shopMainCate?listType=31">크로스백</a></li>
                    
                    <li id="dap1Shose" style="display:none;">-신발</li>
                    <li id="dap2Sh" style="display:none;"><a href="/B_P002_D001/shopMainCate?listType=32">등산화</a></li>
                    <!-- 잡화 -->
                    
                    <!-- 등산용품 -->
                    <li id="tap3">등산용품</li>
                    <li id="dap1stuff_0" style="display:none;"><a href="/B_P002_D001/shopMainCate?listType=11">스틱</a></li>
                    <li id="dap1stuff_1" style="display:none;"><a href="/B_P002_D001/shopMainCate?listType=12">장갑</a></li>
                    <li id="dap1stuff_2" style="display:none;"><a href="/B_P002_D001/shopMainCate?listType=13">아이젠</a></li>
                    <li id="dap1stuff_3" style="display:none;"><a href="/B_P002_D001/shopMainCate?listType=14">보호대</a></li>
                    <!-- 등산용품 -->
                    
                  </ul>
                </div>
              </aside>

            <aside class="left_widgets p_filter_widgets">
                <div class="l_w_title">
                  <h3><a href="/E_P003_D001/addUsedForm">중고등록</a></h3>
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
            <p>새것이 최고다!!</p>
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
            <a href="/B_P003_D001/productDetail?prodNum=${items.PRODNUM}"><img class="img-fluid w-100" src="/resources/img/${items.IMAGE }" alt=""/></a>
              <div class="p_icon">
                <a href="#">
                  <i class="ti-eye"></i>
                </a>
                <a href="#">
                  <i class="ti-heart"></i>
                </a>
                <a  href="/B_P003_D001/addCart?prodNum=${items.PRODNUM}&prodName=${items.NAME}&prodPrice=${items.PRICE}&addType=main" >
                  <i class="ti-shopping-cart"></i>
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
  <!--================ End Inspired Product Area =================-->
    <!--================ start footer Area  =================-->
    <footer class="footer-area section_gap">
      <div class="container">
        <div class="row">
          <div class="col-lg-2 col-md-6 single-footer-widget">
            <h4>Top Products</h4>
            <ul>
              <li><a href="#">Managed Website</a></li>
              <li><a href="#">Manage Reputation</a></li>
              <li><a href="#">Power Tools</a></li>
              <li><a href="#">Marketing Service</a></li>
            </ul>
          </div>
          <div class="col-lg-2 col-md-6 single-footer-widget">
            <h4>Quick Links</h4>
            <ul>
              <li><a href="#">Jobs</a></li>
              <li><a href="#">Brand Assets</a></li>
              <li><a href="#">Investor Relations</a></li>
              <li><a href="#">Terms of Service</a></li>
            </ul>
          </div>
          <div class="col-lg-2 col-md-6 single-footer-widget">
            <h4>Features</h4>
            <ul>
              <li><a href="#">Jobs</a></li>
              <li><a href="#">Brand Assets</a></li>
              <li><a href="#">Investor Relations</a></li>
              <li><a href="#">Terms of Service</a></li>
            </ul>
          </div>
          <div class="col-lg-2 col-md-6 single-footer-widget">
            <h4>Resources</h4>
            <ul>
              <li><a href="#">Guides</a></li>
              <li><a href="#">Research</a></li>
              <li><a href="#">Experts</a></li>
              <li><a href="#">Agencies</a></li>
            </ul>
          </div>
          <div class="col-lg-4 col-md-6 single-footer-widget">
            <h4>Newsletter</h4>
            <p>You can trust us. we only send promo offers,</p>
            <div class="form-wrap" id="mc_embed_signup">
              <form target="_blank" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
                method="get" class="form-inline">
                <input class="form-control" name="EMAIL" placeholder="Your Email Address" onfocus="this.placeholder = ''"
                  onblur="this.placeholder = 'Your Email Address '" required="" type="email">
                <button class="click-btn btn btn-default">Subscribe</button>
                <div style="position: absolute; left: -5000px;">
                  <input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
                </div>
  
                <div class="info"></div>
              </form>
            </div>
          </div>
        </div>
        <div class="footer-bottom row align-items-center">
          <p class="footer-text m-0 col-lg-8 col-md-12"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
          <div class="col-lg-4 col-md-12 footer-social">
            <a href="#"><i class="fa fa-facebook"></i></a>
            <a href="#"><i class="fa fa-twitter"></i></a>
            <a href="#"><i class="fa fa-dribbble"></i></a>
            <a href="#"><i class="fa fa-behance"></i></a>
          </div>
        </div>
      </div>
    </footer>
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
