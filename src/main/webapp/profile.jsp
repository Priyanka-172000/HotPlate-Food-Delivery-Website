<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  String userName = (String) session.getAttribute("userName");
  String userEmail = (String) session.getAttribute("userEmail");
  if (userName == null) userName = "John Doe";
  if (userEmail == null) userEmail = "john@example.com";
  String initial = userName.length() > 0 ? String.valueOf(userName.charAt(0)).toUpperCase() : "U";
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800;900&display=swap" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Profile – QuickBite</title>
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/navbar.css">
  <link rel="stylesheet" href="css/profile.css">
</head>
<body>

<jsp:include page="components/navbar.jsp"/>

<div class="profile-page">
  <div class="container">
    <div class="profile-layout">

      <aside class="profile-sidebar">
        <div class="ps-card">
          <div class="ps-avatar"><%= initial %></div>
          <div class="ps-name"><%= userName %></div>
          <div class="ps-email"><%= userEmail %></div>
          <ul class="ps-nav">
            <li><a href="profile.jsp" class="active">👤 My Profile</a></li>
            <li><a href="order-history.jsp">📋 My Orders</a></li>
            <li><a href="#">📍 Saved Addresses</a></li>
            <li><a href="#">💳 Payments</a></li>
            <li><a href="#">🎁 Offers & Coupons</a></li>
            <li><a href="#">⭐ Favourites</a></li>
            <li><a href="LogoutServlet" style="color:var(--primary);">🚪 Logout</a></li>
          </ul>
        </div>
      </aside>

      <div class="profile-main">
        <div class="profile-card">
          <h3>Personal Information</h3>
          <form action="ProfileServlet" method="post">
            <div class="form-row">
              <div class="form-group">
                <label>Full Name</label>
                <input type="text" name="name" value="<%= userName %>">
              </div>
              <div class="form-group">
                <label>Email Address</label>
                <input type="email" name="email" value="<%= userEmail %>">
              </div>
            </div>
            <div class="form-row">
              <div class="form-group">
                <label>Phone Number</label>
                <input type="tel" name="phone" placeholder="+91 9876543210">
              </div>
              <div class="form-group">
                <label>Date of Birth</label>
                <input type="date" name="dob">
              </div>
            </div>
            <div class="form-group">
              <label>Default Delivery Address</label>
              <input type="text" name="address" placeholder="Enter your address">
            </div>
            <button type="submit" class="save-btn">Save Changes</button>
          </form>
        </div>
      </div>

    </div>
  </div>
</div>

<jsp:include page="components/footer.jsp"/>
</body>
</html>
