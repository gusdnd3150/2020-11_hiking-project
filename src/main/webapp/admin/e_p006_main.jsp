<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<!--jquery  -->
 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
 
 <!--head -->
<%@ include file="../include/head.jsp"%>

<!-- 구글차트 API -->
<script type="text/javascript" src="https://www.google.com/jsapi"></script>



 



<script type="text/javascript">

google.charts.load('current', {'packages':['corechart']}); //구글 차트 라이브러리 로딩



$(document).on("click", "#searchDate", function() {//지정 날짜 조회
	var _startDate = $('#startDate').val();
	var _endDate = $('#endDate').val();
	 console.log(_startDate);
	 console.log(_endDate);
	 
	 google.charts.setOnLoadCallback(searchDate);//라이브러리를 불러오는 작업이 완료되었으면 drawChart작업을 실행하라는 뜻.

	
	function searchDate() {
	    var jsonData = $.ajax({ 
	    	type : 'get',
	        url :"searchDatePieChart.do",
	        dataType : "json",
	        async : false,
	        data : {
	        	startDate : _startDate,
				endDate : _endDate
			}
	    }).responseText; //제이슨파일을 text파일로 읽어들인다는 뜻
	    
	    console.log(jsonData);
	    
	    //데이터테이블 생성
	    var data = new google.visualization.DataTable(jsonData);
	    
	   	// 원형 그래프  PieChart					
	    var chart = new google.visualization.PieChart(document.getElementById('boardChart_div')); 
	   //파이차트 옵션
	    var pieChart_options ={title : "cs게시글 통계", width : 500,height : 300, is3D: true }; 
	    //파이차트 그래프 그리기
	    chart.draw(data, pieChart_options);	
	    
	    
	    //매출 그래프 ajax
	    var jsonData1 = $.ajax({ 
	    	type : 'get',
	        url :"searchDateColumnChart.do",
	        dataType : "json",
	        async : false,
	        data : {
	        	startDate : _startDate,
				endDate : _endDate
			}
	    }).responseText; //제이슨파일을 text파일로 읽어들인다는 뜻
	    
	    console.log(jsonData1);
	    
	    //데이터테이블 생성
	    var data1 = new google.visualization.DataTable(jsonData1);
	    
	    var chart1 = new google.visualization.ColumnChart(document.getElementById('columnChart_div')); 
	
	   var columnChartOptions = {title : '매출통계',  width : 500, height : 300, bar : {
		groupWidth : '80%' // 그래프 너비 설정 %
		},
		legend : {
			position : 'none' // 항목 표시 여부 (현재 설정은 안함)
		}
	};
	   
	   //컬럼 차트
	    chart1.draw(data1, columnChartOptions);	
	    
	
	}

	
});

