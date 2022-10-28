package com.abdelkrim.sgb.DAO;

import java.sql.*;

public class SQLSession {

    private Connection connection;

    public SQLSession() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/sgb_db?useTimeZone=true&serverTimezone=UTC&autoReconnect=true&useSSL=false", "root", "toor");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Connection getConnection() {
        return connection;
    }

    public void close() {
        try {
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
