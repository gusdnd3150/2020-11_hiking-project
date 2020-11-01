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
	
	         

	    });
        
        

        function prodDetail(index){
        	var createDat = $("input[name=createDat]").eq(index).val();
        	var delivery = $("input[name=delivery]").eq(index).val();
        	console.log(createDat);
        	
        	window.open("/E_P003_D001/payListDetail?createDat="+createDat+"&delivery="+delivery+"",
                    "childForm", "width=1300, height=450, resizable = no, scrollbars = no");
        	
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
                  <th scope="col"><strong>결제일</strong></th>
                  <th scope="col"><strong>구매자</strong></th>
                  <th scope="col"><strong>결제수단</strong></th>
                  <th scope="col"><strong>상품이름</strong></th>
                  <th scope="col"><strong>결제금액</strong></th>
                  <th scope="col"><strong>포인트사용</strong></th>
                </tr>
              </thead>
              <tbody>
              <!-- 반복구간 -->
              <c:choose>
                <c:when test="${empty payList }">
                <h>등록된 상품이 없습니다</h>
                </c:when>
                <c:when test="${not empty payList }">
                     <c:forEach var="payList" items="${payList }" varStatus="Num">
                <tr>
                  <td>
                      <p>${payList.CREATEDAT }</p>  <!-- 결제일 -->      
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
                   <p>${payList.TOTALPRICE }</p>      <!-- 결제금액 -->
                  </td>
                  <td>
                   <p>${payList.USED }</p>      <!-- 포인트사용 -->
                  </td>
                   <td>
                    <button class="btn btn-info btn-sm" onclick="prodDetail(${Num.index})" value="" >상세보기</button>
                  </td>
                </tr>
                <input type= "hidden" name="createDat" value="${payList.CREATEDAT }">
                <input type= "hidden" name="delivery" value="${payList.DELIVERY }">
                     </c:forEach>
                </c:when>              
              </c:choose>
                  <!-- 반복구간  -->
                </tbody>
            </table>          
                
                     <!-- 페이징 자리 -->
                 
          <div style="display: block; text-align: center;">
	     <c:if test="${paging.startPage != 1 }">
			<a href="/B_P003_D001/paymentList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/B_P003_D001/paymentList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/B_P003_D001/paymentList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
			<p> ${paging.listType}</p>
		</c:if>
	    </div>        
                      <div style="text-align: center" ><br><br>
                     <a href="/B_P002_D001/shopMainCate?listType=100"> <p align="center" class="main_btn" >쇼핑계속하기</p></a>
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
