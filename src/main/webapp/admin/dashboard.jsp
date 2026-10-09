<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard - HotPlate</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
  <style>
    *{margin:0;padding:0;box-sizing:border-box;}
    body{font-family:'Inter',sans-serif;background:#f0f2f5;color:#1C1C1C;display:flex;min-height:100vh;}
    a{text-decoration:none;color:inherit;}

    /* Sidebar */
    .sidebar{width:240px;background:#1C1C1C;flex-shrink:0;display:flex;flex-direction:column;position:fixed;top:0;left:0;height:100vh;z-index:100;}
    .sb-brand{display:flex;align-items:center;gap:10px;padding:24px 20px;border-bottom:1px solid rgba(255,255,255,0.1);}
    .sb-logo{width:34px;height:34px;background:#E23744;border-radius:9px;display:flex;align-items:center;justify-content:center;}
    .sb-brand-name{font-size:18px;font-weight:900;color:#fff;}
    .sb-admin{font-size:11px;color:rgba(255,255,255,0.4);font-weight:600;letter-spacing:1px;padding:16px 20px 8px;text-transform:uppercase;}
    .sb-nav{display:flex;flex-direction:column;padding:0 12px;}
    .sb-link{display:flex;align-items:center;gap:12px;padding:11px 12px;border-radius:10px;font-size:14px;font-weight:600;color:rgba(255,255,255,0.65);margin-bottom:2px;transition:all 0.18s;}
    .sb-link:hover,.sb-link.active{background:rgba(226,55,68,0.18);color:#fff;}
    .sb-link.active{background:#E23744;color:#fff;}
    .sb-link svg{flex-shrink:0;}
    .sb-bottom{margin-top:auto;padding:16px 12px;border-top:1px solid rgba(255,255,255,0.1);}
    .sb-user{display:flex;align-items:center;gap:10px;padding:10px 12px;}
    .sb-avatar{width:36px;height:36px;border-radius:50%;background:#E23744;color:#fff;display:flex;align-items:center;justify-content:center;font-size:14px;font-weight:800;flex-shrink:0;}
    .sb-uname{font-size:13px;font-weight:700;color:#fff;}
    .sb-urole{font-size:11px;color:rgba(255,255,255,0.45);}

    /* Main */
    .main{margin-left:240px;flex:1;display:flex;flex-direction:column;}
    .topbar{background:#fff;border-bottom:1px solid #e8e8e8;padding:0 32px;height:64px;display:flex;align-items:center;justify-content:space-between;}
    .topbar-title{font-size:20px;font-weight:800;}
    .topbar-right{display:flex;align-items:center;gap:12px;}
    .tb-date{font-size:13px;color:#888;}

    /* Content */
    .content{padding:32px;}

    /* Stats */
    .stats-grid{display:grid;grid-template-columns:repeat(4,1fr);gap:20px;margin-bottom:32px;}
    .stat-card{background:#fff;border-radius:16px;padding:24px;border:1px solid #eee;}
    .stat-icon{width:48px;height:48px;border-radius:12px;display:flex;align-items:center;justify-content:center;margin-bottom:16px;}
    .stat-num{font-size:28px;font-weight:900;margin-bottom:4px;}
    .stat-label{font-size:13px;color:#888;font-weight:600;}
    .stat-change{font-size:12px;font-weight:700;margin-top:8px;}
    .stat-change.up{color:#26A541;}
    .stat-change.down{color:#E23744;}

    /* Tables */
    .section-card{background:#fff;border-radius:16px;border:1px solid #eee;overflow:hidden;margin-bottom:24px;}
    .sc-head{display:flex;align-items:center;justify-content:space-between;padding:20px 24px;border-bottom:1px solid #f5f5f5;}
    .sc-title{font-size:16px;font-weight:800;}
    .sc-action{font-size:13px;font-weight:700;color:#E23744;}
    table{width:100%;border-collapse:collapse;}
    th{padding:12px 16px;text-align:left;font-size:12px;font-weight:700;color:#888;text-transform:uppercase;letter-spacing:0.5px;border-bottom:1px solid #f5f5f5;background:#fafafa;}
    td{padding:14px 16px;font-size:14px;border-bottom:1px solid #f8f8f8;vertical-align:middle;}
    tr:last-child td{border-bottom:none;}
    tr:hover td{background:#fafafa;}
    .badge{display:inline-block;padding:4px 10px;border-radius:20px;font-size:12px;font-weight:700;}
    .badge.green{background:#E8F5E9;color:#26A541;}
    .badge.orange{background:#FFF3E0;color:#F57C00;}
    .badge.red{background:#FFF0F1;color:#E23744;}
    .badge.blue{background:#E3F2FD;color:#1976D2;}
    .rest-img-sm{width:38px;height:38px;border-radius:8px;object-fit:cover;}

    /* Two-col layout */
    .two-col{display:grid;grid-template-columns:1fr 1fr;gap:24px;}

    /* Quick actions */
    .qa-grid{display:grid;grid-template-columns:repeat(3,1fr);gap:14px;padding:20px;}
    .qa-btn{background:#f8f8f8;border:1px solid #eee;border-radius:12px;padding:18px;display:flex;align-items:center;gap:12px;cursor:pointer;transition:all 0.18s;}
    .qa-btn:hover{background:#FFF0F1;border-color:#E23744;}
    .qa-icon{width:40px;height:40px;border-radius:10px;background:#E23744;display:flex;align-items:center;justify-content:center;flex-shrink:0;}
    .qa-label{font-size:14px;font-weight:700;}
  </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
  <div class="sb-brand">
    <div class="sb-logo">
      <svg width="20" height="20" fill="#fff" viewBox="0 0 24 24"><path d="M18 8h1a4 4 0 0 1 0 8h-1"/><path d="M2 8h16v9a4 4 0 0 1-4 4H6a4 4 0 0 1-4-4V8z"/><line x1="6" y1="1" x2="6" y2="4"/><line x1="10" y1="1" x2="10" y2="4"/><line x1="14" y1="1" x2="14" y2="4"/></svg>
    </div>
    <div>
      <div class="sb-brand-name">HotPlate</div>
      <div style="font-size:10px;color:rgba(255,255,255,0.4);font-weight:600;">Admin Panel</div>
    </div>
  </div>

  <div class="sb-admin">Main Menu</div>
  <div class="sb-nav">
    <a href="dashboard.jsp"             class="sb-link active">
      <svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/></svg>
      Dashboard
    </a>
    <a href="order-management.jsp"      class="sb-link">
      <svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"/><line x1="3" y1="6" x2="21" y2="6"/></svg>
      Orders
    </a>
    <a href="restaurant-management.jsp" class="sb-link">
      <svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/><polyline points="9 22 9 12 15 12 15 22"/></svg>
      Restaurants
    </a>
    <a href="menu-management.jsp"       class="sb-link">
      <svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><line x1="8" y1="6" x2="21" y2="6"/><line x1="8" y1="12" x2="21" y2="12"/><line x1="8" y1="18" x2="21" y2="18"/><line x1="3" y1="6" x2="3.01" y2="6"/><line x1="3" y1="12" x2="3.01" y2="12"/><line x1="3" y1="18" x2="3.01" y2="18"/></svg>
      Menu Items
    </a>
    <a href="users.jsp"                 class="sb-link">
      <svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
      Users
    </a>
    <a href="../index.jsp"              class="sb-link">
      <svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="m3 9 9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/></svg>
      View Website
    </a>
  </div>

  <div class="sb-bottom">
    <div class="sb-user">
      <div class="sb-avatar">A</div>
      <div>
        <div class="sb-uname">Admin User</div>
        <div class="sb-urole">Super Admin</div>
      </div>
    </div>
    <a href="AdminLogoutServlet" class="sb-link" style="margin-top:8px;">
      <svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/></svg>
      Logout
    </a>
  </div>
</div>

<!-- Main Content -->
<div class="main">
  <div class="topbar">
    <div class="topbar-title">Dashboard Overview</div>
    <div class="topbar-right">
      <div class="tb-date" id="dashDate"></div>
      <div style="width:36px;height:36px;background:#E23744;border-radius:50%;display:flex;align-items:center;justify-content:center;">
        <svg width="18" height="18" fill="#fff" viewBox="0 0 24 24"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"/><path d="M13.73 21a2 2 0 0 1-3.46 0"/></svg>
      </div>
    </div>
  </div>

  <div class="content">

    <!-- Stats -->
    <div class="stats-grid">
      <div class="stat-card">
        <div class="stat-icon" style="background:#FFF0F1;">
          <svg width="24" height="24" fill="none" stroke="#E23744" stroke-width="2" viewBox="0 0 24 24"><path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"/><line x1="3" y1="6" x2="21" y2="6"/></svg>
        </div>
        <div class="stat-num">1,284</div>
        <div class="stat-label">Total Orders Today</div>
        <div class="stat-change up">&#8593; +12.5% from yesterday</div>
      </div>
      <div class="stat-card">
        <div class="stat-icon" style="background:#E8F5E9;">
          <svg width="24" height="24" fill="none" stroke="#26A541" stroke-width="2" viewBox="0 0 24 24"><line x1="12" y1="1" x2="12" y2="23"/><path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"/></svg>
        </div>
        <div class="stat-num">&#8377;2,84,560</div>
        <div class="stat-label">Revenue Today</div>
        <div class="stat-change up">&#8593; +8.2% from yesterday</div>
      </div>
      <div class="stat-card">
        <div class="stat-icon" style="background:#E3F2FD;">
          <svg width="24" height="24" fill="none" stroke="#1976D2" stroke-width="2" viewBox="0 0 24 24"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/></svg>
        </div>
        <div class="stat-num" id="statUsers">&hellip;</div>
        <div class="stat-label">Total Users</div>
        <div class="stat-change up" id="statUsersChange">&nbsp;</div>
      </div>
      <div class="stat-card">
        <div class="stat-icon" style="background:#FFF3E0;">
          <svg width="24" height="24" fill="none" stroke="#F57C00" stroke-width="2" viewBox="0 0 24 24"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/></svg>
        </div>
        <div class="stat-num" id="statRest">&hellip;</div>
        <div class="stat-label">Active Restaurants</div>
        <div class="stat-change up">&#8593; 2 new this week</div>
      </div>
    </div>

    <div class="two-col">

      <!-- Recent Orders -->
      <div class="section-card">
        <div class="sc-head">
          <div class="sc-title">Recent Orders</div>
          <a href="order-management.jsp" class="sc-action">View All</a>
        </div>
        <table>
          <thead><tr><th>Order ID</th><th>Customer</th><th>Restaurant</th><th>Amount</th><th>Status</th></tr></thead>
          <tbody>
            <tr><td><strong>#HP847291</strong></td><td>Arjun Mehta</td><td>KFC</td><td>&#8377;349</td><td><span class="badge green">Delivered</span></td></tr>
            <tr><td><strong>#HP847290</strong></td><td>Priya Sharma</td><td>Biryani House</td><td>&#8377;598</td><td><span class="badge orange">Out for Delivery</span></td></tr>
            <tr><td><strong>#HP847289</strong></td><td>Rahul Kumar</td><td>Domino's Pizza</td><td>&#8377;799</td><td><span class="badge blue">Preparing</span></td></tr>
            <tr><td><strong>#HP847288</strong></td><td>Sneha Patel</td><td>McDonald's</td><td>&#8377;249</td><td><span class="badge green">Delivered</span></td></tr>
            <tr><td><strong>#HP847287</strong></td><td>Vikram Singh</td><td>Dosa Plaza</td><td>&#8377;180</td><td><span class="badge red">Cancelled</span></td></tr>
            <tr><td><strong>#HP847286</strong></td><td>Anjali Nair</td><td>Sushi Sakura</td><td>&#8377;1,200</td><td><span class="badge orange">Out for Delivery</span></td></tr>
          </tbody>
        </table>
      </div>

      <!-- Top Restaurants -->
      <div class="section-card">
        <div class="sc-head">
          <div class="sc-title">Top Restaurants</div>
          <a href="restaurant-management.jsp" class="sc-action">View All</a>
        </div>
        <table>
          <thead><tr><th>Restaurant</th><th>Orders</th><th>Revenue</th><th>Rating</th></tr></thead>
          <tbody>
            <tr>
              <td><div style="display:flex;align-items:center;gap:10px;"><img src="../images/restaurants/kfc.jpg" class="rest-img-sm" alt="KFC"><strong>KFC</strong></div></td>
              <td>284</td><td>&#8377;71,000</td>
              <td><span style="color:#26A541;font-weight:700;">&#9733; 4.3</span></td>
            </tr>
            <tr>
              <td><div style="display:flex;align-items:center;gap:10px;"><img src="../images/restaurants/biryani-house.jpg" class="rest-img-sm" alt="Biryani"><strong>Biryani House</strong></div></td>
              <td>241</td><td>&#8377;84,350</td>
              <td><span style="color:#26A541;font-weight:700;">&#9733; 4.6</span></td>
            </tr>
            <tr>
              <td><div style="display:flex;align-items:center;gap:10px;"><img src="../images/restaurants/dominos.jpg" class="rest-img-sm" alt="Dominos"><strong>Domino's Pizza</strong></div></td>
              <td>198</td><td>&#8377;79,200</td>
              <td><span style="color:#26A541;font-weight:700;">&#9733; 4.5</span></td>
            </tr>
            <tr>
              <td><div style="display:flex;align-items:center;gap:10px;"><img src="../images/restaurants/dosa-plaza.jpg" class="rest-img-sm" alt="Dosa"><strong>Dosa Plaza</strong></div></td>
              <td>175</td><td>&#8377;31,500</td>
              <td><span style="color:#26A541;font-weight:700;">&#9733; 4.4</span></td>
            </tr>
            <tr>
              <td><div style="display:flex;align-items:center;gap:10px;"><img src="../images/restaurants/mcdonalds.jpg" class="rest-img-sm" alt="McD"><strong>McDonald's</strong></div></td>
              <td>162</td><td>&#8377;32,400</td>
              <td><span style="color:#26A541;font-weight:700;">&#9733; 4.2</span></td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

    <!-- Quick Actions -->
    <div class="section-card">
      <div class="sc-head"><div class="sc-title">Quick Actions</div></div>
      <div class="qa-grid">
        <a href="order-management.jsp" class="qa-btn">
          <div class="qa-icon"><svg width="20" height="20" fill="none" stroke="#fff" stroke-width="2" viewBox="0 0 24 24"><path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"/><line x1="3" y1="6" x2="21" y2="6"/></svg></div>
          <div><div class="qa-label">Manage Orders</div><div style="font-size:12px;color:#888;margin-top:3px;">View, update, cancel orders</div></div>
        </a>
        <a href="restaurant-management.jsp" class="qa-btn">
          <div class="qa-icon"><svg width="20" height="20" fill="none" stroke="#fff" stroke-width="2" viewBox="0 0 24 24"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/></svg></div>
          <div><div class="qa-label">Add Restaurant</div><div style="font-size:12px;color:#888;margin-top:3px;">Onboard new partners</div></div>
        </a>
        <a href="menu-management.jsp" class="qa-btn">
          <div class="qa-icon"><svg width="20" height="20" fill="none" stroke="#fff" stroke-width="2" viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"/><line x1="5" y1="12" x2="19" y2="12"/></svg></div>
          <div><div class="qa-label">Add Menu Item</div><div style="font-size:12px;color:#888;margin-top:3px;">Update food items</div></div>
        </a>
      </div>
    </div>

  </div>
</div>

<script>
document.getElementById('dashDate').textContent = new Date().toLocaleDateString('en-IN',{weekday:'long',year:'numeric',month:'long',day:'numeric'});

// Load live counts from backend
fetch('UserAdminServlet?action=list').then(r=>r.json()).then(function(users){
  document.getElementById('statUsers').textContent = users.length;
  var today = new Date().toISOString().slice(0,10);
  var todayCount = users.filter(function(u){ return u.joined === today; }).length;
  document.getElementById('statUsersChange').innerHTML = '&#8593; +' + todayCount + ' new today';
}).catch(function(){ document.getElementById('statUsers').textContent = '0'; });

fetch('RestaurantAdminServlet2?action=list').then(r=>r.json()).then(function(rests){
  var active = rests.filter(function(r){ return (r.status||'active')==='active'; }).length;
  document.getElementById('statRest').textContent = active;
}).catch(function(){ document.getElementById('statRest').textContent = '0'; });
</script>
</body>
</html>
