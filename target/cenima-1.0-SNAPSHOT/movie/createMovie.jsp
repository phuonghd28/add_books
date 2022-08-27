<%@ page import="com.movie.cinema.cenima.entity.Movie" %>
<%@ page import="com.movie.cinema.cenima.dao.MovieDao" %>
<%@ page import="java.util.UUID" %>
<%@ page import="com.movie.cinema.cenima.util.HandlerDate" %><%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 8/15/2022
  Time: 3:20 PM
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
    String image = request.getParameter("image");
    String duration = request.getParameter("duration");
    String description = request.getParameter("description");
    String coming_soon = request.getParameter("comingsoon");
    Long comingSoonLong = HandlerDate.convertLocalDateToLong(HandlerDate.convertStringToLocalDate(coming_soon));
    Movie movie = Movie.MovieBuilder.aMovie()
            .withId(UUID.randomUUID().toString())
            .withName(name)
            .withDuration(Integer.parseInt(duration))
            .withComingSoon(comingSoonLong)
            .withImage(image)
            .withDescription(description)
            .build();

    MovieDao movieDao = new MovieDao();

    if (movieDao.create(movie)) {
        response.sendRedirect("formMovie.jsp?msg=1");
    } else {
        response.sendRedirect("formMovie.jsp?msg=0");
    }
%>
</body>
</html>
