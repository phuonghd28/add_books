<%@ page import="com.movie.cinema.cenima.entity.Movie" %>
<%@ page import="com.movie.cinema.cenima.dao.MovieDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.movie.cinema.cenima.entity.Account" %><%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 8/15/2022
  Time: 2:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
<head>
    <title>W3.CSS Template</title>
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
<% Account account = (Account) session.getAttribute("account"); %>
<!-- Sidebar (hidden by default) -->

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
            <%if (account != null) {%>
            <div class="w3-button w3-padding-16 w3-left" onclick="w3_open()">☰</div>
            <%}%>
            MOVIES
            <% if (account == null) {%>
            <div class="w3-button w3-padding-16 w3-right "><a class="btn-custom-login" href="../login/formLogin.jsp">Login</a>
            </div>
            <%} else {%>
            <div class=" w3-padding-16 w3-right ">
                <span>Well come <b><%= account.getUsername()%></b></span>
                <a style="border-radius: 5px; ;color: #f1f1f1; text-decoration: none; background: #04AA6D; margin-left: 5px;"
                   class="w3-button" href="../login/logOut.jsp">Logout</a>
            </div>
            <%}%>
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
                   style="background: cadetblue">Bán vé</a>
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

<script>
    // Script to open and close sidebar
    function w3_open() {
        document.getElementById("mySidebar").style.display = "block";
    }

    function w3_close() {
        document.getElementById("mySidebar").style.display = "none";
    }
</script>

</body>
</html>

