package com.hostel.servlet;

import com.hostel.dao.ComplaintDAO;
import com.hostel.model.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/RaiseComplaintServlet")
public class RaiseComplaintServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Get Session and User
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("currentUser") : null;

        // 2. Security Check: Redirect to login if session is invalid
        if (user == null) {
            response.sendRedirect("login.html");
            return;
        }

        // 3. Get form data from the JSP
        String roomNo = request.getParameter("roomNo");
        String categoryId = request.getParameter("categoryId");
        String title = request.getParameter("title");
        String description = request.getParameter("description");

        // 4. Use the ID from the logged-in User object
        int userId = user.getId();

        // 5. Save to database using the instance method
        ComplaintDAO dao = new ComplaintDAO();
        
        boolean result = false;
        try {
            result = dao.raiseComplaint(
                    userId,
                    Integer.parseInt(categoryId),
                    title,
                    description,
                    roomNo
            );
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        // 6. FIX: Redirect to .jsp files instead of .html
        if (result) {
            response.sendRedirect("success.jsp"); 
        } else {
            // Ensure you have created error.jsp or point this to a valid page
            response.sendRedirect("error.jsp");
        }
    }
}