package com.movie.cinema.cenima.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionHelper {

    static Connection conn = null;
    public static Connection getConn(){
        String dbUrl = "jdbc:mysql://localhost:3306/cinema_db";
        String dbClass = "com.mysql.jdbc.Driver";
        try {
            if (conn == null){
                Class.forName(dbClass);
                conn = DriverManager.getConnection(dbUrl, "root", "");
            }
            return conn;
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
}
