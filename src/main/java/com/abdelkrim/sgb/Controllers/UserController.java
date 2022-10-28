package com.abdelkrim.sgb.Controllers;

import com.abdelkrim.sgb.DAO.UserDAO;
import com.abdelkrim.sgb.Models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "User", value = "/dashboard/users")
public class UserController extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        UserDAO userDAO = new UserDAO();
        List<User> users = userDAO.getAll();
        userDAO.close();

        request.setAttribute("users", users);

        response.setContentType("text/html");
        getServletContext().getRequestDispatcher("/WEB-INF/users/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));

        UserDAO userDAO = new UserDAO();
        userDAO.delete(id);
        userDAO.close();

        response.sendRedirect(request.getHeader("Referer"));
    }
}