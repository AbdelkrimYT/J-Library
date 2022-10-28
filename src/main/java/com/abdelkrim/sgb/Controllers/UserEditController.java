package com.abdelkrim.sgb.Controllers;

import com.abdelkrim.sgb.DAO.UserDAO;
import com.abdelkrim.sgb.Models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "UserEdit", value = "/dashboard/users/edit")
public class UserEditController extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));

        UserDAO userDAO = new UserDAO();
        User user = userDAO.getById(id);
        userDAO.close();

        request.setAttribute("user", user);

        response.setContentType("text/html");
        getServletContext().getRequestDispatcher("/WEB-INF/users/edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));

        UserDAO userDAO = new UserDAO();
        User user = new User();

        user.username = request.getParameter("username");
        user.password = request.getParameter("password");

        userDAO.update(id, user);
        userDAO.close();

        response.sendRedirect(request.getHeader("Referer"));
    }
}