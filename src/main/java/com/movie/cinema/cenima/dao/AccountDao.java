package com.movie.cinema.cenima.dao;

import com.movie.cinema.cenima.entity.Account;
import com.movie.cinema.cenima.enums.Status;
import com.movie.cinema.cenima.util.ConnectionHelper;
import com.movie.cinema.cenima.util.HandlerDate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;

public class AccountDao {

    private final Connection conn;

    public AccountDao() {
        this.conn = ConnectionHelper.getConn();
    }


    public boolean register(Account account) {
        String query = "Insert into accounts (id, username, password, status, create_date, update_date) values (?, ?, ?, ?, ?, ?)";
        boolean check = false;
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, account.getId());
            ps.setString(2, account.getUsername());
            ps.setString(3, account.getPassword());
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

    public boolean login(Account account) {
        String query = "Select * FROM accounts WHERE username = ? AND password = ?";
        boolean check = false;
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, account.getUsername());
            ps.setString(2, account.getPassword());
            ResultSet rs = ps.executeQuery();
            check = rs.next();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return check;
    }
}
