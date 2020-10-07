<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>



<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
        $(document).ready(function () {
	
	            $("button[name=delete]").click(function () {        // 삭제
		       var check = window.confirm("삭제 하시겠습니까?");
		       
		       if (check==true){
		    	   
	          	var deleteNum = $(this).val();
		        console.log(deleteNum);
		        
		        $.ajax({
		        	type:"post",
		        	url:"/B_P003_D001/deleteCart",
		        	dataType:"text",
		        	data:{deleteNum:deleteNum},
		        	success:function(data){
		        		location.href="/B_P003_D001/cartList";
		        	},
		        	error:function(data){
		        		alert("삭제실패");
		        	}
		        });
		       }
	         });
	
	         $("#buyProduts").click(function(){            // 구매 시 체크된 값만 받아옴
	        	 /* var zoneCode = $('input[name=post1]').val(); */
	        	 var totalPrice = [];
	        	 var orderNums = [];
	        	 var quantities = [];
	        	 
	        	 $('input[name=buyinfo]:checked').each(function (i, elements) {
	        		    var index= $(elements).index("input:checkbox[name=buyinfo]");
	        		    
	        		    var perTotal =$("input[name=perTotal]").eq(index).val();//해당상품의 토탈 값
	        		    var orderNum =$("input[name=orderNum]").eq(index).val();//해당상품의 orderNum
	        		    var quantity =$("input[name=qty]").eq(index).val();//해당상품의 수량
	        		    
	        		    console.log("총 값"+perTotal);
	        		    totalPrice.push(Number.parseInt(perTotal));
	        		    console.log("주문번호"+orderNum);
	        		    orderNums.push(Number.parseInt(orderNum));
	        		    console.log("수량"+quantity);
	        		    quantities.push(Number.parseInt(quantity));
	        		});
	        	 
	        	 for(var i=0;i<quantities.length;i++){
	        		 console.log("배열수량"+quantities[i]);
	        		 console.log("배열 가격"+totalPrice[i]);
	        		 console.log("배열 주문번호"+orderNums[i]);
	        	 }
	     		$.ajax({
	    			type : "post",       //응답 데이터를 텍스트로 지정
	    			dataType : "text",    //응답 데이터를 텍스트로 지정   
	    			async:true,           //false인경우 동기식으로 처리
	    			url : "/B_P003_D001/butProductsFromCart",               // 전송할 서블릿을 지정
	    			data : {totalPrice:totalPrice,orderNums:orderNums,quantities:quantities},  //서버로 매개변수와 값을 설정
	    			success : function(data, textStatus) {  //전송과 응담이 성공했을 경우의 작업을 설정
	    				$('#message').append(data);  //서버 응답 메시지를 <div> 엘리먼트에 표시
	    			},
	    			error : function(data, textStatus) { //오류발생 시 내용
	    				alert('에러발생');
	    			},
	    			complete : function(data, textStatus) {  //완료 시 수행
	    				location.href="/B_P003_D001/buyProd?type=3";
	    			}
	    		});
	        	 
	         });
	         
	         
	         $("button[name=upNum]").click(function() {           //수량업 클릭 시 
				var index = $("button[name=upNum]").index(this); //인덱스 값 (이벤트를 발생시킨 태그의 index)
	        	 console.log(index);
	        	 var quantity =$("input[name=qty]").eq(index); // 값
	        	 var sst = quantity.val();
	        	 if(!isNaN(sst)){
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
			
			
			
	         $("#selectAll").click(function(){       //체크박스 전체 선택 혹은 해제
	             //클릭되었으면
	             if($("#selectAll").prop("checked")){
	                 //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	                 $("input[name=buyinfo]").prop("checked",true);
	                 //클릭이 안되있으면
	             }else{
	                 //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	                 $("input[name=buyinfo]").prop("checked",false);
	             }
	         });
	         
	        	                     //상품 총 가격
                 $("input[type=checkbox]").change(function(){  //체크박스 터치 시 이벤트 발생
                     var sum =0;
    	        	 $('input[name=buyinfo]:checked').each(function (i, elements) {
    	        		    var index= $(elements).index("input:checkbox[name=buyinfo]");
    	        		    var perTotal =$("input[name=perTotal]").eq(index).val();
    	        		    var pase = Number.parseInt(perTotal)
    	        		    sum = sum+pase;
    	        		});
    	        	console.log(sum);
    	    	    var shototal =$("#showTotal");
	          	    shototal.text(sum);
                  });
	    });
</script>



<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="/common/header.jsp" />
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
    
    
    
  <body>
    <!--================Header Menu Area =================-->
    <header class="header_area">
      
<div  class="topnav container" align="center">
  <a class="active" href="/B_P002_D001/shopMainCate?listType=10">Home</a> <!--  10은 전체목록 -->
  <a href="/B_P002_D001/shopMainCate?listType=2">등산 가방</a>  
  <a href="/B_P002_D001/shopMainCate?listType=3">아웃도어</a>
  <a href="/B_P002_D001/shopMainCate?listType=4">등산스틱</a>
  <a href="/B_P002_D001/shopMainCate?listType=5">등산화</a>
  <a href="/B_P002_D001/shopMainCate?listType=6">등산장갑</a>
  <a href="/B_P002_D001/shopMainCate?listType=1">양말</a>
  <a href="/B_P002_D001/shopMainCate?listType=7">보호대</a>
  <a href="/B_P002_D001/shopMainCate/6">중고물품 등록</a>
  <a class="fas fa-shopping-cart" id="getSession"></a>
</div>
    </header>
    <!--================Header Menu Area =================-->

    <!--================Home Banner Area =================-->
    <section class="banner_area">
      <div class="banner_inner d-flex align-items-center">
        <div class="container">
          <div
            class="banner_content d-md-flex justify-content-between align-items-center"
          >
            <div class="mb-3 mb-md-0">
              <h2>${cartList[0].userNum }님 장바구니</h2>
              <p></p>
            </div>
            <div class="page_link">
              <a href="index.html">Home</a>
              <a href="cart.html">Cart</a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================End Home Banner Area =================-->

    <!--================Cart Area =================-->
    <section class="cart_area">
      <div class="container">
        <div class="cart_inner">
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th scope="col"><input type="checkbox" id="selectAll" value=""></th>
                  <th scope="col">Product</th>
                  <th scope="col">Price</th>
                  <th scope="col">Quantity</th>
                  <th scope="col">Total</th>
                  <th scope="col">delete</th>
                </tr>
              </thead>
              <tbody>
              <!-- 반복구간 -->
              <c:choose>
                <c:when test="${empty cartList }">
                <h>등록된 상품이 없습니다</h>
                </c:when>
                <c:when test="${not empty cartList }">
                     <c:forEach var="cartList" items="${cartList }">
                <tr>
                      <td>
                <input type="checkbox" name="buyinfo" value="${cartList.prodNum }">
                <input type="hidden" name="orderNum" value="${cartList.orderNum }">
                </td>
                  <td>
                    <div class="media">
                      <div class="d-flex">
                        <img
                          src="/B_P002_D001/mainImage/${cartList.prodNum }"
                          alt="" width="90px" height="90px"
                        />
                      </div>
                      <div class="media-body">
                        <p>${cartList.prodName }</p>
                      </div>
                    </div>
                  </td>
                  <td>
                    <h5>${cartList.price }</h5>
                    <input type="hidden" name="perPrice" value="${cartList.price }">
                  </td>
                  <td>
                    <div class="product_count">
                      <input
                        type="text"
                        name="qty"
                        id="sst"
                        maxlength="12"
                        value="${cartList.quantity }"
                        title="Quantity:"
                        class="input-text qty"
                      />
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
                  <td>
                    <%-- <h5 id="totalPut">${cartList.price * cartList.quantity }</h5> --%>
                    <input type="text" name="perTotal" value="${cartList.price * cartList.quantity }" readonly style="border: none">
                  </td>
                   <td>
                    <button class="btn btn-info btn-sm" name="delete" value="${cartList.prodNum }">삭제</button>
                  </td>
                </tr>
                  
                     
                     </c:forEach>
                </c:when>              
              </c:choose>
                  <!-- 반복구간  -->
                                  
                
                <tr>      <!-- 페이징 자리 -->
                  <td colspan="6">
          <div style="display: block; text-align: center;">
	     <c:if test="${paging.startPage != 1 }">
			<a href="/B_P003_D001/cartList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/B_P003_D001/cartList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/B_P003_D001/cartList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
			<p> ${paging.listType}</p>
		</c:if>
	    </div>                  
                  </td>
                </tr>
                
                <tr>
                <td></td>
                <td></td>
                <td></td>
                  <td >
                    <h5>Total</h5>
                  </td>
                  <td>
                    <h5> <bold id="showTotal">0</bold>원 </h5>
                    <intput type="hidden" name="lastPrice" value="">
                  </td>
                  <td></td>
                </tr>

                <tr class="out_button_area">
                  <td></td>
                  <td></td>
                  <td></td>
                  <td colspan="2" align="center">
                    <div class="checkout_btn_inner">
                      <p class="gray_btn" id="keepShopping">쇼핑계속하기</p>
                      <p class="main_btn" id="buyProduts">구매하기</p>
                    </div>
                  </td>
                  <td></td>
                  <td></td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </section>
    <!--================End Cart Area =================-->

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