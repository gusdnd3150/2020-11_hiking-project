<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>


<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>

$(document).ready(function () { //최초에 페이지이동 후 문서가 로드되었을때 한번 실행
	paging(1,6);
	
});

function paging(nowPage,cntPerPage){        //현재페이지 , 페이지당 보여줄 row 개수
  $.ajax({
    	type:"post",
    	url:"/PagingResult.do",
    	dataType:"json",
    	data:{nowPage:nowPage,cntPerPage:cntPerPage},
    	success:function(data){
    		console.log(data);
    		var pagingView="";
    		
    		  if(data.startPage !=1){
    			  pagingView +="<a href='#' onclick='return paging("+(data.startPage -1)+","+data.cntPerPage+");'>&lt;</a>";
    		  } 
    		  for(var i =data.startPage; i<=data.endPage;i++){
    			  if(i ==data.nowPage ){
    				  pagingView +="<a style='color:red' href='#'>"+i+"</a>";
    			  }else if(i !=data.nowPage){
    				  pagingView +="<a href='#' onclick='return paging("+i+","+data.cntPerPage+");'>"+i+"</a>";
    			  }
    		  }
    		  
    		  if(data.endPage != data.lastPage){
    			  pagingView +="<a href='#' onclick='return paging("+(data.endPage +1)+","+data.cntPerPage+");'>&gt;</a>";
    		  }

    		var pagingDiv =$("#paging");	
    		pagingDiv.html(pagingView);
    		
    		
    		
    	 	$.ajax({
    	    	type:"get",
    	    	url:"/PagingValues.do",
    	    	dataType:"json",
    	    	data:{start:data.start,end:data.end},       //시작 번호와 끝값만 다시 보내주고 값을 가져옴 start,end
    	    	success:function(data){
    	    		
     	    		var table="";
     	    		table += "<tr>";
     	    		table += "<th>이름</th>";
     	    		table += "<th>가격</th>";
     	    		table += "<th>넘버</th>";
     	    		table += "<th>조회수</th>";
     	    		table += "<th>카테</th>";
     	    		table += "</tr>";
    	    		for(var i in data){
    	    			table +="<tr>";
    	    			table += "<td>"+data[i].NAME+"</td>";
    	    			table += "<td>"+data[i].PRICE+"</td>";
    	    			table += "<td>"+data[i].PRODNUM+"</td>";
    	    			table += "<td>"+data[i].CNTCOUNT+"</td>";
    	    			table += "<td>"+data[i].PRODCATEGORYNUM+"</td>";
    	    			table +="</tr>";
    	    		}
    	    	
    	    		$("#list").html(table);
    	    		
    	    	}
    	    }); 
    	},
 
    });
}  

</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>

        <div align="center">
            <table id="list">
            <tr>
            <th>정보0</th>
               <th>정보1</th>
                <th>정보2</th>
                <th>정보3</th>
                <th>정보4</th>
            </tr>
            </table>
           
         </div>


         <div align="center" id="paging">
         </div>

</div>
</body>
</html>
