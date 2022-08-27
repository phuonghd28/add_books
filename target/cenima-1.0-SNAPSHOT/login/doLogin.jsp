<%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 8/15/2022
  Time: 11:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@page language="java" import="java.util.*, java.awt.*"%>
<%@ page import="com.movie.cinema.cenima.entity.Account" %>
<%@ page import="com.movie.cinema.cenima.dao.AccountDao" %>
<%@ page import="com.mysql.cj.Session" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");

    String username = request.getParameter("username");
    String password = request.getParameter("password");

    Account account = Account.AccountBuilder.anAccount()
            .withUsername(username)
            .withPassword(password)
            .build();

    AccountDao accountDao = new AccountDao();
    if (accountDao.login(account)) {
        session.setAttribute("account", account);
        response.sendRedirect("../home/homeCinema.jsp?code=200");
    } else {
        response.sendRedirect("formLogin.jsp?code=400");
    }
%>
</body>
</html>
