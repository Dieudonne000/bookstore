package com.dios.controllers;

import com.dios.utility.LanguageUtil;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/changeLanguage")
public class LanguageController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String lang = request.getParameter("language");
        LanguageUtil.setLanguage(lang);
        HttpSession session = request.getSession();
        session.setAttribute("language", lang);
        response.sendRedirect("login");
    }
}
