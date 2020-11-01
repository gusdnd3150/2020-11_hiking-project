<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>




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



  function addDelivery(userNum){
	  console.log(userNum);
	  
	  var address1 = $("input[name=address1]").val();
	  var address2 = $("input[name=address2]").val();
	  var post = $("input[name=post1]").val();
	  var userName = $("input[name=fax]").val();
	  var phonNum = $("input[name=tel]").val();
	  
	  $.ajax({
			 type:"post",
		     async:true,
		     url:"/addDelivery.do",
		     data:{userNum:userNum,address1:address1,address2:address2,
		    	 phonNum:phonNum,userName:userName,post:post
		     },
		     success:function(data,textStatus){
		     	alert('기본지 설정이 되었습니다.');
		     	opener.location.reload();
		     	window.close();
		     },
		     error:function(data,textStatus){
		     }
		 });
	  
  }
  
  
</script>

</head>
<body>


                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table">
                            <tbody>
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
                              <tr>
                                <td>
                                    <button onclick="addDelivery(${userNum})" class="genric-btn primary" name="upNum" >추가</button>
                                </td>
                            </tr>  
                            </tbody>
                        </table>
                    </div>
                </div>


</body>
</html>