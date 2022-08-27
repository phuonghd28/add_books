<%@ page import="com.movie.cinema.cenima.entity.Account" %><%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 8/15/2022
  Time: 9:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Account account = (Account) session.getAttribute("account");
%>

<% if (account != null){%>
<html>
<head>
    <title>Cinema Create</title>
    <link rel="stylesheet" href="../asset/css/main.css">
</head>
<body>
<div class="main">
    <form action="createCinema.jsp" method="post">
        <h2>Create Cinema</h2>
        <div class="container">
            <label><b>Name</b></label>
            <label>
                <input type="text" placeholder="Enter Name" name="name" required>
            </label>

            <label><b>Address</b></label>
            <label>
                <input type="text" placeholder="Enter Address" name="address" required>
            </label>

            <button type="submit">Create</button>
            <button type="reset">Reset</button>
        </div>
        <div class="login_link">
            Bấm <a href="../home/homeCinema.jsp">vào đây</a> để quay lại trang chủ.
        </div>
    </form>
</div>
</body>
<% String msg = request.getParameter("msg"); %>

<% if (msg != null && msg.equals("1")) { %>
<SCRIPT language="JavaScript" charset="UTF-8">
    alert("Tạo mới thành công.")
</SCRIPT>
<% } else if (msg != null && msg.equals("0")) { %>
<SCRIPT language="JavaScript">
    alert("Tạo mới thất bại.")
</SCRIPT>
<% } %>
</html>
<%} else {%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<h4>Unauthorized</h4>
</body>
</html>
<%}%>

