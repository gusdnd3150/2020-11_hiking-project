<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/common/header.jsp" flush="false" />
<%
	request.setCharacterEncoding("UTF-8");
	pageContext.setAttribute("loginID", request.getSession().getAttribute("LOGIN"));
%>
<style>
	.list {
		text-decoration: none; !important;
		color: black;
	}
	.list:hover {
		text-decoration: none; !important;
		color: black;
	}
	#myTabContent {
		height: 200px;
	}
	textarea {
		width: 300px;
		height: 100px;
	}
</style>
	<div class="container pt-5">
		<!-- 상단 프로필 박스 -->
		<div class="pt-5" style="text-align: center;">
			<h1>마이페이지</h1>
				<div class="box box-primary">
					<div class="box-body box-profile">
						<img class="rounded-circle mt-2" src="/resources/img/${userVO.content2}" width="100px" height="100px" alt="프로필사진">
						<h4 class="mt-2" id="nickName">${userVO.nickName}</h4>
						<p id="profile1">${userVO.profile}</p>
						<button type="button" class="btn btn-info col-md-4 col-sm-12" id="editProf" data-toggle="modal" data-target="#exampleModalCenter">
						<b>프로필 수정하기</b>
						</button>
					</div>
				</div>
		</div>
		<!-- 2단탭 박스 -->
		<div class="row p-3">
			<!-- 나의 산오름 탭 -->
			<div class="col-md-6 col-sm-12">
				<ul class="list-group list-group-unbordered">
					<li class="list-group-item text-center">
						<h4>나의 산오름</h4>
					</li>
					<a class="list" href='/profile/myFriendsList.do/${loginID}' style='color: black;' onclick="window.open(this.href,'','width=390, height=540'); return false;">
						<li class="list-group-item d-flex justify-content-between align-items-center">
							<b>나의 친구 목록</b>
							<span class="text-muted m-2">더보기></span>
						</li>
					</a>
					<a class="list" href="/calendar.do">
						<li class="list-group-item d-flex justify-content-between align-items-center">
							<b>나의 등산 일정</b>
							<span class="text-muted m-2">더보기></span>
						</li>
					</a>
					<a class="list" href="/mypage/moim.do?userId=${LOGIN}" onclick="window.open(this.href,'','width=370, height=540'); return false;">
						<li class="list-group-item d-flex justify-content-between align-items-center">
							<b>나의 모임 관리</b>
							<span class="text-muted m-2">더보기></span>
						</li>
					</a>
					<a class="list" href="/mypage/favorite.do?userId=${LOGIN}" onclick="window.open(this.href,'','width=370, height=540'); return false;">
						<li class="list-group-item d-flex justify-content-between align-items-center">
							<b>나의 찜 목록</b>
							<span class="text-muted m-2">더보기></span>
						</li>
					</a>
