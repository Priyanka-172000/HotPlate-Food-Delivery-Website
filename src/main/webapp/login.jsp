<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  String error = (String) request.getAttribute("error");
    String redirect = request.getParameter("redirect");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign In - HotPlate</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800;900&display=swap" rel="stylesheet">
  <style>
    *{margin:0;padding:0;box-sizing:border-box;}
    body{font-family:'Inter',sans-serif;background:#f8f8f8;min-height:100vh;}
    a{text-decoration:none;color:inherit;}
    .page{display:flex;min-height:100vh;}
    .left{flex:1;background:linear-gradient(160deg,#1a1a2e 0%,#16213e 50%,#6B1E1E 100%);display:flex;flex-direction:column;justify-content:center;padding:60px 56px;position:relative;overflow:hidden;}
    .left::before{content:'';position:absolute;inset:0;background:radial-gradient(ellipse at 30% 70%,rgba(226,55,68,0.2) 0%,transparent 60%);}
    .brand{display:flex;align-items:center;gap:12px;margin-bottom:56px;position:relative;z-index:1;}
    .brand-img{width:42px;height:42px;border-radius:50%;object-fit:cover;}
    .brand-name{font-size:24px;font-weight:900;color:#fff;}
    .left-title{font-size:38px;font-weight:900;color:#fff;line-height:1.15;margin-bottom:18px;position:relative;z-index:1;}
    .left-title span{color:#E23744;}
    .left-sub{font-size:15px;color:rgba(255,255,255,0.68);line-height:1.7;position:relative;z-index:1;}
    .food-images{display:flex;gap:12px;margin-top:44px;position:relative;z-index:1;}
    .food-images img{width:80px;height:80px;border-radius:14px;object-fit:cover;border:2px solid rgba(255,255,255,0.2);}
    .right{width:520px;flex-shrink:0;background:#fff;display:flex;align-items:center;justify-content:center;padding:40px;}
    .form-box{width:100%;max-width:400px;}
    .form-box h2{font-size:26px;font-weight:900;margin-bottom:6px;}
    .form-box p{font-size:14px;color:#777;margin-bottom:28px;}
    .error-box{background:#FFF0F1;border:1px solid #FFD6D9;color:#E23744;border-radius:10px;padding:12px 16px;font-size:13px;font-weight:600;margin-bottom:18px;}
    .fgroup{margin-bottom:18px;}
    .fgroup label{display:block;font-size:13px;font-weight:700;color:#444;margin-bottom:6px;}
    .fgroup input{width:100%;padding:13px 16px;border:1.5px solid #e8e8e8;border-radius:10px;font-size:14px;font-family:'Inter',sans-serif;color:#1C1C1C;background:#f9f9f9;outline:none;transition:border-color 0.2s,background 0.2s;}
    .fgroup input:focus{border-color:#E23744;background:#fff;box-shadow:0 0 0 3px rgba(226,55,68,0.08);}
    .submit-btn{width:100%;background:#E23744;color:#fff;border:none;border-radius:10px;padding:14px;font-size:16px;font-weight:800;cursor:pointer;font-family:'Inter',sans-serif;transition:background 0.18s;margin-top:4px;}
    .submit-btn:hover{background:#C62233;}
    .switch{text-align:center;margin-top:18px;font-size:14px;color:#777;}
    .switch a{color:#E23744;font-weight:700;}
    .forgot{text-align:right;margin-top:-10px;margin-bottom:18px;}
    .forgot a{font-size:13px;color:#E23744;font-weight:600;}
  </style>
</head>
<body>
<div class="page">
  <div class="left">
    <div class="brand">
      <img src="images/categories/biryani.jpg" class="brand-img" alt="HotPlate">
      <span class="brand-name">HotPlate</span>
    </div>
    <h2 class="left-title">India's fastest<br><span>food delivery</span></h2>
    <p class="left-sub">Order from 500+ top-rated restaurants near you. Hot food delivered in 30 minutes, guaranteed.</p>
    <div class="food-images">
      <img src="images/categories/biryani.jpg" alt="Biryani">
      <img src="images/categories/pizza.jpg" alt="Pizza">
      <img src="images/categories/burger.jpg" alt="Burger">
      <img src="images/categories/chicken.jpg" alt="Chicken">
    </div>
  </div>
  <div class="right">
    <div class="form-box">
      <h2>Welcome back!</h2>
      <p>Sign in to continue ordering your favourite food</p>
      <% if (error != null) { %><div class="error-box">&#9888; <%= error %></div><% } %>
      <form action="LoginServlet" method="post">
        <% if (redirect != null && !redirect.isEmpty()) { %>
          <input type="hidden" name="redirect" value="<%= redirect %>">
        <% } %>
        <div class="fgroup">
          <label>Email Address</label>
          <input type="email" name="email" placeholder="you@example.com" required>
        </div>
        <div class="fgroup">
          <label>Password</label>
          <input type="password" name="password" placeholder="Enter your password" required>
        </div>
        <div class="forgot"><a href="#">Forgot password?</a></div>
        <button type="submit" class="submit-btn">Sign In &rarr;</button>
      </form>
      <div class="switch">Don't have an account? <a href="register.jsp">Sign Up</a></div>
    </div>
  </div>
</div>
</body>
</html>
