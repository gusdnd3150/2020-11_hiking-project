<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="../resources/css/tui-calendar.css" />
</head>
<body>
<div id="calendar" style="height: 800px;"></div>
<script src="../resources/js/tui-calendar.js"></script>
<script src="../resources/js/view/calendar/calendar.js"></script>
<script>
    var Calendar = tui.Calendar;

    const calendar = new Calendar('#calendar', {
        defaultView: 'week',
        useCreationPopup: true,
        useDetailPopup: true
    });

    calendar.render();
</script>
</body>
</html>
