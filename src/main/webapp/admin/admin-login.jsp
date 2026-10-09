<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String error = request.getParameter("error"); %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Login - HotPlate</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800;900&display=swap" rel="stylesheet">
  <style>
    *{margin:0;padding:0;box-sizing:border-box;}
    body{font-family:'Inter',sans-serif;background:linear-gradient(160deg,#1a1a2e 0%,#16213e 50%,#6B1E1E 100%);min-height:100vh;display:flex;align-items:center;justify-content:center;padding:20px;}
    a{text-decoration:none;color:inherit;}
    .login-card{background:#fff;border-radius:20px;padding:44px 40px;width:100%;max-width:400px;box-shadow:0 20px 60px rgba(0,0,0,0.3);}
    .brand{display:flex;align-items:center;justify-content:center;gap:10px;margin-bottom:8px;}
    .brand-icon{width:40px;height:40px;background:#E23744;border-radius:11px;display:flex;align-items:center;justify-content:center;}
    .brand-name{font-size:22px;font-weight:900;color:#1C1C1C;}
    .panel-label{text-align:center;font-size:12px;font-weight:700;color:#E23744;letter-spacing:1.5px;text-transform:uppercase;margin-bottom:28px;}
    .login-title{font-size:22px;font-weight:800;text-align:center;margin-bottom:6px;color:#1C1C1C;}
    .login-sub{font-size:13px;color:#888;text-align:center;margin-bottom:28px;}
    .error-box{background:#FFF0F1;border:1px solid #FFD6D9;color:#E23744;border-radius:10px;padding:12px 16px;font-size:13px;font-weight:600;margin-bottom:18px;text-align:center;}
    .fg{margin-bottom:18px;}
    .fg label{display:block;font-size:13px;font-weight:700;color:#444;margin-bottom:6px;}
    .fg input{width:100%;padding:13px 16px;border:1.5px solid #e8e8e8;border-radius:10px;font-size:14px;font-family:'Inter',sans-serif;outline:none;transition:border-color 0.2s;}
    .fg input:focus{border-color:#E23744;box-shadow:0 0 0 3px rgba(226,55,68,0.08);}
    .login-btn{width:100%;background:#E23744;color:#fff;border:none;border-radius:10px;padding:14px;font-size:15px;font-weight:800;cursor:pointer;font-family:'Inter',sans-serif;transition:background 0.18s;margin-top:4px;}
    .login-btn:hover{background:#C62233;}
    .hint-box{background:#F8F9FA;border:1px dashed #ddd;border-radius:10px;padding:12px 16px;margin-top:20px;font-size:12px;color:#888;text-align:center;line-height:1.6;}
    .hint-box strong{color:#555;}
    .back-link{display:block;text-align:center;margin-top:18px;font-size:13px;color:#888;}
    .back-link:hover{color:#E23744;}
  </style>
</head>
<body>
<div class="login-card">
  <div class="brand">
    <div class="brand-icon">
      <svg width="22" height="22" fill="#fff" viewBox="0 0 24 24"><path d="M18 8h1a4 4 0 0 1 0 8h-1"/><path d="M2 8h16v9a4 4 0 0 1-4 4H6a4 4 0 0 1-4-4V8z"/><line x1="6" y1="1" x2="6" y2="4"/><line x1="10" y1="1" x2="10" y2="4"/><line x1="14" y1="1" x2="14" y2="4"/></svg>
    </div>
    <div class="brand-name">HotPlate</div>
  </div>
  <div class="panel-label">Admin Panel</div>
  <div class="login-title">Welcome back</div>
  <div class="login-sub">Sign in to manage your restaurant platform</div>

  <% if ("1".equals(error)) { %>
  <div class="error-box">&#9888; Invalid username or password. Please try again.</div>
  <% } %>

  <form action="AdminLoginServlet2" method="post">
    <div class="fg">
      <label>Username</label>
      <input type="text" name="username" placeholder="Enter admin username" required autofocus>
    </div>
    <div class="fg">
      <label>Password</label>
      <input type="password" name="password" placeholder="Enter password" required>
    </div>
    <button type="submit" class="login-btn">Sign In to Admin Panel &rarr;</button>
  </form>

  <div class="hint-box">
    <strong>Demo Credentials</strong><br>
    Username: <strong>admin</strong> &nbsp;|&nbsp; Password: <strong>admin123</strong>
  </div>

  <a href="../index.jsp" class="back-link">&larr; Back to HotPlate website</a>
</div>
</body>
</html>
