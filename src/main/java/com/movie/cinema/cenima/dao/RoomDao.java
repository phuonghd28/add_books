package com.movie.cinema.cenima.dao;

import com.movie.cinema.cenima.entity.Room;
import com.movie.cinema.cenima.enums.Status;
import com.movie.cinema.cenima.util.ConnectionHelper;
import com.movie.cinema.cenima.util.HandlerDate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class RoomDao {

    private final Connection conn;

    public RoomDao() {
        this.conn = ConnectionHelper.getConn();
    }

    public boolean create(Room room) {
        String query = "Insert into rooms (id, name, total_seat, cinema_id, status, create_date, update_date) values (?, ?, ?, ?, ?, ?, ?)";
        boolean check = false;
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, room.getId());
            ps.setString(2, room.getName());
            ps.setInt(3, room.getTotalSeat());
            ps.setString(4, room.getCinemaId());
            ps.setInt(5, Status.ACTIVE.getValue());
            ps.setLong(6, HandlerDate.convertLocalDateTimeToLong(LocalDateTime.now()));
            ps.setLong(7, HandlerDate.convertLocalDateTimeToLong(LocalDateTime.now()));
            check = ps.executeUpdate() > 0;
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return check;
    }

    public List<Room> getAll() {
        String query = "select * from rooms";
        List<Room> rooms = new ArrayList<>();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Room room = Room.RoomBuilder.aRoom()
                        .withId(rs.getString(1))
                        .withName(rs.getNString(2))
                        .withTotalSeat(rs.getInt(3))
                        .withCinemaId(rs.getString(4))
                        .withDeleteDate(rs.getLong(5))
                        .withUpdateDate(rs.getLong(6))
                        .withCreateDate(rs.getLong(7))
                        .withStatus(rs.getInt(8))
                        .build();
                System.out.println(room);
                rooms.add(room);
            }
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rooms;
    }

    public List<Room> getByCinemaId(String cinemaId) {
        String query = "select * from rooms where cinema_id = ?";
        List<Room> rooms = new ArrayList<>();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, cinemaId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Room room = Room.RoomBuilder.aRoom()
                        .withId(rs.getString(1))
                        .withName(rs.getNString(2))
                        .withTotalSeat(rs.getInt(3))
                        .withCinemaId(rs.getString(4))
                        .withDeleteDate(rs.getLong(5))
                        .withUpdateDate(rs.getLong(6))
                        .withCreateDate(rs.getLong(7))
                        .withStatus(rs.getInt(8))
                        .build();
                System.out.println(room);
                rooms.add(room);
            }
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rooms;
    }
}
