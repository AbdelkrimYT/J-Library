package com.abdelkrim.sgb.Filters;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class AuthFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uid = (String) req.getSession().getAttribute("uid");

        if (uid == null) uid = "no-authorized";

        if (uid.equals("authorized")) {
            chain.doFilter(req, res);
        } else {
            res.sendRedirect(request.getServletContext().getContextPath() + "/login");
        }
    }
}
