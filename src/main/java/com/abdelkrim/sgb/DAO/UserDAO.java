package com.abdelkrim.sgb.DAO;

import com.abdelkrim.sgb.Models.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    private SQLSession session;
    private Connection connection;

    public UserDAO() {
        session = new SQLSession();
        connection = session.getConnection();
    }

    public void close() {
        session.close();
    }

    public void save(User user) {
        String q = "INSERT INTO utilisateurs (username, password) VALUES (?, ?)";

        PreparedStatement statement;

        try {
            statement = connection.prepareStatement(q);
            statement.setString(1, user.username);
            statement.setString(2, user.password);
            statement.executeUpdate();
            statement.close();
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(int id, User user) {
        String q = "UPDATE utilisateurs SET username = ?, password = ? WHERE id = ?";

        PreparedStatement statement;

        try {
            statement = connection.prepareStatement(q);
            statement.setString(1, user.username);
            statement.setString(2, user.password);
            statement.setInt(3, id);
            statement.executeUpdate();
            statement.close();
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String q = "DELETE FROM utilisateurs WHERE id = ?";

        PreparedStatement statement;

        try {
            statement = connection.prepareStatement(q);
            statement.setInt(1, id);
            statement.executeUpdate();
            statement.close();
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public User getById(int id) {
        String q = "SELECT id, username, password FROM utilisateurs WHERE id = ?";

        User user = null;
        PreparedStatement statement;
        ResultSet result;

        try {
            statement = connection.prepareStatement(q);
            statement.setInt(1, id);
            result = statement.executeQuery();

            if (result.next()) {
                user = new User();
                user.id = result.getInt("id");
                user.username = result.getString("username");
                user.password = result.getString("password");
            }

            result.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    public List<User> getAll() {
        String q = "SELECT id, username, password FROM utilisateurs";

        List<User> users = new ArrayList<>();
        PreparedStatement statement;
        ResultSet result;

        try {
            statement = connection.prepareStatement(q);
            result = statement.executeQuery();

            while (result.next()) {
                User user = new User();
                user.id = result.getInt("id");
                user.username = result.getString("username");
                user.password = result.getString("password");
                users.add(user);
            }

            result.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }

    public int getCountAll() {
        String q = "SELECT count(*) AS count FROM utilisateurs";

        int res = 0;
        Statement statement;
        ResultSet result;

        try {
            statement = connection.createStatement();
            result = statement.executeQuery(q);

            if (result.next()) {
                res = result.getInt("count");
            }

            result.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return res;
    }

    public boolean isValid(String username, String password) {
        String q = "SELECT count(*) > 0 AS isValid FROM utilisateurs WHERE username = ? AND password = ?";

        boolean b = false;
        PreparedStatement statement;
        ResultSet result;

        try {
            statement = connection.prepareStatement(q);

            statement.setString(1, username);
            statement.setString(2, password);

            result = statement.executeQuery();

            if (result.next()) {
                b = result.getBoolean("isValid");
            }

            result.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return b;
    }

}
