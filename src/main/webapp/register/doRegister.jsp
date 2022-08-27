<%@ page import="com.movie.cinema.cenima.entity.Account" %>
<%@ page import="java.util.UUID" %>
<%@ page import="com.movie.cinema.cenima.dao.AccountDao" %><%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 8/15/2022
  Time: 12:41 PM
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

    String username = request.getParameter("username");
    String password = request.getParameter("password");

    Account account = Account.AccountBuilder.anAccount()
            .withId(UUID.randomUUID().toString())
            .withUsername(username)
            .withPassword(password)
            .build();
    session.setAttribute("account", account);

    AccountDao accountDao = new AccountDao();

    if (accountDao.register(account)) {
        response.sendRedirect("formRegister.jsp?code=200");
    } else {
        response.sendRedirect("formRegister.jsp?code=500");
    }
%>
</body>
</html>
