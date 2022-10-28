package com.abdelkrim.sgb.Controllers;

import com.abdelkrim.sgb.DAO.AuthorDAO;
import com.abdelkrim.sgb.Models.Author;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "AuthorEdit", value = "/dashboard/authors/edit")
public class AuthorEditController extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));

        AuthorDAO authorDAO = new AuthorDAO();
        Author author = authorDAO.getById(id);
        authorDAO.close();

        if (author != null) {
            request.setAttribute("author", author);
            request.setAttribute("author-books", author.books);
            request.setAttribute("author-id", id);

            response.setContentType("text/html");
            getServletContext().getRequestDispatcher("/WEB-INF/authors/edit.jsp").forward(request, response);
        }
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));

        AuthorDAO authorDAO = new AuthorDAO();
        Author author = new Author();

        author.lastName = request.getParameter("author-last-name");
        author.firstName = request.getParameter("author-first-name");
        author.dateOfBirth = request.getParameter("author-date-of-birth");

        authorDAO.update(id, author);
        authorDAO.close();

        response.sendRedirect(request.getHeader("Referer"));
    }
}