<%--					<li class="list-group-item">--%>
<%--						<ul class="nav nav-tabs" id="myInfoTab" role="tablist">--%>
<%--							<li class="nav-item" role="presentation">--%>
<%--								<a class="nav-link active" id="joined-tab" data-toggle="tab" href="#joined" role="tab" aria-controls="joined" aria-selected="true">--%>
<%--									<b>내가 가입한 산모임</b>--%>
<%--								</a>--%>
<%--							</li>--%>
<%--							<li class="nav-item" role="presentation">--%>
<%--								<a class="nav-link" id="created-tab" data-toggle="tab" href="#created" role="tab" aria-controls="created" aria-selected="false">--%>
<%--									<b>내가 만든 산모임</b>--%>
<%--								</a>--%>
<%--							</li>--%>
<%--						</ul>--%>
<%--						<div class="tab-content" id="myInfoContent" style="overflow:scroll;width: auto;height: 200px" >--%>
<%--							<div class=" tab-pane fade show active" id="joined" data-spy="scroll" role="tabpanel" aria-labelledby="joined-tab">--%>
<%--								<ul>--%>
<%--								<c:forEach var="JList" items="${JList}">--%>
<%--										<li><img class="rounded-circle mt-2" src="/resources/img/${JList.STOREDFILENAME}" width="50" height="50">--%>
<%--									<a href="/commu/commuPageView.do?groupNum=${JList.GROUPNUM}">--%>
<%--										${JList.NAME}</li>--%>
<%--									</a>--%>
<%--								</c:forEach>--%>
<%--								</ul>--%>
<%--							</div>--%>
<%--							<div class=" tab-pane fade" id="created" role="tabpanel" data-spy="scroll" aria-labelledby="created-tab">--%>
<%--								<ul>--%>
<%--								<c:forEach var="CList" items="${CList}">--%>
<%--									<li><img class="rounded-circle mt-2" src="/resources/img/${CList.STOREDFILENAME}" width="50" height="50">--%>
<%--									<a href="/commu/commuPageView.do?groupNum=${CList.GROUPNUM}">--%>
<%--										${CList.NAME}</a></li>--%>
<%--								</c:forEach>--%>
<%--								</ul>--%>
<%--							</div>--%>
<%--						</div>--%>
<%--					</li>--%>
				</ul>
			</div>
			<!-- 나의 오름마켓 탭 -->
			<div class="col-md-6 col-sm-12">
				<!-- <div class="col-md-5"> -->
				<ul class="list-group list-group-unbordered">
					<li class="list-group-item text-center">
						<h4 id="shoppingMall">나의 오름마켓</h4>
					</li>
					<li class="list-group-item d-flex justify-content-between align-items-center">
						<b>보유포인트 P</b>
						<c:if test="${ point.point eq null}">
							<h5 class="mt-2"> 0 <img src="/resources/img/shop_coin.png" width="30px" height="30px"></h5>
						</c:if>
						<c:if test="${ point.point ne null }">
							<h5 class="mt-2">${point.point } <img src="/resources/img/shop_coin.png" width="30px" height="30px"></h5>
						</c:if>
					</li>

					<li class="list-group-item d-flex justify-content-between align-items-center">
						<b>위시리스트</b>
						<c:if test="${wishCount == 0 }">
							<a href="/wishList.do"><h5 class="mt-2">0 </h5></a>
						</c:if>
						<c:if test="${wishCount != 0 }">
							<a href="/wishList.do"><h5 class="mt-2">${wishCount } </h5></a>
						</c:if>
					</li>

					<li class="list-group-item d-flex justify-content-between align-items-center">
						<b>장바구니</b>
						<c:if test="${cartCount == 0 }">
							<a href="/myShop/cartList.do"><h5 class="mt-2">0 </h5></a>
						</c:if>
						<c:if test="${cartCount != 0 }">
							<a href="/myShop/cartList.do"><h5 class="mt-2">${cartCount } </h5></a>
						</c:if>
					</li>

					<li class="list-group-item d-flex justify-content-between align-items-center">
						<b>구매내역</b>
						<c:if test="${buyCount == 0 }">
							<a href="/paymentList.do"><h5 class="mt-2">0 </h5></a>
						</c:if>
						<c:if test="${buyCount != 0 }">
							<a href="/paymentList.do"><h5 class="mt-2">${buyCount } </h5></a>
						</c:if>
					</li>

					<li class="list-group-item d-flex justify-content-between align-items-center">
						<b>중고물품 신청내역</b>
						<c:if test="${usedCount == 0 }">
							<a href="/myUsedList.do"><h5 class="mt-2">0 </h5></a>
						</c:if>
						<c:if test="${usedCount != 0 }">
							<a href="/myUsedList.do"><h5 class="mt-2">${usedCount } </h5></a>
						</c:if>
					</li>

					<!-- <li class="list-group-item">
						<nav id="scroll">
							<ul class="nav nav-tabs" id="myTab" role="tablist">
								<li class="nav-item" role="presentation">
									<a class="nav-link active" id="a-tab" data-toggle="tab" href="#a" role="tab" aria-controls="a" aria-selected="true">
										<b>탭 쓰려면 쓰세용a</b>
									</a>
								</li>
								<li class="nav-item" role="presentation">
									<a class="nav-link" id="b-tab" data-toggle="tab" href="#b" role="tab" aria-controls="b" aria-selected="false">
										<b>탭 쓰려면 쓰세용b</b>
									</a>
								</li>
							</ul>
						</nav>
						<div class="tab-content" id="myTabContent" style="overflow:scroll; width: auto;height: 200px">
							<div class="tab-pane fade show active" id="a" role="tabpanel"
								 aria-labelledby="a-tab">
								(줄지움 하세요 : 'control'+'D')스크롤이내려가지롱스크롤이내려가지롱스크롤이내려가지롱스크롤이내려가지롱스크롤이내려가지롱스크롤이내려가지롱스크롤이내려가지롱스크롤이내려가지롱스크롤이내려가지롱스크롤이내려가지롱스크롤이내려가지롱스크롤이내려가지롱스크롤이내려가지롱스크롤이내려가지롱스크롤이내려가지롱스크롤이내려가지롱스크롤이내려가지롱
								(줄지움 하세요 : 'control'+'D')스크롤이내려가지롱스크롤이내려가지롱스크롤이내려가지롱스크롤이내려가지롱스크롤이내려가지롱스크롤이내려가지롱스크롤이내려가지롱스크롤이내려가지롱스크롤이내려가지롱스크롤이내려가지롱스크롤이내려가지롱스크롤이내려가지롱스크롤이내려가지롱스크롤이내려가지롱스크롤이내려가지롱스크롤이내려가지롱스크롤이내려가지롱
							</div>
							<div class="tab-pane fade" id="b" role="tabpanel"
								 aria-labelledby="b-tab">skskskskskskskskskksskskk</div>
						</div>
					</li> -->
				</ul>
			</div>
		</div>
		<div class="pt-3 text-center">
			<button type="button" class="btn btn-info col-md-4 col-sm-12" id="editInfo" data-toggle="modal" data-target="#exampleModalCenter3">
				<b>나의 정보 수정하기</b>
			</button>
		</div>
		<div class="container pt-5">
			<jsp:include page="../common/footer.jsp" flush="false" />
		</div>
	</div>

