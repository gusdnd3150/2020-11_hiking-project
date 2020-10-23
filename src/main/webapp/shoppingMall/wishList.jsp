<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>


<style>

</style>


<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
        $(document).ready(function () {
	
	
	            
	         $("#addCart").click(function(){            // 체크된 값만 장바구니로 3번으로 넣어야함
	        	 var quantities = [];
	        	 var prodNames=[];
	        	 var prices=[];  
	        	 var prodNums=[];  
	        	 var optionNums=[];
	        	 var likenums =[];
	        	 
	        	 $('input[name=addCart]:checked').each(function (i, elements) {
	        		    var index= $(elements).index("input:checkbox[name=addCart]");
	        		    var likeNum= $("input[name=addCart]").eq(index).val();//해당상품의 'likenum'
	        		    var prodNum=$("input[name=prodNum]").eq(index).val();//해당상품의 '상품번호'
	        		    var optionNum=$("input[name=optionNum]").eq(index).val();//해당상품의 '옵션번호'
	        		    var prodName=$("input[name=prodNames]").eq(index).val();//해당상품의 '이름'
	        		    var price =$("input[name=perPrice]").eq(index).val();//해당상품의 '가격'
	        		    
	        		    console.log("하나의 값"+price);
	        		    console.log("likeNum:"+likeNum);
	        		    console.log("수량"+1);
	        		    console.log("제품번호"+prodNum);
	        		    console.log("옵션번호"+optionNum);
	        		    
	        		    likenums.push(Number.parseInt(likeNum));
	        		    prodNums.push(Number.parseInt(prodNum));
	        		    optionNums.push(Number.parseInt(optionNum));
	        		    prodNames.push(prodName);
	        		    prices.push(Number.parseInt(price));
	        		    quantities.push(1);
	        		});
	        	 
	        	 if(likenums.length==0){
	        		 alert("상품을 체크해 주세요");
	        		 return;
	        	 }
	        	 
	        	 
	     		$.ajax({
	    			type : "post",       
	    			dataType : "text",      
	    			async:true,          
	    			url : "/E_P003_D001/addCartFromWish",      
	    			data : {quantities:quantities,prodNames:prodNames,prices:prices,prodNums:prodNums,
	    				optionNums:optionNums,likenums:likenums},  
	    			success : function(data, textStatus) {
	    				alert("추가되었습니다.");
	    				location.href="/B_P003_D001/wishList";
	    			},
	    			error : function(data, textStatus) {
	    				alert('에러발생');
	    			}
	    		}); 
	     		
	        	 
	         });
	         
	         
	       
			
	         $("#selectAll").click(function(){       //체크박스 전체 선택 혹은 해제
	             //클릭되었으면
	             if($("#selectAll").prop("checked")){
	                 //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	                 $("input[name=addCart]").prop("checked",true);
	                 //클릭이 안되있으면
	             }else{
	                 //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	                 $("input[name=addCart]").prop("checked",false);
	             }
	         });
	         
	        	                     //상품 총 가격
/*                  $("input[type=checkbox]").change(function(){  //체크박스 터치 시 이벤트 발생
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
                  }); */
	    });
        
        
        
        
        
        
        function putBox(index){
        	var button  =$("button[name=memobutton"+index+"]");
        	var commentText =$("input[name=commentText"+index+"]");
        	var addCommentgo =$("button[name=addBox"+index+"]");
        	
        	button.hide();
        	commentText.slideDown();
        	addCommentgo.slideDown();
        }
        
        
        
         
        function addComment(index){   //메모추가하기
        	var prodComment =$("input[name=commentText"+index+"]").val();  // 글
        	var likeNum =$("button[name=addBox"+index+"]").val();  //likenum
        	console.log(likeNum);
        	console.log(prodComment);
        	
        	if(prodComment==null||prodComment==""){
        		alert("메모를 입력해 주세요");
        	}
    		$.ajax({
    			type : "post",       
    			dataType : "text",    
    			async:true,         
    			url : "/E_P003_D001/updateMemo",         
    			data : {likeNum:likeNum,prodComment:prodComment},  //서버로 매개변수와 값을 설정
    			success : function(data, textStatus) {
    				alert("수정되었습니다.");
    				location.href="/B_P003_D001/wishList";
    			},
    			error : function(data, textStatus) {
    				alert('에러발생');
    			}
    		}); 
        	
        }
        
        
        function deleteWish(Num){
        	
        	var likeNum = Num; // prodlike PK
        	
        	$.ajax({
    			type : "post",       
    			dataType : "text",    
    			async:true,         
    			url : "/E_P003_D001/deleteWish",         
    			data : {likeNum:likeNum},  //서버로 매개변수와 값을 설정
    			success : function(data, textStatus) {
    				location.href="/B_P003_D001/wishList";
    			},
    			error : function(data, textStatus) {
    				alert('에러발생');
    			}
    		}); 
        	
        	
        }
        
        
        
        
        function modMemo(index){
        	var likeNum =$("button[name=modComment"+index+"]").val();    //likenum 
        	var prodComment ="";  // 메모내용
        	
       		$.ajax({
    			type : "post",       
    			dataType : "text",    
    			async:true,         
    			url : "/E_P003_D001/updateMemo",         
    			data : {prodComment:prodComment,likeNum:likeNum},  //서버로 매개변수와 값을 설정
    			success : function(data, textStatus) {
    				location.href="/B_P003_D001/wishList";
    			},
    			error : function(data, textStatus) {
    				alert('에러발생');
    			}
    		}); 
        	
        }
        
        
	         
        /* function sendModMemo(index){   //메모수정하기
        	var likeNum =$("button[name=sendMemo"+index+"]").val();  // likenum
        	var prodComment =$("input[name=prodComment"+index+"]").val();  // 수정할 내용
        	
        	console.log(likeNum);
        	console.log(prodComment);
        	
      		$.ajax({
    			type : "post",       
    			dataType : "text",    
    			async:true,         
    			url : "/E_P003_D001/updateMemo",         
    			data : {prodComment:prodComment,likeNum:likeNum},  //서버로 매개변수와 값을 설정
    			success : function(data, textStatus) {
    				alert("수정되었습니다.");
    				location.href="/B_P003_D001/wishList";
    			},
    			error : function(data, textStatus) {
    				alert('에러발생');
    			}
    		}); 
        } */
        
        
        