function selectDay(str){
	 console.log("셀렉트 옵션값          "+str);
	var t = new Date();
	var _st=t.getFullYear()+'-'+(t.getMonth()+1)+'-'+t.getDate();
	var _end;
	var _key_word;
	
	if(str=="all"){
		_key_word="all";
	}else if(str=="toDay"){
		_st=t.getFullYear()+'-'+(t.getMonth()+1)+'-'+t.getDate();
		_key_word="toDay"
	}else if(str=="1week"){
		t.setDate(t.getDate()-7)
		_end=t.getFullYear()+'-'+(t.getMonth()+1)+'-'+t.getDate();
		_key_word="week_month";
	}else if(str=="2week"){
		t.setDate(t.getDate()-14)
		_end=t.getFullYear()+'-'+(t.getMonth()+1)+'-'+t.getDate();
		_key_word="week_month";
	}else if(str=="1month"){
		t.setMonth(t.getMonth()-1)
		_end=t.getFullYear()+'-'+(t.getMonth()+1)+'-'+t.getDate();
		_key_word="week_month";
	}
	
	 console.log("버튼 선택후 포멧되어 나온 시작일            "+_st);
	 console.log("버튼 선택후 포멧되어 나온 종료일            "+_end);
	 console.log("버튼 선택후 포멧되어 나온 키워드            "+_key_word);
	
	
	 google.charts.setOnLoadCallback(selectChart);//라이브러리를 불러오는 작업이 완료되었으면 selectChart()작업을 실행하라는 뜻.
	 
	function selectChart() {
	    var jsonData = $.ajax({ 
	    	type : 'get',
	        url :"selectPieChart.do",
	        dataType : "json",
	        async : false,
	        data : {
	        	st : _st,
	        	end : _end,
	        	key_word :_key_word
			}
	    }).responseText; //제이슨파일을 text파일로 읽어들인다는 뜻
	    
	    console.log(jsonData);
	    
	    //데이터테이블 생성
	    var pieChartdata = new google.visualization.DataTable(jsonData);
	    
	   	// 원형 그래프  PieChart					
	    var pieChart = new google.visualization.PieChart(document.getElementById('boardChart_div')); 
	   //파이차트 옵션
	    var pieChart_options ={title : "cs게시글 통계셀렉트 조회", width : 500,height : 400, is3D: true }; 
	    //파이차트 그래프 그리기
	    pieChart.draw(pieChartdata, pieChart_options);	
	    
	    /*     셀렉트 조회 매출 통계                             */
		
		    var jsonData1 = $.ajax({ 
		    	type : 'get',
		        url :"selectColumnChart.do",
		        dataType : "json",
		        async : false,
		        data : {
		        	st : _st,
		        	end : _end,
		        	key_word :_key_word
				}
		    }).responseText; //제이슨파일을 text파일로 읽어들인다는 뜻
		    
		    console.log(jsonData1);
		    
		    //데이터테이블 생성
		    var columnChartdate = new google.visualization.DataTable(jsonData1);
		    
		   	// 원형 그래프  PieChart					
		    var columnChart = new google.visualization.ColumnChart(document.getElementById('columnChart_div')); 
		   
		  	 var columnChartOptions1 = {title : '매출통계',  width : 500, height : 300, bar : { groupWidth : '80%'},legend : {position : 'none' }};
		   
		  	columnChart.draw(columnChartdate, columnChartOptions1);	
	}

}
/* 
function drawChart() {
    var jsonData = $.ajax({ 
        url :"boardChart.do",
        dataType : "json",
        async : false
    }).responseText; //제이슨파일을 text파일로 읽어들인다는 뜻
    
    console.log(jsonData);
    
    //데이터테이블 생성
    var data = new google.visualization.DataTable(jsonData);
    
   	// 원형 그래프  PieChart					
    var chart = new google.visualization.PieChart(document.getElementById('boardChart_div')); 
   //파이차트 옵션
    var pieChart_options ={title : "cs게시글 통계", width : 600,height : 400, is3D: true }; 
    //파이차트 그래프 그리기
    chart.draw(data, pieChart_options);	
    
 	 //바 차트
    var chart11 = new google.visualization.BarChart(document.getElementById('boardChart_div11')); 
    //바차트 옵션
    var barChart_options ={title : "cs게시글 통계 바 차트", width : 600,height : 400 };
    //바차트 그래프 그리기
    chart11.draw(data, barChart_options);
} */
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

		<!-- Main Header -->
		<%@ include file="../include/main_header.jsp"%>
		<!-- Left side column. contains the logo and sidebar -->
		<%@ include file="../include/left_column.jsp"%>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<small>통계 현황</small>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
					<li class="active">Here</li>
				</ol>
			</section>
			<!-- Main content -->
			   <div>
			   <input type='date' name='startDate' id='startDate'/> ~ <input type='date' name='endDate' id='endDate'/> 
			   <button class="btn btn-danger btn-xs" id="searchDate">조회</button>&nbsp;&nbsp;
			   
			    	<select name="searchOption" class="btn btn-info dropdown-toggle" onchange="selectDay(this.value)">
            		<option value="all">전체조회</option>
            		<option value="toDay">당일</option>
           			<option value="1week">1주</option>
            		<option value="2week">2주</option>
            		<option value="1;month">1달</option>
            		
        			</select>  
			   </div>
        
       
   
			


<!-- ---------------------------------- 차트 출력 영역-------------------------------------------------------------- -->

			<!-- cs게시글 통계 그래프 -->
			
			 <div id="boardChart_div" style="float: left; width: 33%; padding:10px;">
			  <!-- 차트가 그려지는 영역 -->
			 </div> 
			
			  <div id="columnChart_div"style=" float: left; width: 33%; padding:10px;">
			  <!-- 차트가 그려지는 영역 -->
			 </div> 
		   
		   
			
			
			
			
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<%@ include file="../include/main_footer.jsp"%>
	</div>
	<!-- ./wrapper -->
</div>
	<!-- REQUIRED JS SCRIPTS -->
	<%@ include file="../include/plugin_js.jsp"%>

</body>
</html>