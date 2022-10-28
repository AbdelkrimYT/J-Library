package com.abdelkrim.sgb.DAO;

import com.abdelkrim.sgb.Models.SearchResult;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SearchDAO {

    private SQLSession session;
    private Connection connection;

    public SearchDAO() {
        session = new SQLSession();
        connection = session.getConnection();
    }

    public void close() {
        session.close();
    }

    public List<SearchResult> searchResults(String s_for, String s_value) {
        String q = null;

        switch (s_for) {
            case "author":
                q = "SELECT * FROM v_search WHERE nom LIKE \"%" + s_value + "%\"" +
                        " UNION " +
                    "SELECT * FROM v_search WHERE prénom LIKE \"%" + s_value + "%\"";
                break;
            case "book":
                q = "SELECT * FROM v_search WHERE titre LIKE \"%" + s_value + "%\"";
                break;
            case "domain":
                q = "SELECT * FROM v_search WHERE domaine LIKE \"%" + s_value + "%\"";
                break;
        }

        List<SearchResult> searchResults = new ArrayList<>();

        Statement statement;
        ResultSet result;

        try {
            statement = connection.createStatement();
            result = statement.executeQuery(q);

            while (result.next()) {
                SearchResult sr = new SearchResult();
                sr.authorFirstName = result.getString("nom");
                sr.authorLastName = result.getString("prénom");
                sr.authorDateOfBirth = result.getString("date_de_naissance");
                sr.bookTitle = result.getString("titre");
                sr.bookDomain = result.getString("domaine");
                sr.bookResume = result.getString("résumé");
                sr.bookNumberOfPages = result.getInt("nb_pages");
                searchResults.add(sr);
            }

            result.close();
            statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return searchResults;
    }
}
