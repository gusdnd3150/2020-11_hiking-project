<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
<meta charset="utf-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>입력항목 예제1</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

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
    
    
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
crossorigin="anonymous"></script><!-- jQuery CDN --->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script> 

  //var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;    

$(document).ready(function () {
	
	
	      // 총가격
          var sum =0;
          $("input[name=total]").each(function(idx){
           var value = $(this).val();
           var eqValue = $("input[name=total]:eq(" + idx + ")").val() ;
           sum = sum+ Number.parseInt(eqValue);
          });
          var showTotalPrice =$("#payTotal");
          var innerTotalPice=$("input[name=payTotal]");
          showTotalPrice.text(sum);
          innerTotalPice.val(sum);
	
            $("#clickUp").on("click",function(){     //업버튼 클릭 시
         var quantity = $("#sst").val();
         var price = $('#price').text();
         var totalPrice = $('input[name=total]'); 
         var totalPay = $('input[name=payTotal]');
         var total = quantity*price;
         $("#totalPut").text(total); //상품토탈
         totalPrice.val(total);

         $("#payTotal").text(total);  //결제 토탈
         totalPay.val(total);
        });
 
        $("#clickDown").on("click",function(){          //다운버튼 클릭 시
          var quantity = $("#sst").val();
          var price = $('#price').text();
          var totalPrice = $('input[name=total]');
         var totalPay = $('input[name=payTotal]');
         var total = quantity*price;

         $("#totalPut").text(total); //상품토탈
         totalPrice.val(total);

         $("#payTotal").text(total);  //결제 토탈
         totalPay.val(total);
         
        });
        
        $("input[name=card]").on("click",function(){  //카드결제
          var account = $('input[name=account]');
          var payType =$('input[name=payType]');
          /* account.checked==null; */
          account.prop("checked",false);
          payType.val('card');
          console.log(payType.val());
          });
        

        $("input[name=account]").on("click",function(){  //결제 
        var card = $('input[name=card]');
        var payType =$('input[name=payType]');
        card.prop("checked",false); 
        payType.val('trans');
        console.log(payType.val());
        });  
        
        
        
       
        
        $("input[name=defualtAddress]").on("click",function(){  //기본배송지
            var address = $('input[name=address]');
            var defualtAddress =$('input[name=defualtAddress]'); 
            var newAddress =$('input[name=newAddress]');
            newAddress.prop("checked",false);
            
            address.val('기본배송지');
            
            var basic = $('input[name=basicAddress]').val();
            var basic2 =$('input[name=addressDetail]').val();
            var zonecode =$('input[name=zonecode]').val();
            var name =$('input[name=deliNmae]').val();
            var custName =$('input[name=DBcustName]').val();
            var custPhone =$('input[name=DBcustPhone]').val();
            var type =$('input[name=type]').val();   
            
            //var deliPhonNum =$('input[name=deliPhonNum]').val();
            
            if(basic==''||basic==null){  //테스트로 name으로 진행 완료 후 basic 로 바꾸자
            	alert("기본배송지가 없습니다.");
            	var check = window.confirm("배송지를 추가하시겠습니까?");
            	
            	if(check==true){ //예 누르면
            		//아작스
            		
            		window.open("/E_P003_D001/addDeliveryForm",
                            "childForm", "width=700, height=450, resizable = no, scrollbars = no");
            	}else{//아니면
            		defualtAddress.prop("checked",false);
            		return;
            	}
           
            }else{
            
            var put1 = $('input[name=post1]');
            var put2 = $('input[name=address1]');
            var put3 = $('input[name=address2]');
            var put4 = $('input[name=tel]');
            var put5 = $('input[name=fax]');
            
            
            
            put1.val(zonecode);
            put2.val(basic);
            put3.val(basic2);
            put4.val(custPhone);
            put5.val(custName);
            }
            
            
            
            });
        

          $("input[name=newAddress]").on("click",function(){  // 변경배송지
          var address = $('input[name=address]');
          var defualtAddress =$('input[name=defualtAddress]');
          defualtAddress.prop("checked",false);
          
          address.val('변경배송지');
          
          var put1 = $('input[name=post1]');
          var put2 = $('input[name=address1]');
          var put3 = $('input[name=address2]');
          var put4 = $('input[name=tel]');
          var put5 = $('input[name=fax]');
          
          put1.val('');
          put2.val('');
          put3.val('');
          put4.val('');
          put5.val('');
          });
});


