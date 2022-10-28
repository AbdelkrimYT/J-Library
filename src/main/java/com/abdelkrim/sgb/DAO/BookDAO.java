package com.abdelkrim.sgb.DAO;

import com.abdelkrim.sgb.Models.Author;
import com.abdelkrim.sgb.Models.Book;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {

    private SQLSession session;
    private Connection connection;

    public BookDAO() {
        session = new SQLSession();
        connection = session.getConnection();
    }

    public void close() {
        session.close();
    }

    public void save(Book book) {
        String q = "INSERT INTO livres (titre, résumé, nb_pages, domaine) VALUES (?, ?, ?, ?)";

        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(q);
            statement.setString(1, book.title);
            statement.setString(2, book.resume);
            statement.setInt(3, book.numberOfPages);
            statement.setString(4, book.domain);
            statement.executeUpdate();
            statement.close();
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(int id, Book book) {
        String q = "UPDATE livres SET titre = ?, résumé = ?, nb_pages = ?, domaine = ? WHERE issn = ?";

        PreparedStatement statement = null;

        try {
            statement = connection.prepareStatement(q);
            statement.setString(1, book.title);
            statement.setString(2, book.resume);
            statement.setInt(3, book.numberOfPages);
            statement.setString(4, book.domain);
            statement.setInt(5, id);
            statement.executeUpdate();
            statement.close();
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String q = "DELETE FROM livres WHERE issn = ?";

        PreparedStatement statement = null;

        try {
            statement = connection.prepareStatement(q);
            statement.setInt(1, id);
            statement.executeUpdate();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Book getById(int id) {
        String q = "SELECT issn, titre, résumé, nb_pages, domaine FROM livres WHERE issn = ?";
        String j = "SELECT auteurs.num AS num, auteurs.nom AS nom, auteurs.prénom AS prénom, auteurs.date_de_naissance AS date_de_naissance FROM ecrit JOIN auteurs ON auteurs.num = ecrit.num WHERE issn = ?";

        PreparedStatement statement = null;
        ResultSet result = null;
        Book book = null;

        try {
            statement = connection.prepareStatement(q);
            statement.setInt(1, id);
            result = statement.executeQuery();

            if (result.next()) {
                book = new Book();
                book.id = result.getInt("issn");
                book.title = result.getString("titre");
                book.resume = result.getString("résumé");
                book.numberOfPages = result.getInt("nb_pages");
                book.domain = result.getString("domaine");

                statement = connection.prepareStatement(j);
                statement.setInt(1, id);

                result = statement.executeQuery();
                book.authors = new ArrayList<>();

                while (result.next()) {
                    Author author = new Author();
                    author.id = result.getInt("num");
                    author.lastName = result.getString("nom");
                    author.firstName = result.getString("prénom");
                    author.dateOfBirth = result.getString("date_de_naissance");
                    book.authors.add(author);
                }
            }

            statement.close();
            result.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return book;
    }

    public List<Book> getAll() {
        String q = "SELECT issn, titre, résumé, nb_pages, domaine FROM livres";

        Statement statement = null;
        ResultSet result = null;
        List<Book> books = new ArrayList<>();

        try {
            statement = connection.createStatement();
            result = statement.executeQuery(q);
            books = new ArrayList<>();

            while (result.next()) {
                Book book = new Book();
                book.id = result.getInt("issn");
                book.title = result.getString("titre");
                book.resume = result.getString("résumé");
                book.numberOfPages = result.getInt("nb_pages");
                book.domain = result.getString("domaine");
                books.add(book);
            }

            statement.close();
            result.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return books;
    }

    public int getCountAll() {
        String q = "SELECT count(*) AS count FROM livres";

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
}
