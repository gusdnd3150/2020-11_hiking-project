<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src='https://www.ibsheet.com/ibleaders.js'></script>
<script src='https://www.ibsheet.com/demo/js/lib/sheet/ibsheetinfo.js'></script>
<script src='https://www.ibsheet.com/demo/js/lib/sheet/ibsheet.js'></script>
<script src='https://www.ibsheet.com/demo/js/lib/sheet/ibsheet-global.js'></script>
<div id='ib-container'></div>
<div id='pagination' style='text-align:center;width:100%'></div>

<script>
 var data=[];
 
 $(document).ready(function() {

	         $.ajax({
	             type: "get",
	             url: "ibsheetResult.do",
	             dataType: "json",
	             success: function( responseData, status , xhr ){
		           console.log(responseData);
		           for(var i in responseData){
		        	   data.push(responseData[i]);
		           }
		           
		           var jsonArray = JSON.parse(JSON.stringify(data))
		           console.log(jsonArray);
	             },
	             error:function(xhr, status, error){
	                 console.log(error);
	             }
	         });


	 });
 


var ib = {
	    initialize: function() {
	        var initData = {
	            "Cfg": {
	                "SearchMode": 1,
	                "Page": 10,
	                "FrozenCol": 0,
	                "UseHeaderActionMenu": false,
	                "MouseHoverMode": 2,
	                "SelectionRowsMode": 1,
	                "AutoFitColWidth": "resize",
	                "DeferredVScroll": 1
	            },
	            "HeaderMode": {
	                "Sort": 1,
	                "ColMove": 1,
	                "ColResize": 1,
	                "HeaderCheck": 1
	            },
	            "Cols": [{
	                "Header": "조회수",
	                "Type": "Seq",
	                "Width": 50,
	                "SaveName": "CNTCOUNT",
	                "Align": "Right"
	            }, {
	                "Header": "상태",
	                "Type": "Status",
	                "Width": 60,
	                "SaveName": "",
	                "Align": "Center",
	                "ShowMobile": 0
	            }, {
	                "Header": "삭제",
	                "Type": "DelCheck",
	                "Width": 60,
	                "SaveName": "",
	                "ShowMobile": 0
	            }, {
	                "Header": "이름",
	                "Type": "Combo",
	                "Width": 70,
	                "SaveName": "NAME",
	                "ComboText": "한국|미국|일본|영국|캐나다|이탈리아|스웨덴|중국|프랑스",
	                "Align": "Center",
	                "ShowMobile": 0
	            }, {
	                "Header": "영화명",
	                "Type": "Text",
	                "Width": 200,
	                "SaveName": "NAME",
	                "Ellipsis": 1
	            }, {
	                "Header": "상영횟수",
	                "Type": "AutoSum",
	                "Width": 100,
	                "SaveName": "CNTCOUNT",
	                "Format": "#,##0"
	            },  {
	                "Header": "추천",
	                "Type": "CheckBox",
	                "Width": 60,
	                "SaveName": "sCheck"
	            }]
	        };


	        // IBSheet 생성
	        var container = $('#ib-container')[0];
	        createIBSheet2(container, 'mySheet', '100%', '284px');

	        // IBSheet 초기화
	        IBS_InitSheet(mySheet, initData);

	        // 편집 가능 여부 설정
	        mySheet.SetEditable(true);

	        // 페이지 네이션 설정
	        mySheet.SetCountPosition(1);
	        mySheet.SetPagingPosition(2);
	        this.doAction();
	    },
	    data:{data:data}
	    ,
	    doAction: function() {
	        // 데이터 로드
	        mySheet.LoadSearchData(this.data, {
	            Sync: 1
	        });
	        if ($("#pro-options").val() == "frozen-col") {
	            mySheet.SetColWidth("sTitle", 300);
	        } else {
	            mySheet.FitColWidth();
	        }
	    }
	};
	ib.initialize();

	// jsfiddle에서 ib 접근을 위해 window에 등록
	window.ib = ib;

</script>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>