package com.abdelkrim.sgb.DAO;

import com.abdelkrim.sgb.Models.Author;
import com.abdelkrim.sgb.Models.Book;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AuthorDAO {

    private SQLSession session;
    private Connection connection;

    public AuthorDAO() {
        session = new SQLSession();
        connection = session.getConnection();
    }

    public void close() {
        session.close();
    }

    public void save(Author author) {
        String q = "INSERT INTO auteurs (nom, prénom, date_de_naissance) VALUES (?, ?, ?)";

        PreparedStatement statement = null;
        try {
            statement = connection.prepareStatement(q);
            statement.setString(1, author.lastName);
            statement.setString(2, author.firstName);
            statement.setString(3, author.dateOfBirth);
            statement.executeUpdate();
            statement.close();
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(int id, Author author) {
        String q = "UPDATE auteurs SET nom = ?, prénom = ?, date_de_naissance = ? WHERE num = ?";

        PreparedStatement statement = null;

        try {
            statement = connection.prepareStatement(q);
            statement.setString(1, author.lastName);
            statement.setString(2, author.firstName);
            statement.setString(3, author.dateOfBirth);
            statement.setInt(4, id);
            statement.executeUpdate();
            statement.close();
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void delete(int id) {
        String q = "DELETE FROM auteurs WHERE num = ?";

        PreparedStatement statement = null;

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

    public void attachBook(int id, int bookId) {
        String q = "INSERT INTO ecrit (num, issn) VALUES (?, ?)";

        PreparedStatement statement;
        try {
            statement = connection.prepareStatement(q);
            statement.setInt(1, id);
            statement.setInt(2, bookId);
            statement.executeUpdate();
            statement.close();
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void unattachBook(int id, int bookId) {
        String q = "DELETE FROM ecrit WHERE num = ? AND issn = ?";

        PreparedStatement statement = null;

        try {
            statement = connection.prepareStatement(q);
            statement.setInt(1, id);
            statement.setInt(2, bookId);
            statement.executeUpdate();
            connection.commit();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Author getById(int id) {
        String q = "SELECT num, nom, prénom, date_de_naissance FROM auteurs WHERE num = ?";
        String j = "SELECT livres.issn AS issn, livres.titre AS titre, livres.résumé AS résumé, livres.nb_pages AS nb_pages, livres.domaine AS domaine FROM ecrit JOIN livres ON ecrit.issn = livres.issn WHERE ecrit.num = ?";

        PreparedStatement statement = null;
        ResultSet result = null;
        Author auteur = null;

        try {
            statement = connection.prepareStatement(q);
            statement.setInt(1, id);
            result = statement.executeQuery();

            if (result.next()) {
                auteur = new Author();

                auteur.id = result.getInt("num");
                auteur.lastName = result.getString("nom");
                auteur.firstName = result.getString("prénom");
                auteur.dateOfBirth = result.getString("date_de_naissance");

                statement = connection.prepareStatement(j);
                statement.setInt(1, id);

                result = statement.executeQuery();
                auteur.books = new ArrayList<>();

                while (result.next()) {
                    Book book = new Book();
                    book.id = result.getInt("issn");
                    book.title = result.getString("titre");
                    book.resume = result.getString("résumé");
                    book.numberOfPages = result.getInt("nb_pages");
                    book.domain = result.getString("domaine");
                    auteur.books.add(book);
                }
            }

            statement.close();
            result.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return auteur;
    }

    public List<Author> getAll() {
        String q = "SELECT num, nom, prénom, date_de_naissance FROM auteurs";

        Statement statement = null;
        ResultSet result = null;
        List<Author> auteurs = new ArrayList<>();

        try {
            statement = connection.createStatement();
            result = statement.executeQuery(q);
            auteurs = new ArrayList<>();

            while (result.next()) {
                Author auteur = new Author();
                auteur.id = result.getInt("num");
                auteur.lastName = result.getString("nom");
                auteur.firstName = result.getString("prénom");
                auteur.dateOfBirth = result.getString("date_de_naissance");
                auteurs.add(auteur);
            }

            statement.close();
            result.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return auteurs;
    }

    public int getCountAll() {
        String q = "SELECT count(*) AS count FROM auteurs";

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
