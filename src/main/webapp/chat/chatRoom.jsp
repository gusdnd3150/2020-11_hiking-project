<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <title>Document</title>
    <link rel="stylesheet" href="../resources/css/views/chat/style.css">
</head>
<body class="chat-body">
<header class="top-header top-header-chat">
    <div class="header_top">
        <div class="header_column">
            <span class="header_time">18:38</span>
        </div>
    </div>

    <div class="header_bottom chat-header-bottom">
        <div class="header_column">
            <span class="header_text chat-text">채팅방 제목(그룹 이름)</span>
        </div>
    </div>
</header>
<main class="chat">
    <div class="chat_date-devider">
        <span class="chat_date-devider-text">오늘 날짜</span>
    </div>
    <div class="chat_message chat_message-me">
        <span class="chat_message-time">17:55</span>
        <span class="chat_message-body">Hello!! This is a test message.</span>
    </div>
    <div id="console" class="chat_message chat_message-from">
        <img src="../resources/img/profile1.jpg" alt="" class="chat_message-profile-img">
        <div class="chat_message-profile">
            <h3 class="chat_message-name">LYNN</h3>
            <span class="chat_message-body">And this is an answer</span>
        </div>
        <span class="chat_message-time">19:30</span>
    </div>
</main>
<div class="chat_bottom">
    <i class="fas fa-plus fa-lg"></i>
    <div class="chat_bottom-column">
        <input type="text" class="chat_chatting" id="message">
<%--        <i class="far fa-smile-wink fa-lg"></i>--%>
        <button onclick="send();" style="width: 100px">보내기</button>
    </div>
</div>
<div class="maxdang">
    <span>창을 작게 해주세요</span>
</div>
<%--<input type="text" id="message" />--%>
<%--<input type="button" value="전송" onclick="send();" />--%>
<%--<input type="button" value="종료" onclick="disconnect();" />--%>

<%--<div id="console" />--%>

<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/js/sockjs.js"></script>
<script type="text/javascript" src="/resources/js/stomp.js"></script>
<script type="text/javascript">

    var stompClient = null;

    connect();

    function connect() {
        var socket = new SockJS('/chat');
        stompClient = Stomp.over(socket);
        stompClient.connect({}, function () {
            stompClient.subscribe('/topic/' + '${roomId}', function (e) {
                showMessage(JSON.parse(e.body));
                alertClosing('comeMessage',2000);
            });
        });
    }

    function disconnect() {
        if (stompClient !== null) {
            stompClient.disconnect();
        }
    }

    function send() {
        var data = {'roomId': '${roomId}', 'sender' :'<%= session.getAttribute("LOGIN")%>', 'message': $("#message").val()};
        stompClient.send("/chat/send/${roomId}", {}, JSON.stringify(data));
        // showMessage(data);
        // $("#message").val('');
        alertClosing('successMessage',2000);
    }

    function showMessage(e) {
        var console = document.getElementById("console");
        console.innerHTML = "<div class='row'> <div class='col-lg-12'> <div class='media'> <div class='media-body'> <h4 class='media-heading'>" +
            e.sender + "</h4><h4 class='small pull-right'>방금</h4> </div> <p>" +
            e.message + "</p> </div> </div> </div> <hr>" + console.innerHTML;
    };
    window.onbeforeunload = function(e){
        disconnect();
    }

    function alertClosing(selector, delay){
        console.log(selector);
        document.getElementById(selector).style.display = "block";
        window.setTimeout(function(){
            document.getElementById(selector).style.display = "none";
        },delay);
    }
</script>
</body>
</html>