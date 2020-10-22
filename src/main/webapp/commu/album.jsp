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
<style>

ul,ol {list-style-type:none;}
/* a {color:inherit;text-decoration:none;outline: none;cursor:pointer; }  */
.album-cover {
  width: 92%;
  height: 230px;
  background-image: url('/resources/img/test/list1.jpg');
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center;
}
.album-info {
  padding: 5px;
}
.album-title {
  font-family: 'Noto Sans KR', sans-serif;
}
.album-item{
border-color: 2px solid green;
}
#ASpace{
width:330px;
}


</style>
 <div class="tab-pane fade" id="album" role="tabpanel" aria-labelledby="list-album-list">
 <div class="row pt-3">
<h3>&nbsp&nbsp&nbsp전체 사진</h3><div id="ASpace"></div>
<button type="file" style="float:right;"  class="btn btn-outline-success">사진 올리기</button>
 </div>
 <div class="row  mt-4 text-center text-lg-left">

        <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4 h-100">
                <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/pWkk7iiCoDM/400x300" alt="">
            </a>
        </div>
        <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4 h-100">
                <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/aob0ukAYfuI/400x300" alt="">
            </a>
        </div>
        <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4 h-100">
                <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/EUfxH-pze7s/400x300" alt="">
            </a>
        </div>
        <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4 h-100">
                <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/M185_qYH8vg/400x300" alt="">
            </a>
        </div>
        <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4 h-100">
                <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/sesveuG_rNo/400x300" alt="">
            </a>
        </div>
        <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4 h-100">
                <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/AvhMzHwiE_0/400x300" alt="">
            </a>
        </div>
        <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4 h-100">
                <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/2gYsZUmockw/400x300" alt="">
            </a>
        </div>
        <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4 h-100">
                <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/EMSDtjVHdQ8/400x300" alt="">
            </a>
        </div>
        <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4 h-100">
                <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/8mUEy0ABdNE/400x300" alt="">
            </a>
        </div>
        <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4 h-100">
                <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/G9Rfc1qccH4/400x300" alt="">
            </a>
        </div>
        <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4 h-100">
                <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/aJeH0KcFkuc/400x300" alt="">
            </a>
        </div>
        <div class="col-lg-3 col-md-4 col-6">
            <a href="#" class="d-block mb-4 h-100">
                <img class="img-fluid img-thumbnail" src="https://source.unsplash.com/p2TQ-3Bh3Oo/400x300" alt="">
            </a>
        </div>
</div>

<!-- <br>
<br>
<h3>&nbsp&nbsp&nbsp사진첩</h3>
<br>
<ul>
  <li>
    <div class="album-item">
      <div class="album-cover"></div>
      <div class="album-info">
        <p class="album-title">앨범1</p>
      </div>
    </div>
  </li>
  <li>
    <div class="album-item">
      <div class="album-cover"></div>
      <div class="album-info">
        <p class="album-title">앨범2</p>
      </div>
    </div>
  </li>
  <li>
    <div class="album-item">
      <div class="album-cover"></div>
      <div class="album-info">
        <p class="album-title">앨범3</p>
      </div>
    </div>
  </li>
  <li>
    <div class="album-item">
      <div class="album-cover"></div>
      <div class="album-info">
        <p class="album-title">앨범4</p>
      </div>
    </div>
  </li>
</ul>
 -->


</div>

</html>