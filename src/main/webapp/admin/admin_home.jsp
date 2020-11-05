<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
     <%
     request.setCharacterEncoding("utf-8");
      %>
<!DOCTYPE html>
<html>
<!--jquery  -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<%@ include file="../include/head.jsp"%>


<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>

<!-- 구글차트 API 제이쿼리 보다 밑에 설정 되어야한다.-->
<script type="text/javascript" src="https://www.google.com/jsapi"></script>

<script type="text/javascript">


//구글 차트 라이브러리 로딩
google.charts.load('current', {'packages' : [ 'corechart' ]});

google.charts.setOnLoadCallback( function() { drawChart() });


 	var t = new Date();
	var _st=t.getFullYear()+'-'+(t.getMonth()+1)+'-'+t.getDate();
	
	console.log("날짜          "+_st)
	
 $(document).ready(function(){
	 
	
	/* 금일  주문건*/
	$.ajax({
			type : 'post',
			url : 'toDayOrder.do',
			data : {
				st : _st
			},
			success : function(data) {
			 $('#toDayOrder').text(data);

			}
		});
	
	/* 금일 신규가입자 */
	 $.ajax({
			type : 'post',
			url : 'toDayUser.do',
			data : {
				st : _st
			},
			success : function(data) {
			 $('#toDayUser').text(data);

			}
		});
	
	 /* 금일  매출 */
	 $.ajax({
			type : 'post',
			url : 'toDaySales.do',
			data : {
				st : _st
			},
			success : function(data) {
			 $('#toDaySales').text(data+"₩");

			}
		});	
	 
	 /*  취소 요청건 */
	 $.ajax({
			type : 'post',
			url : 'toDayCancelOrder.do',
			data : {
				st : _st
			},
			success : function(data) {
			 $('#toDayCancelOrder').text(data);

			}
		});
	 
 });

function drawChart(){
	var t1 = new Date();
	var _st1=t1.getFullYear()+'-'+(t1.getMonth()+1)+'-'+t1.getDate();
	
	
		/* 1달 기준 매출 통계*/
		t1.setMonth(t1.getMonth()-1)
		_end1=t1.getFullYear()+'-'+(t1.getMonth()+1)+'-'+t1.getDate();
		
		var jsonData = $.ajax({
			type : 'get',
			url : "payChart.do",
			dataType : "json",
			async : false,
			data : {
				st : _st1,
				end : _end1
			}
		}).responseText;  

		console.log("페이차트         " + jsonData);

		var data = new google.visualization.DataTable(jsonData);

		 var payChartAreaChart = new google.visualization.AreaChart(document.getElementById('payChart_div'));

	      var payChartOptions = {
	              title : '매출 타입별 현황',
	          	titleTextStyle :{
	           		 fontSize: 15
	           	 },
	              width : '100%',
				  height : '100%',
	               legend : {
						position : 'top'
					},
	          	animation : {
					duration : 1500,
					easing : 'linear',
					startup : true
				}
	             
	            };
	      payChartAreaChart.draw(data, payChartOptions);
	      
	      
			/* 카테고리별 조회수 통계 전체 기준 */
			var jsonData1 = $.ajax({
				type : 'get',
				url : "categoryChart.do",
				dataType : "json",
				async : false
				
			}).responseText;  

			console.log("카테고리 차트         " + jsonData1);

			var data1 = new google.visualization.DataTable(jsonData1);

			 var category = new google.visualization.PieChart(document.getElementById('categoryChart_div'));

		      var categoryOptions = {
		    		  title : '조회수 통계 (전체)',
			          	titleTextStyle :{
			           		 fontSize: 12
			           	 },
		           		pieHole: 0.4,
		              width : '100%',
					  height : '100%',
		               legend : {
							position : 'top'
						},
		          	animation : {
						duration : 1500,
						easing : 'linear',
						startup : true
					}
		             
		            };
		      category.draw(data1, categoryOptions);
		      
		      
		      
		      
		      var t2 = new Date();
		      var _st2=t2.getFullYear()+'-'+(t2.getMonth()+1)+'-'+t2.getDate();
		      
		      t2.setDate(t2.getDate() - 7)
		  	_end2 = t2.getFullYear() + '-' + (t2.getMonth() + 1) + '-'+ t2.getDate();
		      
		      /* 카테고리별 판매 1주일 기준  */
		  	var jsonData2 = $.ajax({
				type : 'get',
				url : "category.do",
				dataType : "json",
				async : false,
				data : {
					st : _st2,
					end : _end2
				}
			}).responseText;  

			console.log("카테고리 차트         " + jsonData2);

			var data2 = new google.visualization.DataTable(jsonData2);

			 var category2 = new google.visualization.ComboChart(document.getElementById('category_div'));

		      var categoryOptions2 = {
				       title : '판매 통계 (1주일)',
				       titleTextStyle :{fontSize: 12},
				            legend : {position : 'top'},
				              width : '100%',
							  height : '100%',
				              seriesType: 'bars',
				          	animation : {
								duration : 1500,
								easing : 'linear',
								startup : true
							}
				             
				         };
		      category2.draw(data2, categoryOptions2);
		           
	};
	//금일 주문건 클릭시
 function orderinpo(){
	 location.href="selectOrderDay.do?key_word=toDay&startDate="+_st;
 }
 salesinpo

	//금일 신규회원 클릭시
