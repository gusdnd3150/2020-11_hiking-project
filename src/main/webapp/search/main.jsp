<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/header.jsp" />
<body class="container pt-5">
    <div class="pt-5">
        <h1>상세 검색</h1>
        <div class="pt-3">
            <div class="form-inline">
                <input type="text" class="form-control col-3" placeholder="검색어를 입력해주세요">
                <button class="btn btn-info">검색</button>
                <a class="btn btn-light" data-toggle="collapse" href="#searchCondition" role="button" aria-expanded="false" aria-controls="collapseExample">
                    상세 검색
                </a>
            </div>
            <div class="collapse" id="searchCondition">
                <div class="row card-body">
                    <div class="col-4">
                        <h4>유형</h4>
                        <select id="type" style="width: 100%">
                            <option value="none">무관</option>
                            <option value="mt">산</option>
                            <option value="path">등산로</option>
                            <option value="group">등산모임</option>
                            <option value="moim">산모임</option>
                        </select>
                    </div>
                    <div class="col-4">
                        <h4>기간</h4>
                        <select id="period" style="width: 100%">
                            <option value="none">무관</option>
                            <option value="hour">최근 1시간</option>
                            <option value="day">최근 1일</option>
                            <option value="week">최근 1주일</option>
                            <option value="month">최근 1달</option>
                        </select>
                    </div>
                    <div class="col-4">
                        <h4>정렬</h4>
                        <select id="sort" style="width: 100%">
                            <option value="none">무관</option>
                            <option value="new">최근 순</option>
                            <option value="old">오래된 순</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>

        <hr />

    </div>
    <!-- 쇼핑몰 상품 추천 (랜덤) -->
    <div class="text-center" style="width:100%; height: 200px; display: flex;justify-content: center;flex-direction: column">
        <p>결과가 없습니다</p>
    </div>
<script type="text/javascript" src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/bootstrap.min.js"></script>
</body>
<jsp:include page="/common/footer.jsp" />

