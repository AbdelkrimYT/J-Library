package com.abdelkrim.sgb.Controllers;
import com.abdelkrim.sgb.DAO.AuthorDAO;
import com.abdelkrim.sgb.Models.Author;

import com.abdelkrim.sgb.DAO.SQLSession;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Author", value = "/dashboard/authors")
public class AuthorController extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        AuthorDAO authorDAO = new AuthorDAO();
        List<Author> auteurs = authorDAO.getAll();
        authorDAO.close();

        request.setAttribute("auteurs", auteurs);

        response.setContentType("text/html");
        getServletContext().getRequestDispatcher("/WEB-INF/authors/index.jsp").forward(request, response);;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));

        AuthorDAO authorDAO = new AuthorDAO();
        authorDAO.delete(id);
        authorDAO.close();

        response.sendRedirect(request.getHeader("Referer"));
    }
}