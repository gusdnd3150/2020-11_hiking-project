<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" 
    import ="java.util.*,project.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />   


<!DOCTYPE html>
<html lang="ko">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <link rel="icon" href="img/favicon.png" type="image/png" />
    
        <!-- Bootstrap core CSS -->
  <link href="/resources/shop/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="/resources/shop/css/shop-homepage.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="/resources/css/views/common/header.css">
    <!-- Bootstrap core JavaScript -->
  <script src="/resources/shop/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/shop/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    
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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>         
   $(document).ready(function () {
	   
            $("#buyProduct").on("click",function(){
           var quantity = $("#sst").val();
           var prodNum =  $("#prodNum").val();
           console.log(prodNum);
           console.log(quantity);
           location.href="/B_P003_D001/buyProd?prodNum="+prodNum+"&quantity="+quantity+"&type=1";

           });
           


             $("#addCart").on("click",function(){     //장바구니에 추가
               var prodNums = []; 
               var optionnums =[];
               var quantities =[];
               var prices =[];
               var prodPrice =$("input[name=addPrice]").val();
               console.log(prodPrice);
               var addType ="상품디테일";
               
           	 $('input[name=optionCheck]:checked').each(function (i, elements) {
     		    var index= $(elements).index("input:checkbox[name=optionCheck]");
     		   var prodNum =$("input[name=prodNum]").eq(index).val();
     		  var optioNnum =$("input[name=optionNum]").eq(index).val();
     		    var quantity =$("input[name=qty]").eq(index).val();
     		   
     		   var vcalcul=  Number.parseInt(quantity) * Number.parseInt(prodPrice);
     		    prodNums.push(Number.parseInt(prodNum));
     		    optionnums.push(Number.parseInt(optioNnum));
     		    quantities.push(Number.parseInt(quantity));
     		   prices.push(vcalcul);
     		});
           	 for(var i=0;i<prodNums.length;i++){
           		 console.log("프로드넘"+prodNums[i]);
           		console.log("옵션"+optionnums[i]);
           		console.log("수량"+quantities[i]);
           		console.log("체크된 수량*제품가격"+prices[i]);
           	 }
           	 
           	 for(var i=0;i< quantities.length;i++){
           		 if(quantities[i] <1){
                      alert("수량을 입력해 주세요");
                }
           	 }
           	 
        
      		  $.ajax({
 	            type:"post",
 	            async:true,
 	            url:"/B_P003_D001/addCart",
 	            data:{prodNums:prodNums,optionnums:optionnums,quantities:quantities,addType:addType,prices:prices},
 	            success:function(data,textStatus){
 	            	alert('장바구니에 추가되었습니다.');
 	            	location.href="/B_P002_D001/shopMainCate?listType=100";
 	            },
 	            error:function(data,textStatus){
 	            }
 	          }); 
 	          
           });
           
   
          
          
          
          $("button[name=upNum]").click(function() {           //수량업 클릭 시 
				 var index = $("button[name=upNum]").index(this); //인덱스 값 (이벤트를 발생시킨 태그의 index)
				 var dbquantity = $("input[name=quantity]").eq(index).val(); 
	        	 console.log(dbquantity);
	        	 var quantity =$("input[name=qty]").eq(index); // 값
	        	 var sst = quantity.val();
	        	 
	        	 if(sst == dbquantity ) {
	        		 alert("재고량을 초과할 수 없습니다.");
	        	 }else if(!isNaN(sst)){
	        		 sst++;
	        	 }
	        	 quantity.val(sst);
	             var quantity2 =quantity.val();
	        	 var perPrice =$("input[name=perPrice]").eq(index).val(); // 값
	        	 var calcul = quantity2* perPrice;
	        	 var perTotal =$("input[name=perTotal]").eq(index);  //태그만 선택
	        	 quantity.val(quantity2);
	        	 perTotal.val(calcul);
	        	 
			});
	         
	         
	         $("button[name=downNum]").click(function() {           //수량다운 클릭 시 
					var index = $("button[name=downNum]").index(this); //인덱스 값 (이벤트를 발생시킨 태그의 index)
		        	 console.log(index);
		        	 var quantity =$("input[name=qty]").eq(index); // 값 인덱스번호에 맞는 qty태그를 선택
		        	 var sst = quantity.val();
		        	 if(!isNaN(sst)){
		        		 sst--;
		        	 }
		        	 quantity.val(sst);
		             var quantity2 =quantity.val();
		        	 var perPrice =$("input[name=perPrice]").eq(index).val(); // 값
		        	 var calcul = quantity2* perPrice;
		        	 var perTotal =$("input[name=perTotal]").eq(index);  //태그만 선택
		        	 quantity.val(quantity2);
		        	 perTotal.val(calcul);
				});
 
});

      
   

