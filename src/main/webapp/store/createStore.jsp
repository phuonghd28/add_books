<%@ page import="com.movie.cinema.cenima.entity.Store" %>
<%@ page import="java.util.UUID" %>
<%@ page import="com.movie.cinema.cenima.util.HandlerDate" %>
<%@ page import="com.movie.cinema.cenima.dao.StoreDao" %>
<%@ page import="com.mysql.cj.util.StringUtils" %>
<%@ page import="java.time.LocalDateTime" %><%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 8/15/2022
  Time: 8:41 PM
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

    String unit_price = request.getParameter("unit_price");
    String show_time_request = request.getParameter("show_time");
    String room_id = request.getParameter("room_id");
    String total_ticket = request.getParameter("total_ticket");
    String total_seat = request.getParameter("total_seat");
    String duration_request = request.getParameter("duration");
    String coming_soon_movie = request.getParameter("coming_soon_movie");
    String movie_id = request.getParameter("movie_id");
    boolean check = StringUtils.isNullOrEmpty(unit_price)
            && StringUtils.isNullOrEmpty(show_time_request)
            && StringUtils.isNullOrEmpty(room_id)
            && StringUtils.isNullOrEmpty(movie_id)
            && StringUtils.isNullOrEmpty(total_ticket);
    Store room = null;
    try {
        // validate
        if (check) {
            response.sendRedirect("formStore.jsp?code=1301&movie_id=" + movie_id);
            return;
        }
        // kiểm tra số lượng vé bán phải nhỏ hơn số ghế có trong phòng
        if (!(Integer.parseInt(total_ticket) < Integer.parseInt(total_seat))) {
            response.sendRedirect("formStore.jsp?code=1303&movie_id=" + movie_id);
            return;
        }

        LocalDateTime comingSoonMovie = HandlerDate.convertLongToLocalDateTime(Long.parseLong(coming_soon_movie));
        // thời gian chiếu phim
        LocalDateTime showTime = LocalDateTime.parse(show_time_request);

        // kiểm tra thời gian chiếu phim với ngày hiện tại phải lơn hơn 1 ngày và
        // thời gian chiếu phim phải lớn hơn ngày công chiếu 1 ngày.
        boolean checkTime = HandlerDate.compareWithCurrentDate(showTime.plusDays(1))
                && HandlerDate.compareTwoLocalDateTime(showTime, comingSoonMovie.plusDays(1));
        if (!checkTime) {
            response.sendRedirect("formStore.jsp?code=1302&movie_id=" + movie_id);
            return;
        }

        StoreDao storeDao = new StoreDao();
        Long start = HandlerDate.convertLocalDateTimeToLong(showTime.minusHours(Long.parseLong(duration_request) + 30));
        Long end = HandlerDate.convertLocalDateTimeToLong(showTime.plusMinutes(Long.parseLong(duration_request) + 30));
        boolean checkConflict = !storeDao.checkShowTimeConflict(start, end, room_id);
        if (!checkConflict) {
            response.sendRedirect("formStore.jsp?code=1304&movie_id=" + movie_id);
            return;
        }

        room = Store.StoreBuilder.aStore()
                .withId(UUID.randomUUID().toString())
                .withUnitPrice(Double.parseDouble(unit_price))
                .withRoomId(room_id)
                .withMovieId(movie_id)
                .withShowTime(HandlerDate.convertLocalDateTimeToLong(showTime))
                .withTotalTicket(Integer.parseInt(total_ticket))
                .build();


        if (storeDao.create(room)) {
            response.sendRedirect("formStore.jsp?code=200&movie_id=" + movie_id);
        } else {
            response.sendRedirect("formStore.jsp?code=500&movie_id=" + movie_id);
        }
        return;
    } catch (Exception e) {
        response.sendRedirect("formStore.jsp?code=500&movie_id=" + movie_id);
    }

%>
</body>
</html>
