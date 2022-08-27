<%@ page import="com.mysql.cj.util.StringUtils" %>
<%@ page import="com.movie.cinema.cenima.util.HandlerCode" %>
<%@ page import="com.movie.cinema.cenima.util.HandlerDate" %>
<%@ page import="java.util.List" %>
<%@ page import="com.movie.cinema.cenima.dao.MovieDao" %>
<%@ page import="com.movie.cinema.cenima.dao.RoomDao" %>
<%@ page import="com.movie.cinema.cenima.dao.CinemaDao" %>
<%@ page import="com.movie.cinema.cenima.dao.StoreDao" %>
<%@ page import="com.movie.cinema.cenima.entity.*" %><%--
  Created by IntelliJ IDEA.
  User: hoang
  Date: 8/16/2022
  Time: 1:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String movieId = request.getParameter("movie_id");
    RoomDao roomDao = new RoomDao();
    CinemaDao cinemaDao = new CinemaDao();
    MovieDao movieDao = new MovieDao();
    StoreDao storeDao = new StoreDao();

    List<Store> stores = storeDao.getAll();
    List<Cinema> cinemas = cinemaDao.getAll();

    Movie movie = null;
    List<Room> rooms = roomDao.getAll();

    if (movieId != null) {
        movie = movieDao.getById(movieId);
    }
    Account account = (Account) session.getAttribute("account");
%>
<%
    if (account != null) {
%>
<html>
<head>
    <title>Sell Ticket</title>
    <link rel="stylesheet" href="../asset/css/main.css">
</head>
<body>
<div class="main-store">
    <div class="fist_div">
        <form action="createStore.jsp" method="post">
            <h2>Bán vé</h2>
            <div class="container">
                <%
                    if (movie != null) {%>
                <input name="coming_soon_movie" type="hidden" value="<%= movie.getComingSoon()%>">
                <input name="movie_id" type="hidden" value="<%= movie.getId()%>">
                <%
                    }
                %>
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

                <label><b>Danh sách thời gian chiếu phim: </b></label>
                <div>
                    <select name="store_id" id="select_store">
                        <option>Vui lòng chọn thời gian</option>
                        <% if (stores.size() > 0) { %>
                        <% for (Store store : stores) { %>
                        <option class="option-store" value="<%= store.getId()%>"
                                data-room_id="<%= store.getRoomId()%>"
                                data-unit_price="<%= store.getUnitPrice()%>"

                        >
                            <%= HandlerDate.convertLongToLocalDateTime(store.getShowTime())%>
                        </option>
                        <%}%>
                        <%} else {%>
                        <option>Something when wrong</option>
                        <%}%>
                    </select>
                </div>


                <label><b>Giá vé (Vnđ): </b></label>
                <label>
                    <input type="number" id="unit_price" name="unit_price" disabled>
                </label>

                <label><b>Tổng số ghế hiện có trong phòng:</b></label>
                <label>
                    <input type="text" value="" id="total_seat-1" disabled>
                    <input type="hidden" value="" name="total_seat" id="total_seat-2">
                    <%if (movie != null) {%>
                    <input type="hidden" value="<%= movie.getDuration()%>" name="duration">
                    <%}%>
                </label>

                <label><b>Tổng số vé bán:</b></label>
                <div>
                    <input type="number" placeholder="Tổng số lượng vé không được lớn hơn tổng số ghế"
                           name="total_ticket" required>
                </div>
                <button type="submit">Bán</button>
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
        let htmlOptionRoom = null;
        select_room.prop('disabled', false)
        option_room.each(function () {
            let cinema_id = $(this).data('cinema_id');
            let seat = $(this).data('seat');
            let value = $(this).val();
            let name = $(this).text();
            if (select_cinema.val() === cinema_id) {
                htmlOptionRoom += renderOptionRoom(value, seat, cinema_id, name);
            }
        })
        if (htmlOptionRoom === null) {
            htmlOptionRoom = '<option>Không có phòng tại rạp chiếu này.</option>';
            select_room.html(htmlOptionRoom)
        } else {
            select_room.html('<option>Vui lòng chọn phòng chiếu phim.</option>' + htmlOptionRoom);
        }

    })

    function renderOptionRoom(value, seat, cinema_id, name) {
        return '<option class="option-room" value="' + value + '" data-seat="' + seat + '" data-cinema_id="' + cinema_id + '">' + name + '</option>';
    }
</script>
<script>
    let select_cinema_form_room = document.getElementById("select_cinema_form_room")
    let total_seat = document.getElementById("total_seat-1")
    let total_seat_2 = document.getElementById("total_seat-2")
    let form_time_store = document.getElementById("form-time-store")

    let option_store = $(".option-store");
    let select_store = $("#select_store");
    let unit_price = $("#unit_price");

    select_cinema_form_room.addEventListener("change", function (event) {
        let value = event.target.options[event.target.selectedIndex].dataset.seat;
        total_seat.value = value;
        total_seat_2.value = value;
        let roomId = select_cinema_form_room.value;
        let htmlOptionStore = null;
        option_store.each(function () {
            let data_roomId = $(this).data('room_id');
            let unit_price = $(this).data('unit_price');
            let value = $(this).val();
            let name = $(this).text();
            if (roomId === data_roomId) {
                htmlOptionStore += renderOptionStore(value, data_roomId, name, unit_price);
            }
        })

        if (htmlOptionStore === null) {
            htmlOptionStore = '<option>Không có xuất chiếu tại phòng này.</option>';
            select_store.html(htmlOptionStore)
        } else {
            select_store.html('<option>Vui lòng chọn thời gian xem phim.</option>' + htmlOptionStore);
        }
    })

    $(document).on('change', '#select_store', function () {
        let unitPrice = $(this).find(':selected').attr('data-unit_price');
        unit_price.val(unitPrice)
    })

    function renderOptionStore(value, room_id, name, unit_price) {
        return '<option class="option-store" value="' + value + '" data-room_id="' + room_id + '" data-unit_price="' + unit_price + '" >' + name + '</option>';
    }
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
