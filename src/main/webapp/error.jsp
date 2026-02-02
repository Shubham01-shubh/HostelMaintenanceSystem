<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error | HMS</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-main: #020617;
            --card-bg: #111827;
            --border-color: #1f2937;
            --text-primary: #f8fafc;
            --text-muted: #94a3b8;
            --accent-red: #ef4444;
            --accent-blue: #3b82f6;
        }

        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background: radial-gradient(circle at top left, #1e1b4b, var(--bg-main));
            color: var(--text-primary);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            background: var(--card-bg);
            width: 100%;
            max-width: 450px;
            padding: 3rem;
            border-radius: 20px;
            border: 1px solid var(--border-color);
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
            text-align: center;
        }

        .error-icon {
            font-size: 5rem;
            color: var(--accent-red);
            margin-bottom: 1rem;
            display: inline-block;
        }

        h2 {
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 1rem;
            color: var(--accent-red);
        }

        p {
            color: var(--text-muted);
            line-height: 1.6;
            margin-bottom: 2.5rem;
        }

        .btn-group {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        button {
            width: 100%;
            background: var(--accent-blue) !important;
            color: white;
            border: none;
            padding: 1rem;
            border-radius: 10px;
            font-weight: 600;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.2s;
        }

        button:hover {
            background: #2563eb !important;
            transform: translateY(-2px);
        }

        .secondary-link {
            color: var(--text-muted);
            text-decoration: none;
            font-size: 0.9rem;
            font-weight: 500;
            transition: color 0.2s;
        }

        .secondary-link:hover {
            color: var(--accent-blue);
        }

        hr {
            border: 0;
            border-top: 1px solid var(--border-color);
            margin: 2rem 0;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="error-icon">✕</div>
    
    <h2>Something Went Wrong</h2>
    
    <p>
        An error occurred while processing your request. This could be due to a connection timeout or invalid data. 
    </p>

    <hr>

    <div class="btn-group">
        <a href="raise_complaint.jsp" style="text-decoration: none;">
            <button type="button">Try Again</button>
        </a>
        
        <a href="dashboard.jsp" class="secondary-link">
            Return to Dashboard
        </a>
    </div>
</div>

</body>
</html>