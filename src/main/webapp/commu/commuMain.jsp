<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<jsp:include page="/common/header.jsp" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/views/group/main.css" />
<body class="pt-5 mt-5">
	<div class="container">
		<div class="row">
			<h1 class="col-md-8 col-lg-10 mb-0">인기글</h1>
			<div class="col-md-4 col-lg-2 pt-2 pb-2 mt-5">
				<a href="/after/main.do"><button type="button"  style="margin:0 0 0 60px; color:green;" class="btn btn-link">더 보기 ></button></a>
			</div>
			<div id="afterBoard" class="row col-12 row-cols-1 row-cols-md-2">
			</div>
		</div>
		<div class="btn-group" role="group" aria-label="...">
		</div>

		<p></p>
		<hr >
		<div class="row">
			<h1 class="col-md-8 col-lg-10 mb-0">이런 산모임 어때요?</h1>
			<div class="col-md-4 col-lg-2 pt-2 pb-2 btn-group btn-group-toggle"
				data-toggle="buttons">
				<label class="btn btn-outline-secondary active"> 
				   <input type="radio" name="options" id="sort_lately" checked> 최신순
				</label> 
				<label class="btn btn-outline-secondary"> 
				   <input type="radio" name="options" id="sort_like"> 인기순
				</label>
			</div>
		</div>
		<div class="responsive">
			<div class="row">
				<div class="col-sm-6">
					<a href="/commu/createForm.jsp"><button type="button" class="btn btn-outline-success"
						style="padding: 10px 10px; margin:20px 10px 10px 10px; width: 100%; height: 100px;">
						<div class="row">
						<svg width="3em" height="3em" viewBox="0 0 16 16"
							class="bi bi-plus-circle" fill="currentColor"
							xmlns="http://www.w3.org/2000/svg"
							style="margin:0% 0% 0% 30%;" class="mr-3">
						  <path fill-rule="evenodd" d="M8 15A7 7 0 1 0 8 1a7 7 0 0 0 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
						  <path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
						</svg>
						<h3 style="margin:1% 0% 0% 0%;">&nbsp&nbsp&nbsp&nbsp산모임 만들기</h3>
						</div>
					</button></a>
					<div id="commuList_even"></div>
				</div>
				<div class="col-sm-6" id="commuList_odd"></div>
			</div>
			<!-- row -->
		</div>
		<div id="result"></div>
		<div style="height:30px;"></div>
		<!-- responsive -->
	<button type="button" id="appendMoreListBtn" class="btn btn-outline-secondary btn-lg btn-block">더 보기</button>
	</div>
	<!-- container -->

	<div class="container">
		<jsp:include page="../common/footer.jsp" flush="false" />
	</div>
	<script type="text/javascript" src="../resources/js/jquery.js"></script>
	<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
		integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
		crossorigin="anonymous"></script>
