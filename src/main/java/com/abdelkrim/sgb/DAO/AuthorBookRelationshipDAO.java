package com.abdelkrim.sgb.DAO;

import com.abdelkrim.sgb.Models.Author;
import com.abdelkrim.sgb.Models.Book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AuthorBookRelationshipDAO {
    private SQLSession session;
    private Connection connection;

    public AuthorBookRelationshipDAO() {
        session = new SQLSession();
        connection = session.getConnection();
    }

    public void close() {
        session.close();
    }

    public List<Book> getBooks(int athorId) {
        String q = "SELECT livres.issn AS issn, livres.titre AS titre, livres.domaine AS domaine FROM livres WHERE livres.issn NOT IN (SELECT issn FROM ecrit WHERE ecrit.num = ?)";

        List<Book> books = new ArrayList<>();

        PreparedStatement statement;
        ResultSet result;

        try {
            statement = connection.prepareStatement(q);
            statement.setInt(1, athorId);
            result = statement.executeQuery();

            while (result.next()) {
                Book book = new Book();
                book.id = result.getInt("issn");
                book.title = result.getString("titre");
                book.domain = result.getString("domaine");
                books.add(book);
            }

            result.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return books;
    }

    public  List<Author> getAuthors(int bookId) {
        String q = "SELECT auteurs.num AS num, auteurs.nom AS nom, auteurs.prénom AS prénom FROM auteurs WHERE auteurs.num NOT IN ( SELECT num FROM ecrit WHERE ecrit.issn = ? )";

        List<Author> authors = new ArrayList<>();
        PreparedStatement statement;
        ResultSet result;

        try {
            statement = connection.prepareStatement(q);
            statement.setInt(1, bookId);
            result = statement.executeQuery();

            while (result.next()) {
                Author author = new Author();
                author.id = result.getInt("num");
                author.lastName = result.getString("nom");
                author.firstName = result.getString("prénom");
                authors.add(author);
            }

            result.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return authors;
    }
}
