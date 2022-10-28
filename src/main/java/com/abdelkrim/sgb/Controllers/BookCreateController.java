package com.abdelkrim.sgb.Controllers;

import com.abdelkrim.sgb.DAO.BookDAO;
import com.abdelkrim.sgb.Models.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "BookCreat", value = "/dashboard/books/create")
public class BookCreateController extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        getServletContext().getRequestDispatcher("/WEB-INF/books/create.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        BookDAO bookDAO = new BookDAO();
        Book book = new Book();

        book.title = request.getParameter("book-title");;
        book.domain = request.getParameter("book-domain");;
        book.numberOfPages = Integer.parseInt(request.getParameter("book-number-of-pages"));
        book.resume = request.getParameter("book-resume");

        bookDAO.save(book);
        bookDAO.close();

        response.sendRedirect(request.getHeader("Referer"));
    }
}