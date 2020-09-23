<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />   
<!DOCTYPE html>


<html lang="ko">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Shop Homepage - Start Bootstrap Template</title>

  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/shop-homepage.css">
   <script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script> 
  <script src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js" />"></script>
  
<style>

.card-img-top{
width=800;
height=350;
}


</style>  

</head>



<body>


  <!-- Page Content -->
  <div class="container">

    <div class="row">

      <!-- /.col-lg-5 -->

      <div class="col-lg-9">
                <div id ="search" align="center">
                 <form action ="" method="post">
                 <table style="text-align:center">
                <tr>
                <td><input type="search" name= "search" placeholder="search brother" ></td>
                <td><input type="submit" value="검색"> </td>
                <tr>
               </table>
               </form>
               </div>

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div id ="selector"class="carousel-item active">
              <img class="d-block img-fluid" src="${pageContext.request.contextPath}/resource/image/main.jpg" alt="First slide" >
            </div>
            <div id ="selector" class="carousel-item">
              <img class="d-block img-fluid" src="${pageContext.request.contextPath}/resource/image/main2.jpg" alt="Second slide" >
            </div>
            <div id ="selector" class="carousel-item">
              <img class="d-block img-fluid" src="${pageContext.request.contextPath}/resource/image/main.jpg" alt="Third slide">
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

         <div class="row">
         
        <c:choose>
              <c:when test="${empty viewAll}">
                 <h>등록된 상품이 없습니다</h>
                 
              </c:when>
              <c:when test="${not empty viewAll}">
                    <c:forEach var="data" items="${viewAll }" >
     
                    <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
                <%-- <a href="#"><img class="card-img-top" src="data:image/jpg;base64, ${encodinglist}"  alt="" width="800" height="500"></a> --%>
                <a href="#"><img class="card-img-top" src="${pageContext.request.contextPath}/B_P002_D001/mainImage/${data.PRODNUM}"  alt="" width="800" height="500"></a>   
              <div class="card-body">
                <h4 class="card-title">
                  <a href="#">${data.NAME }</a>
                </h4>
                <h5>${data.PRICE }원</h5>
                <p class="card-text">${data.CONTENT }</p>
              </div>
              <div class="card-footer">
           
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>
                    </c:forEach>
             </c:when>
          </c:choose>

        </div>
        <!-- /.row -->

        
<!-- 페이징 자리 -->
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="${contextPath}/B_P002_D001/shopMain.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="${contextPath}/B_P002_D001/shopMain.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="${contextPath}/B_P002_D001/shopMain.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
	
	
      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->

</body>

</html>
