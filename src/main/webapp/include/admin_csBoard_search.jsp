<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <head>

  <script type="text/javascript">
	//조건검색시 인풋창 입력 막는 조건
  function myFunction(str) {
	    if(str=='status'){
	        $(".form-control").prop("disabled",true);
	         $("#radioInput").append("<input type='radio'  name='key_word1' value='1'> 처리대기 &nbsp;&nbsp");
	         $("#radioInput").append("<input type='radio'  name='key_word1' value='2'>완료  &nbsp;&nbsp");
	    }else{
	    	  $(".form-control").prop("disabled",false);
	    	  $("#radioInput").hide();
	    	
	    }
	};

 

  </script>
    </head>
  
    	 <form action="csBoardsearch.do" method="POST">
          <div class="input-group margin">
                <div class="input-group-btn">
                	<select name="searchOption" class="btn btn-info dropdown-toggle" onchange="myFunction(this.value)">
            		<option value="all">전체조회</option>
            		<option value="csPostType100">공지 전체 조회</option>
           			<option value="csPostType200">문의 전체 조회</option>
            		<option value="csPostType300">신고 전체 조회</option>
            		<option value="userNum">작성자 ID 조회</option>
            		<option value="status">처리 상태 조회</option>
        			</select>  
                </div> 
                <input type="text" name="key_word" class="form-control" placeholder="조회내용을 입력하세요">
                    <span class="input-group-btn">
                      <button type="submit" class="btn btn-info btn-flat" >조회</button>            
                    </span>
              </div>
               <div id="radioInput"> </div> 
             </form>
