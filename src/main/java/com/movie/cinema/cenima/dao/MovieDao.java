package com.movie.cinema.cenima.dao;

import com.movie.cinema.cenima.entity.Movie;
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

public class MovieDao {

    private final Connection conn;

    public MovieDao() {
        this.conn = ConnectionHelper.getConn();
    }

    public boolean create(Movie movie) {
        String query = "Insert into movies (id, name, image, duration, description, coming_soon, status, create_date, update_date) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        boolean check = false;
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, movie.getId());
            ps.setString(2, movie.getName());
            ps.setString(3, movie.getImage());
            ps.setInt(4, movie.getDuration());
            ps.setString(5, movie.getDescription());
            ps.setLong(6, movie.getComingSoon());
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

    public List<Movie> getAll() {
        String query = "select * from movies";
        List<Movie> movies = new ArrayList<>();
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Movie movie = Movie.MovieBuilder.aMovie()
                        .withId(rs.getString(1))
                        .withName(rs.getNString(2))
                        .withImage(rs.getString(3))
                        .withDuration(rs.getInt(4))
                        .withDescription(rs.getNString(5))
                        .withComingSoon(rs.getLong(6))
                        .withDeleteDate(rs.getLong(7))
                        .withUpdateDate(rs.getLong(8))
                        .withCreateDate(rs.getLong(9))
                        .withStatus(rs.getInt(10))
                        .build();
                movies.add(movie);
            }
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movies;
    }

    public Movie getById(String id) {
        String query = "select * from movies where id = ?";
        Movie movie = null;
        try {
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                movie = Movie.MovieBuilder.aMovie()
                        .withId(rs.getString(1))
                        .withName(rs.getNString(2))
                        .withImage(rs.getString(3))
                        .withDuration(rs.getInt(4))
                        .withDescription(rs.getNString(5))
                        .withComingSoon(rs.getLong(6))
                        .withDeleteDate(rs.getLong(7))
                        .withUpdateDate(rs.getLong(8))
                        .withCreateDate(rs.getLong(9))
                        .withStatus(rs.getInt(10))
                        .build();
            }
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movie;
    }
}
