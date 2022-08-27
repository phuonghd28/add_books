<%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 8/15/2022
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Movie</title>
    <link rel="stylesheet" href="../asset/css/main.css">
</head>
<body>

<div class="main">
    <form action="createMovie.jsp" method="post">
        <h2>Create Movie</h2>
        <div class="container">
            <div>
                <label><b>Name:</b></label>
                <label>
                    <input type="text" placeholder="Enter name" name="name" required>
                </label>
            </div>
            <div>
                <label><b>Image:</b></label>
                <label>
                    <input type="text" placeholder="Enter link image" name="image" required>
                </label>
            </div>
            <div>
                <label><b>Duration(m):</b></label>
                <label>
                    <input type="text" placeholder="Enter Duration" name="duration" required>
                </label>
            </div>
            <div>
                <label><b>Coming Soon:</b></label>
                <label>
                    <input type="date" placeholder="Enter Coming Soon" name="comingsoon" required>
                </label>
            </div>
            <div>
                <div><label><b>Description:</b></label></div>
                <div><label>
                    <textarea name="description" cols="90" rows="10"></textarea>
                </label></div>
            </div>

            <button type="submit">Tạo</button>
            <button type="reset">Reset</button>

            <div class="login_link">
                Nhấn <a href="../home/homeCinema.jsp"><b>vào đây</b></a> để về trang chủ.
            </div>
        </div>
    </form>
</div>
</body>
<% String msg = request.getParameter("msg"); %>

<% if (msg != null && msg.equals("1")) { %>
<SCRIPT language="JavaScript">
    alert("Tạo mới phim thành công.")
</SCRIPT>
<% } else if (msg != null && msg.equals("0")) { %>
<SCRIPT language="JavaScript">
    alert("Tạo mới phim thất bại.")
</SCRIPT>
<% } %>
</html>
