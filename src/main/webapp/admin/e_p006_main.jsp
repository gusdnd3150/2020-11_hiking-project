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

<!--head -->
<%@ include file="../include/head.jsp"%>

<!-- 구글차트 API 제이쿼리 보다 밑에 설정 되어야한다.-->
<script type="text/javascript" src="https://www.google.com/jsapi"></script>

<script type="text/javascript">

	//구글 차트 라이브러리 로딩
	google.charts.load('current', {'packages' : [ 'corechart' ]}); 
	

	//지정 날짜 조회
	$(document).on("click","#searchDate",function() {
						
						var _startDate = $('#startDate').val();
						var _endDate = $('#endDate').val();
						console.log(_startDate);
						console.log(_endDate);

						google.charts.setOnLoadCallback(searchDate);//라이브러리를 불러오는 작업이 완료되었으면 drawChart작업을 실행하라는 뜻.

						/* 지정 일자 조회 */
						function searchDate() {
							var jsonData = $.ajax({
								type : 'get',
								url : "searchDatePieChart.do",
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
							var pieChart_options = {
								title : "cs게시글 통계",
								titleTextStyle :{
					           		 fontSize: 15
					           	 },
								width : '100%',
								height : '100%',
								is3D : true,
								 slices: {  3: {offset: 0.2},
				                     1: {offset: 0.3}
				                  },
								animation : {
									duration : 1000,
									easing : 'linear',
									startup : true
								}
							};
							
							//파이차트 그래프 그리기 (값, 설정 옵션)
							chart.draw(data, pieChart_options);

							//매출 통계
							var jsonData1 = $.ajax({
								type : 'get',
								url : "searchDateColumnChart.do",
								dataType : "json",
								async : false,
								data : {
									startDate : _startDate,
									endDate : _endDate
								}
							}).responseText;

							console.log(jsonData1);

							var data1 = new google.visualization.DataTable(jsonData1);

							var chart1 = new google.visualization.ColumnChart(document.getElementById('columnChart_div'));
						
							var columnChartOptions = {
								title : '매출통계',
								titleTextStyle :{
					           		 fontSize: 15
					           	 },
								width : '100%',
								height : '100%',
								bar : {
									groupWidth : '80%'
								},
								legend : {
									position : 'none'
								},
								animation : {
									startup : true,
									duration : 1000,
									easing : 'linear'
								},

							};

							chart1.draw(data1, columnChartOptions);

							/* 가입자 통계 라인 차트 */
							var userJson = $.ajax({
								type : 'get',
								url : "serchUserLineChart.do",
								dataType : "json",
								async : false,
								data : {
									startDate : _startDate,
									endDate : _endDate
								}
							}).responseText;

							console.log("가입자 통계 라인 차트          " + userJson);

							var userLineChartDate = new google.visualization.DataTable(userJson);
			
							var userLineChart = new google.visualization.LineChart(document.getElementById('userLineChart_div'));

							var userLineChartOptions = {
								title : '회원통계',
								titleTextStyle :{
					           		 fontSize: 15
					           	 },
								width : '100%',
								height : '100%',
								legend : 'none',
								hAxis : {
									maxValue : 7
								},
								vAxis : {
									maxValue : 13
								},
								lineWidth : 3,
								colors : [ '#43459d', '#f1ca3a', '#e7711b' ],
								animation : {
									duration : 1500,
									easing : 'linear',
									startup : true
								},
								legend : {
									position : 'top'
								}
							};

							userLineChart.draw(userLineChartDate,
									userLineChartOptions);

							/* 가입자  바차트 통계 */
							var jsonUser = $.ajax({
								type : 'get',
								url : "serchUserBarChart.do",
								dataType : "json",
								async : false,
								data : {
									startDate : _startDate,
									endDate : _endDate
								}
							}).responseText;

							console.log("가입자  바차트 통계: " + jsonUser);

							var userBarChartDate = new google.visualization.DataTable(jsonUser);
									
							var userBarChar = new google.visualization.BarChart(document.getElementById('userBarChar_div'));

							var userBarChartDateOptions = {
								title : '조회 일자별 회원 통계',
								titleTextStyle :{
					           		 fontSize: 15
					           	 },
								width : '100%',
								height : '100%',
								legend : {
									position : 'top'
								},
								animation : { 
									startup : true,
									duration : 1000,
									easing : 'linear'
								},
								annotations : {
									textStyle : {
										fontSize : 15,
										bold : true,
										italic : true,
										colors : [ '#43459d', '#f1ca3a',
												'#e7711b' ],
										auraColor : '#d799ae',
										opacity : 0.8
									}
								}
							};

							userBarChar.draw(userBarChartDate,userBarChartDateOptions);
							
							/* 카테고리별 판매 통계*/
				 			var category1 = $.ajax({
								type : 'get',
								url : "serchCategoryChart.do",
								dataType : "json",
								async : false,
								data : {
									startDate : _startDate,
									endDate : _endDate
								}
							}).responseText;  

							console.log("카테고리 통계 톰바 차트" + category1);

							var categoryComboChart1 = new google.visualization.DataTable(category1);

							var categoryChar1 = new google.visualization.ComboChart(document.getElementById('categoryChar_div'));

					
						      var categoryChartOptions1 = {
						              title : '카테고리별 통계',
						          	titleTextStyle :{
						           		 fontSize: 15
						           	 },
						              width : '100%',
									  height : '100%',
						              seriesType: 'bars',
						              legend : {
											position : 'top'
										},
						          	animation : {
										duration : 1500,
										easing : 'linear',
										startup : true
									}
						             
						            };
							categoryChar1.draw(categoryComboChart1, categoryChartOptions1);

						}
					});

	/*//////////////////////////////////////////////////셀렉트 조회 ///////////////////////////////////////////////////////////////////////////////  */

	//페이지 시작시 전체 통계 조회
	$(document).ready(function() {selectDay()});

	//셀렉트 조회시 서버로 전달할 날짜 계산 및 키워드
	function selectDay(str) {
		
		console.log("셀렉트 옵션값          " + str);
		
		var t = new Date();
		var _st = t.getFullYear() + '-' + (t.getMonth() + 1) + '-'+ t.getDate();
		var _end;
		var _key_word;

		if (str == "all") {
			_key_word = "all";
		} else if (str == "toDay") {
			_st = t.getFullYear() + '-' + (t.getMonth() + 1) + '-'+ t.getDate();
			_key_word = "toDay"
		} else if (str == "1week") {
			t.setDate(t.getDate() - 7)
			_end = t.getFullYear() + '-' + (t.getMonth() + 1) + '-'+ t.getDate();
			_key_word = "week_month";
		} else if (str == "2week") {
			t.setDate(t.getDate() - 14)
			_end = t.getFullYear() + '-' + (t.getMonth() + 1) + '-'+ t.getDate();
			_key_word = "week_month";
		} else if (str == "1month") {
			t.setMonth(t.getMonth() - 1)
			_end = t.getFullYear() + '-' + (t.getMonth() + 1) + '-'+ t.getDate();
			_key_word = "week_month";
		}

		console.log("버튼 선택후 포멧되어 나온 _st            " + _st);
		console.log("버튼 선택후 포멧되어 나온 _end            " + _end);
		console.log("버튼 선택후 포멧되어 나온 _key_word        " + _key_word);

		google.charts.setOnLoadCallback(selectChart);

		function selectChart() {

			/* cs 게시글 통계 */
			var jsonData = $.ajax({
				type : 'get',
				url : "selectPieChart.do",
				dataType : "json",
				async : false,
				data : {
					st : _st,
					end : _end,
					key_word : _key_word
				}
			}).responseText; 

			console.log(jsonData);

			var pieChartdata = new google.visualization.DataTable(jsonData);
				
			var pieChart = new google.visualization.PieChart(document.getElementById('boardChart_div'));
		
			var pieChart_options = {
				title : "cs게시글 통계",
				titleTextStyle :{
           		 fontSize: 15
           	 },
				width : '100%',
				height : '100%',
				 is3D: true,
				 slices: {  3: {offset: 0.2},
                     1: {offset: 0.3}
                  }
	             
			};
			
			pieChart.draw(pieChartdata, pieChart_options);

			/* 매출 통계     */
			var jsonData1 = $.ajax({
				type : 'get',
				url : "selectColumnChart.do",
				dataType : "json",
				async : false,
				data : {
					st : _st,
					end : _end,
					key_word : _key_word
				}
			}).responseText;

			console.log("매출 통계                          :"+jsonData1);

			var columnChartdate = new google.visualization.DataTable(jsonData1);

			var columnChart = new google.visualization.ColumnChart(document.getElementById('columnChart_div'));

			var columnChartOptions1 = {
				title : '매출통계',
				titleTextStyle :{
           		 fontSize: 15
           	 },
				width : '100%',
				height : '100%',
				bar : {
					groupWidth : '80%'
				},
				legend : {
					position : 'none'
				},
				animation : {
					startup : true,
					duration : 1000,
					easing : 'linear'
				},

			};

			columnChart.draw(columnChartdate, columnChartOptions1);

			/* 가입자 통계 라인 차트*/
			var userJson = $.ajax({
				type : 'get',
				url : "selectUserLineChart.do",
				dataType : "json",
				async : false,
				data : {
					st : _st,
					end : _end,
					key_word : _key_word
				}
			}).responseText; //제이슨파일을 text파일로 읽어들인다는 뜻

			console.log("가입자 통계 라인차트:       " + userJson);

			var userLineChartDate = new google.visualization.DataTable(userJson);
			
			var userLineChart = new google.visualization.LineChart(document.getElementById('userLineChart_div'));

			var userLineChartOptions = {
				title : '회원통계',
				titleTextStyle :{
           		 fontSize: 15
           	 },
				width : '100%',
				height : '100%',
				legend : 'none',
				lineWidth : 2,
				colors : [ '#43459d', '#f1ca3a', '#e7711b' ],
				animation : {
					duration : 1500,
					easing : 'linear',
					startup : true
				},
				legend : {
					position : 'top'
				}
			};

			userLineChart.draw(userLineChartDate, userLineChartOptions);

			/* 가입자  바차트 통꼐 */
			var jsonUser = $.ajax({
				type : 'get',
				url : "selectUserBarChart.do",
				dataType : "json",
				async : false,
				data : {
					st : _st,
					end : _end,
					key_word : _key_word
				}
			}).responseText; 

			console.log("가입자 통계 바 차트" + jsonUser);

			var userBarChartDate = new google.visualization.DataTable(jsonUser);

			var userBarChar = new google.visualization.BarChart(document.getElementById('userBarChar_div'));

			var userBarChartDateOptions = {
				title : '조회 일자별 회원 통계',
				titleTextStyle :{
           		 fontSize: 15
           	 },
				width : '100%',
				height : '100%',
				legend : 'none',
				legend : {
					position : 'top'
				},
				animation : { 
					startup : true,
					duration : 1000,
					easing : 'linear'
				},
				annotations : {
					textStyle : {
						fontSize : 15,
						bold : true,
						italic : true,
						colors : [ '#43459d', '#f1ca3a', '#e7711b' ],
						auraColor : '#d799ae',
						opacity : 0.8
					}
				}
			};
			userBarChar.draw(userBarChartDate, userBarChartDateOptions);
			
			
			/* 카테고리별 판매 통계*/
 			var category = $.ajax({
				type : 'get',
				url : "selectCategoryChart.do",
				dataType : "json",
				async : false,
				data : {
					st : _st,
					end : _end,
					key_word : _key_word
				}
			}).responseText;  

			console.log("카테고리 통계 톰바 차트" + category);

			var categoryComboChart = new google.visualization.DataTable(category);

			var categoryChar = new google.visualization.ComboChart(document.getElementById('categoryChar_div'));


		      var categoryChartOptions = {
		              title : '카테고리별 통계',
		            titleTextStyle :{fontSize: 15},
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
			categoryChar.draw(categoryComboChart, categoryChartOptions);
		}
	}

</script>
<style>
/* .basic_btn {
	display: inline-block;
	max-width: 110px;
	width: 100%;
	line-height: 35px;
	font-size: 15px;
	border: 1px solid #007bff;
	border-radius: 10px;
} */
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
     
        <small>통계 현황</small>
     
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Forms</a></li>
        <li class="active">Editors</li>
      </ol>
    </section>

    <!-- Main content -->
 <section class="content">
      <div class="row">
        <div class="col-md-12">
 <div class="box box-info">
            <div class="box-header">
              <h3 class="box-title">통계 조회
                <small></small>
              </h3>
           <!--    tools box -->
              <div class="pull-right box-tools">
                <button type="button" class="btn btn-info btn-sm" data-widget="collapse" data-toggle="tooltip" title="" data-original-title="Collapse">
                  <i class="fa fa-minus"></i></button>
                <button type="button" class="btn btn-info btn-sm" data-widget="remove" data-toggle="tooltip" title="" data-original-title="Remove">
                  <i class="fa fa-times"></i></button>
              </div>
          <!--     /. tools -->
            </div>
          <!--   /.box-header -->
            <div class="box-body pad" style="">
			<center>
					<strong>일자별 조회 : </strong>
					<select name="searchOption" class="basic_btn btn-primary"
						onchange="selectDay(this.value)">
						<option>조회 선택</option>
						<option value="all">전체조회</option>
						<option value="toDay">당일</option>
						<option value="1week">1주</option>
						<option value="2week">2주</option>
						<option value="1month">1달</option>
					</select> &nbsp;&nbsp; <input type='date' name='startDate' id='startDate' />
					~ <input type='date' name='endDate' id='endDate' />
					<button class="btn btn-danger btn-xs" id="searchDate">조회</button>
					&nbsp;&nbsp;
				</center>
      <div class="box">
          <!--   /.box-header -->
			<div class="box-body">
					<!-- 	페이지 내용 -->
				<div class="test_chart" style="width: 100%; height: 100px; margin-top: 20px; display: initial;">
				<!-- 매출 통계 그래프 -->
				<div id="columnChart_div">
					<!-- 차트가 그려지는 영역 -->
				</div>

			</div>



			<!-- 2번쨰 그래프  감싸는거-->
			<div style="overflow: hidden">
				<!--왼쪽 그래프 -->
				<div style='float: left; width: 49.5%; height: 100px; padding: 10px; margin-left: 0;'>

					<!-- cs게시글 통계 그래프 -->
					<div id="boardChart_div">
						<!-- 차트가 그려지는 영역 -->
					</div>
					<!-- 카테고리별 통계 그래프 -->
					<div id="categoryChar_div">
						<!-- 차트가 그려지는 영역 -->
					</div>
				
				</div>
				
				<!--//왼쪽 그래프 -->


				<!--오른쪽 그래프 -->
				<div style="float: left; width: 49.5%; padding: 10px; margin-left: 1%;">
					
					<!--가입자 통계 라인차트  -->
					<div id="userLineChart_div">
						<!-- 차트가 그려지는 영역 -->
					</div>
					
					<!--가입자 통계 바 차트  -->
					<div id="userBarChar_div">
						<!-- 차트가 그려지는 영역 -->
					</div>
				</div>
				<!--//오른쪽 그래프 -->
			</div>
			<!-- //2번쨰 그래프 -->
							</div>
						</div>
		              </div>
		            </div>		
				</div>
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