</script>

  <body>
  <jsp:include page="/common/header.jsp" />

    <!--================Single Product Area =================-->
    <div class="product_image_area">
      <div class="container">
        <div class="row s_product_inner">
        
          <div class="col-lg-6">
            <div class="s_product_img">
              <div
                id="carouselExampleIndicators"
                class="carousel slide"
                data-ride="carousel"
              >
               <!-- 여기서부터는 작은이미지 -->
                <ol class="carousel-indicators">
               <c:forEach var="showimages" items="${images }" varStatus="index">
                  <li
                    data-target="#carouselExampleIndicators"
                    data-slide-to="${index.index }"
                    class="active"
                  >
                    <img
                    width="60px" height="60px"
                      src="http://localhost:8080/resources/img/${showimages.CONTENT }"
                      alt=""
                    />
                  </li>
               </c:forEach>
                </ol>
                
               <!-- 여기서부터는 큰이미지 -->
                <div class="carousel-inner">
                
                
                  
                  <div class="carousel-item active">
                    <img
                    width="450px" height="450px"
                      class="d-block w-100"
                      src="http://localhost:8080/resources/img/${images[0].CONTENT }"
                    />
                  </div>
                  
   
                  
                  
                  <c:if test="${fn:length(images) ==4 }">
                           <div class="carousel-item ">
                    <img
                    width="450px" height="450px"
                      class="d-block w-100"
                      src="http://localhost:8080/resources/img/${images[1].CONTENT }"
                    />
                  </div>
                           <div class="carousel-item ">
                    <img
                    width="450px" height="450px"
                      class="d-block w-100"
                      src="http://localhost:8080/resources/img/${images[2].CONTENT }"
                    />
                  </div>
                           <div class="carousel-item ">
                    <img
                    width="450px" height="450px"
                      class="d-block w-100"
                      src="http://localhost:8080/resources/img/${images[3].CONTENT }"
                    />
                  </div>
                  
                  </c:if>
                 
                 <c:if test="${fn:length(images) ==3 }">
                          <div class="carousel-item ">
                    <img
                    width="450px" height="450px"
                      class="d-block w-100"
                      src="http://localhost:8080/resources/img/${images[1].CONTENT }"
                    />
                  </div>
                           <div class="carousel-item ">
                    <img
                    width="450px" height="450px"
                      class="d-block w-100"
                      src="http://localhost:8080/resources/img/${images[2].CONTENT }"
                    />
                  </div>
                  </c:if>
                 
                 <c:if test="${fn:length(images) ==2 }">
                          <div class="carousel-item ">
                    <img
                    width="450px" height="450px"
                      class="d-block w-100"
                      src="http://localhost:8080/resources/img/${images[1].CONTENT }"
                    />
                  </div>
                  </c:if>
                  
                </div>
              </div>
            </div>
          </div>
          
          
          
          
          <div class="col-lg-5 offset-lg-1">
            <div class="s_product_text">
              <h3>${prodDetail[0].NAME}</h3>
              <h2>$ ${prodDetail[0].PRICE } 원</h2>
              <input type="hidden" name="addPrice" value="${prodDetail[0].PRICE }">
              <ul class="list">
                <li>
                    <c:if test="${prodDetail[0].TYPE ==1 }">
                    <a class="active" href="#">
                    <span>Category</span> : 중고</a>
                    </c:if>
                    <c:if test="${prodDetail[0].TYPE ==2 }">
                     <a class="active" href="#">
                    <span>Category</span> : 신제품</a>
                    </c:if>
                    
                </li>
                <li>
                  <%-- <a href="#"> <span>Availibility</span> : ${prodDetail[0].QUANTITY } </a> --%>
                </li>
              </ul>
              <p>
                ${prodDetail[0].CONTENT }
              </p>
              <hr>
              
              <div>   <!-- 옵션테그 -->
               <a href="#"> <span>Options 선택</span> : </a>
               <!-- 반복 -->
              <table>
              <c:forEach var="options" items="${prodDetail }">
               <tr>
               <td><input type="checkbox" name="optionCheck">  &nbsp; &nbsp;</td>
               
               <td> <h> <span>재고 </span> : ${options.QUANTITY }  &nbsp; &nbsp; </h> </td>
                 <td><h> <span>사이즈 </span> : ${options.PRODSIZE }  &nbsp; &nbsp;</h> </td>
               <td> <h><span>색상</span> :  ${options.COLOR }  &nbsp;</h></td>
               <td>
                 <!-- <h><input type="text" name="inputquantity" placeholder="수량 입력 " style="display: none" value="" size=6></h> -->
                    <div class="product_count" style="margin-top: 10px;margin-bottom: 6px"  >
                      <input
                        type="text"
                        name="qty"
                        id="sst"
                        maxlength="12"
                        value="1"
                        title="Quantity:"
                        class="input-text qty"
                         style="height: 36px"/>
                      <button
                        onclick=""
                        class="increase items-count"
                        type="button"
                        name="upNum"
                      >
                        <i class="lnr lnr-chevron-up"></i>
                      </button>
                      <button
                        onclick=""
                        class="reduced items-count"
                        type="button"
                        name="downNum"
                      >
                        <i class="lnr lnr-chevron-down"></i>
                      </button>
                    </div>
                </td>
              </tr>
              <input type="hidden" name="quantity" value="${options.QUANTITY }">
              <input type="hidden" name="prodNum" value="${options.PRODNUM }">
              <input type="hidden" name="optionNum" value="${options.OPTIONNUM }">
              </c:forEach>
              </table>
                <br>
                <!-- 반복 끝 -->
              </div>
              <hr>
 
             
              <div class="card_area">
                <p class="main_btn" id="addCart">장바구니</p>  <!--  a tag에 수량+prodNum과 같이 보내고 서버에서 세션으로 진행할지 결정 -->
                <%-- <a class="main_btn" href="/B_P003_D001/buyProd/${prodDetail.prodNum }">구매하기</a> --%>
                <p class="main_btn" id="buyProduct">구매하기</p> 
                <input type="hidden" id="prodNum" value="${prodDetail[0].PRODNUM }">
                <input type="hidden" id="prodName" value="${prodDetail[0].NAME }"> 
                <input type="hidden" id="prodPrice" value="${prodDetail[0].PRICE }">
                <a class="icon_btn" href="#">
                  <i class="lnr lnr lnr-heart"></i>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--================End Single Product Area =================-->

    <!--================Product Description Area =================-->
    <section class="product_description_area">
      <div class="container">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
          <li class="nav-item">
            <a
              class="nav-link"
              id="home-tab"
              data-toggle="tab"
              href="#home"
              role="tab"
              aria-controls="home"
              aria-selected="true"
              >Description</a
            >
          </li>
          <li class="nav-item">
            <a
              class="nav-link active"
              id="review-tab"
              data-toggle="tab"
              href="#review"
              role="tab"
              aria-controls="review"
              aria-selected="false"
              >Reviews</a
            >
          </li>
        </ul>
        <div class="tab-content" id="myTabContent">
          <div
            class="tab-pane fade"
            id="home"
            role="tabpanel"
            aria-labelledby="home-tab"
          >
            <c:choose>
                 <c:when test="${empty imagesBottom }">
               <p>이미지가 없습니다.</p>     
                   </c:when>
                  <c:when test="${not empty imagesBottom }">
                    <c:forEach var="imagesBottom" items="${imagesBottom }">
                   <img src="http://localhost:8080/resources/img/${imagesBottom.CONTENTDETAIL }"  alt="상" width="800" height="500"><br>
                   </c:forEach>
            </c:when>
           </c:choose>
          </div>
          <div
            class="tab-pane fade"
            id="profile"
            role="tabpanel"
            aria-labelledby="profile-tab"
          >
            <div class="table-responsive">
              <table class="table">
                <tbody>
                  <tr>
                    <td>
                      <h5>Width</h5>
                    </td>
                    <td>
                      <h5>128mm</h5>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <h5>Height</h5>
                    </td>
                    <td>
                      <h5>508mm</h5>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <h5>Depth</h5>
                    </td>
                    <td>
                      <h5>85mm</h5>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <h5>Weight</h5>
                    </td>
                    <td>
                      <h5>52gm</h5>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <h5>Quality checking</h5>
                    </td>
                    <td>
                      <h5>yes</h5>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <h5>Freshness Duration</h5>
                    </td>
                    <td>
                      <h5>03days</h5>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <h5>When packeting</h5>
                    </td>
                    <td>
                      <h5>Without touch of hand</h5>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <h5>Each Box contains</h5>
                    </td>
                    <td>
                      <h5>60pcs</h5>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <div
            class="tab-pane fade"
            id="contact"
            role="tabpanel"
            aria-labelledby="contact-tab"
          >
            <div class="row">
              <div class="col-lg-6">
              </div>
              <div class="col-lg-6">
                <div class="review_box">
                  <h4>Post a comment</h4>
                  <form
                    class="row contact_form"
                    action="contact_process.php"
                    method="post"
                    id="contactForm"
                    novalidate="novalidate"
                  >
                    <div class="col-md-12">
                      <div class="form-group">
                        <input
                          type="text"
                          class="form-control"
                          id="name"
                          name="name"
                          placeholder="Your Full name"
                        />
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <input
                          type="email"
                          class="form-control"
                          id="email"
                          name="email"
                          placeholder="Email Address"
                        />
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <input
                          type="text"
                          class="form-control"
                          id="number"
                          name="number"
                          placeholder="Phone Number"
                        />
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <textarea
                          class="form-control"
                          name="message"
                          id="message"
                          rows="1"
                          placeholder="Message"
                        ></textarea>
                      </div>
                    </div>
                    <div class="col-md-12 text-right">
                      <button
                        type="submit"
                        value="submit"
                        class="btn submit_btn"
                      >
                        Submit Now
                      </button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
          <div
            class="tab-pane fade show active"
            id="review"
            role="tabpanel"
            aria-labelledby="review-tab"
          >
            <div class="row">
              <div class="col-lg-6">
                <div class="row total_rate">
                  <div class="col-6">
                    <div class="box_total">
                      <h5>Overall</h5>
                      <h4>${average }</h4>
                      <h6>(03 Reviews)</h6>
                    </div>
                  </div>
                  <div class="col-6">
                    <div class="rating_list">
                      <h3>Based on 3 Reviews</h3>
                      <ul class="list">
                        <li>
                          <a href="#"
                            >5 Star
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            </a>
                        </li>
                        <li>
                          <a href="#"
                            >4 Star
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i> </a
                          >
                        </li>
                        <li>
                          <a href="#"
                            >3 Star
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i> </a
                          >
                        </li>
                        <li>
                          <a href="#"
                            >2 Star
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i> </a
                          >
                        </li>
                        <li>
                          <a href="#"
                            >1 Star
                            <i class="fa fa-star"></i> </a
                          >
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
                <div class="review_list">
                          <!-- 경계선 -->
                       <c:choose>
                            <c:when test="${empty afterList }">
                                 <p> 후기가 없습니다 </p>
                            </c:when>
                            <c:when test="${not empty afterList }">      
                               <c:forEach var="afterList" items="${afterList }">
                                 <c:if test="${afterList.lvl == 1 }">    <!--  후기원글일 경우 -->
                     
                     <div class="review_item">
                    <div class="media">
                      <div class="d-flex">
                       <!-- 이미지 -->
                        <img
                          src="http://localhost:8080/resources/img/${afterList.photo }"
                          alt=""
                          width="100px" height="100px"
                        />
                      </div>
                      <div class="media-body">
                        <h4>${afterList.userNum }</h4>    <!-- 유저아이디 -->
                        <c:if test="${afterList.evalue ==1 }">
                        <i class="fa fa-star"></i>        <!-- 평점 -->
                        </c:if>
                        <c:if test="${afterList.evalue ==2 }">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        </c:if>
                        <c:if test="${afterList.evalue ==3 }">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        </c:if>
                       <c:if test="${afterList.evalue == 4 }">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        </c:if>
                       <c:if test="${afterList.evalue == 5 }">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        </c:if>
                      </div>
                    </div>
                    <p>                 <!-- 내용 -->
                       ${afterList.content }
                    </p>
                    <p>${afterList.createDat }</p>
                    <form name="addComent"  method="post" action="/B_P003_D001/addComent"  >
                                            <input type="hidden" name="prodNum" value="${prodDetail[0].PRODNUM }">
                                            <input type="hidden" name="afterType" value="${afterList.afterNum }">
                                         <input type="text" name="content">
                                         <input type="submit" class="btn btn-info" value="댓글등록">
                                       </form>
                  </div>
                  </c:if>
                  <c:if test="${afterList.lvl == 2 }">
                     <div class="review_item" style="background-color:#e9e9e9">
                    <div class="media">
                      <div class="d-flex">
                      <hr>   <!-- 이미지 -->
                      </div>
                      <div class="media-body">
                        <h4>id: ${afterList.userNum }</h4>    <!-- 유저아이디 -->
                      </div>
                    </div>
                    <p>                 <!-- 내용 -->
                       ${afterList.content }
                    </p>
                    <p>${afterList.createDat }</p>
                  </div>
                                 </c:if>
                               </c:forEach>
                            </c:when>
                         </c:choose>       
                  
                 <!-- 경계선 -->
                </div>
                    <!-- 페이징 -->
                <div style="display: block; text-align: center;">
	<c:if test="${paging.startPage != 1 }">
			<a href="/B_P003_D001/productDetail?prodNum=${prodDetail[0].PRODNUM }&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/B_P003_D001/productDetail?prodNum=${prodDetail[0].PRODNUM}&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/B_P003_D001/productDetail?prodNum=${prodDetail[0].PRODNUM}&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
			<p> ${paging.listType}</p>
		</c:if>
	</div>
                
              </div>
              <div class="col-lg-6">
                <div class="review_box">
                  <h4>상품 후기 등록</h4>
                   <form
                    class="row contact_form"
                    action="/B_P003_D001/addAfter"
                    method="post"
                    id="contactForm"
                    novalidate="novalidate"
                    enctype="multipart/form-data"
                  >
                  <input type="hidden" name="prodNum" value="${prodDetail[0].PRODNUM }"><br>
                  <label>평점 </label>
            <select name="evalue" id="evalue">
            <option value="1">1</option>    
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
             </select><br>
                    <!-- 파일첨부 -->
                        <input
                          type="file"
                          name="photo"
                        />
                  <!-- 상품후기내용 -->
                    <div class="col-md-12">
                      <div class="form-group">
                        <textarea
                          class="form-control"
                          name="content"
                          id="content"
                          rows="1"
                          placeholder="후기"
                          style="width:400px;height:100px"
                        ></textarea>
                      </div>
                    </div>
                    <div class="col-md-12 text-right">
                      <button
                        type="submit"
                        value="submit"
                        class="btn submit_btn"
                      >
                        Submit Now
                      </button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================End Product Description Area =================-->


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