function usePoin(){                         //포인트 사용할 경우
     var usepoint = $('input[name=usepoint]');
     var point = $('input[name=point]'); //db 보유포인트
     var put =  $('#minus');
    
     if(usepoint.val() > point.val()){
    	 alert("보유포인트보다 많습니다");
     }else{
      var result ="-"+usepoint.val();
      put.text(result);
      put.removeAttr("style");
      put.css("color","red");
      point.val(usepoint.val());
     }
    
}




 function sample6_execDaumPostcode() { 
 new daum.Postcode({ 
 oncomplete: function(data) { 
  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분. 
  // 각 주소의 노출 규칙에 따라 주소를 조합한다. 
  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다. 
  var fullAddr = ''; // 최종 주소 변수 
  var extraAddr = ''; // 조합형 주소 변수 
  // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다. 
  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우 
   fullAddr = data.roadAddress; 
  } else { // 사용자가 지번 주소를 선택했을 경우(J) 
   fullAddr = data.jibunAddress; 
  } 
  // 사용자가 선택한 주소가 도로명 타입일때 조합한다. 
  if(data.userSelectedType === 'R'){ 
   //법정동명이 있을 경우 추가한다. 
  if(data.bname !== ''){ 
   extraAddr += data.bname; 
  } 
  // 건물명이 있을 경우 추가한다. 
  if(data.buildingName !== ''){ 
   extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName); 
  } 
  // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다. 
   fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : ''); 
  } 
  // 우편번호와 주소 정보를 해당 필드에 넣는다. 
  document.getElementById('post1').value = data.zonecode; //5자리 새우편번호 사용 
  document.getElementById('address1').value = fullAddr; 
  // 커서를 상세주소 필드로 이동한다. 
  document.getElementById('address2').focus(); 
 } 
 }).open(); 
} 
 
 
 function cancelPay(imp,merchant) {
	  var test ="imp_122779319082";
	  $.ajax({
		 type:"post",
	     async:true,
	     url:"/E_P003_D001/cancelPay",
	     data:{test:imp,merchant:merchant},
	     success:function(data,textStatus){
	     	alert('결제취소 결과:'+data);
	     	console.log(data);
	     },
	     error:function(data,textStatus){
	     }
	 }); 

   }
 
 IMP.init('imp33067254');
 function check() {
	  var check = window.confirm("결제를 진행 하시겠습니까?");
	  if (check == true){
		  
		  var chooseAddress = $('input[name=address]').val(); // 기본 혹은 변경지
          var zoneCode = $('input[name=post1]').val();  
          var address1 = $('input[name=address1]').val();
          var address2 = $('input[name=address2]').val();
          var phoneNum = $('input[name=tel]').val();
          var custName = $('input[name=fax]').val();
		  var payType = $('input[name=payType]').val(); // 결제타입 카드/통장
		  var point= $('input[name=usepoint]').val();    //포인트 
		  var type =$('input[name=type]').val();      // 1즉시구매 3 장바구니결제
		  //var prodNum = $('input[name=prodNum]').val();  //물품 정보
		  //var quantity = $('input[name=qty]').val();
		  var totalPrice= $('input[name=payTotal]').val();//상품개수의 총 합
		  console.log(totalPrice);
		  var prodName = $('input[name=prodName]').val();
		  
		  var prodNums=[];
		  var quantityToDB=[];
		  var orderNums=[];
		  var perTotals=[];
		  var prodPrices =[];
		  var optionNums=[];
          $("input[name=prodNum]").each(function(idx){
              var value = $(this).val();
              var eqValue = $("input[name=prodNum]:eq(" + idx + ")").val() ;
              var quan = $("input[name=qty]:eq(" + idx + ")").val() ;
              var orderNum = $("input[name=orderNum]:eq(" + idx + ")").val() ;
              var perTotal = $("input[name=total]:eq(" + idx + ")").val() ;
              var prodPrice = $("input[name=prodPrice]:eq(" + idx + ")").val() ;
              var optionNum = $("input[name=optionNums]:eq(" + idx + ")").val() ;
              
              prodNums.push(Number.parseInt(eqValue));
              quantityToDB.push(Number.parseInt(quan));
              orderNums.push(Number.parseInt(orderNum));
              optionNums.push(Number.parseInt(optionNum));
              perTotals.push(Number.parseInt(perTotal));
              prodPrices.push(prodPrice);
              console.log("수량:"+quan);
              console.log("오더넘:"+orderNum);
              console.log("프로드넘:"+eqValue);
             });

		  if(point==null ||point==''){
			  point = '0';
		  }
		  IMP.request_pay({
		      pg : 'inicis', // version 1.1.0부터 지원.
		      pay_method : payType,           //trans는 무통장
		      merchant_uid : 'merchant_' + new Date().getTime(),
		      //name : custName,
		      amount : totalPrice-point, //판매 가격
		      /* buyer_email : 'iamport@siot.do', */
		      buyer_name : custName,
		      buyer_tel : phoneNum,
		      buyer_addr : address1+address2,
		      buyer_postcode : zoneCode
		  }, function(rsp) {
		      if ( rsp.success ) {
		    	  if(rsp.apply_num==null||rsp.apply_num==''){
		    		  rsp.apply_num ='kakao';
		    	  }
	              $.ajax({
	                type:"post",
	                async:true,
	                url:"/B_P003_D001/payInfo",
	                data:{zoneCode:zoneCode,
	                	address1:address1,address2:address2,
	                	phoneNum:phoneNum,custName:custName,
	                	payType:payType,totalPrice:totalPrice,point:point,paid_amount:rsp.paid_amount,optionNums:optionNums,
	                	imp_uid:rsp.imp_uid,merchant_uid:rsp.merchant_uid,prodPrices:prodPrices,
	                	apply_num:rsp.apply_num,prodNums:prodNums,quantityToDB:quantityToDB,type:type,
	                	chooseAddress:chooseAddress,prodName:prodName,orderNums:orderNums,perTotals:perTotals,
	                },
	                success:function(data,textStatus){
	                    alert(data);
	                    if(data =='fail'){
	                    	cancelPay(rsp.imp_uid,rsp.merchant_uid);
	                    	alert('결제 취소실행.');
	                    }else{
	                    	alert('결제가 완료 되었습니다.');
		                	location.href="/B_P002_D001/shopMainCate?listType=100";
	                    }
	                },
	                error:function(data,textStatus){
	                	alert('결제 실패.');
	                	cancelPay(rsp.imp_uid,rsp.merchant_uid);
	                },
	                complete:function(){
	                }
	              });
	                  /* var msg = '결제가 완료되었습니다.';
	   		          msg += '고유ID : ' + rsp.imp_uid;
	   		          msg += '상점 거래ID : ' + rsp.merchant_uid;
	   		          msg += '결제 금액 : ' + rsp.paid_amount;
	   		          msg += '카드 승인번호 : ' + rsp.apply_num;
	   		          location.href="/B_P002_D001/shopMainCate?listType=10"; */
		         
		      } else {
		          var msg = '결제에 실패하였습니다.';
		          msg += '에러내용 : ' + rsp.error_msg;
		          window.close();
		      }
		      alert(msg);
		  });
	  }else{
		  location.href="/B_P002_D001/shopMainCate?listType=100";
	  }
}
 
