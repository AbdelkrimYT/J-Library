package com.abdelkrim.sgb.Controllers;

import com.abdelkrim.sgb.DAO.BookDAO;
import com.abdelkrim.sgb.Models.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "BookShow", value = "/dashboard/books/show")
public class BookShowController extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));

        BookDAO bookDAO = new BookDAO();
        Book book = bookDAO.getById(id);
        bookDAO.close();

        request.setAttribute("book", book);
        request.setAttribute("book-auteurs", book.authors);

        response.setContentType("text/html");
        getServletContext().getRequestDispatcher("/WEB-INF/books/show.jsp").forward(request, response);
    }

}