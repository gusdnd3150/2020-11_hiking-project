<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/common/header.jsp" />
    <!-- Bootstrap core CSS -->
  <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="/resources/css/shop-homepage.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="/resources/css/views/common/header.css">
    <!-- Bootstrap core JavaScript -->
  <script src="/resources/vendor/jquery/jquery.min.js"></script>
  <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  
  
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}
.column {
  float: left;
  width: 50%;
  padding: 10px;
  height: 300px; /* Should be removed. Only for demonstration */
}
.row:after {
  content: "";
  display: table;
  clear: both;
}

ul{
   list-style:none;
   padding-left:0px;
   }


/* Style the tab */
.tab {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
}

</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
$(document).ready(function(){
    $("#addAfterdform").on("click",function(){
         $("#form").removeAttr("style");
    });
    
    $("#addComentForm").on("click",function(){
        $("#comentform").removeAttr("style");
   });
});

function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}

</script>
</head>
<body>

<h2>주문 상세</h2>
<div class="container">
<div class="row"> 
     <img class="column" src="/B_P002_D001/mainImage/${prodDetail.prodNum }"  alt="" width="600" height="900">    
    <!-- <img class="column" src="/resources/img/images.jpg" width="600" height="900" alt=""> -->
  <div class="column" style="background-color:#bbb;">
     <h2>${prodDetail.name}</h2>  <!-- 제목 -->
    <hr>
    <ul>
    <li>남은 수량: ${prodDetail.quantity }!!! </li>   <!-- 남은수량 -->
    <li><b> ${prodDetail.price }원</b></li>   <!-- 가격 -->
    <hr>
    <li><b>적립 포인트 4p</b></li>
    <hr>
    <li>
    <form>
    수량: <input type="text" name="count">
    <table align="center">
    <tr>
    <td> <a href="/B_P003_D001/pay/${prodDetail.prodNum }">장바구니</a></td>
     <td><button>구매하기</button></td>
     <td><button>위시리스트</button></td>
    </tr>
    </table>
    </form>
    </li>
    </ul>
  </div>
</div>

<br>
<br>
<br>

<div class="tab">
  <button class="tablinks" onclick="openCity(event, 'London')">상품후기</button>
  <button class="tablinks" onclick="openCity(event, 'Paris')">제품설명</button>
</div>

<div id="London" class="tabcontent">
   <p id="addAfterdform">후기 작성하기</p>
   <form name="addAfter" id="form" method="post" action="/B_P003_D001/addAfter" style="display:none" enctype="multipart/form-data">
        <label>평점</label>
        <input type="hidden" name="prodNum" value="${prodDetail.prodNum }"><br>
        <select name="evalue" id="evalue">
            <option value="1">1</option>    
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
        </select><br>
        <label>내용</label>
        <textarea name="content"> </textarea><br>
        <label>첨부</label><br>
        <input  type="file" name="photo"><br>
        <input type="submit" value="등록"><br>
        <hr>
    </form>
    
  <div class="row"> 
    <%-- <img class="card-img-top" src="/B_P002_D001/mainImage/${data.prodNum }"  alt="" width="600" height="900"> --%>
  <!-- <div class="column" style="background-color:#bbb;"> -->
    <!-- 상품 후기 리스트 -->
                    <table class="table">
                        <hr>
                        <tbody>
                         <c:choose>
                            <c:when test="${empty afterList }">
                                 <p> 후기가 없습니다 </p>
                            </c:when>
                            <c:when test="${not empty afterList }">      
                               <c:forEach var="afterList" items="${afterList }">
                                 <c:if test="${afterList.lvl == 1 }">    <!--  후기원글일 경우 -->
                                 <div class="row">
                                     <img class="column" src="/B_P003_D001/AfterImage/${afterList.afterNum }"  alt="" width="300" height="300">
                                   <div class="column" >
                                    <p class="prodtext">후기내용: ${afterList.content }, 평점: ${afterList.evalue } , 작성일: ${afterList.createDat } , 아이디: ${afterList.userNum }</p>
                                    
                                    <p id="addComentForm">댓글등록</p>
                                     <form name="addComent" id="comentform" method="post" action="/B_P003_D001/addComent" style="display:none" >
                                            <input type="hidden" name="prodNum" value="${prodDetail.prodNum }"><br>
                                            <input type="hidden" name="afterType" value="${afterList.afterNum }">
                                          <label>내용</label>
                                         <textarea name="content"> </textarea><br>
                                         <input type="submit" value="댓글등록"><br>
                                        <hr>
                                       </form>
                                    <br>
                                   </div>
                                 </div>
                                 </c:if>
                                  <c:if test="${afterList.lvl == 2 }">    <!-- 댓글 경우 -->
                                      <div class="row">
                                      <h class="column">댓글</h>
                                   <div class="column" >
                                    <p class="prodtext">댓글 내용: ${afterList.content }, 평점: ${afterList.evalue } , 작성일: ${afterList.createDat } , 아이디: ${afterList.userNum }</p>
                                     <br>
                                   </div>
                                 </div>
                                 </c:if>
                               </c:forEach>
                            </c:when>
                         </c:choose>
                        </tbody>
                        <hr>
                    </table>
  </div>  
  
            <!-- 페이징 -->
  <div style="display: block; text-align: center;">
	<c:if test="${paging.startPage != 1 }">
			<a href="/B_P003_D001/productDetail?prodNum=${prodDetail.prodNum }&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/B_P003_D001/productDetail?prodNum=${prodDetail.prodNum}&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/B_P003_D001/productDetail?prodNum=${prodDetail.prodNum}&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
			<p> ${paging.listType}</p>
		</c:if>
	</div>
</div>


<div id="Paris" class="tabcontent">
  <h3>제품설명</h3>
  <c:choose>
     <c:when test="${empty images }">
     <p>이미지가 없습니다.</p>     
     </c:when>
     <c:when test="${not empty images }">
         <c:forEach var="images" items="${images }">
       <img src="data:image/jpg;base64, ${images}"  alt="상" width="800" height="500"><br>
         </c:forEach>
     </c:when>
  </c:choose>
  <%-- <img src="data:image/jpg;base64, ${images}"  alt="" width="800" height="500" /> --%>
  <p> ${prodDetail.content }</p> 
</div>

</div>

</body>

<jsp:include page="/common/footer.jsp" />
</html>
