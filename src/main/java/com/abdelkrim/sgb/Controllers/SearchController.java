package com.abdelkrim.sgb.Controllers;

import com.abdelkrim.sgb.DAO.SearchDAO;
import com.abdelkrim.sgb.Models.SearchResult;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Search", value = "/search")
public class SearchController extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String search_for = request.getParameter("search_for");
        String search_value = request.getParameter("search_value");

        if (search_for != null && search_value != null) {
            SearchDAO searchDAO = new SearchDAO();
            List<SearchResult> searchResults = searchDAO.searchResults(search_for, search_value);
            searchDAO.close();

            request.setAttribute("search-results", searchResults);
            getServletContext().getRequestDispatcher("/WEB-INF/search/result.jsp").forward(request, response);
        } else {
            getServletContext().getRequestDispatcher("/WEB-INF/search/index.jsp").forward(request, response);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}