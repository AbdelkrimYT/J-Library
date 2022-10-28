package com.abdelkrim.sgb.Controllers;

import com.abdelkrim.sgb.DAO.AuthorDAO;
import com.abdelkrim.sgb.Models.Author;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "AuthorCreate", value = "/dashboard/authors/create")
public class AuthorCreateController extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        getServletContext().getRequestDispatcher("/WEB-INF/authors/create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String lastName = request.getParameter("author-last-name");
        String firstName = request.getParameter("author-first-name");
        String dateOfBirth = request.getParameter("author-date-of-birth");

        AuthorDAO authorDAO = new AuthorDAO();
        Author author = new Author();

        author.firstName = firstName;
        author.lastName = lastName;
        author.dateOfBirth = dateOfBirth;
        authorDAO.save(author);
        authorDAO.close();

        response.sendRedirect(request.getHeader("Referer"));
    }
}