</script>
<style>

.coloumncontent{
position:relative;
}
.protext{
position:absolute;
align:bottom;
}


</style>

</head>    
<body>
<jsp:include page="/common/header.jsp" />

       <!-- user table 정보 -->
<c:if test="${not empty address.ADDRESS }">
<input type="hidden" name="basicAddress" value="${address.ADDRESS }">
<input type="hidden" name="addressDetail" value="${address.ADDRESS2 }">
<input type="hidden" name="zonecode" value="${address.ZONECODE }">
<input type="hidden" name="delibasic" value="${address.DELIBASIC }">
<input type="hidden" name="DBcustName" value="${address.CUSTNAME }">
<input type="hidden" name="DBcustPhone" value="${address.CUSTPHONE }">
</c:if>


<br>
<br>
<br>
<br>
<div class="container">
    <form name="f" method="post">
 
        <div class="col-sm-12 pt-3">
            <div class="card">
                <div class="card-header card-header-primary">
                    <h4 class="card-title"><i class="fas fa-square"></i> 배송지 정보 </h4>
                    <p class="card-catagory"></p>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table">
                            <tbody>
                            <tr>
                                <td>배송지</td>
                                <td>
                                    <input type="checkbox" name="defualtAddress" value ="기본">기본
                                    <input type="checkbox" name="newAddress" value ="변경지"> 변경배송지
                                    <input type="hidden" name="address" value ="">                              
                                </td>
                            </tr>  
                            <tr>
                                <td>전화번호</td>
                                <td>
                                    <input type="text" name="tel" class="form-control" value="">
                                </td>
                                <td>구매자</td>
                                <td>
                                    <input type="text" name="fax" class="form-control" value="">
                                </td>
                            </tr>
                            <tr>
                                <td>우편번호</td>
                                <td>
                                    <input type="text" name="post1" id="post1" size="5" class="form-control" readonly value="" style="display:inline-block;width:100px;"> 
                                    <i class="fas fa-search" onclick="sample6_execDaumPostcode()" style="cursor:pointer;font-size:24px;"></i>
                                </td>
                            </tr>
                            <tr>
                                <td>주소</td>
                                <td colspan="3">
                                    <input type="text" name="address1" id="address1" class="form-control mb-3" value="">
                                    <input type="text" name="address2" id="address2" class="form-control" value="">
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
 
            <div class="pt-3"></div>
 
                 <div class="card">
                <div class="card-header"><i class="fas fa-square"></i> 결제상품</div>
                <div class="card-body">
                <!-- 경계선 -->
                
      <div class="container">
        <div class="cart_inner">
          <div class="table-responsive">
          
          
            <table class="table">
              <thead>
                <tr>
                  <th scope="col">상품</th>
                  <th scope="col">가격</th>
                  <th scope="col">수량</th>
                  <th scope="col">옵션</th>
                  <th scope="col">Total</th>
                </tr>
              </thead>
              <tbody>
              
              <c:choose>
                  <c:when test="${not empty prodDetail }">
                    <c:forEach var="prodDetail" items="${prodDetail }">
                  
              <!-- 반복구간 -->
                <tr>
                  <td>
                    <div class="media">
                      <div class="d-flex">
                        <img
                          src="/resources/img/${prodDetail.IMAGE }"
                          <%-- src="/resources/img/${prodDetail.IMAGE }" --%>
                          alt="" width="90px" height="90px"
                        />
                      </div>
                      <div class="media-body">
                        <p>${prodDetail.NAME }</p>
                      </div>
                    </div>
                  </td>
                  <td>
                    <h5 id="price">${prodDetail.PRICE }</h5>
                    <input type="hidden" name="prodPrice" value="${prodDetail.PRICE }" style="border: none;">
                  </td>
                  <td>
                    <div class="product_count">
                    <P>${prodDetail.QUANTITY }</P>
                      <input
                        type="hidden"
                        name="qty"
                        id="sst"
                        maxlength="12"
                        value="${prodDetail.QUANTITY }"
                        title="Quantity:"
                        class="input-text qty"
                      />
                      
                      <p></p>
                    </div>
                  </td>
                  <td>
                  <h> <span>색상 </span> : ${prodDetail.COLOR }  &nbsp; &nbsp; </h><br>
                <h> <span>사이즈 </span> : ${prodDetail.PRODSIZE }  &nbsp; &nbsp;</h> 
                  </td>
                  <td>
                    <h5> <bold id="totalPut">${prodDetail.PRICE * prodDetail.QUANTITY }</bold>원</h5> <!--  수량 *가격 --> 
                    <input type ="hidden" name="total" value="${prodDetail.PRICE * prodDetail.QUANTITY }">
                  </td>
                </tr>
                <input type="hidden" name="prodNum" value="${prodDetail.PRODNUM }">
                <input type="hidden" name="prodName" value="${prodDetail.NAME }">
                <input type="hidden" name="orderNum" value="${prodDetail.ORDERNUM }">
                <input type="hidden" name="optionNums" value="${prodDetail.OPTIONNUM }">
                <input type="hidden" name="type" value="${type }">
                
                    </c:forEach>
                  </c:when>
              </c:choose>
               <!-- 반복구간 --> 
            </table>
          </div>
        </div>
      </div>
                    
                    <!-- 경계선 -->
                </div>
            </div>
 
 
 
 
            <div class="card">
                <div class="card-header"><i class="fas fa-square"></i> 결제 진행</div>
                <div class="card-body">
                    <table class="table">
                        <tbody>
                            <tr style="line-height:32px;">
                                <td>결제 수단</td>
                                <td>
                                    <input type="checkbox" name="card" value ="card">카드
                                    <input type="checkbox" name="account" value ="account">계좌        
                                    <input type="hidden" name="payType" value =""> 
                                </td>
                            </tr>
                            <tr style="line-height:32px;">
                                <td>포인트</td>
                                <td>
                                    <p>보유 포인트: ${point } p</p><br>
                                    <input type="hidden" name="point" value="${point }">
                                    <p><input type="text" name="usepoint" value="">포인트P 
                                    <button type="button" id="poinButton" onclick="usePoin()" class="btn btn-success">포인트사용</button> </p>
                                </td>
                            </tr>
                            <tr style="line-height:32px;" >
                                <td>총 결제 금액</td>
                                <td >
                                    <p> <bold id="payTotal"></bold>원  <blod id="minus" style="display: none;"></blod> </p>
                                    <input type ="hidden" name="payTotal" value="">
                                    
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="pt-3"></div>
        </div>
    </form>
    <div class="text-center mt-3">
        <button type="button" onclick="check()" class="btn btn-success">결제하기</button>
        <button type="button" onclick="cancelPay()" class="btn btn-info" >뒤로가기</button>
    </div>
