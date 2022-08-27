<%@ page import="com.mysql.cj.util.StringUtils" %>
<%@ page import="com.movie.cinema.cenima.util.HandlerCode" %><%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 8/15/2022
  Time: 12:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="../asset/css/main.css">
</head>
<body>
<div class="main-register">
    <form action="doRegister.jsp" method="post">
        <h2>Register</h2>
        <div class="container">
            <label><b>Username</b></label>
            <label>
                <input type="text" placeholder="Enter Username" name="username" required>
            </label>

            <label><b>Password</b></label>
            <label>
                <input type="password" placeholder="Enter Password" name="password" required>
            </label>

            <button type="submit">Register</button>
            <button type="reset">Reset</button>
        </div>
        <div class="login_link">
            Bạn đã có tài khoản vui lòng <a href="../login/formLogin.jsp">Login</a>
        </div>
        <div class="login_link">
            Bấm<a href="../home/homeCinema.jsp"> vào đây</a> để quay lại trang chủ
        </div>
    </form>
</div>
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
