<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" 
    import ="java.util.*,project.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />   


<!DOCTYPE html>
<html lang="ko">
  <head>
   <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <link rel="icon" href="/resources/shop/img/favicon.png" type="image/png" />
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
    
    

<style>
img{
cursor: pointer;
}
</style>

  </head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>         
   $(document).ready(function () {
	   $("#buyProduct").on("click",function(){           
	     $.ajax({
             type:"post",
             async:true,
             url:"/getSession.do",
             dataType:"json",
             success:function(data,textStatus){
               if(data.checkStatus == 'notEmpty'){
            	   buyProd();
               }else{ 
            	   alert("로그인 후 이용가능합니다.");
            	   return;
               }
             },
             error:function(data,textStatus){
             }
           });
	   });
           
	   
	   $("#addCart").on("click",function(){           
		     $.ajax({
	             type:"post",
	             async:true,
	             url:"/getSession.do",
	             dataType:"json",
	             success:function(data,textStatus){
	               if(data.checkStatus == 'notEmpty'){
	            	   addcart();
	               }else{ 
	            	   alert("로그인 후 이용가능합니다.");
	            	   return;
	               }
	             },
	             error:function(data,textStatus){
	             }
	           });
		   });
	   
	   
          
          $("button[name=upNum]").click(function() {           //수량업 클릭 시 
				 var index = $("button[name=upNum]").index(this); //인덱스 값 (이벤트를 발생시킨 태그의 index)
				 var dbquantity = $("input[name=quantity]").eq(index).val(); 
	        	 console.log(dbquantity);
	        	 var quantity =$("input[name=qty]").eq(index); // 값
	        	 var sst = quantity.val();
	        	 
	        	 if(sst == dbquantity ) {
	        		 alert("재고량을 초과할 수 없습니다.");
	        	 }else if(!isNaN(sst)){
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
		        	 
		        	 if(sst==0){
		        		 alert("수량은 하나이상 선택해 주시길 바랍니다.");
		        		 return;
		        	 }
		        	  
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
	         
	         
	   
 
});
      
     
      
       
	   function buyProd(){
	   	   var prodNums = []; 
	       var optionnums =[];
	       var quantities =[];
	       var prices =[];
	       
	       var prodSizes =[];
	       var prodColors=[];
	       var prodNames=[];
	       var prodImages=[];
	       var optionNums=[];
	       
	       var prodPrice =$("input[name=addPrice]").val().replace(",","").trim();
	       
	       
	       
	       var Type ="상품디테일";
	       
	       var checkBox =$('input[name=optionCheck]:checked');// 옵션체크 
	       if (checkBox.length ==0){
	       	alert("옵션을 선택해 주세요");
	       	return;
	       }
	       
	   	 $('input[name=optionCheck]:checked').each(function (i, elements) {
	   	    var index= $(elements).index("input:checkbox[name=optionCheck]");
	   	   var prodNum =$("input[name=prodNum]").eq(index).val();
	   	    var optioNnum =$("input[name=optionNum]").eq(index).val();
	   	    var quantity =$("input[name=qty]").eq(index).val();
	   	    var prodColor =$("input[name=prodColor]").eq(index).val();
	   	    var prodSize =$("input[name=prodSize]").eq(index).val();
	   	    var prodName =$("input[name=prodName]").eq(index).val();
	   	    var prodImage =$("input[name=buyImage]").eq(index).val();
	   	    var optionNum =$("input[name=optionNum]").eq(index).val();
	   	    
	   	    
	   	    prodSizes.push(prodSize); 
	   	    prodColors.push(prodColor);
	   	    prodNames.push(prodName);
	   	    prodImages.push(prodImage);
	   	    
	   	    optionNums.push(Number.parseInt(optionNum));
	   	    prodNums.push(Number.parseInt(prodNum));
	   	    optionnums.push(Number.parseInt(optioNnum));
	   	    quantities.push(Number.parseInt(quantity));
	   	    prices.push(prodPrice);
	   	});
	   	 for(var i=0;i<prodNums.length;i++){
	   		 console.log("프로드넘"+prodNums[i]);
	   		console.log("옵션"+optionnums[i]);
	   		console.log("수량"+quantities[i]);
	   		console.log("체크된 수량*제품가격"+prices[i]);
	   		 console.log("사이즈"+prodSizes[i]);
	   	   console.log("색상"+prodColors[i]);
	   			console.log("이름"+prodNames[i]);
	   			console.log("이미지"+prodImages[i]);
	   			console.log("옵션번호"+optionNums[i]);
	   	 }
	   	 
	   	 for(var i=0;i< quantities.length;i++){
	   		 if(quantities[i] <1){
	              alert("수량을 입력해 주세요");
	              return;
	           }
	   	 }
	        $.ajax({
	         type:"post",
	         async:true,
	         url:"/myShop/buyProdFromDetail.do",
	         data:{prodNums:prodNums,optionnums:optionnums,quantities:quantities,Type:Type,prices:prices,
	       	  prodSizes:prodSizes,prodColors:prodColors,prodNames:prodNames,prodImages:prodImages,optionNums:optionNums},
	         success:function(data,textStatus){
	             	location.href="/myShop/buyProd.do?type=1";
	         },
	         error:function(data,textStatus){
	         },
	         complete:function(){
	         }
	       });   
	       
	   }   
	   
	   
      function addcart(){
	       var prodNums = []; 
           var optionnums =[];
           var quantities =[];
           var prices =[];
           var prodPrice =$("input[name=addPrice]").val().replace(",","").trim();
           console.log(prodPrice);
           var addType ="상품디테일";
           
           var checkBox =$('input[name=optionCheck]:checked');// 옵션체크 
	       if (checkBox.length ==0){
	       	alert("옵션을 선택해 주세요");
	       	return;
	       }
           
	
       	 $('input[name=optionCheck]:checked').each(function (i, elements) {
 		    var index= $(elements).index("input:checkbox[name=optionCheck]");
 		   var prodNum =$("input[name=prodNum]").eq(index).val();
 		  var optioNnum =$("input[name=optionNum]").eq(index).val();
 		    var quantity =$("input[name=qty]").eq(index).val();
 		   
 		    prodNums.push(Number.parseInt(prodNum));
 		    optionnums.push(Number.parseInt(optioNnum));
 		    quantities.push(Number.parseInt(quantity));
 		    prices.push(prodPrice);
 		});
       	 for(var i=0;i< quantities.length;i++){
       		 if(quantities[i] <1){
                  alert("수량을 입력해 주세요");
            }
       	 }
  		  $.ajax({
	            type:"post",
	            async:true,
	            url:"/myShop/addCart.do",
	            data:{prodNums:prodNums,optionnums:optionnums,quantities:quantities,addType:addType,prices:prices},
	            error:function(data,textStatus){
	            },
	            complete:function(){
	            	alert('장바구니에 추가되었습니다.');
	            	location.reload();
	            }
	          }); 
	          
       }
      
      
      
      function addComment2(index){ //댓글등록
   	   
   	   var prodNum =$("input[name=afterProdNum2]").eq(index).val();
   	   var afterType =$("input[name=afterType2]").eq(index).val();
   	   var content =$("input[name=afterContent2]").eq(index).val();
   	
   	   
   	   var prodNumtag =$("input[name=afterProdNum2]").eq(index);
   	  var index2 =prodNumtag.parents(".review_item").index();
   	   
   	     $.ajax({
                type:"post",
                async:true,
                url:"/getSession.do",
                dataType:"json",
                success:function(data,textStatus){
                  
                  if(data.checkStatus == 'notEmpty'){
               	   
               	   $.ajax({
          	            type:"post",
          	            async:true,
          	            url:"/myShop/addComent.do",
          	            data:{prodNum:prodNum,afterType:afterType,content:content},
          	            dataType:"json",
          	            error:function(data,textStatus){
          	            },
          	            complete:function(){
          	            	//location.reload(); 
          	            	PutComment(index2);
          	            }
          	          }); 
                  }else{ 
               	   alert("로그인 후 이용가능합니다.");
               	   return;
                  }
                },
                error:function(data,textStatus){
                }
              });
      }
      
      
 
   function addComment(index){ //댓글등록
	   
	   var prodNum =$("input[name=afterProdNum]").eq(index).val();
	   var afterType =$("input[name=afterType]").eq(index).val();
	   var content =$("input[name=afterContent]").eq(index).val();
	    
	   console.log("에프터번호"+afterType);
	   console.log("인덱스"+index);
	   console.log(content);
	   
	   var prodNumtag =$("input[name=afterContent]").eq(index);
	   var index2 =prodNumtag.parents(".review_item").index();
  	   var putter =$("#CommentPutter"+index2+"");
	    
	   
	     $.ajax({
             type:"post",
             async:true,
             url:"/getSession.do",
             dataType:"json",
             success:function(data,textStatus){
               
               if(data.checkStatus == 'notEmpty'){
            	   
            	   $.ajax({
       	            type:"post",
       	            async:true,
       	            url:"/myShop/addComent.do",
       	            data:{prodNum:prodNum,afterType:afterType,content:content},
       	            dataType:"json",
       	            error:function(data,textStatus){
       	            },
       	            complete:function(){
       	            	location.reload(); 
       	            }
       	          }); 
            	   
            	   
               }else{ 
            	   alert("로그인 후 이용가능합니다.");
            	   return;
               }
             },
             error:function(data,textStatus){
             }
           });
	
      
   }
   
   function showComment2(index){
	   var tag = $("#commentInput2"+index+"");
	   tag.slideDown();
   }
   
   
   function showCommentForm(index){
	   var tag = $("#commentInput"+index+"");
	   tag.slideDown();
   }
   
   
   function PutComment(index){   //댓글 보이기
	   var afterNum = $("input[name=afterType]").eq(index).val();
	   var prodNum = $("input[name=afterProdNum]").eq(index).val();
	   var putter =$("#CommentPutter"+index+"");
	   var hidebutton =$("#showcommentList"+index+"");   //댓글보기 버튼 숨기기 위함
	   var sessionId="${sessionId}";
	   var foldList =$("#foldList"+index+"");
	   
	   console.log("인덱스"+index);
	   console.log(afterNum);
	   
	   $(".emptyPutter").empty();
	   
	   $(".showbutton").show();
	   $(".hidefold").hide();
	   $(".hidespread").hide();
	   
		  $.ajax({
	            type:"get",
	            async:true,
	            url:"/selectComment.do",
	            data:{afterNum:afterNum,prodNum:prodNum},
	            dataType:"json",
	            contentType: "application/json; charset=utf-8;",
	            success:function(data,textStatus){
	            	
	            	var put ="";
	            	for(var i=0;i<data.length;i++){
	            		
                        if(data[i].LV==2){
	            	    put = "<div style='padding-left:60px'>";
                        }else if(data[i].LV==3){
                        	put = "<div  style='padding-left:100px'>";	
                        }else{
                          put = "<div>";
                        }
                        
	            	    put +="<br>";
	            		put += "<ul class='col-12 pl-5 row'>";
	            		
	            		if(data[i].IMAGE==null){
	            		put+=  '<li style="float:left"><img src="/resources/img/basic_profile.PNG" class="rounded-circle" style="width: 50px;height: 50px"></li>';
	            		}else{
	            		put += '<li style="float:left"><img src="/resources/img/'+data[i].IMAGE+'" class="rounded-circle" style="width: 50px;height: 50px"></li>';
	            		}
	            		put +=  '<li style="float:left;padding-left: 22px;padding-top: 4px;"><p>'+data[i].ID+'&nbsp;&nbsp; '+data[i].CREATEDAT+'&nbsp;&nbsp;';
	            		
	            	    if(data[i].LV!=3){
	            		put +=  '<button class="genric-btn default-border"'; 
	            		put +=  'style="line-height: 18px;padding: 0px 2px;" onclick="showComment2('+i+')">댓글달기</button> ';
	            		}
	            		
	            		if(data[i].ID ==sessionId){
	            		put +=  '<button class="genric-btn danger"'; 
	            		put +=  'style="line-height: 18px;padding: 0px 2px;" onclick="delComment('+data[i].AFTERNUM+','+data[i].PRODNUM+')">x</button> ';
	            		put += ' </p></li>';
	            		}else{
	            			put += ' </p></li>';
	            		}
	            	    put +="</ul>";
	            	    put +="<p style='padding-left: 50px;padding-top: 2px;' >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong> "+data[i].CONTENT+" </strong> </p>";
	            		
	            	    put += "<div id='commentInput2"+i+"' class='row' style='justify-content:center;display:none'  width='80%'>";
	            		put += "<input name='afterContent2' class='form-control'  style='width: 81%;' type='text'"; 
	            	    put += "placeholder='내용을 입력해주세요'>";
	            		put += "<button class='genric-btn info radius' style='line-height: 35px;padding: 0 17px;' onclick='addComment2("+i+")'>등록</button>";
	            		put += "<input type='hidden' name='afterProdNum2' value='"+data[i].PRODNUM+"'>";
	            		put += "<input type='hidden' name='afterType2' value='"+data[i].AFTERNUM+"'>";
	            		put += "</div>";
	            	    put +="<br></div>";
	            	    putter.append(put);
	            	}
	            	putter.slideDown();
	            	hidebutton.hide();
	            	foldList.show();
	            },
	            error:function(data,textStatus){
	            }
	          });
   }
   
   function foldComment(index){
	   var hidelist =$("#CommentPutter"+index+"");  
	   var foldList =$("#foldList"+index+"");
	   var spreadList =$("#spreadList"+index+"");
	   hidelist.slideUp(); //댓글숨기고
	   foldList.hide(); //접기버튼 숨기고
	   spreadList.show(); //펴기버튼 보여준다
	   
   }
   
   function spreadComment(index){  
	   var showList =$("#CommentPutter"+index+"");
	   var foldList =$("#foldList"+index+"");
	   var spreadList =$("#spreadList"+index+"");
	   showList.slideDown();
	   foldList.show();
	   spreadList.hide();
   }
 
   
   
    function delAfter(index){
    	var afterNum = $("input[name=afterType]").eq(index).val();
    	var prodNum = $("input[name=prodNum]").eq(index).val();
    	console.log(afterNum);
    	
    	var check = window.confirm("후기를 삭제 하시겠습니까?");
    	
    	if(check==true){
    	$.ajax({
			type : "post",       
			dataType : "text",    
			async:true,         
			url : "/delAfter.do",         
			data : {afterNum:afterNum}, 
			success : function(data, textStatus) {
				location.reload();
			},
			error : function(data, textStatus) {
			}
		});
    	}
    }
   
    
    function delComment(afterNum,prodNum){
    	
    	var check =window.confirm("댓글을 삭제 하시겠습니까?");
    	
    	if(check==true){
    	$.ajax({
			type :"get",       
			dataType : "text",    
			async:true,         
			url : "/delComment.do",         
			data : {afterNum:afterNum}, 
			success : function(data, textStatus) {
				location.reload();
			},
			error : function(data, textStatus) {
			}
		});
    	}
    }
    
    
    function addAfterTest(){
    	$.ajax({
            type:"post",
            async:true,
            url:"/getSession.do",
            dataType:"json",
            success:function(data,textStatus){
              console.log(data.checkStatus);
              
              if(data.checkStatus == 'notEmpty'){
              	
               var afterImage= $("input[id=uploadFile]").val();
       			
               console.log(afterImage);
               if(afterImage.length==0){
                 alert("후기사진을 등록 바랍니다.");
                 return;
               }
               
               var form = $('#contactForm')[0];
               var data = new FormData(form);
               
               $.ajax({
                   type:"post",
                   async:true,
                   enctype: 'multipart/form-data',
                   processData: false,
                   contentType: false,
                   url:"/myShop/addAfter.do",
                   dataType:"json",
                   data: data,
                   cache: false,
                   success:function(data,textStatus){
                  	 
                   },
                   complete:function(){
                	   location.reload();
                   }
                 });
                
              }else{ 
           	   alert("로그인 후 이용가능합니다.");
           	   return false;
              }
            }
          });
    	
    }
      
    
    function delwish(prodNum){
   	 
        $.ajax({
            type:"post",
            async:true,
            url:"/myShop/delwish.do",
            dataType:"text",
            data: {prodNum:prodNum},
            success:function(data,textStatus){
            	if(data=='success'){
           	   $("#changeNode").replaceWith('<a id="changeNode" onclick="return addwish('+prodNum+');"><img src="/resources/img/shop_heart.png" width="20px" height="20px" style="color:black"></a>');
            	}
            },
            error:function(){
            }
          });
        
   	 
    }
    
    
    function addwish(prodNum){
    	
    	
    	$.ajax({
            type:"post",
            async:true,
            url:"/getSession.do",
            dataType:"json",
            success:function(data,textStatus){
              if(data.checkStatus == 'notEmpty'){
            	  
            	   $.ajax({
                       type:"post",
                       async:true,
                       url:"/myShop/addwish.do",
                       dataType:"text",
                       data: {prodNum:prodNum},
                       success:function(data,textStatus){
                       	if(data=='success'){
                      	      //location.reload();
                      	     $("#changeNode").replaceWith('<a id="changeNode"  onclick="return delwish('+prodNum+');"><img src="/resources/img/shop_heart2.png" width="20px" height="20px" ></a>');
                       	}
                       },
                       error:function(){
                       }
                     });
            	  
              }else{ 
           	   alert("로그인 후 이용가능합니다.");
           	   return;
              }
            },
            error:function(data,textStatus){
            }
          });
        
   	 
    }
    
    function changImage(index){
    var image =$("#smallImage"+index+"");
    var bigImage =$("#bigImage");
      bigImage.attr("src",image.attr("src"));
    }
    
</script>

  <body>
  <jsp:include page="/common/header.jsp" />

    <!--================Single Product Area =================-->
    <div class="product_image_area">
      <div class="container">
        <div class="row s_product_inner">
        
          <div class="col-lg-6">
            <div class="s_product_img">
               <!-- 여기서부터는 큰이미지 -->
              <div>
               <img src="/resources/img/${images[0].CONTENT }" width="500px" height="500px" id="bigImage" style="color:black;">
              </div>
               <!-- 여기서부터는 작은이미지 -->
              <div>
               <ul style="margin-right: 42px;">
               <c:forEach var="showimages" items="${images }" varStatus="index">
                  <li style="float:right">
                   <img src="/resources/img/${showimages.CONTENT }" id="smallImage${index.index}"
                   onclick="changImage(${index.index})" width="100px" height="100px" style="border: groove;color:black">   
                  </li>
               </c:forEach>
               </ul>
              </div>
            </div>
          </div>
          
          
          
          
          <div class="col-lg-5 offset-lg-1">
            <div class="s_product_text">
              <h3>${prodDetail[0].NAME}</h3>
              <h2> ${prodDetail[0].PRICE } 원</h2>
              <input type="hidden" name="addPrice" value="${prodDetail[0].PRICE }">
              <ul class="list">
                <li>
                    <c:if test="${prodDetail[0].TYPE ==2 }">
                    <a class="active" href="#">
                    <span>Category</span> : 중고</a>
                    </c:if>
                    <c:if test="${prodDetail[0].TYPE ==1 }">
                     <a class="active" href="#">
                    <span>Category</span> : 신제품</a>
                    </c:if>
                    
                </li>
                <li>
                  <%-- <a href="#"> <span>Availibility</span> : ${prodDetail[0].QUANTITY } </a> --%>
                </li>
              </ul>
              <p>
                ${prodDetail[0].CONTENT }
              </p>
              <hr>
              
              <div>   <!-- 옵션테그 -->
               <a href="#"> <span>Options 선택</span> : </a>
               <!-- 반복 -->
              <table>
              <c:forEach var="options" items="${prodDetail }">
               <tr>
               <td><input type="checkbox" name="optionCheck">  &nbsp; &nbsp;</td>
               
               <td> <h> <span>재고 </span> : ${options.QUANTITY }  &nbsp; &nbsp; </h> </td>
                 <td><h> <span>사이즈 </span> : ${options.PRODSIZE }  &nbsp; &nbsp;</h> </td>
               <td> <h><span>색상</span> :  ${options.COLOR }  &nbsp;</h></td>
               
               
               <td>
                 <!-- <h><input type="text" name="inputquantity" placeholder="수량 입력 " style="display: none" value="" size=6></h> -->
                    <div class="product_count" style="margin-top: 10px;margin-bottom: 6px"  >
                      <input
                        type="text"
                        name="qty"
                        id="sst"
                        maxlength="12"
                        value="1"
                        title="Quantity:"
                        class="input-text qty"
                         style="height: 36px"/>
                      <button
                        onclick=""
                        class="increase items-count"
                        type="button"
                        name="upNum"
                      >
                        <img src="/resources/img/shop_button_up.png" width="20px" height="20px" style="color:black">
                      </button>
                      <button
                        onclick=""
                        class="reduced items-count"
                        type="button"
                        name="downNum"
                      >
                        <img src="/resources/img/shop_button_down.png" width="20px" height="20px" style="color:black">
                      </button>
                    </div>
                </td>
              </tr>
              <input type="hidden" name="quantity" value="${options.QUANTITY }">
              <input type="hidden" name="perPrice" value="${options.PRICE }">
              <input type="hidden" name="prodNum" value="${options.PRODNUM }">
              <input type="hidden" name="optionNum" value="${options.OPTIONNUM }">
              <input type="hidden" name="prodSize" value="${options.PRODSIZE }">
              <input type="hidden" name="prodColor" value="${options.COLOR }">
              <input type="hidden" name="buyImage" value="${images[0].CONTENT }">
              <input type="hidden" name="prodName" value="${prodDetail[0].NAME }">
              </c:forEach>
              </table>
                <br>
                <!-- 반복 끝 -->
              </div>
              <hr>
 
             
              <div class="card_area">
                <p class="main_btn" id="addCart">장바구니</p>  <!--  a tag에 수량+prodNum과 같이 보내고 서버에서 세션으로 진행할지 결정 -->
                <%-- <a class="main_btn" href="/myShop/buyProd.do/${prodDetail.prodNum }">구매하기</a> --%>
                <p class="main_btn" id="buyProduct">구매하기</p> 
                <input type="hidden" id="prodNum" value="${prodDetail[0].PRODNUM }">
                <input type="hidden" id="prodName" value="${prodDetail[0].NAME }"> 
                <input type="hidden" id="prodPrice" value="${prodDetail[0].PRICE }">
                
                <c:if test="${empty prodDetail[0].USERNUM }">
                <a id="changeNode"  onclick="return addwish(${prodDetail[0].PRODNUM});"><img src="/resources/img/shop_heart.png" width="20px" height="20px" style="color:black"></a>
                </c:if>
                <c:if test="${not empty prodDetail[0].USERNUM }">
                  <a id="changeNode"  onclick="return delwish(${prodDetail[0].PRODNUM});"><img src="/resources/img/shop_heart2.png" width="20px" height="20px" ></a>
                </c:if>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--================End Single Product Area =================-->

    <!--================Product Description Area =================-->
    <section class="product_description_area">
      <div class="container">
        <ul class="nav nav-tabs" id="myTab" role="tablist">
          <li class="nav-item">
            <a
              class="nav-link"
              id="home-tab"
              data-toggle="tab"
              href="#home"
              role="tab"
              aria-controls="home"
              aria-selected="true"
              >상품설명</a
            >
          </li>
          <li class="nav-item">
            <a
              class="nav-link active"
              id="review-tab"
              data-toggle="tab"
              href="#review"
              role="tab"
              aria-controls="review"
              aria-selected="false"
              >상품후기</a
            >
          </li>
        </ul>
        <div class="tab-content" id="myTabContent">
          <div
            class="tab-pane fade"
            id="home"
            role="tabpanel"
            aria-labelledby="home-tab"
          >
            <c:choose>
                 <c:when test="${empty imagesBottom }">
               <p>이미지가 없습니다.</p>     
                   </c:when>
                  <c:when test="${not empty imagesBottom }">
                    <c:forEach var="imagesBottom" items="${imagesBottom }">
                   <img src="/resources/img/${imagesBottom.CONTENTDETAIL }"  alt="상" style="max-width: 100%; height:auto"><br>
                   </c:forEach>
            </c:when>
           </c:choose>
          </div>
          
          
          <div
            class="tab-pane fade show active"
            id="review"
            role="tabpanel"
            aria-labelledby="review-tab"
          >
            <div class="row">
              <div class="col-lg-6">
                <div class="row total_rate">
                  <div class="col-6">
                    <div class="box_total">
                      <h5>평점</h5>
                      <h4>${average }</h4>
                    </div>
                  </div>
                  <div class="col-6" style="font:sans-serif">
                    <div class="rating_list" style="font:sans-serif">
                      <ul  class="list" style="font:sans-serif">
                      
                        <li>
                        
                          <a href="#"
                            >5 Star
                            <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black">
                            <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black">
                            <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black">
                            <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black">
                            <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black">
                            </a>
                        </li>
                        <li>
                          <a href="#"
                            >4 Star
                            <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black">
                            <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black">
                            <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black">
                            <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black"> </a
                          >
                        </li>
                        <li>
                          <a href="#"
                            >3 Star
                            <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black">
                            <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black">
                            <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black"> </a
                          >
                        </li>
                        <li>
                          <a href="#"
                            >2 Star
                            <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black">
                            <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black"> </a
                          >
                        </li>
                        <li>
                          <a href="#"
                            >1 Star
                            <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black"> </a
                          >
                        </li>
                      </ul>
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-lg-6">
              
              <c:if test="${prodDetail[0].CHECKBUY !=0 }">
                <div class="review_box">
                  <h4>상품 후기 등록</h4>
                  
                   <form
                    name="addAfter"
                    class="row contact_form"
                    action="/myShop/addAfter.do" 
                    method="post"
                    id="contactForm"
                    novalidate="novalidate"
                    enctype="multipart/form-data"
                  >
                  <input type="hidden" name="prodNum" value="${prodDetail[0].PRODNUM }"><br>
                  <label>평점 </label>
            <select name="evalue" id="evalue">
            <option value="1">1</option>    
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
             </select><br>
                    <!-- 파일첨부 -->
                        <input type="file"  id="uploadFile" name="photo"/>
                  <!-- 상품후기내용 -->
                    <div class="col-md-12">
                      <div class="form-group">
                        <textarea
                          class="form-control"
                          name="content"
                          id="content"
                          rows="1"
                          placeholder="후기"
                          style="width:400px;height:100px"
                        ></textarea>
                      </div>
                      
                    </div>
                  </form>
                     <button onclick="addAfterTest()" style="display:inline;" class="genric-btn info radius">후기등록</button>
                </div>
                </c:if>
                
                <c:if test="${prodDetail[0].CHECKBUY ==0 }">
                      
                </c:if>
                
              </div>
            </div>
            
              <hr>
              <div class="review_list" style="padding:5%">
              
                          <!-- 경계선 -->
                       <c:choose>
                            <c:when test="${empty afterList }">
                                 <p> 후기가 없습니다 </p>
                            </c:when>
                            <c:when test="${not empty afterList }">      
                               <c:forEach var="afterList" items="${afterList }" varStatus="num">
                                 
                     <div class="review_item" style="background-color:#F6F6F6"  >
                    <div class="media" >
                      <div class="d-flex">
                       <!-- 이미지 -->
     
                        
                        
                           <img
                          src="/resources/img/${afterList.PHOTO }"
                          alt=""
                           data-toggle="modal" data-target="#myModal${num.index }"
                          class="img-thumbnail"
                          width="150px" height="150px"
                          border="15px"/>
                    

<!-- Modal -->
<div id="myModal${num.index }" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body">
                         <img
                          src="/resources/img/${afterList.PHOTO }"
                          border="15px"
                          style="max-width: 100%; height:auto"
                        />
   <div class="media-body">
                       <c:choose>
                         <c:when test="${afterList.IMAGE eq null}">
                        <img src="/resources/img/basic_profile.PNG" class="rounded-circle" style="width: 50px;height: 50px;float:left">
                         </c:when>
                          <c:when test="${afterList.IMAGE ne null}">
                         <img  src="/resources/img/${afterList.IMAGE}" class="rounded-circle" style="width: 50px;height: 50px;float:left">
                         </c:when>
                         </c:choose>
                        <p style="float:left">${afterList.ID } &nbsp;&nbsp; ${afterList.CREATEDAT } </p>    <!-- 유저아이디+생성일 -->
                        <c:if test="${afterList.EVALUE ==1 }"> <!-- 평점 -->
                        <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black;margin-top: 13px;">        
                        </c:if>
                        <c:if test="${afterList.EVALUE ==2 }">
                        <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black;margin-top: 13px;">
                        <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black;margin-top: 13px;">
                        </c:if>
                        <c:if test="${afterList.EVALUE ==3 }">
                        <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black;margin-top: 13px;">
                        <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black;margin-top: 13px;">
                        <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black;margin-top: 13px;">
                        </c:if>
                       <c:if test="${afterList.EVALUE == 4 }">
                        <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black;margin-top: 13px;">
                        <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black;margin-top: 13px;">
                        <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black;margin-top: 13px;">
                        <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black;margin-top: 13px;">
                        </c:if>
                       <c:if test="${afterList.EVALUE == 5 }">
                        <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black;margin-top: 13px;">
                        <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black;margin-top: 13px;">
                        <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black;margin-top: 13px;">
                        <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black;margin-top: 13px;">
                        <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black;margin-top: 13px;">
                        </c:if>
                        <p>&nbsp;&nbsp;  <strong style="display:block;overflow:hidden;white-space:nowrap;text-overflow: ellipsis">${afterList.CONTENT }</strong></p>     <!--  후기내용 -->
                      </div>
                        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
                        
                      </div>
                      
                      <div class="media-body">
                       <c:choose>
                         <c:when test="${afterList.IMAGE eq null}">
                        <img src="/resources/img/basic_profile.PNG" class="rounded-circle" style="width: 50px;height: 50px">
                         </c:when>
                          <c:when test="${afterList.IMAGE ne null}">
                         <img src="/resources/img/${afterList.IMAGE}" class="rounded-circle" style="width: 50px;height: 50px">
                         </c:when>
                         </c:choose>
                        <p>${afterList.ID } &nbsp;&nbsp; ${afterList.CREATEDAT } </p>    <!-- 유저아이디+생성일 -->
                        <c:if test="${afterList.EVALUE ==1 }"> <!-- 평점 -->
                        <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black">        
                        </c:if>
                        <c:if test="${afterList.EVALUE ==2 }">
                        <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black">
                        <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black">
                        </c:if>
                        <c:if test="${afterList.EVALUE ==3 }">
                        <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black">
                        <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black">
                        <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black">
                        </c:if>
                       <c:if test="${afterList.EVALUE == 4 }">
                        <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black">
                        <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black">
                        <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black">
                        <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black">
                        </c:if>
                       <c:if test="${afterList.EVALUE == 5 }">
                        <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black">
                        <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black">
                        <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black">
                        <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black">
                        <img src="/resources/img/shop_star.png" width="20px" height="20px" style="color:black">
                        </c:if>
                        <p>&nbsp;&nbsp;  <strong>${afterList.CONTENT }</strong></p>     <!--  후기내용 -->
                        
                      </div>
                 
                    </div>
                    <div>
                      <div>
                     <ul style="padding-right: 23px;">
                     
                         <c:if test="${afterList.CNT !=0 }">
                         <li class="showbutton" id="showcommentList${num.index }" style="float:right"><p align="right"><button style="line-height: 27px;padding: 0px 7px;"
                     class="genric-btn default-border" onclick="PutComment(${num.index})">댓글${afterList.CNT }개보기</button></p>
                     </li>
                     
                     
                       <li id="foldList${num.index }" style="float:right;display:none" class="hidefold"><p align="right"><button style="line-height: 27px;padding: 0px 7px;"
                     class="genric-btn default-border" onclick="foldComment(${num.index})">댓글 접기</button></p>
                     </li>
                      <li id="spreadList${num.index }" style="float:right;display:none" class="hidespread"><p align="right"><button style="line-height: 27px;padding: 0px 7px;"
                     class="genric-btn default-border" onclick="spreadComment(${num.index})">댓글 펴기</button></p>
                     </li>
                         </c:if>
                     
                     <c:if test="${afterList.ID == sessionId }">
                     <li style="float:right">
                     <p align="right"><button style="line-height: 27px;padding: 0px 7px;" 
                     class="genric-btn danger" onclick="delAfter(${num.index})">후기삭제</button></p>
                     </li>
                     </c:if>
                     
                     <li style="float:right">
                     <p align="right"><button style="line-height: 27px;padding: 0px 7px;" 
                     class="genric-btn primary radius" onclick="showCommentForm(${num.index})">댓글등록</button></p>
                     </li>
                         
                     </ul>
                     
                      </div>
                    </div>
                    <br>
                    <br>
                    <hr width="90%">
          <div id="commentInput${num.index }" class="row" style="justify-content:center;display:none"  width="80%">
        <input name="afterContent" class="form-control"  style="width: 81%;" type="text" 
        placeholder="내용을 입력해주세요">
        <button class="genric-btn info radius" style="line-height: 35px;padding: 0 17px;" onclick="addComment(${num.index})">등록</button>
        <input type="hidden" name="afterProdNum" value="${prodDetail[0].PRODNUM }">
        <input type="hidden" name="afterType" value="${afterList.AFTERNUM }">
       </div>
                 
                   <div class="emptyPutter" id="CommentPutter${num.index }" style="display:none">
                   
                   </div>
              </div>
                               </c:forEach>
                            </c:when>
                         </c:choose>       
                  
                 <!-- 경계선 -->
                </div>
                
                
                
                    <!-- 페이징 -->
                <div style="display: block; text-align: center;">
                
	<c:if test="${paging.startPage != 1 }">
			<a href="/productDetail.do?prodNum=${prodDetail[0].PRODNUM }&nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/productDetail.do?prodNum=${prodDetail[0].PRODNUM}&nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/productDetail.do?prodNum=${prodDetail[0].PRODNUM}&nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
	
               </div>
             
          </div>
        </div>
    </section>
    <!--================End Product Description Area =================-->
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