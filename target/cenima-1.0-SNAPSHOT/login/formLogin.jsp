<%@ page import="com.mysql.cj.util.StringUtils" %>
<%@ page import="com.movie.cinema.cenima.util.HandlerCode" %><%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 8/15/2022
  Time: 11:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../asset/css/main.css">
</head>
<body>
<div class="main-login">
    <form action="doLogin.jsp" method="post">
        <h2>Cinema TheBoys Login</h2>
        <div class="imgcontainer">
            <img src="https://img.freepik.com/premium-vector/colorful-movie-logo_18099-26.jpg?w=2000" alt="Avatar" class="avatar">
        </div>

        <div class="container">
            <label><b>Username</b></label>
            <label>
                <input type="text" placeholder="Enter Username" name="username" required>
            </label>

            <label><b>Password</b></label>
            <label>
                <input type="password" placeholder="Enter Password" name="password" required>
            </label>

            <button type="submit">Login</button>
            <button type="reset">Reset</button>
        </div>
        <div class="login_link">
            Bạn chưa có tài khoản vui lòng <a href="../register/formRegister.jsp">Register</a>
        </div>
        <div class="login_link">
            Bấm<a href="../home/homeCinema.jsp"> vào đây</a> để quay lại trang chủ
        </div>
    </form>
</div>
</body>
<% String code = request.getParameter("code"); %>
<p id="msg-response" hidden><%= !StringUtils.isNullOrEmpty(code) ? HandlerCode.convertCodeToString(Integer.parseInt(code)) : "Something when wrong" %></p>
</body>

<% if (!StringUtils.isNullOrEmpty(code)) { %>
<SCRIPT language="JavaScript">
    let msg = document.getElementById("msg-response").textContent;
    alert(msg)
</SCRIPT>
<% } %>
</html>
