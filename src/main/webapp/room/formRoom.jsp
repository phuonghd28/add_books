<%@ page import="java.util.List" %>
<%@ page import="com.movie.cinema.cenima.entity.Cinema" %>
<%@ page import="com.movie.cinema.cenima.dao.CinemaDao" %>
<%@ page import="com.mysql.cj.util.StringUtils" %>
<%@ page import="com.movie.cinema.cenima.util.HandlerCode" %>
<%@ page import="com.movie.cinema.cenima.entity.Account" %><%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 8/15/2022
  Time: 8:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    CinemaDao cinemaDao = new CinemaDao();
    List<Cinema> cinemas = cinemaDao.getAll();
    Account account = (Account) session.getAttribute("account");
%>
<% if (account != null){%>
<html>
<head>
    <title>Room Create</title>
    <link rel="stylesheet" href="../asset/css/main.css">
</head>
<body>
<div class="main">
    <form action="createRoom.jsp" method="post">
        <h2>Create Room</h2>
        <div class="container">
            <label><b>Name</b></label>
            <label>
                <input type="text" placeholder="Enter Name" name="name" required>
            </label>
            <label><b>Total Seat</b></label>
            <label>
                <input type="text" placeholder="Enter Total Seat" name="total_seat" required>
            </label>
            <label><b>Cinema</b></label>
            <div>
                <select name="cinema_id" id="select_cinema_form_room">
                    <% if (cinemas.size() > 0) {
                        for (Cinema c : cinemas) { %>
                    <option value="<%= c.getId()%>"><%= c.getName()%>
                    </option>
                    <%
                        }
                    } else {
                    %>
                    <option>Something when wrong</option>
                    <%}%>
                </select>
            </div>

            <button type="submit">Create</button>
            <button type="reset">Reset</button>
        </div>
        <div class="login_link">
            Bấm <a href="../home/homeCinema.jsp">vào đây</a> để quay lại trang chủ.
        </div>
    </form>
</div>
</body>
<% String code = request.getParameter("code"); %>
<p id="msg-response"
   hidden><%= !StringUtils.isNullOrEmpty(code) ? HandlerCode.convertCodeToString(Integer.parseInt(code)) : "Something when wrong" %>
</p>
</body>

<% if (!StringUtils.isNullOrEmpty(code)) { %>
<SCRIPT language="JavaScript">
    let msg = document.getElementById("msg-response").textContent;
    alert(msg)
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