function userinpo(){
	 location.href="toDayUserList.do?st="+_st;
}
 
	//금일 매출 클릭시
 function salesinpo(){
 	 location.href="selectSearch.do?key_word=toDay&st="+_st;
 }
 
	//금일 취소요청 클릭시
 function cancelOrderinpo(){
 	 location.href="selectCancelOrderList.do"
 }
	
	//메일 발송
 $(document).on('click', '#sendEmail', function(e) {
		e.preventDefault();
		
		var formData = $('#frm').serialize();
		 $.ajax({
				type : 'post',
				url : 'mainPageMail.do',

				data : formData,
				success : function(data) {
					console.log(data);
						if("ok" == (data)){
							$('#email').val("");
							$('#subject').val("");
							$('#content').val("");
							alert("메일발송 완료");
						}else{
							alert("메일발송 실패");
						}

				}
			});
			
	});
	
//이메일 검사 정규식
 var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
 function email1(value){

	 if(mailJ.test(value)){
		 $("#msg").html("");
		 $("#sendEmail").attr("disabled", false);
	 }else{
		 $("#msg").html("잘못된 이메일 형식입니다.");
		 $("#msg").css("color", "red");
		 $("#sendEmail").attr("disabled", true);
	 }
 };
</script>
<style>

</style>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

  <!-- Main Header -->
  <%@ include file="../include/main_header.jsp" %>
  <!-- Left side column. contains the logo and sidebar -->
  <%@ include file="../include/left_column.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
  	<section class="content-header">

        <small>Main Page</small>
     
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Forms</a></li>
        <li class="active">Editors</li>
      </ol>
    </section>

    <!-- Main content -->
 <section class="content">
      <!-- Info boxes -->
      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <!--  000000000000000000000000000 금일 주문건  000000000000000000000000000000  -->
              <h3 id="toDayOrder"></h3>

              <p>금일 주문건</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a class="small-box-footer" onclick="orderinpo()">상세보기 <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <!--  000000000000000000000000000   금일매출    000000000000000000000000000000  -->
              <h3 id="toDaySales"><sup style="font-size: 20px"></sup></h3>

              <p>금일 매출</p>
            </div>
            <div class="icon">
              <i class="fa fa-fw fa-thumbs-up"></i>
            </div>
            <a href="#" class="small-box-footer" onclick="salesinpo()">상세보기 <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <!--  000000000000000000000000000  신규가입자 000000000000000000000000000000  -->
              <h3 id="toDayUser"></h3>

              <p>신규 가입자</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <a href="#" class="small-box-footer" onclick="userinpo()">상세보기 <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
             <!--  000000000000000000000000000  취소요철   000000000000000000000000000000  -->
              <h3 id="toDayCancelOrder"></h3>

              <p>취소요청</p>
            </div>
            <div class="icon">
              <i class="fa fa-fw fa-ban"></i>
            </div>
            <a href="#"  class="small-box-footer" onclick="cancelOrderinpo()">상세보기 <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
      </div>
      <div class="row">
        <div class="col-md-12">
        <div class="box box-info">
            <div class="box-header">
              <h3 class="box-title">매출 통계
                <small></small>
              </h3>
              <!-- tools box -->
              <div class="pull-right box-tools">
                <button type="button" class="btn btn-info btn-sm" data-widget="collapse" data-toggle="tooltip" title="" data-original-title="Collapse">
                  <i class="fa fa-minus"></i></button>
                <button type="button" class="btn btn-info btn-sm" data-widget="remove" data-toggle="tooltip" title="" data-original-title="Remove">
                  <i class="fa fa-times"></i></button>
              </div>
              <!-- /. tools -->
            </div>
            <!-- /.box-header -->
             <!--  000000000000000000000000000  그래프   000000000000000000000000000000  -->
            <div class="box-body pad" style="" >
            <!-- 통계 그레프 -->
            <div id="payChart_div">
            
            </div>
     		
            </div>
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

      <!-- Main row -->
      <div class="row">
        <!-- Left col -->
        <div class="col-md-8">
          <!-- MAP & BOX PANE -->
   <!--00000000000000000000000 메일 보내기  -->
		   <div class="box box-warning">
		            <div class="box-header ui-sortable-handle" style="cursor: move;">
		              <i class="fa fa-envelope"></i>
		
		              <h3 class="box-title"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">이메일</font></font></h3>
		              <!-- tools box -->
		              <div class="pull-right box-tools">
		                <button type="button" class="btn btn-warning btn-sm" data-widget="remove" data-toggle="tooltip" title="" data-original-title="Remove">
		                  <i class="fa fa-times"></i></button>
		              </div>
		              <!-- /. tools -->
		            </div>
		           
		            <div class="box-body">
		              <form  id="frm">
		                <div class="form-group">
		                  <input type="email" class="form-control" name="email" id="email" onkeyup="email1(this.value)"	 placeholder="받는 사람:seokhg0216@gamil.com">
		                </div>
		                <div class="form-group">
		                  <input type="text" class="form-control" name="subject" id="subject" placeholder="제목">
		                </div>
		                <div>
		                <!-- ck에디터 -->
		                	<textarea class="form-control"  cols="30" rows="11" name="content" id="content" placeholder="내용"></textarea>
						</div>
		              </form>
		            </div>
		            <center>
		            <h5 id="msg"></h5>
		            </center>
		            <div class="box-footer clearfix">
		              <button type="button" class="pull-right btn btn-default" id="sendEmail"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">전송
		                </font></font><i class="fa fa-arrow-circle-right"></i></button>
		            </div>
		          </div>
		          <!-- /////  00000000000000000000000 메일 보내기  -->
          <!-- /.box -->
          
   
          <div class="row">

            <!-- /.col -->
          </div>
          <!-- /.row -->

        </div>
        <!-- /.col -->
 
 
 
 
 
        <div class="col-md-4">

          <!-- PRODUCT LIST -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">카테고리별 통계</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
            <div id="categoryChart_div">
            
            </div>
            <div id="category_div">
            
            </div>

            </div>
            <!-- /.box-body -->
          </div>
          
          
          
          
          
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
           <!--  /.box-body -->
          </div>  
                   
           </div>
          </div>
          <!-- /.box -->

          
        </div>
        <!-- /.col-->
      </div>
      <!-- ./row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
 <%@ include file="../include/main_footer.jsp" %>
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->
<%@ include file="../include/plugin_js.jsp" %>

</body>
</html>