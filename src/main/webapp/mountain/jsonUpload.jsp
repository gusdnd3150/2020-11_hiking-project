<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/mountain/trail/upload.do" enctype="multipart/form-data">
    <label>파일:</label>
    <input multiple="multiple" type="file" name="file">
    <input type="submit" value="upload">
</form>
</body>
</html>
