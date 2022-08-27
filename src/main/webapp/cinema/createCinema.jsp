<%@ page import="com.movie.cinema.cenima.entity.Cinema" %>
<%@ page import="java.util.UUID" %>
<%@ page import="com.movie.cinema.cenima.dao.CinemaDao" %><%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 8/15/2022
  Time: 9:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");

    String name = request.getParameter("name");
    String address = request.getParameter("address");

    Cinema cinema = Cinema.CinemaBuilder.aCinema()
            .withId(UUID.randomUUID().toString())
            .withName(name)
            .withAddress(address)
            .build();

    CinemaDao accountDao = new CinemaDao();

    if (accountDao.create(cinema)) {
        response.sendRedirect("formCinema.jsp?msg=1");
    } else {
        response.sendRedirect("formCinema.jsp?msg=0");
    }
%>
</body>
</html>