</body>
<script>
 $(document).ready(function (){
        $('#sort_lately').click();
    })

    $('#sort_lately').on('click',function (){
    	loadAfterBoard();
        $('#commuList_even').empty();
        $('#commuList_odd').empty();
        $('#appendMoreListBtn').data('keyword','lately');
        $('#appendMoreListBtn').data('rowNum', 0 );

        var data = {
            'keyword' : 'lately',
            'rowNum' : 0
        }

        sortList(data);
    });

 
    $('#sort_like').on('click',function (){
		loadAfterBoard();
		$('#commuList_even').empty();
		$('#commuList_odd').empty();
		$('#appendMoreListBtn').data('keyword','like');
		$('#appendMoreListBtn').data('rowNum', 0 );
        
		var data = {
            'keyword' : 'like',
            'rowNum' : 0
        }

        sortList(data);
    });
    
    $('#appendMoreListBtn').on('click',function (){
    	console.log('keyword:  '+$('#appendMoreListBtn').data('keyword'));
    	console.log('rowNum:  '+$('#appendMoreListBtn').data('rowNum'));
   	
    if($('#appendMoreListBtn').data('keyword') === 'lately'){
	   	  var rN = ( $('#appendMoreListBtn').data('rowNum') +1 ); 
	   	  $('#appendMoreListBtn').data('rowNum',rN );
	   	  var data = {
	              'keyword' : 'lately',
	              'rowNum' : rN
	          }
	   	     sortList(data);
   		 
   	 }else if($('#appendMoreListBtn').data('keyword') == 'lately'){
   	  var rN = ( $('#appendMoreListBtn').data('rowNum') +1 ); 
      $('#appendMoreListBtn').data('rowNum',rN );
   	  var data = {
              'keyword' : 'like',
              'rowNum' : rN
          }
   	     sortList(data);
   	 }

    });
   
    
    var isEnd = false; 

    function sortList(data){
        if(isEnd == true){
            return ;
        }
        $.ajax({
            type: "POST",
            url: "/commu/selectAllCommuList.do",
            data: JSON.stringify(data),
            dataType: 'json',
            contentType: "application/json; charset=utf-8;",
            success: function (response){
                if(response.length!=0){
                    appendSortList(response);
                }else if(response.length==0) {
                    isEnd = true;
                   // window.removeEventListener('scroll', function (){
                        $('#result')
                            .append('<center><div>산모임이 더 이상 없습니다.</div></center>');
                   // })
                }
            },
            error: function(request, status, error){
            	alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            }
        })
    };
    
   
    function appendSortList(response){
        for(var i=0;i<response.length;i++){

            var status =  '<a href="/commu/commuPageView.do?groupNum='+response[i].GROUPNUM+'" style=" color: black;">' +
			              '<div class="media" style=" padding: 10px 10px;">'+
						  '<img src="/resources/img/'+response[i].STOREDFILENAME+'" style="width: 120px; height: 100px;" class="mr-3" alt="...">'+
				          '<div class="media-body" style="width:100px;">'+
				          '<h6 class="mt-0 mb-1">'+
						  '<strong>'+response[i].NAME+'</strong>'+
					      '</h6>'+
					      '<small class="card-text text-mute" style="display: block; overflow: hidden; white-space: nowrap; text-overflow: ellipsis">'+response[i].DETAIL+'</small>'+
					      '<small style="color: gray;">멤버 '+response[i].STAFFCURRENT+' / 지역 '+response[i].AREA+' </small>'+
				          '</div> </div> </a>';

            if( i%2==0 ){
                $('#commuList_odd').append(status);
            }else if(i%2==1){
                $('#commuList_even').append(status);
            }
        }
    }


   /*  function loadingImage() {
        var loadingImg ='';

        loadingImg += "<div id='loadingImg' class='pt-5' style='width: 100%'>";
        loadingImg += "<img src='/resources/img/loading.gif' style='position: relative; margin: 0px auto;display: block'/>";
        loadingImg += "</div>";

        $('#result').append(loadingImg);

    }

    function closeLoading() {
        $('#loadingImg').remove();
    } */
    
//afterBoard
 	function loadAfterBoard(){
		$.ajax({
			type: "GET",
			url: "/main/afterList.do",
			dataType: 'json',
			contentType: "application/json; charset=utf-8;",
			success: function (response){
				console.log("success")
				console.log(response)

				for(var i=0;i<2;i++){

					var detail = response[i].CONTENT;
					var convertDetail = detail.replace(/(<([^>]+)>)/ig,"");

					var html = ''
					html += '<div class="col-6">';
					html += '<div class="card" style="border: 1px solid green;">';
					html += '<div class="p-3">'
					html += '<div class="profile-box form-inline">'
					html += '<img src="/resources/img/'+response[i].CONTENT2+'" class="rounded-circle" style="width: 50px;height: 50px">'
					html += '<div>';
					html += '<div class="m-0 pl-2" style="height: 30px;display:block;overflow:auto;white-space:nowrap;text-overflow: ellipsis">'+response[i].NICKNAME+' 님이 작성하신 글</div>'
					html += '<h3 class="pl-2">'+response[i].TITLE+'</h3>'
					html += '</div></div>'
					html += '<div class="card-body">';
					html += '<p class="text-muted">'+convertDetail+'</p>';
					html += '</div></div></div>';

					$('#afterBoard').append(html)
				}
			},
			error: function(request, status, error){
				console.log("error")
			}
		})
	}
</script>
</html>