<!-- Modal1 -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">나의 프로필 수정하기</h5>
				<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form action="/mypage/updateUserInfo.do" enctype="multipart/form-data" method="post">
							<table class="table">
								<tr>
									<th>프로필 사진</th>
									<td colspan="4"><input type="file" name="file" /></td>
								</tr>
								<tr>
									<th>나의 소개글</th>
									<td colspan="4">
										<textarea id="profile2" name="profile">${userVO.profile}</textarea><br>
									</td>
								</tr>
							</table>
				<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">X 닫기</button>
				<button type="submit" class="btn btn-info">변경하기</button>
				</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- Modal2 -->
<div class="modal fade" id="exampleModalCenter3" tabindex="-1"
	 role="dialog" aria-labelledby="exampleModalCenterTitle"
	 aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">비밀번호 입력</h5>
				<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"  id="close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<table>
					<tr>
						<th>비밀번호</th>
						<td>
							<input type="password" class="form-control" id="password3" name="password3" placeholder="비밀번호를 입력하세요." required>
							<div class="check_font" id="passwordCheck3"></div>
						<td>
						<td><button id="checkIt" class="btn btn-light">확인</button><td>
					</tr>
				</table>
			</div>
			<div class="modal-footer">
				<a href="/mypage/modifyView.do">
					<button type="button" class="btn btn-info" disabled id="myInfo">다음</button>
				</a>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script>
	$(document).ready(function() {
		$("#checkIt").click(function() {
			var pwd = $("#password3").val();
			console.log("이벤트!!" + pwd);
			$.ajax({
				url : "/mypage/pwdCheck.do",
				type : "post",
				data : {
					pwd : pwd
				},
				success : function(data) {
					console.log(data);
					if ($('#password3').val() == "") {
						$('#passwordCheck3').text('비밀번호를 입력해주세요.');
						$('#passwordCheck3').css('color', 'red');
						$("#myInfo").attr("disabled", true);
					} else if (data == "0") {
						// 0 : 비밀번호 통과
						$("#password3").val("");
						$("#passwordCheck3").text("'다음'을 클릭하세요.");
						$('#passwordCheck3').css('color', 'green');
						$("#myInfo").attr("disabled", false);
					} else if (data == "1") {
						// 1 : 	비밀번호 틀림
						$("#password3").val("");
						$("#passwordCheck3").text("비밀번호를 다시 확인해주세요.");
						$("#passwordCheck3").css("color", "red");
						$("#myInfo").attr("disabled", true);
					}
				},
				error : function(data, textStatus) {
					console.log("실패");
				},
				complete : function(data, textStatus) {
				}
				//responsebody -> 아작스로 들어옴
			});
		});

		$("#myInfo").click(function() {
			console.log("myInfo");
			$("#password3").val("");
		});
	});
</script>
</body>
</html>