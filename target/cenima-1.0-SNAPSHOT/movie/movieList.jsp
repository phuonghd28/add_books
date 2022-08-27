<%@ page import="com.movie.cinema.cenima.dao.MovieDao" %>
<%@ page import="com.movie.cinema.cenima.entity.Account" %>
<%@ page import="com.movie.cinema.cenima.entity.Movie" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 8/16/2022
  Time: 9:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Account account = (Account) session.getAttribute("account");
%>
<% if (account!= null){%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
    <link rel="stylesheet" href="../asset/css/main.css">
    <style>
        body, h1, h2, h3, h4, h5, h6 {
            font-family: "Karma", sans-serif
        }

        .w3-bar-block .w3-bar-item {
            padding: 20px
        }

        .btn-custom-login {
            text-decoration: none;
        }
    </style>
</head>
<body>

<nav class="w3-sidebar w3-bar-block w3-card w3-top w3-xlarge w3-animate-left"
     style="display:none;z-index:2;width:40%;min-width:300px" id="mySidebar">
    <a href="javascript:void(0)" onclick="w3_close()"
       class="w3-bar-item w3-button">Close Menu</a>
    <a href="../movie/formMovie.jsp" onclick="w3_close()" class="w3-bar-item w3-button">Create Movie</a>
    <a href="../room/formRoom.jsp" onclick="w3_close()" class="w3-bar-item w3-button">Create Room</a>
    <a href="../cinema/formCinema.jsp" onclick="w3_close()" class="w3-bar-item w3-button">Create Cinema</a>
</nav>


<!-- Top menu -->
<div class="w3-top">
    <div class="w3-white w3-xlarge" style="max-width:1200px;margin:auto">

        <div class="w3-center w3-padding-16">

            <div class="w3-button w3-padding-16 w3-left" onclick="w3_open()">☰</div>
            MOVIES
        </div>

    </div>
</div>

<!-- !PAGE CONTENT! -->
<div class="w3-main w3-content w3-padding" style="max-width:1200px;margin-top:100px">

    <!-- First Photo Grid-->
    <div class="w3-row-padding w3-padding-16 w3-center" id="food">
        <%
            MovieDao movieDao = new MovieDao();
            List<Movie> movies = movieDao.getAll();
            for (Movie m : movies) {
        %>
        <div class="w3-quarter">
            <img src="<%= m.getImage()   %>" alt="Sandwich" style="width:100%">
            <h3><%= m.getName() %>
            </h3>
            <p class="text-custom"><%= m.getDescription()%>
            </p>
            <% if (account != null) {%>
            <div class="btn-custom">
                <a href="../store/formStore.jsp?movie_id=<%= m.getId()%>" class="fist-btn">Create Store</a>
                <a href="../ticket/formSellTicket.jsp?movie_id=<%= m.getId()%>" class="fist-btn"
                   style="background: cadetblue">Sell Ticket</a>
            </div>
            <%}%>
        </div>
        <%
            }
        %>
    </div>

    <!-- Pagination -->
    <%--    <div class="w3-center w3-padding-32">--%>
    <%--        <div class="w3-bar">--%>
    <%--            <a href="#" class="w3-bar-item w3-button w3-hover-black">«</a>--%>
    <%--            <a href="#" class="w3-bar-item w3-black w3-button">1</a>--%>
    <%--            <a href="#" class="w3-bar-item w3-button w3-hover-black">2</a>--%>
    <%--            <a href="#" class="w3-bar-item w3-button w3-hover-black">3</a>--%>
    <%--            <a href="#" class="w3-bar-item w3-button w3-hover-black">4</a>--%>
    <%--            <a href="#" class="w3-bar-item w3-button w3-hover-black">»</a>--%>
    <%--        </div>--%>
    <%--    </div>--%>
    <hr>

    <!-- Footer -->
    <footer class="w3-row-padding w3-padding-32">
        <div class="w3-third">
            <h3>FOOTER</h3>
            <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies
                congue gravida diam non fringilla.</p>
            <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">w3.css</a></p>
        </div>
    </footer>

    <!-- End page content -->
</div>

</body>
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