</div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <!-- <script src="/resouces/shop/js/jquery-3.2.1.min.js"></script>
    <script src="/resouces/shop/js/popper.js"></script>
    <script src="/resouces/shop/js/bootstrap.min.js"></script>
    <script src="/resouces/shop/js/stellar.js"></script>
    <script src="/resouces/shop/vendors/lightbox/simpleLightbox.min.js"></script>
    <script src="/resouces/shop/vendors/nice-select/js/jquery.nice-select.min.js"></script>
    <script src="/resouces/shop/vendors/isotope/imagesloaded.pkgd.min.js"></script>
    <script src="/resouces/shop/vendors/isotope/isotope-min.js"></script>
    <script src="/resouces/shop/vendors/owl-carousel/owl.carousel.min.js"></script>
    <script src="/resouces/shop/js/jquery.ajaxchimp.min.js"></script>
    <script src="/resoucesjs/mail-script.js"></script>
    <script src="/resoucesvendors/jquery-ui/jquery-ui.js"></script>
    <script src="/resoucesvendors/counter-up/jquery.waypoints.min.js"></script>
    <script src="/resoucesvendors/counter-up/jquery.counterup.js"></script>
    <script src="/resoucesjs/theme.js"></script> -->

</body>
<jsp:include page="/common/footer.jsp" />
</html>

