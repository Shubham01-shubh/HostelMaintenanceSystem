<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.hostel.model.User" %>
<%
    // Security Check: If no user in session, redirect to login
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login.html");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Raise Complaint | HMS</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-main: #020617;
            --card-bg: #111827;
            --border-color: #1f2937;
            --text-primary: #f8fafc;
            --text-muted: #94a3b8;
            --accent-blue: #3b82f6;
        }

        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background: radial-gradient(circle at top left, #0f172a, var(--bg-main));
            color: var(--text-primary);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            background: var(--card-bg);
            width: 90%;
            max-width: 480px;
            padding: 2.5rem;
            border-radius: 16px;
            border: 1px solid var(--border-color);
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
        }

        h2 {
            font-size: 1.75rem;
            font-weight: 700;
            text-align: center;
            margin-bottom: 2rem;
            color: #fff;
        }

        label {
            font-size: 0.85rem;
            font-weight: 600;
            color: var(--text-muted);
            margin-bottom: 0.6rem;
            display: block;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        input, select, textarea {
            width: 100%;
            background: var(--bg-main) !important;
            border: 1px solid var(--border-color) !important;
            border-radius: 10px;
            padding: 0.9rem 1.1rem;
            color: #fff !important;
            margin-bottom: 1.5rem;
            transition: all 0.3s ease;
            box-sizing: border-box;
            font-size: 0.95rem;
        }

        input:focus, select:focus, textarea:focus {
            border-color: var(--accent-blue) !important;
            outline: none;
            box-shadow: 0 0 0 4px rgba(59, 130, 246, 0.15);
            background: #0f172a !important;
        }

        button {
            width: 100%;
            background: var(--accent-blue) !important;
            color: white;
            border: none;
            padding: 1.1rem;
            border-radius: 10px;
            font-weight: 700;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 0.5rem;
        }

        button:hover {
            background: #2563eb !important;
            transform: translateY(-2px);
            box-shadow: 0 10px 15px -3px rgba(59, 130, 246, 0.3);
        }

        .back-link {
            color: var(--text-muted);
            text-decoration: none;
            font-size: 0.85rem;
            display: inline-flex;
            align-items: center;
            margin-bottom: 1.5rem;
            transition: color 0.2s;
        }

        .back-link:hover { color: var(--accent-blue); }
    </style>
</head>
<body>

<div class="container">
    <a href="dashboard.jsp" class="back-link">&larr; Back to Dashboard</a>

    <h2>Raise Complaint</h2>

    <form action="RaiseComplaintServlet" method="post">

        <label for="roomNo">Room Number</label>
        <input type="text" id="roomNo" name="roomNo" placeholder="e.g., B-204" required>

        <label for="categoryId">Service Category</label>
        <select id="categoryId" name="categoryId" required>
            <option value="" disabled selected>-- Select Category --</option>
            <option value="1">Electrical</option>
            <option value="2">Plumbing</option>
            <option value="3">Network / Wi-Fi</option>
            <option value="4">Furniture / Maintenance</option>
        </select>

        <label for="title">Complaint Title</label>
        <input type="text" id="title" name="title" placeholder="e.g. Fan not working" required>

        <label for="description">Description</label>
        <textarea id="description" name="description" rows="4" placeholder="Briefly describe the issue..." required></textarea>

        <button type="submit">Submit Complaint</button>
    </form>
</div>

</body>
</html>