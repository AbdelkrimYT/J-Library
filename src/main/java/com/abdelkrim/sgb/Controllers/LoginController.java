package com.abdelkrim.sgb.Controllers;

import com.abdelkrim.sgb.DAO.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "Login", value = "/login")
public class LoginController extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String action = request.getParameter("action");

        if (action == null) {
            getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        } else if (action.equals("logout")) {
            HttpSession session = request.getSession();
            session.removeAttribute("uid");
            response.sendRedirect(request.getServletContext().getContextPath() + "/login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession session = request.getSession();

        UserDAO userDAO = new UserDAO();
        boolean isValid = userDAO.isValid(username, password);
        userDAO.close();

        if (isValid) {
            session.setAttribute("uid", "authorized");
            response.sendRedirect(request.getServletContext().getContextPath() + "/dashboard");
        } else {
            session.setAttribute("uid", "authorized");
            request.setAttribute("error", "Nom d'utilisateur ou mot de passe incorrect.");
            getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            response.sendRedirect(request.getHeader("Referer"));
        }
    }
}