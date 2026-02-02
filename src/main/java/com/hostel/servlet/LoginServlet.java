package com.hostel.servlet;

import com.hostel.dao.UserDAO;
import com.hostel.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String pass = request.getParameter("password");

        // 1. Check credentials against database
        User user = UserDAO.validate(email, pass);

        if (user != null) {
            // SUCCESS: Create session and store user object
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", user); 
            response.sendRedirect("dashboard.jsp"); 
            
        } else {
            // FAILURE: Send error message back to login.jsp
            request.setAttribute("errorMessage", "Invalid email or password. Please try again.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}