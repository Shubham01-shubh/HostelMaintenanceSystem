<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | HMS</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <style>
        /* Specific Alert Styling for the Login Page */
        .error-alert {
            background: rgba(239, 68, 68, 0.1);
            border: 1px solid rgba(239, 68, 68, 0.2);
            color: #ef4444;
            padding: 0.8rem;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            font-size: 0.85rem;
            text-align: center;
            font-weight: 500;
            animation: fadeIn 0.3s ease-in;
        }

        .success-alert {
            background: rgba(34, 197, 94, 0.1);
            border: 1px solid rgba(34, 197, 94, 0.2);
            color: #22c55e;
            padding: 0.8rem;
            border-radius: 8px;
            margin-bottom: 1.5rem;
            font-size: 0.85rem;
            text-align: center;
            font-weight: 500;
            animation: fadeIn 0.3s ease-in;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<div class="container">
    <div class="text-center mb-4" style="text-align: center;">
        <h4 style="color: #3b82f6; font-weight: 800; letter-spacing: 2px; margin-bottom: 5px;">HMS</h4>
        <h2 style="margin-top: 0;">User Login</h2>
        <p class="text-muted" style="color: #94a3b8; font-size: 14px; margin-bottom: 25px;">Access the Hostel Maintenance Portal</p>
    </div>

    <%-- 1. LOGOUT MESSAGE LOGIC --%>
    <% 
        String logoutMsg = request.getParameter("msg");
        if ("logout".equals(logoutMsg)) { 
    %>
        <div class="success-alert">
            You have been successfully logged out.
        </div>
    <% } %>

    <%-- 2. ERROR MESSAGE LOGIC --%>
    <% 
        String error = (String) request.getAttribute("errorMessage");
        if (error != null) { 
    %>
        <div class="error-alert">
            <%= error %>
        </div>
    <% } %>


    <%-- 3. LOGIN FORM --%>
    <form action="LoginServlet" method="post">
        <label for="email">Email Address</label>
        <input type="email" id="email" name="email" placeholder="student@test.com" required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="••••••••" required>

        <button type="submit">Sign In</button>
    </form>
</div>

</body>
</html>