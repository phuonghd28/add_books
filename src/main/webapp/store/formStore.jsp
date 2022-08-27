<%@ page import="com.movie.cinema.cenima.dao.RoomDao" %>
<%@ page import="com.movie.cinema.cenima.entity.Room" %>
<%@ page import="java.util.List" %>
<%@ page import="com.movie.cinema.cenima.dao.MovieDao" %>
<%@ page import="com.movie.cinema.cenima.entity.Movie" %>
<%@ page import="com.movie.cinema.cenima.util.HandlerDate" %>
<%@ page import="com.mysql.cj.util.StringUtils" %>
<%@ page import="com.movie.cinema.cenima.util.HandlerCode" %>
<%@ page import="com.movie.cinema.cenima.entity.Cinema" %>
<%@ page import="com.movie.cinema.cenima.dao.CinemaDao" %>
<%@ page import="com.movie.cinema.cenima.entity.Account" %>
<%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 8/15/2022
  Time: 8:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String movieId = request.getParameter("movie_id");
    RoomDao roomDao = new RoomDao();
    MovieDao movieDao = new MovieDao();
    CinemaDao cinemaDao = new CinemaDao();
    List<Cinema> cinemas = cinemaDao.getAll();
    Movie movie = null;
    List<Room> rooms = roomDao.getAll();
    if (movieId != null) {
        movie = movieDao.getById(movieId);
    }
    assert movie != null;
    Account account = (Account) session.getAttribute("account");
%>
<%
    if (account != null) {
%>
<html>
<head>
    <title>Store</title>
    <link rel="stylesheet" href="../asset/css/main.css">
</head>
<body>
<div class="main-store">
    <div class="fist_div">
        <form action="createStore.jsp" method="post">
            <h2>Tạo mới suất chiếu</h2>
            <div class="container">
                <%
                    if (movie != null) {%>
                <input name="coming_soon_movie" type="hidden" value="<%= movie.getComingSoon()%>">
                <input name="movie_id" type="hidden" value="<%= movie.getId()%>">
                <%
                    }
                %>
                <label><b>Giá vé (Vnđ): </b></label>
                <label>
                    <input type="number" placeholder="Enter Unit price" name="unit_price" required>
                </label>

                <label><b>Thời gian chiếu:</b></label>
                <div>
                    <input type="datetime-local" name="show_time" class="input_local_datetime" required>
                </div>

                <label><b>Rạp chiếu: </b></label>
                <div>
                    <select name="cinema_id" id="select_cinema">
                        <option>Vui lòng chọn rạp chiếu phim</option>
                        <% if (cinemas.size() > 0) {
                            for (Cinema cinema : cinemas) { %>
                        <option value="<%= cinema.getId()%>"><%= cinema.getName()%>
                        </option>
                        <%
                            }
                        } else {
                        %>
                        <option>Something when wrong</option>
                        <%}%>
                    </select>
                </div>

                <label><b>Phòng: </b></label>
                <div>
                    <select name="room_id" id="select_cinema_form_room" disabled>
                        <option>Vui lòng chọn phòng</option>
                        <% if (rooms.size() > 0) {
                            for (Room room : rooms) { %>
                        <option class="option-room" value="<%= room.getId()%>"
                                data-seat="<%= room.getTotalSeat()%>"
                                data-cinema_id="<%= room.getCinemaId() %>"
                        ><%= room.getName()%>
                        </option>
                        <%
                            }
                        } else {
                        %>
                        <option>Something when wrong</option>
                        <%}%>
                    </select>
                </div>
                <label><b>Tổng số ghế hiện có trong phòng:</b></label>
                <label>
                    <input type="text" value="" id="total_seat-1" disabled>
                    <input type="hidden" value="" name="total_seat" id="total_seat-2">
                    <input type="hidden" value="<%= movie.getDuration()%>" name="duration">
                </label>

                <label><b>Tổng số vé bán:</b></label>
                <div>
                    <input type="number" placeholder="Tổng số lượng vé không được lớn hơn tổng số ghế"
                           name="total_ticket" required>
                </div>
                <button type="submit">Tạo mới</button>
                <button type="reset">Reset</button>
            </div>
            <div class="login_link">
                Bấm <a href="../home/homeCinema.jsp">vào đây</a> để quay lại trang chủ.
            </div>
        </form>
    </div>
    <div class="second_div_store">
        <% if (movie != null) {%>
        <div class="store_movie_image">
            <img src="<%= movie.getImage()   %>" alt="Sandwich" style="width: 100%">
        </div>
        <div class="store_movie_content">
            <h3><%= movie.getName() %>
            </h3>
            <p><span>Coming soon:</span> <%= HandlerDate.convertLongToLocalDate(movie.getComingSoon())%>
            </p>
            <p><span>Duration:</span> <%= HandlerDate.convertMinuteToHour(movie.getDuration()) %>
            </p>

            <p><%= movie.getDescription()%>
            </p>

            <%} else {%>
            <p>Something when wrong!</p>
            <%}%>
        </div>
    </div>
</div>
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
<script src="../asset/js/jquery-3.6.0.min.js"></script>
<script>
    let select_cinema = $("#select_cinema");
    let option_room = $(".option-room");
    let select_room = $("#select_cinema_form_room");

    $(document).on('change', '#select_cinema', function () {
        let htmlOption = null;
        select_room.prop('disabled', false)
        option_room.each(function () {
            let cinema_id = $(this).data('cinema_id');
            let seat = $(this).data('seat');
            let value = $(this).val();
            let name = $(this).text();
            if (select_cinema.val() === cinema_id) {
                htmlOption += renderOption(value, seat, cinema_id, name);
            }
        })
        if (htmlOption === null) {
            htmlOption = '<option>Không có phòng tại rạp chiếu này.</option>';
            select_room.html(htmlOption)
        } else {
            select_room.html('<option>Vui lòng chọn phòng chiếu phim.</option>' + htmlOption);
        }

    })

    function renderOption(value, seat, cinema_id, name) {
        return '<option class="option-room" value="' + value + '" data-seat="' + seat + '" data-cinema_id="' + cinema_id + '">' + name + '</option>';
    }
</script>
<script>
    let select_cinema_form_room = document.getElementById("select_cinema_form_room")
    let total_seat = document.getElementById("total_seat-1")
    let total_seat_2 = document.getElementById("total_seat-2")
    select_cinema_form_room.addEventListener("change", function (event) {
        let value = event.target.options[event.target.selectedIndex].dataset.seat;
        total_seat.value = value;
        total_seat_2.value = value;
    })
</script>
</html>
<% } else { %>
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
<% } %>