package com.abdelkrim.sgb.Controllers;

import com.abdelkrim.sgb.DAO.AuthorBookRelationshipDAO;
import com.abdelkrim.sgb.DAO.AuthorDAO;
import com.abdelkrim.sgb.DAO.BookDAO;
import com.abdelkrim.sgb.Models.Author;
import com.abdelkrim.sgb.Models.Book;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AuthorBookRelationship", value = "/dashboard/attachment")
public class AuthorBookRelationshipController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String view = request.getParameter("view");

        if (view.equals("author")) {
            int authorId = Integer.parseInt(request.getParameter("id"));

            AuthorDAO authorDAO = new AuthorDAO();
            Author author = authorDAO.getById(authorId);
            authorDAO.close();

            AuthorBookRelationshipDAO abADAO = new AuthorBookRelationshipDAO();
            List<Book> books = abADAO.getBooks(authorId);
            abADAO.close();

            request.setAttribute("author", author);
            request.setAttribute("books-to", books);
            request.setAttribute("author-id", authorId);

            response.setContentType("text/html");
            getServletContext().getRequestDispatcher("/WEB-INF/attachment/author.jsp").forward(request, response);
        }

        else if (view.equals("book")) {
            int bookId = Integer.parseInt(request.getParameter("id"));

            BookDAO bookDAO = new BookDAO();
            Book book = bookDAO.getById(bookId);
            bookDAO.close();

            AuthorBookRelationshipDAO abADAO = new AuthorBookRelationshipDAO();
            List<Author> authors = abADAO.getAuthors(bookId);
            abADAO.close();

            request.setAttribute("book", book);
            request.setAttribute("author-to", authors);
            request.setAttribute("book-id", bookId);

            response.setContentType("text/html");
            getServletContext().getRequestDispatcher("/WEB-INF/attachment/book.jsp").forward(request, response);

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        int bookId = Integer.parseInt(request.getParameter("book-id"));
        int authorId = Integer.parseInt(request.getParameter("author-id"));

        if (action.equals("unattach")) {
            AuthorDAO authorDAO = new AuthorDAO();
            authorDAO.unattachBook(authorId, bookId);
            authorDAO.close();
        }

        else if (action.equals("attach")) {
            AuthorDAO authorDAO = new AuthorDAO();
            authorDAO.attachBook(authorId, bookId);
            authorDAO.close();
        }

        response.sendRedirect(request.getHeader("Referer"));
    }
}
