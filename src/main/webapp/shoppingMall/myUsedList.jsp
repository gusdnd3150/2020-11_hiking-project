<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
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
	
	         $("#listType22").change(function(){
	        	 var listType= $(this).val();
	        	 
	        	 var startD = $("input[name=startD22]").val();
	        	 var endD = $("input[name=endD22]").val();
	        	 if(endD != null){
	        	 location.href="/myUsedList.do?listType="+listType+"&startD="+startD+"&endD="+endD+" ";
	        	 }else{
	        		 location.href="/myUsedList.do?listType="+listType+"";
	        	 }
	        	 
	         });

	    });
        
        

        function prodDetail(index){
        	var createDat = $("input[name=createDat]").eq(index).val();
        	var delivery = $("input[name=delivery]").eq(index).val();
        	console.log(createDat);
        	
        	window.open("/myUsedListDetail?createDat="+createDat+"&delivery="+delivery+"",
                    "childForm", "width=1300, height=450, resizable = no, scrollbars = no");
        	
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
        		     url:"/applycancelPayment",
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
              <h2>${myUsedList[0].ID }님 중고물품 신청내역</h2>
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
        <div class="left_dorp">
              
              <table>
                <!-- <th><button><a href="/paymentList?listType=0">당일</a></button></th> -->
                <th><button class="btn btn-info"><a href="/myUsedList.do?listType=1" style="color:white">1주일</a></button></th>
                <th><button class="btn btn-info"><a href="/myUsedList.do?listType=15" style="color:white">15일</a></button></th>
                <th><button class="btn btn-info"><a href="/myUsedList.do?listType=30" style="color:white">1개월</a></button></th>
                <th><form action="/myUsedList.do" method="get" name="searchForm">
                  <input type="date" name="startD" required="required"> 
                  <input type="date" name="endD" required="required"> 
                 <input type="hidden" name= "listType" value="200" >
                 <input class="btn btn-info" type="submit" value="조회"> 
              </form></th>
              </table>
              </div>
      
        <div class="cart_inner">
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th scope="col"><strong>대표사진</strong></th>
                  <th scope="col"><strong>등록일</strong></th>
                  <th scope="col"><strong>상품이름</strong></th>
                  <th scope="col"><strong>요청금액</strong></th>
                  <th scope="col"><strong>상품분류</strong></th>
                  <th scope="col"><strong>처리상태</strong></th>
                  <th scope="col">   <select style="height: 34px;" id="listType22" name="listType22">
                                      <option value="3">승인대기</option>  
                                      <option value="5">등록완료</option>
                                      <option value="4">승인거절</option>
                                       </select>  
                   </th>
                </tr>
              </thead>
              
              
              <tbody>
              <!-- 반복구간 -->
              <c:choose>
                <c:when test="${empty myUsedList }">
                <h> 접수하신 중고상품이 없습니다.</h>
                </c:when>
                <c:when test="${not empty myUsedList }">
                
                     <c:forEach var="myUsedList" items="${myUsedList }" varStatus="Num">
                <tr>
                   <td> <!-- 대표사진 -->
                      <img class="img-thumbnail" src="/resources/img/${myUsedList.IMAGE }"  width="120px" height="120px"/>
                  </td>
                
                  <td>
                      <p>${myUsedList.CREATEDAT }</p>  <!-- 등록일 -->      
                  </td>
                  <td>
                      <p>${myUsedList.NAME }</p>  <!-- 상품이름 -->      
                  </td>
                  <td>
                  <p>${myUsedList.PRICE }</p>      <!-- 요청금액 -->
                  </td>
                  
                    <td>
                    <!-- 상품분류 -->
                  <c:if test="${myUsedList.PRODCATEGORYNUM ==15 }">
                         <p>반팔</p>
                  </c:if>
                    <c:if test="${myUsedList.PRODCATEGORYNUM ==16 }">
                         <p>긴팔</p>
                  </c:if>
                        <c:if test="${myUsedList.PRODCATEGORYNUM ==17 }">
                         <p>후드</p>
                  </c:if>
                         <c:if test="${myUsedList.PRODCATEGORYNUM ==18 }">
                         <p>반바지</p>
                  </c:if>
                        <c:if test="${myUsedList.PRODCATEGORYNUM ==19 }">
                         <p>긴바지</p>
                  </c:if>
                      <c:if test="${myUsedList.PRODCATEGORYNUM ==20 }">
                         <p>패딩</p>
                  </c:if>
                   <c:if test="${myUsedList.PRODCATEGORYNUM ==21 }">
                         <p>야상</p>
                  </c:if>
                   <c:if test="${myUsedList.PRODCATEGORYNUM ==22 }">
                         <p>바람막이</p>
                  </c:if>
                  <c:if test="${myUsedList.PRODCATEGORYNUM ==23 }">
                         <p>비니</p>
                  </c:if>
                  <c:if test="${myUsedList.PRODCATEGORYNUM ==24 }">
                         <p>캡모자</p>
                  </c:if>
                  <c:if test="${myUsedList.PRODCATEGORYNUM ==25 }">
                         <p>정글모</p>
                  </c:if>
                  <c:if test="${myUsedList.PRODCATEGORYNUM ==26 }">
                         <p>선캡</p>
                  </c:if>
                  <c:if test="${myUsedList.PRODCATEGORYNUM ==27 }">
                         <p>긴양말</p>
                  </c:if>
                  <c:if test="${myUsedList.PRODCATEGORYNUM ==28 }">
                         <p>반양말</p>
                  </c:if>
                  <c:if test="${myUsedList.PRODCATEGORYNUM ==29 }">
                         <p>발가락양말</p>
                  </c:if>
                  <c:if test="${myUsedList.PRODCATEGORYNUM ==30 }">
                         <p>백팩</p>
                  </c:if>
                  <c:if test="${myUsedList.PRODCATEGORYNUM ==31}">
                         <p>크로스백</p>
                  </c:if>
                   <c:if test="${myUsedList.PRODCATEGORYNUM ==32}">
                         <p>바람막이</p>
                  </c:if>
                     <c:if test="${myUsedList.PRODCATEGORYNUM ==11}">
                         <p>스틱</p>
                  </c:if>
                   <c:if test="${myUsedList.PRODCATEGORYNUM ==12}">
                         <p>장갑</p>
                  </c:if>
                  <c:if test="${myUsedList.PRODCATEGORYNUM ==13}">
                         <p>아이젠</p>
                  </c:if>
                 <c:if test="${myUsedList.PRODCATEGORYNUM ==14}">
                         <p>보호대</p>
                  </c:if>
                  </td>
                  
                  <td>
                   <c:if test="${myUsedList.TYPE ==3 }">
                   <p>승인대기</p>
                   </c:if>
                    <c:if test="${myUsedList.TYPE ==4 }">
                   <p style="font-color:red">승인거절</p>
                   </c:if>
                   <c:if test="${myUsedList.TYPE ==5 }">
                   <p>중고물품 등록 완료</p>
                   </c:if>
                   
                  
                  </td>
                   <td>
                   <c:if test="${myUsedList.TYPE ==5 }">  <!-- 등록된 내 물품 보러가기 -->
                    <a href="/productDetail.do?prodNum=${myUsedList.PRODNUM}">
                    <button class="btn btn-info btn-sm" >내 물품 보러가기</button></a>
                   </c:if>
                   
                     <c:if test="${myUsedList.TYPE ==4 }"> <!-- 승인거절 시 답변 사유 보기 -->
                    <button class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal${num.index }">답변확인</button>
                    
                        <div class="modal fade" id="myModal${num.index }" role="dialog">
                       <div class="modal-dialog">
                                      <div class="modal-content">
                                    <div class="modal-header">
                                  <button type="button" class="close" data-dismiss="modal">&times;</button>
                                   </div>
                               <div class="modal-body">
                                 <h2>${myUsedList.REQUIRECOMMENT }</h2>       
                                 </div>
                                <div class="modal-footer">         
                                  <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                             </div>
                                           </div>
                                            </div>
                                            </div>
                   </c:if>
                  </td>
                </tr>
                
                
                
                     </c:forEach>
                </c:when>              
              </c:choose>
                  <!-- 반복구간  -->
                </tbody>
            </table>          
                
                     <!-- 페이징 자리 -->
                 
          <div style="display: block; text-align: center;">
	     <c:if test="${paging.startPage != 1 }">
			<a href="/myUsedList.do?startD=${paging.starD }&endD=${paging.endD }&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/myUsedList.do?startD=${paging.starD }&endD=${paging.endD }&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/myUsedList.do?startD=${paging.starD }&endD=${paging.endD }&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	    </div>      
	      
	      <c:if test="${not empty paging.starD }">
	       <input type="hidden" name="startD22" value="${paging.starD }">
           <input type="hidden" name="endD22" value="${paging.endD }">
	      </c:if>
	    
	      
                      <div style="text-align: center" ><br><br>
                     <a href="/shopMainCate.do?listType=100"> <p align="center" class="main_btn" >쇼핑계속하기</p></a>
                      </div>
          </div>
        </div>
      </div>
    </section>
    
    
    
    
    
    <!-- 모달창 -->
    
    
    
    
    
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
