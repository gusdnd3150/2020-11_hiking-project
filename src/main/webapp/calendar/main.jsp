<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<jsp:include page="/common/header.jsp" />
    <meta charset='utf-8' />
    <link href='https://use.fontawesome.com/releases/v5.0.6/css/all.css' rel='stylesheet'>
    <link href='../resources/full-calendar/core/main.css' rel='stylesheet' />
    <link href='../resources/full-calendar/bootstrap/main.css' rel='stylesheet' />
    <link href='../resources/full-calendar/timegrid/main.css' rel='stylesheet' />
    <link href='../resources/full-calendar/daygrid/main.css' rel='stylesheet' />
    <link href='../resources/full-calendar/list/main.css' rel='stylesheet' />
    <link href='../resources/css/views/calendar/main.css' rel="stylesheet" />
<body class="container pt-5">
    <div class="pt-5">
        <h1>내 등산일정</h1>
        <div id='calendar'></div>
    </div>
</body>
<script type="text/javascript" src="./resources/js/jquery.js"></script>
<script src='../resources/full-calendar/core/main.js'></script>
<script src='../resources/full-calendar/interaction/main.js'></script>
<script src='../resources/full-calendar/bootstrap/main.js'></script>
<script src='../resources/full-calendar/daygrid/main.js'></script>
<script src='../resources/full-calendar/timegrid/main.js'></script>
<script src='../resources/full-calendar/list/main.js'></script>
<script>

document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
        plugins: [ 'bootstrap', 'interaction', 'dayGrid', 'timeGrid', 'list' ],
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,listMonth',
        },
        footer: {

        },
        locale: 'ko',
        buttonText: {
            today: '오늘',
            month: '달력',
            list: '리스트'
        },
        defaultDate: '2020-10-26',
        navLinks: true, // can click day/week names to navigate views
        editable: false,
        themeSystem: 'bootstrap',
        contentHeight: 500,
        eventLimit: true, // allow "more" link when too many events
        events: function (info, successCallback, failureCallback){
            var data = {
                'userId' : '<%= request.getSession().getAttribute("LOGIN")%>'
            }

            $.ajax({
                type: "GET",
                url:"/calender/selectCalendarByUserId.do",
                data: data,
                dataType:'json',
                contentType: "application/json; charset=utf-8;",
                success:function (response){

                    var events = [];
                    for(var i=0;i<response.length;i++) {
                        events.push({
                            title: response[i].NAME,
                            start: response[i].STARTDAY,
                            url: "/group/"+response[i].GROUPNUM,
                            color: "#757449"
                        })
                    }
                    successCallback(events);
                },
                error:function (response){
                    console.log("error")
                }

            })
        }
    });
    calendar.render();
});
</script>
</html>


