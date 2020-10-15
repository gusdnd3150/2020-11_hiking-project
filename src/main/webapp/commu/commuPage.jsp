<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!doctype html>
<html lang="ko">
<jsp:include page="/commu/common/leftSide.jsp" flush="false" />


<!-- middle div -->
<c:choose>
<c:when test="${empty m2.USERSTATUS && 1 eq m4.BOARDACCESS}">
<jsp:include page="/commu/commuIntro.jsp" flush="false" />
	</c:when>
	<c:otherwise>
	<div class="col-md-6 tab-content" id="nav-tabContent">
		<div class="tab-pane fade show active" id="commuPage" role="tabpanel"
			aria-labelledby="list-commuPage-list">
			<c:if test="${0 eq m2.USERSTATUS}">
			<div id="search" class="row pl-3 pb-2">
				<input class="form-control " type="search"
					style="width: 473px; height: 40px; margin: 3px; border-color: green; !important;"
					placeholder="Search" aria-label="Search">
				<button type="submit" class="btn btn-primary"
					style="background-color: green; border-color: green; margin: 3px; width: 50xp; height: 40px; !important;">
					<img src="../resources/img/search.png" width="25" height="25"
						onclick="">
				</button>
			</div>

			<div class="card" style="border-color: green;">
				<div class="card-body">
					📌📍📎📏📐📑📒📓📔📕📖📗📘📙📚📛📜📝
					<hr class="my-4">
				</div>
				<div class="card-body">
					<blockquote class="blockquote my-4">
						<p>글을 작성해주세요~~~~~ //CK에디터 박힐 부분</p>
					</blockquote>
				</div>
			</div>
			<hr>
			</c:if>
			<div class="card">
				<div class="card-header">공지사항</div>
				<div class="card-body">
					<blockquote class="blockquote mb-0">
						<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
							Integer posuere erat a ante.</p>
						<footer class="blockquote-footer">
							Someone famous in <cite title="Source Title">Source Title</cite>
						</footer>
					</blockquote>
				</div>
			</div>
			<div class="card">
				<div class="card-body">
					우리 청솔 산모임 9월 정모 너무 행복했어요~~우리 청솔 산모임 9월 정모 너무 행복했어요~~우리 청솔 산모임 9월 정모
					너무 행복했어요~~우리 청솔 산모임 9월 정모 너무 행복했어요~~우리 청솔 산모임 9월 정모 너무 행복했어요~~우리 청솔
					산모임 9월 정모 너무 행복했어요~~
					<hr class="my-4">
					댓글 부분
				</div>
			</div>
		</div>
			<c:if test="${0 eq m2.USERSTATUS}">
		<jsp:include page="/commu/calender.jsp" flush="false" />
		<jsp:include page="/commu/album.jsp" flush="false" />
		<jsp:include page="/commu/files.jsp" flush="false" />
		<jsp:include page="/commu/member.jsp" flush="false" />
	</div>
<jsp:include page="/commu/common/rightSide.jsp" flush="false" />
</c:if>
	</c:otherwise>
</c:choose>
</html>