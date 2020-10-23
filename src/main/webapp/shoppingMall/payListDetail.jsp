<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>



<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
        $(document).ready(function () {
        	
        	
        	$("#buyProduts").click(function(){
        	  	//opener.location.reload();
		     	window.close();
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
    <!--================Header Menu Area =================-->


   
    <!--================Cart Area =================-->
    <section class="cart_area">
      <div class="container">
        <div class="cart_inner">
          <div class="table-responsive">
            <table class="table">
              <thead>
                <tr>
                  <th scope="col"><strong>상품</strong></th>
                  <th scope="col"><strong>가격</strong></th>
                  <th scope="col"><strong>수량</strong></th>
                  <th scope="col"><strong>옵션</strong></th>
                  <th scope="col"><strong>주소</strong></th>
                  <th scope="col"><strong>결제상태</strong></th>
                  <th scope="col"><strong>배송상태</strong></th>
                </tr>
              </thead>
              <tbody>
              <!-- 반복구간 -->
              <c:choose>
                <c:when test="${not empty payDetailList }">
                     <c:forEach var="payDetailList" items="${payDetailList }">
                     
                  <tr>
                  <td>
                    <div class="media">
                      <div class="d-flex">
                        <img
                          src="/resources/img/${payDetailList.CONTENT }"
                          <%-- src="http://localhost:8080/resources/img/${payDetailList.CONTENT }" --%>
                          alt="" width="90px" height="90px"
                        />
                      </div>
                      <div class="media-body">
                        <p>${payDetailList.NAME }</p>
                      </div>
                    </div>
                  </td>
                  
                  <td>
                    <h5>${payDetailList.PRICE } &nbsp; 원</h5>
                  </td>
                  <td>
                     <h5>${payDetailList.QUANTITY } &nbsp; 개</h5>
                  </td>
                  <td>
                  <div>
                    <ul>
                    <li>색상: &nbsp;&nbsp;${payDetailList.COLOR }</li>
                    <li>사이즈 : ${payDetailList.PRODSIZE }</li>
                    </ul>
                    </div>
                  </td>
                  
                  <td> 
                  <div>
                    <ul>
                    <li>색상: &nbsp;&nbsp;${payDetailList.COLOR }</li>
                    <li>사이즈 : ${payDetailList.PRODSIZE }</li>
                    <li>전화번호 : ${payDetailList.CUSTPHONE }</li>
                    <li>우편번호 : ${payDetailList.ZONECODE }</li>
                    <li>주소 : ${payDetailList.ADDRESS }</li>
                    <li>상세주소 : ${payDetailList.ADDRESS2 }</li>
                    </ul>
                    </div>
                  </td>
                  <td>
                  
                  <c:if test="${payDetailList.ORDERSTATUS ==1 }">
                  <h5>입금대기</h5>
                   </c:if>
                   <c:if test="${payDetailList.ORDERSTATUS ==2 }">
                  <h5>결제완료</h5>
                   </c:if>
                   <c:if test="${payDetailList.ORDERSTATUS ==3 }">
                  <h5>결제취소</h5>
                   </c:if>
                  </td>
                   
                  <td>
                   <c:if test="${payDetailList.DELIVERYSTATUS ==100 }">
                  <h5>배송대기</h5>
                   </c:if>
                  <c:if test="${payDetailList.DELIVERYSTATUS ==200 }">
                  <h5>배송준비</h5>
                   </c:if>  
                  <c:if test="${payDetailList.DELIVERYSTATUS ==300 }">
                  <h5>배송완료</h5>
                   </c:if>  
                 </td>
                 
                </tr>
                     </c:forEach>
                </c:when>              
              </c:choose>
                  <!-- 반복구간  -->
                      
              </tbody>
            </table>
                     <div align="center">
                      <p class="main_btn" id="buyProduts">닫기</p>
                      </div>
          </div>
        </div>
      </div>
    </section>
    <!--================End Cart Area =================-->

    <!--================ start footer Area  =================-->
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
