<%@ page import="java.time.LocalDateTime" %>
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
<main id="chat" class="chat">
    <div class="chat_date-devider">
        <span class="chat_date-devider-text">오늘 날짜</span>
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
        var data = {
            'roomId': '${roomId}',
            'userId' :'<%= session.getAttribute("LOGIN")%>',
            'message': $("#message").val(),
            'time': '<%= LocalDateTime.now() %>'
        };

        stompClient.send("/chat/send/${roomId}", {}, JSON.stringify(data));
        showMyMessage(data);
        document.getElementById("message").value = "";
    }
    function showMyMessage(data){
        $('#chat').append("" +
            "<div id=\"myMessage\" class=\"chat_message chat_message-me\">" +
            "<span class=\"chat_message-time\">"+
            data.time+"</span>\n" +
            "<span class=\"chat_message-body\">" + data.message + "</span>" +
            "</div>")
    };

    function showMessage(data) {
        if(data.userId!='<%= session.getAttribute("LOGIN")%>'){
            $('#chat').append(
                "<div id=\"otherMessage\" class=\"chat_message chat_message-from\">" +
                '<img src="../resources/img/profile1.jpg" alt="" class="chat_message-profile-img">'+
                '<div class="chat_message-profile">' +
                '<h3 class="chat_message-name">LYNN</h3>' +
                '<span class="chat_message-body">' + data.message + '</span>' +
                '</div>' +
                '<span class="chat_message-time"></span>' +
                '</div>');
        }
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
    $(document).ready(function (){
        $('#message').keypress(function (e){
            if(e.keyCode == 13){
                send();
            }
        })
    })
</script>
</body>
</html>