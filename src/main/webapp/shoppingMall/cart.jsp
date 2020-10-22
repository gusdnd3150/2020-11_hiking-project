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
	
	           
	            
	            
	            
	            $("button[name=chooseOption]").click(function () {        // 옵션보기
	 		       
	 	          	var prodNum = $(this).val(); //프로드넘  putOption
	 	          	var index = $("button[name=chooseOption]").index(this); //인덱스
	 	          	var ordernum =$("input[name=orderNum]").eq(index).val(); //오더넘
	 	          	var putter =$("div #putOption").eq(index); //푸터 태그 선택
	 		        console.log(prodNum);
	 		       console.log("인덱스값"+index);
	 		      console.log("푸터인덱스"+putter.index());
	 		     console.log("오더넘"+ordernum);
	 		      
	 		        $.ajax({
	 		        	type:"get",
	 		        	url:"/E_P003_D001/chooseOption",
	 		        	dataType:"JSON", 
	 		        	data:{prodNum:prodNum},
	 		        	contentType: "application/json; charset=utf-8;",
	 		        	success:function(data){
	                    console.log(data[0].NAME);
	                    console.log(data.length);
	                   
	                    for(var i ;i<data.length ; i++){
	                          console.log(data[i].NAME);
	                    }
	                    
	                    var put = "<table style='border-style:solid'>";
	                    
	                    put += "<tr>";
	                    put += "<th>재고</th>";
	                    put += "<th>사이즈</th>";
	                    put += "<th>색상</th>";
	                    put += "<th>수량</th>";
	                    put += "<th></th>";
	                    put += "</tr>";
	                    for(var i=0 ;i<data.length ; i++){
	                    	put += "<tr>";
	                    	
	                    	//put += "<td><input type='checkbox' name='optionCheck'>  &nbsp; &nbsp;</td>";
	                    	put += "<td> <h>   "+data[i].QUANTITY+" &nbsp; &nbsp; </h> </td>";
	                    	put += "<td> <h>   "+data[i].PRODSIZE+"  &nbsp; &nbsp;</h> </td>";
	                    	put += "<td> <h>   "+data[i].COLOR+"  &nbsp;</h></td>";
	                    	put += "<td>";
	                    	put += "<div class='product_count' style='margin-top: 10px;margin-bottom: 6px'  >";
	                    	put += "<input type='text' name='qty2' id='sst2' maxlength='12' value='1' title='Quantity:' class='input-text qty' style='height: 36px'/>";
	                    	put += "<button onclick='' class='increase items-count' type='button' name='upNum2'> <i class='lnr lnr-chevron-up'></i> </button>";
	                    	put += "<button onclick='' class='reduced items-count' type='button' name='downNum2'> <i class='lnr lnr-chevron-down'></i> </button>";
	                    	put += "</div>";
	                    	put += "</td>";
	                    	put += "<td>";
	                        put += "<button class='btn btn-info btn-sm' name='modOption' value='"+data[i].OPTIONNUM+"'>추가하기</button>";
	                    	put += "</td>";
	                    	put += "</tr>";
	                    	put += "<input type='hidden' name='quantity2' value='"+data[i].QUANTITY+"'>";
	                    	put += "<input type='hidden' name='orderNum2' value='"+ordernum+"'>";
	                    	put += "<input type='hidden' name='perPrice2' value='"+data[i].PRICE+"'>";
	                    	put += "<input type='hidden' name='prodNum2' value='"+data[i].PRODNUM+"'>";
	                    	put += "<input type='hidden' name='optionNum2' value='"+data[i].OPTIONNUM+"'>";
	                    	
	                    }
	                    put += "</table>";
	                    console.log(put);
	                    putter.html(put);
	                    
	                    
	                    
	                    $("button[name=upNum2]").click(function() {           //수량업 클릭 시 
	       				 var index = $("button[name=upNum2]").index(this); //인덱스 값 (이벤트를 발생시킨 태그의 index)
	       				 var dbquantity = $("input[name=quantity2]").eq(index).val(); 
	       	        	 console.log(index);
	       	        	 var quantity =$("input[name=qty2]").eq(index); // 값
	       	        	 var sst = quantity.val();
	       	        	 
	       	        	 if(sst == dbquantity ) {
	       	        		 alert("재고량을 초과할 수 없습니다.");
	       	        	 }else if(!isNaN(sst)){
	       	        		 sst++;
	       	        	 }
	       	        	 quantity.val(sst);
	       	             var quantity2 =quantity.val();
	       	        	 var perPrice =$("input[name=perPrice2]").eq(index).val(); // 값
	       	        	 var calcul = quantity2* perPrice;
	       	        	 var perTotal =$("input[name=perTotal2]").eq(index);  //태그만 선택
	       	        	 quantity.val(quantity2);
	       	        	 perTotal.val(calcul);
	       	        	 
	                    });
	                    
	                    $("button[name=downNum2]").click(function() {                  //수량다운 클릭 시 
	                    	var index = $("button[name=downNum2]").index(this); //인덱스 값 (이벤트를 발생시킨 태그의 index)
	            		        	 console.log(index);
	            		        	 var quantity =$("input[name=qty2]").eq(index); // 값 인덱스번호에 맞는 qty태그를 선택
	            		        	 var sst = quantity.val();
	            		        	 if(!isNaN(sst)){
	            		        		 sst--;
	            		        	 }
	            		        	 quantity.val(sst);
	            		             var quantity2 =quantity.val();
	            		        	 var perPrice =$("input[name=perPrice2]").eq(index).val(); // 값
	            		        	 var calcul = quantity2* perPrice;
	            		        	 var perTotal =$("input[name=perTotal2]").eq(index);  //태그만 선택
	            		        	 quantity.val(quantity2);
	            		        	 perTotal.val(calcul);
	                    });
	                   
	                    
	                    $("button[name=modOption]").click(function() {           //수량업 클릭 시 
		       				 var index = $("button[name=modOption]").index(this); //인덱스 값 (이벤트를 발생시킨 태그의 index)
		       	        	 console.log(index);
		       				 var add=$(this);
		       	        	 var quantity =$("input[name=qty2]").eq(index).val(); // 값
		       	        	var ordernum =$("input[name=orderNum2]").eq(index).val(); // 값
		       	        	var perPrice =$("input[name=perPrice2]").eq(index).val(); // 값
		       	        	var optionNum =$("input[name=optionNum2]").eq(index).val(); // 값
		       	        	var sear =$("input[name=qty2]").eq(index); // 값
		       	        	
		       	        	console.log("오더넘:"+ordernum);
		       	        	console.log("옵션넘:"+optionNum);
		       	        	console.log("수량:"+quantity);
		       	        	console.log("가격(하나당):"+perPrice);
		       	        	
		       	        	
		       	        	//내일 아침에 아작스로 처리하면 끝
		       	        	          $.ajax({
		       	        		            type: "get",
		       	        		            url: "/E_P003_D001/modOption",
		       	        		            data: {ordernum:ordernum,optionNum:optionNum,quantity:quantity,perPrice:perPrice},
		       	        		            dataType: "json",
		       	        		            success: function( responseData, status , xhr ){
		       	        		            },
		       	        		            error:function(xhr, status, error){
		       	        		                console.log(error);
		       	        		            },
		       	        		            complete:function(){
		       	        		            	alert("옵션이 등록되었습니다.");
		       	        		            	location.href="/B_P003_D001/cartList";
		       	        		            }
		       	        		        });
		       	        	
		                    });
	                      
	                    
	                    
	 		        	},
	 		        	error:function(data){
	 		        		alert("옵션보기 실패");
	 		        	}
	 		        }); 
	 	         });
	            
	      
	            
	              
	              
	            
	         $("#buyProduts").click(function(){            // 구매 시 체크된 값만 받아옴
	        	 var orderNums = [];
	        	 var totalPrice = []; 
	        	 var quantities = [];
	        	 var images =[];  
	        	 var prodNames=[];
	        	 var prices=[];  
	        	 var prodNums=[];  
	        	 var colors=[];
	        	 var sizes=[];
	        	 var optionNums=[];
	        	 
	        	 $('input[name=buyinfo]:checked').each(function (i, elements) {
	        		    var index= $(elements).index("input:checkbox[name=buyinfo]");
	        		    var perTotal =$("input[name=perTotal]").eq(index).val();//해당상품의 토탈 값
	        		    var orderNum =$("input[name=orderNum]").eq(index).val();//해당상품의 orderNum
	        		    var quantity =$("input[name=qty]").eq(index).val();//해당상품의 수량
	        		    var image  =$("input[name=images]").eq(index).val();//해당상품의 수량
	        		    var prodName=$("input[name=prodNames]").eq(index).val();//해당상품의 수량
	        		    var price=$("input[name=perPrice]").eq(index).val();//해당상품의 수량
	        		    var prodNum=$("input[name=prodNum]").eq(index).val();//해당상품의 상품번호
	        		    var optionNum=$("input[name=optionNums]").eq(index).val();//해당상품의 옵션번호
	        		    
	        		    var color=$("input[name=colors]").eq(index).val();//해당상품의 옵션 색상
	        		    var size=$("input[name=sizes]").eq(index).val();//해당상품의 옵션 사이즈
	        		    
	        		    console.log("총 값"+perTotal);
	        		    console.log("주문번호"+orderNum);
	        		    console.log("수량"+quantity);
	        		    console.log("색상"+color);
	        		    console.log("사이즈"+size);
	        		    optionNums.push(Number.parseInt(optionNum));
	        		    totalPrice.push(Number.parseInt(perTotal));
	        		    orderNums.push(Number.parseInt(orderNum));
	        		    quantities.push(Number.parseInt(quantity));
	        			colors.push(color);
	    	        	sizes.push(size);
	        		    images.push(image);
	        		    prodNames.push(prodName);
	        		    prices.push(price);
	        		    prodNums.push(prodNum);
	        		    
	        		});
	     		$.ajax({
	    			type : "post",       //응답 데이터를 텍스트로 지정
	    			dataType : "text",    //응답 데이터를 텍스트로 지정   
	    			async:true,           //false인경우 동기식으로 처리
	    			url : "/B_P003_D001/butProductsFromCart",               // 서버에서 세션으로 상품을 담는다
	    			data : {totalPrice:totalPrice,orderNums:orderNums,quantities:quantities,optionNums:optionNums,
	    				images:images,prodNames:prodNames,prices:prices,prodNums:prodNums,colors:colors,sizes:sizes},  //서버로 매개변수와 값을 설정
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
    <header class="header_area">
      

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
              <h2>${userId }님 장바구니</h2>
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
    <!-- /////////////옵션 선택 안한애들 시작 -->
	      <div class="container">
        <div class="cart_inner">
          <div class="table-responsive">
            <table class="table">
	              <c:choose>
                <c:when test="${not empty cartList2 }">
                     <c:forEach var="cartList" items="${cartList2 }">
                <tr>
                      <td id="locationOrderNum">
                      <h>옵션 선택</h>
                <input type="hidden" name="prodNum" value="${cartList.PRODNUM }">
                <input type="hidden" name="orderNum" value="${cartList.ORDERNUM }">
                </td>
                  <td>
                    <div class="media">
                      <div class="d-flex">
                        <img
                          src="/resources/img/${cartList.IMAGE }"
                          <%-- src="http://localhost:8080/resources/img/${cartList.IMAGE }" --%>
                          alt="" width="90px" height="90px"
                        />
                        <input type="hidden" name="images" value="${cartList.IMAGE }">
                      </div>
                      <div class="media-body">
                        <p>${cartList.NAME }</p>
                        <input type ="hidden" name="prodNames" value="${cartList.NAME }">
                      </div>
                    </div>
                  </td>
                  <td>
                    <h5>${cartList.PRICE } &nbsp; 원</h5>
                    <input type="hidden" name="perPrice" value="${cartList.PRICE }">
                  </td>
                  <td colspan="3">
                  <div id="putOption">   <!-- 아작스로 처리 -->
                    
                    </div>
                  </td>
                  <td></td>
                   <td>
                    <button class="btn btn-info btn-sm" name="chooseOption" value="${cartList.PRODNUM }">옵션 보기</button>
                  </td>
                </tr>
                     </c:forEach>
                </c:when>              
              </c:choose>
                  <!-- 반복구간  -->
                                  
                
                <tr>      <!-- 페이징 자리 -->
                  <td colspan="6">
          <div style="display: block; text-align: center;">
	     <c:if test="${paging2.startPage != 1 }">
			<a href="/B_P003_D001/cartList?nowPage2=${paging2.startPage - 1 }&cntPerPage2=${paging2.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging2.startPage }" end="${paging2.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging2.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging2.nowPage }">
					<a href="/B_P003_D001/cartList?nowPage2=${p }&cntPerPage2=${paging2.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging2.endPage != paging2.lastPage}">
			<a href="/B_P003_D001/cartList?nowPage2=${paging2.endPage+1 }&cntPerPage2=${paging2.cntPerPage}">&gt;</a>
			<p> ${paging2.listType}</p>
		</c:if>
	    </div>        
	              </table>
          </div>
        </div>
      </div>
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
                  <th scope="col">수량</th>
                  <th scope="col">Total</th>
                  <th scope="col">옵션</th>
                  <th scope="col">삭제</th>
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
                <input type="checkbox" name="buyinfo" value="${cartList.PRODNUM }">
                <input type="hidden" name="prodNum" value="${cartList.PRODNUM }">
                <input type="hidden" name="orderNum" value="${cartList.ORDERNUM }">
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
                        <input type ="hidden" name="prodNames" value="${cartList.NAME }">
                      </div>
                    </div>
                  </td>
                  <td>
                    <h5>${cartList.PRICE } &nbsp; 원</h5>
                    <input type="hidden" name="perPrice" value="${cartList.PRICE }">
                  </td>
                  <td>
                    <div class="product_count">
                      <input
                        type="text"
                        name="qty"
                        id="sst"
                        maxlength="12"
                        value="${cartList.QUANTITY }"
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
                    <input type="text" name="perTotal" value="${cartList.PRICE * cartList.QUANTITY }" readonly style="border: none">
                  </td>
                  <td>
                  <div>
                    <ul>
                    <li>색상: &nbsp;&nbsp;${cartList.COLOR }</li>
                    <li>사이즈 : ${cartList.PRODSIZE }</li>
                    </ul>
                    </div>
                  </td>
                   <td>
                    <button class="btn btn-info btn-sm" name="delete" value="${cartList.ORDERNUM }">삭제</button>
                  </td>
                </tr>
                     <input type="hidden" name="colors" value="${cartList.COLOR }">
                     <input type="hidden" name="sizes" value="${cartList.PRODSIZE }">
                     <input type="hidden" name="optionNums" value="${cartList.OPTIONNUM }">
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
