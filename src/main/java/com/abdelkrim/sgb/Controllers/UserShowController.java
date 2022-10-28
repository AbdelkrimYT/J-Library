package com.abdelkrim.sgb.Controllers;

import com.abdelkrim.sgb.DAO.UserDAO;
import com.abdelkrim.sgb.Models.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "UserShow", value = "/dashboard/users/show")
public class UserShowController extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));

        UserDAO userDAO = new UserDAO();
        User user = userDAO.getById(id);
        userDAO.close();

        request.setAttribute("user", user);

        response.setContentType("text/html");
        getServletContext().getRequestDispatcher("/WEB-INF/users/show.jsp").forward(request, response);
    }
}