package com.movie.cinema.cenima.dao;

import com.movie.cinema.cenima.entity.Cinema;
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

public class CinemaDao {

    Connection conn = null;

    public CinemaDao() {
        conn = ConnectionHelper.getConn();
    }

    public boolean create(Cinema cinema) {
        String query = "Insert into cinema (id, name, address, status, create_date, update_date) values (?, ?, ?, ?, ?, ?)";
        boolean check = false;
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, cinema.getId());
            ps.setString(2, cinema.getName());
            ps.setString(3, cinema.getAddress());
            ps.setInt(4, Status.ACTIVE.getValue());
            ps.setLong(5, HandlerDate.convertLocalDateTimeToLong(LocalDateTime.now()));
            ps.setLong(6, HandlerDate.convertLocalDateTimeToLong(LocalDateTime.now()));
            check = ps.executeUpdate() > 0;
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return check;
    }

    public List<Cinema> getAll() {
        String query = "select * from cinema";
        List<Cinema> cinemas = new ArrayList<>();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cinema cinema = Cinema.CinemaBuilder.aCinema()
                        .withId(rs.getString(1))
                        .withName(rs.getNString(2))
                        .withAddress(rs.getNString(3))
                        .withDeleteDate(rs.getLong(4))
                        .withUpdateDate(rs.getLong(5))
                        .withCreateDate(rs.getLong(6))
                        .withStatus(rs.getInt(7))
                        .build();
                cinemas.add(cinema);
            }
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cinemas;
    }
}