</script>



<meta charset="UTF-8">
<title>Insert title here</title>
</head>

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
  <jsp:include page="/common/header.jsp" />
    <!--================Header Menu Area =================-->

    <!--================Header Menu Area =================-->

    <!--================Home Banner Area =================-->
    <section class="banner_area">
      <div class="banner_inner d-flex align-items-center">
        <div class="container">
          <div
            class="banner_content d-md-flex justify-content-between align-items-center"
          >
            <div class="mb-3 mb-md-0">
              <h2>${userId }님 위시리스트</h2>
              <p></p>
            </div>
           <!--  <div class="page_link">
              <a href="index.html">Home</a>
              <a href="cart.html">Cart</a>
            </div> -->
          </div>
        </div>
      </div>
    </section>
    <!--================End Home Banner Area =================-->
    <!-- /////////////옵션 선택 안한애들 시작 -->
	    <!-- ///////////// -->
	    
    <!--================Cart Area =================-->
    <section class="cart_area">
      <div class="container">
        <div class="cart_inner">
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th scope="col"><input type="checkbox" id="selectAll" value=""></th>
                  <th scope="col">상품</th>
                  <th scope="col">가격</th>
                  <th scope="col">메모</th>
                  <th scope="col">평점</th>
                  <th scope="col">저장일</th>
                  <th scope="col">
       
                  </th>
                </tr>
              </thead>
              <tbody>
              <!-- 반복구간 -->
              <c:choose>
                <c:when test="${empty cartList }">
                <h>등록된 상품이 없습니다</h>
                </c:when>
                <c:when test="${not empty cartList }">
                     <c:forEach var="cartList" items="${cartList }" varStatus="test">
                <tr>
                <td>
                <input type="checkbox" name="addCart" value="${cartList.LIKENUM }">     <!-- 장바구니추가 시 서버로갈 데이터 -->
                <input type="hidden" name="prodNum" value="${cartList.PRODNUM }">
                <input type="hidden" name="optionNum" value="${cartList.OPTIONNUM }">
                <input type ="hidden" name="prodNames" value="${cartList.NAME }">
                <input type="hidden" name="perPrice" value="${cartList.PRICE }"> 
                </td>
                  <td>
                    <div class="media">
                      <div class="d-flex">
                        <img
                          src="/resources/img/${cartList.IMAGE }"
                          alt="" width="90px" height="90px"
                        />
                        <input type="hidden" name="images" value="${cartList.IMAGE }">
                      </div>
                      <div class="media-body">
                        <p>${cartList.NAME }</p>
                      </div>
                    </div>
                  </td>
                  <td>
                    <h5>${cartList.PRICE } &nbsp; 원</h5>
                  </td>
                  <td>
                  
                     <c:if test="${not empty cartList.PRODCOMMENT }">
                    <p>${cartList.PRODCOMMENT } &nbsp;    <button class="genric-btn default-border radius" name="modComment${test.index }" 
                    style="line-height: 19px;padding: 0px 6px" onclick="modMemo(${test.index })" value="${cartList.LIKENUM }">x</button></p>
                     </c:if>
                     
                     <c:if test="${empty cartList.PRODCOMMENT }">
                      <button style="line-height: 24px;padding: 0px 7px;" class="genric-btn primary radius" name="memobutton${test.index }" onclick="putBox(${test.index })" value="">메모하기</button>

                      <input type="text" name="commentText${test.index }" style="display:none">
                      <button  class="genric-btn default-border radius" name="addBox${test.index }" onclick="addComment(${test.index })"
                       value="${cartList.LIKENUM }" style="display:none;line-height: 24px;padding: 0px 7px;">메모등록</button>
                     </c:if>
                     
                  </td>
                  <td>
                   <div class="rating_list">
                     <c:if test="${cartList.VALUE >= 5 && cartList.VALUE < 6 }">
                      <p>${cartList.VALUE }  (상품평 : ${cartList.TOTALCOUNT } )</p>
                     <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                     </c:if>
                     <c:if test="${cartList.VALUE >=4  && cartList.VALUE <= 4.9  }">
                      <p>${cartList.VALUE }  (상품평 : ${cartList.TOTALCOUNT } )</p>
                     <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                     </c:if>
                     <c:if test="${cartList.VALUE >=3  && cartList.VALUE <= 3.9  }">
                      <p>${cartList.VALUE }  (상품평 : ${cartList.TOTALCOUNT } )</p>
                     <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i>
                     </c:if>
                     <c:if test="${cartList.VALUE >=2  && cartList.VALUE <= 2.9  }">
                      <p>${cartList.VALUE }  (상품평 : ${cartList.TOTALCOUNT } )</p>
                     <i class="fa fa-star"></i><i class="fa fa-star"></i>
                     </c:if>
                    <c:if test="${cartList.VALUE >=1  && cartList.VALUE <= 1.9  }">
                      <p>${cartList.VALUE }  (상품평 : ${cartList.TOTALCOUNT } )</p>
                     <i class="fa fa-star"></i>
                     </c:if>
                  </div>
                  </td>
                  <td>
                   <p> ${cartList.PICKDATE } </p>
                  </td>
                   <td>  
                    <a href="/B_P003_D001/productDetail?prodNum=${cartList.PRODNUM}"><button class="btn btn-info btn-sm" >상품보기</button></a><br><br>
                    <button class="genric-btn danger" style="line-height: 33px;padding: 0px 22px" onclick="deleteWish(${cartList.LIKENUM})" >삭제</button>
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
			<a href="/B_P003_D001/wishList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/B_P003_D001/wishList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/B_P003_D001/wishList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
			<p> ${paging.listType}</p>
		</c:if>
	    </div>        
                  </td>
                  <td></td>
                  <td></td>
                </tr>
                
                <tr>
                <td></td>
                <td></td>
                <td></td>
                  <td >
                  </td>
                  <td></td>
                </tr>

                <tr class="out_button_area">
                  <td></td>
                  <td></td>
                  <td></td>
                  <td colspan="2" align="center">
                    <div class="checkout_btn_inner">
                      <p class="gray_btn" id="keepShopping">뒤로가기</p>
                      <p class="main_btn" id="addCart">장바구니에 추가</p>
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
    <jsp:include page="../common/footer.jsp" flush="false" />
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
