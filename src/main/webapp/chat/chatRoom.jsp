<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript" src="/resources/js/jquery.js"></script>
    <script type="text/javascript" src="/resources/js/sockjs.js"></script>
    <script type="text/javascript" src="/resources/js/stomp.js"></script>
    <script type="text/javascript">
        // var roomId =
        //
        //     log(roomId);

        function connect() {
            var socket = new SockJS('/chat');
            stompClient = Stomp.over(socket);
            stompClient.connect({}, function () {
                stompClient.subscribe('/topic/' + nickname, function (e) {
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
            data = {'chatRoomId': chatRoomId, 'sender' :nickname, 'receiver': receiver,'message': $("#message").val()};
            stompClient.send("/app/chat/send", {}, JSON.stringify(data));
            showMessage(data);
            $("#message").val('');
            alertClosing('successMessage',2000);
        }

        function showMessage(e) {
            space = document.getElementById("space");
            space.innerHTML = "<div class='row'> <div class='col-lg-12'> <div class='media'> <div class='media-body'> <h4 class='media-heading'>" +
                e.sender + "</h4><h4 class='small pull-right'>방금</h4> </div> <p>" +
                e.message + "</p> </div> </div> </div> <hr>" + space.innerHTML;
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
</head>
<body>
${roomId}
<input type="text" id="message" />
<input type="button" value="전송" onclick="messageSend();" />
<input type="button" value="종료" onclick="disconnect();" />
<div id="console" />
</body>
</html>