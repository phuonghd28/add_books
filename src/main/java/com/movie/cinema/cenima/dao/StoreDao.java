package com.movie.cinema.cenima.dao;

import com.movie.cinema.cenima.entity.Store;
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

public class StoreDao {

    private final Connection conn;
    private boolean check;

    public StoreDao() {
        conn = ConnectionHelper.getConn();
        check = false;
    }

    public boolean create(Store store) {
        String query = "Insert into store" +
                " (id, movie_id, room_id, total_ticket, unit_price, show_time, status, create_date, update_date)" +
                " values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, store.getId());
            ps.setString(2, store.getMovieId());
            ps.setString(3, store.getRoomId());
            ps.setInt(4, store.getTotalTicket());
            ps.setDouble(5, store.getUnitPrice());
            ps.setLong(6, store.getShowTime());
            ps.setInt(7, Status.ACTIVE.getValue());
            ps.setLong(8, HandlerDate.convertLocalDateTimeToLong(LocalDateTime.now()));
            ps.setLong(9, HandlerDate.convertLocalDateTimeToLong(LocalDateTime.now()));
            check = ps.executeUpdate() > 0;
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return check;
    }

    public List<Store> getAll() {
        String query = "select * from store";
        List<Store> stores = new ArrayList<>();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Store store = Store.StoreBuilder.aStore()
                        .withId(rs.getString(1))
                        .withMovieId(rs.getNString(2))
                        .withRoomId(rs.getString(3))
                        .withTotalTicket(rs.getInt(4))
                        .withUnitPrice(rs.getDouble(5))
                        .withShowTime(rs.getLong(6))
                        .withStatus(rs.getInt(7))
                        .withUpdateDate(rs.getLong(8))
                        .withCreateDate(rs.getLong(9))
                        .withDeleteDate(rs.getLong(10))
                        .build();
                stores.add(store);
            }
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stores;
    }

    public boolean checkShowTimeConflict(Long start, Long end, String roomId) {
        String query = "select * from store where (show_time between ? and ?) and room_id = ?";
        boolean check = false;
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setLong(1, start);
            ps.setLong(2, end);
            ps.setString(3, roomId);
            ResultSet rs = ps.executeQuery();
            check = rs.next();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return check;
    }
}
