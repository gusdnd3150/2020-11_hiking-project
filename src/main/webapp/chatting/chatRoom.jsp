<%@ page import="java.time.LocalDateTime" %>
<%@ page import="javax.mail.Session" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <title>채팅</title>
    <link rel="stylesheet" href="../resources/css/views/chat/style.css">
</head>
<body class="chat-body">
<header class="top-header top-header-chat">
    <div class="header_top">
        <div class="header_column">
            <span class="header_time">
                <i id="timeNow"></i>
            </span>
        </div>
    </div>

    <div class="header_bottom chat-header-bottom">
        <div class="header_column">
            <span class="header_text chat-text">${userInfo[0].NAME}</span>
        </div>
    </div>
</header>
<main id="chat" class="chat">
    <div class="chat_date-devider">
        <span class="chat_date-devider-text">오늘 날짜</span>
    </div>
    <c:forEach var="resultList" items="${resultList}">
        <c:choose>
            <c:when test="${resultList.USERID eq LOGIN}">
                <div id="myMessage" class="chat_message chat_message-me">
                <span class="chat_message-time">
                    ${resultList.MESSAGEDAT}
                </span>
                <span class="chat_message-body">${resultList.MESSAGE}</span>
                </div>
            </c:when>
            <c:when test="${resultList.USERID ne LOGIN}">
                <div id="otherMessage" class="chat_message chat_message-from">
                <img src="../resources/img/${resultList.CONTENT2}" alt="" class="chat_message-profile-img">
                <div class="chat_message-profile">
                <h3 class="chat_message-name">${resultList.NICKNAME}</h3>
                <span class="chat_message-body">${resultList.MESSAGE}</span>
                </div>
                <span class="chat_message-time">${resultList.MESSAGEDAT}</span>
                </div>
            </c:when>
        </c:choose>
    </c:forEach>
</main>
<div class="chat_bottom">
    <i class="fas fa-plus fa-lg" style="margin: auto"></i>
    <div class="chat_bottom-column">
        <input type="text" class="chat_chatting" id="message">
        <button onclick="send();" style="width: 100px">보내기</button>
    </div>
</div>
<div class="maxdang">
    <span>창을 적당한 크기로 조절 해주세요</span>
</div>

<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/js/sockjs.js"></script>
<script type="text/javascript" src="/resources/js/stomp.js"></script>
<script type="text/javascript">
    var stompClient = null;

    connect();

    function connect() {
        var socket = new SockJS('/chatting');
        stompClient = Stomp.over(socket);
        stompClient.connect({}, function () {
            stompClient.subscribe('/topic/' + '${roomId}', function (e) {
                showMessage(JSON.parse(e.body));
                $("#chat").scrollTop($("#chat")[0].scrollHeight);
            });
        });
    }

    function disconnect() {
        if (stompClient !== null) {
            stompClient.disconnect();
        }
    }

    function send() {
        var data = {
            'roomId': '${roomId}',
            'userId' :'<%= session.getAttribute("LOGIN")%>',
            'message': $("#message").val(),
            'messagedAt': '<%= LocalDateTime.now() %>',
            'nickname' : '${userInfo[0].NICKNAME}',
            'content2' : '${userInfo[0].CONTENT2}'
        };
        stompClient.send("/chat/send/${roomId}", {}, JSON.stringify(data));
        showMyMessage(data);
        document.getElementById("message").value = "";
        $("#chat").scrollTop($("#chat")[0].scrollHeight);
    }
    function showMyMessage(data){
        var html = '';

        html += '<div id="myMessage" class="chat_message chat_message-me">';
        html += '<span class="chat_message-time">';
        html += '방금'+'</span>\n';
        html += '<span class="chat_message-body">' + data.message + '</span>';
        html += '</div>';

        $('#chat').append(html);
    };


    function showMessage(data) {

        if(data.userId!='<%= session.getAttribute("LOGIN")%>'){

            var html = '';

            html += '<div id="otherMessage" class="chat_message chat_message-from">';
            html += '<img src="../resources/img/'+ data.content2 +'" alt="" class="chat_message-profile-img">';
            html += '<div class="chat_message-profile">';
            html += '<h3 class="chat_message-name">' + data.nickname +'</h3>';
            html += '<span class="chat_message-body">' + data.message + '</span>';
            html += '</div>';
            html += '<span class="chat_message-time">' + '방금' + '</span>';
            html += '</div>';

            $('#chat').append(html)
        }
    };
    window.onbeforeunload = function(e){
        disconnect();
    }

    $(document).ready(function (){

        $("#chat").scrollTop($("#chat")[0].scrollHeight);

        $('#message').keypress(function (e){
            if(e.keyCode == 13){
                send();
            }
        })

        let today = new Date();
        let today_result = date_to_str(today);
        $('#timeNow').text(today_result.toLocaleString())

        setInterval(function (){
            $('#timeNow').text(today_result.toLocaleString())
            location.reload();
        },58000)
    })

    function date_to_str(format) {
        var year = format.getFullYear();
        var month = format.getMonth() + 1;
        if(month<10) month = '0' + month;
        var date = format.getDate();
        if(date<10) date = '0' + date;
        var hour = format.getHours();
        if(hour<10) hour = '0' + hour;
        var min = format.getMinutes();
        if(min<10) min = '0' + min;
        var sec = format.getSeconds();
        if(sec<10) sec = '0' + sec;
        return year + "-" + month + "-" + date + " " + hour + ":" + min;
    }
</script>
</body>
</html>