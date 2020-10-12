<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" type="text/css" href="/resources/css/views/common/fixedBtn.css" />
<span class="col-12" id="RightBottomLayerFixed" onclick="goChat()">
    <i class="fas fa-comments fa-lg"></i>
</span>
<script>
    function goChat(){
        var newWindow = window.open("about:blank","채팅","width=400, height=600, left=300, top=300");
        newWindow.location.href='/chat.do?groupNum=${group.GROUPNUM}';
    }
</script>