package com.abdelkrim.sgb.Controllers;

import com.abdelkrim.sgb.DAO.AuthorDAO;
import com.abdelkrim.sgb.Models.Author;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "AuthorShow", value = "/dashboard/authors/show")
public class AuthorShowController extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));

        AuthorDAO authorDAO = new AuthorDAO();
        Author author = authorDAO.getById(id);
        authorDAO.close();

        request.setAttribute("author", author);
        request.setAttribute("author-books", author.books);

        response.setContentType("text/html");
        getServletContext().getRequestDispatcher("/WEB-INF/authors/show.jsp").forward(request, response);
    }
}