<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.hostel.model.User" %>
<%@ page import="com.hostel.model.Complaint" %>
<%@ page import="com.hostel.dao.ComplaintDAO" %>
<%@ page import="java.util.List" %>
<%
    // 1. Security Check - Prevents unauthorized access
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login.jsp"); // Redirect to JSP, not HTML
        return;
    }

    // 2. Prevent browser from caching protected content
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    // 3. Fetch Data using the Instance-based DAO
    ComplaintDAO dao = new ComplaintDAO();
    int total = dao.getCount(user.getId(), null);
    int pending = dao.getCount(user.getId(), "Pending");
    int progress = dao.getCount(user.getId(), "In Progress");
    int resolved = dao.getCount(user.getId(), "Resolved");
    
    List<Complaint> complaints = dao.getComplaintsByUser(user.getId());
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | HMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/dashboard.css">
</head>
<body>

<div class="app-container">
    <aside class="sidebar">
        <div class="sidebar-brand">
            <h2>HMS</h2>
        </div>
        <nav class="sidebar-nav">
            <a href="dashboard.jsp" class="nav-item active" style="text-decoration: none;">Dashboard</a>
            <a href="my_complaints.jsp" class="nav-item" style="text-decoration: none;">My Complaints</a>
            <a href="profile.jsp" class="nav-item" style="text-decoration: none;">Profile</a>
            
            <div class="nav-item logout-link mt-auto">
                <a href="LogoutServlet" style="text-decoration: none; color: #ff4d4d; font-weight: 600;">Logout</a>
            </div>
        </nav>
    </aside>

    <main class="main-content">
        <header class="page-header">
            <div class="header-left">
                <h1>Welcome, <%= user.getName() %></h1>
                <p>Monitor your maintenance requests here.</p>
            </div>
            <a href="raise_complaint.jsp" class="btn-primary-custom" style="text-decoration: none;">+ Raise Complaint</a>
        </header>

        <section class="stats-grid">
            <div class="stat-card">
                <span class="label">Total</span>
                <span class="value"><%= total %></span>
            </div>
            <div class="stat-card">
                <span class="label">Pending</span>
                <span class="value warning"><%= pending %></span>
            </div>
            <div class="stat-card">
                <span class="label">In Progress</span>
                <span class="value info"><%= progress %></span>
            </div>
            <div class="stat-card">
                <span class="label">Resolved</span>
                <span class="value success"><%= resolved %></span>
            </div>
        </section>

        <div class="table-wrapper">
            <div class="table-title">Recent Activity</div>
            <div class="table-responsive">
                <table class="modern-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Category</th>
                            <th>Issue</th>
                            <th>Status</th>
                            <th>Date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (complaints == null || complaints.isEmpty()) { %>
                            <tr>
                                <td colspan="5" class="empty-msg">No complaints found. Your history is clear!</td>
                            </tr>
                        <% } else { 
                            for(Complaint c : complaints) { %>
                            <tr>
                                <td>#<%= c.getComplaintId() %></td>
                                <td><span class="tag"><%= c.getCategoryName() %></span></td>
                                <td class="bold"><%= c.getTitle() %></td>
                                <td>
                                    <span class="status-pill <%= c.getStatus().toLowerCase().replace(" ", "-") %>">
                                        <%= c.getStatus() %>
                                    </span>
                                </td>
                                <td><%= c.getCreatedAt() %></td>
                            </tr>
                        <% } } %>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</div>

</body>
</html>