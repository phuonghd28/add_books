<%@ page import="com.movie.cinema.cenima.entity.Room" %>
<%@ page import="java.util.UUID" %>
<%@ page import="com.movie.cinema.cenima.dao.RoomDao" %><%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 8/15/2022
  Time: 8:44 PM
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
    String total_seat = request.getParameter("total_seat");
    String cinema_id = request.getParameter("cinema_id");

    Room room = Room.RoomBuilder.aRoom()
            .withId(UUID.randomUUID().toString())
            .withName(name)
            .withTotalSeat(Integer.parseInt(total_seat))
            .withCinemaId(cinema_id)
            .build();

    RoomDao roomDao = new RoomDao();

    if (roomDao.create(room)) {
        response.sendRedirect("formRoom.jsp?code=200");
    } else {
        response.sendRedirect("formRoom.jsp?code=500");
    }
%>
</body>
</html>
