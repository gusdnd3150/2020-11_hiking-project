<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>


<style>
tr:nth-child(even) {
  background-color: #f2f2f2;
}

th, td {
  text-align: left;
  padding: 16px;
}
</style>

<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
        $(document).ready(function () {
            	document.getElementById('defualtDate').value = new Date().toISOString().substring(0, 10);;
	    });
        
        

        function prodDetail(index){
        	var createDat = $("input[name=createDat]").eq(index).val();
        	var delivery = $("input[name=delivery]").eq(index).val();
        	console.log(createDat);
        	
        	window.open("/payListDetail.do?createDat="+createDat+"&delivery="+delivery+"",
                    "childForm", "width=1000, height=450, resizable = no, scrollbars = no");
        	
        }
        
      function cancelProd(index){
        	var createDat = $("input[name=createDat]").eq(index).val();
        	
        	var orderstatus = $("input[name=orderStatus]").eq(index).val();
        	var imp_uid = $("input[name=imp_uid]").eq(index).val();
        	var merchant_uid = $("input[name=merchant_uid]").eq(index).val();
        	
        	var confirm = window.confirm("취소 요청을 하시겠습니까?");
        	
        	if(confirm==true){
        	  var reason=window.prompt("취소사유를 적어주세요");
        		
        	  if(reason==''){
        		  alert("취소 사유를 적어주세요");
        		  return;
        	  }
        	  
        	  $.ajax({
        			 type:"post",
        		     async:true,
        		     url:"/applycancelPayment.do",
        		     data:{reason:reason,imp_uid:imp_uid,merchant_uid:merchant_uid},
        		     success:function(data,textStatus){
        		     	console.log(data);
        		     	if(data=='success'){
        		     		alert("취소접수가 완료되었습니다. 취소처리에는 다소 시간이 소요될 수 있는 점 양해 부탁드리며 빠른 시일내에 처리될 수 있도록 노력하겠습니다. 감사합니다.");
        		     		location.reload(true);
        		     	}
        		     },
        		     error:function(data,textStatus){
        		     }
        		 });
        	  
        	}
        	
        	
        }
	         
	
        
        
        
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
              <h2>${userId }님 구매내역</h2>
              <p></p>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!--================End Home Banner Area =================-->
	    
    <!--================Cart Area =================-->
    <section class="cart_area">
      <div class="container">
      
           <div class="left_dorp">
              <ul>
                <!-- <th><button><a href="/paymentList?listType=0">당일</a></button></th> -->
                <li style="float:left;padding-right: 3px"><button class="btn btn-info"><a href="/paymentList.do?listType=1" style="color:white">1주일</a></button></li>
                <li style="float:left;padding-right: 3px"><button class="btn btn-info"><a href="/paymentList.do?listType=15" style="color:white">15일</a></button></li>
                <li style="float:left;padding-right: 19px"><button class="btn btn-info"><a href="/paymentList.do?listType=30" style="color:white">1개월</a></button></li>
                <li style="float:left"><form action="/paymentList.do" method="get" name="searchForm">
                  <input type="date" name="startD" required="required"> 
                  <input type="date" name="endD" id ="defualtDate" required="required"> 
                 <input type="hidden" name= "listType" value="200" >
                 <select style="height: 34px;" id="deliveryStatus" name="deliveryStatus">
                                      <option value="200">배송준비</option>  
                                      <option value="300">배송완료</option>
                                      <option value="400">배송취소</option>
                                       </select> 
                 <input class="btn btn-info" type="submit" value="조회"> 
              </form></li>
              </ul>
              </div>
        <div class="cart_inner">
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr style="background-color: #f2f2f2;">
                <th></th>
                  <th scope="col"><strong>결제일</strong></th>
                  <th scope="col"><strong>구매자</strong></th>
                  <th scope="col"><strong>결제수단</strong></th>
                  <th scope="col"><strong>상품이름</strong></th>
                  <th scope="col"><strong>결제금액</strong></th>
                  <th scope="col"><strong>포인트사용</strong></th>
                  <th scope="col"><strong>배송상태</strong></th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
              <!-- 반복구간 -->
              <c:choose>
                <c:when test="${empty payList }">
                <h>최근 결제 내역이 없습니다.</h>
                </c:when>
                <c:when test="${not empty payList }">
                     <c:forEach var="payList" items="${payList }" varStatus="Num">
                     
                <c:if test="${payList.TYPE != 'cancel' && payList.TYPE != 'canceled' }">
                <tr>
                  <td>
                      <p>${payList.RN }</p>  <!-- 결제일 -->      
                  </td>
                  <td>
                     <p>${payList.CREATEDAT2}</p> <!-- 결제일 -->
                  </td>
                  <td>
                  <p>${payList.BUYERNAME }</p>      <!-- 구매자 -->
                  </td>
                  <td>
                   <p>${payList.TYPE }</p>      <!-- 결제수단 -->
                  </td>
                  <td>
                    <p>${payList.NAME } (외 : ${payList.COUNT } 건 )</p>  <!-- 상품이름 + 건수-->
                  </td>
                  <td>
                   <%-- <p>${payList.TOTALPRICE -payList.USED  }</p>      <!-- 결제금액 --> --%>
                      <fmt:formatNumber var="money" value="${payList.TOTALPRICE -payList.USED  }"  pattern="###,###,###"/>
                     <p>${money }</p>
                  </td>
                  <td>
                   <p>${payList.USED }</p>      <!-- 포인트사용 -->
                  </td>
                    <td>
                    <c:if test="${payList.DELIVERYSTATUS ==300 }">
                   <p style="color:blue">배송완료</p>
                   </c:if>
                   <c:if test="${payList.DELIVERYSTATUS ==200 }">
                   <p>배송준비</p>
                   </c:if>
                  </td>
                   <td>
                    <button class="btn btn-info btn-sm" onclick="prodDetail(${Num.index})" value="" >상세보기</button><br><br>
                    <button class="btn btn-info btn-sm" onclick="cancelProd(${Num.index})" value="" >취소요청</button>
                  </td>
                </tr>
                <input type= "hidden" name="createDat" value="${payList.CREATEDAT }">
                <input type= "hidden" name="delivery" value="${payList.DELIVERY }">
                <input type= "hidden" name="imp_uid" value="${payList.IMP_UID }">
                <input type= "hidden" name="merchant_uid" value="${payList.MERCHANT_UID }">
                <input type= "hidden" name="orderStatus" value="${payList.ORDERSTATUS }">
                </c:if>
                                <!-- 취소요청한 경우 -->
                <c:if test="${payList.TYPE eq 'cancel' }">
                <tr>
                      <td>
                      <p>${payList.RN }</p>  <!-- 순번 -->      
                  </td>
                  <td>
                         <p>${payList.CREATEDAT2}</p> <!-- 결제일 -->
                  </td>
                  <td>
                  <p>${payList.BUYERNAME }</p>      <!-- 구매자 -->
                  </td>
                  <td>
                   <p>${payList.TYPE }</p>      <!-- 결제수단 -->
                  </td>
                  <td>
                    <p>${payList.NAME } (외 : ${payList.COUNT } 건 )</p>  <!-- 상품이름 + 건수-->
                  </td>
                  <td>
                   <%-- <p>${payList.TOTALPRICE }</p>      <!-- 결제금액 --> --%>
                     <fmt:formatNumber var="money" value="${payList.TOTALPRICE -payList.USED  }"  pattern="###,###,###"/>
                     <p>${money }</p>
                  </td>
                  <td>
                   <p>${payList.USED }</p>      <!-- 포인트사용 -->
                  </td>
                  
                   <td>
                   <c:if test="${payList.DELIVERYSTATUS ==300 }">
                   <p>배송완료</p>
                   </c:if>
                   <c:if test="${payList.DELIVERYSTATUS ==200 }">
                   <p>배송준비</p>
                   </c:if>
                  </td>
                  
                   <td>
                    <button class="btn btn-info btn-sm" onclick="prodDetail(${Num.index})" value="" >상세보기</button><br><br>
                    <%-- <button class="btn btn-info btn-sm" onclick="cancelProd(${Num.index})" value="" style="display:none">취소요청</button> --%>
                    <p>취소처리중</p>
                  </td>
                </tr>
                <input type= "hidden" name="createDat" value="${payList.CREATEDAT }">
                <input type= "hidden" name="delivery" value="${payList.DELIVERY }">
                <input type= "hidden" name="imp_uid" value="${payList.IMP_UID }">
                <input type= "hidden" name="merchant_uid" value="${payList.MERCHANT_UID }">
                <input type= "hidden" name="orderStatus" value="${payList.ORDERSTATUS }">
                </c:if>
                
                          <!-- 취소되었을 경우 -->
                    <c:if test="${payList.TYPE eq 'canceled' }">
                <tr>
                      <td>
                      <p>${payList.RN }</p>  <!-- 순번 -->      
                  </td>
                  <td>
                      <p>${payList.CREATEDAT2}</p> <!-- 결제일 -->
                  </td>
                  <td>
                  <p>${payList.BUYERNAME }</p>      <!-- 구매자 -->
                  </td>
                  <td>
                   <p>${payList.TYPE }</p>      <!-- 결제수단 -->
                  </td>
                  <td>
                    <p>${payList.NAME } (외 : ${payList.COUNT } 건 )</p>  <!-- 상품이름 + 건수-->
                  </td>
                  <td>
                   <%-- <p>${payList.TOTALPRICE }</p>      <!-- 결제금액 --> --%>
                     <fmt:formatNumber var="money" value="${payList.TOTALPRICE -payList.USED  }"  pattern="###,###,###"/>
                     <p>${money }</p>
                  </td>
                  <td>
                   <p>${payList.USED }</p>      <!-- 포인트사용 -->
                  </td>
                  
                   <td>
                   <p style="color:red">배송취소</p>      <!-- 포인트사용 -->
                  </td>
                   <td>
                    <button class="btn btn-info btn-sm" onclick="prodDetail(${Num.index})" value="" >상세보기</button><br><br>
                    <p>취소완료</p>
                    </p>
                  </td>
                </tr>
                <input type= "hidden" name="createDat" value="${payList.CREATEDAT }">
                <input type= "hidden" name="delivery" value="${payList.DELIVERY }">
                <input type= "hidden" name="imp_uid" value="${payList.IMP_UID }">
                <input type= "hidden" name="merchant_uid" value="${payList.MERCHANT_UID }">
                <input type= "hidden" name="orderStatus" value="${payList.ORDERSTATUS }">
                </c:if>
                
                
                     </c:forEach>
                </c:when>              
              </c:choose>
                  <!-- 반복구간  -->
                </tbody>
            </table>          
                
                     <!-- 페이징 자리 -->
                 
          <div style="display: block; text-align: center;">
	     <c:if test="${paging.startPage != 1 }">
			<a href="/paymentList.do?deliveryStatus=${paging.listType2 }&startD=${paging.starD }&endD=${paging.endD }&listType=${paging.listType }&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/paymentList.do?deliveryStatus=${paging.listType2 }&startD=${paging.starD }&endD=${paging.endD }&listType=${paging.listType }&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/paymentList.do?deliveryStatus=${paging.listType2 }&startD=${paging.starD }&endD=${paging.endD }&listType=${paging.listType }&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	    </div>      
	    
	    
	      
                      <div style="text-align: center" ><br><br>
                     <a href="/shopMainCate.do?listType=100"> <p align="center" class="main_btn" >쇼핑계속하기</p></a>
                      </div>
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
