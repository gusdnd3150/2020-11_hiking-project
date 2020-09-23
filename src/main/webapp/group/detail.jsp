<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body>
    <div class="container">
        <img src=""><!--여기는 이미지 들어갈곳 (이미지3장 이상)-->
        <div>
            <img src="" />
            <div class="mountain-info"><!-- 등산로 정보-->
            </div>
            <div class="group-info">
                <p>그룹이름 : ${group.NAME}</p>
                <p>그룹상태 : ${group.STATUS}</p>
                <p>현재인원 : ${group.STAFFCURRENT}</p>
                <p>모집인원 : ${group.STAFFMAX}</p>
            </div>
        </div>
    </div>
</body>
