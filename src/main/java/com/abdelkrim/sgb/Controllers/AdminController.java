package com.abdelkrim.sgb.Controllers;

import com.abdelkrim.sgb.DAO.AuthorDAO;
import com.abdelkrim.sgb.DAO.BookDAO;
import com.abdelkrim.sgb.DAO.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "Admin", value = "/dashboard")
public class AdminController extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        UserDAO userDAO = new UserDAO();
        AuthorDAO authorDAO = new AuthorDAO();
        BookDAO bookDAO = new BookDAO();

        int usersCount = userDAO.getCountAll();
        int auteursCount = authorDAO.getCountAll();
        int booksCount = bookDAO.getCountAll();

        userDAO.close();
        authorDAO.close();
        bookDAO.close();

        request.setAttribute("users-count", usersCount);
        request.setAttribute("auteurs-count", auteursCount);
        request.setAttribute("books-count", booksCount);

        response.setContentType("text/html");
        getServletContext().getRequestDispatcher("/WEB-INF/dashboard/index.jsp").forward(request, response);
    }
}