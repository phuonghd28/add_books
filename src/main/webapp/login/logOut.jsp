<%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 8/16/2022
  Time: 1:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    session.removeAttribute("account");
    response.sendRedirect("../home/homeCinema.jsp");

%>
</body>
</html>
