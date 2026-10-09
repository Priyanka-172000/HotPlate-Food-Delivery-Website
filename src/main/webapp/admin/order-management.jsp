<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setAttribute("activePage","orders"); %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Orders - HotPlate Admin</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
  <style>
    *{margin:0;padding:0;box-sizing:border-box;}body{font-family:'Inter',sans-serif;background:#f0f2f5;color:#1C1C1C;display:flex;min-height:100vh;}a{text-decoration:none;color:inherit;}
    .sidebar{width:240px;background:#1C1C1C;flex-shrink:0;display:flex;flex-direction:column;position:fixed;top:0;left:0;height:100vh;z-index:100;}
    .sb-brand{display:flex;align-items:center;gap:10px;padding:24px 20px;border-bottom:1px solid rgba(255,255,255,0.1);}
    .sb-logo{width:34px;height:34px;background:#E23744;border-radius:9px;display:flex;align-items:center;justify-content:center;}
    .sb-brand-name{font-size:18px;font-weight:900;color:#fff;}
    .sb-admin{font-size:11px;color:rgba(255,255,255,0.4);font-weight:600;letter-spacing:1px;padding:16px 20px 8px;text-transform:uppercase;}
    .sb-nav{display:flex;flex-direction:column;padding:0 12px;}
    .sb-link{display:flex;align-items:center;gap:12px;padding:11px 12px;border-radius:10px;font-size:14px;font-weight:600;color:rgba(255,255,255,0.65);margin-bottom:2px;transition:all 0.18s;}
    .sb-link:hover,.sb-link.active{background:rgba(226,55,68,0.18);color:#fff;}
    .sb-link.active{background:#E23744;}
    .sb-bottom{margin-top:auto;padding:16px 12px;border-top:1px solid rgba(255,255,255,0.1);}
    .sb-user{display:flex;align-items:center;gap:10px;padding:10px 12px;}
    .sb-avatar{width:36px;height:36px;border-radius:50%;background:#E23744;color:#fff;display:flex;align-items:center;justify-content:center;font-size:14px;font-weight:800;flex-shrink:0;}
    .sb-uname{font-size:13px;font-weight:700;color:#fff;}.sb-urole{font-size:11px;color:rgba(255,255,255,0.45);}
    .main{margin-left:240px;flex:1;}
    .topbar{background:#fff;border-bottom:1px solid #e8e8e8;padding:0 32px;height:64px;display:flex;align-items:center;justify-content:space-between;}
    .topbar-title{font-size:20px;font-weight:800;}
    .content{padding:32px;}
    .filters-row{display:flex;align-items:center;gap:12px;margin-bottom:24px;flex-wrap:wrap;}
    .fchip{padding:8px 18px;border-radius:30px;font-size:13px;font-weight:700;background:#fff;border:1px solid #e8e8e8;cursor:pointer;transition:all 0.18s;}
    .fchip.active,.fchip:hover{background:#E23744;color:#fff;border-color:#E23744;}
    .search-input{padding:9px 16px;border:1.5px solid #e8e8e8;border-radius:10px;font-size:14px;font-family:'Inter',sans-serif;outline:none;width:220px;}
    .search-input:focus{border-color:#E23744;}
    .section-card{background:#fff;border-radius:16px;border:1px solid #eee;overflow:hidden;}
    table{width:100%;border-collapse:collapse;}
    th{padding:12px 16px;text-align:left;font-size:12px;font-weight:700;color:#888;text-transform:uppercase;letter-spacing:0.5px;border-bottom:1px solid #f5f5f5;background:#fafafa;}
    td{padding:14px 16px;font-size:14px;border-bottom:1px solid #f8f8f8;vertical-align:middle;}
    tr:last-child td{border-bottom:none;}tr:hover td{background:#fafafa;}
    .badge{display:inline-block;padding:4px 10px;border-radius:20px;font-size:12px;font-weight:700;}
    .badge.green{background:#E8F5E9;color:#26A541;}.badge.orange{background:#FFF3E0;color:#F57C00;}
    .badge.red{background:#FFF0F1;color:#E23744;}.badge.blue{background:#E3F2FD;color:#1976D2;}
    .act-btn{padding:6px 14px;border-radius:8px;font-size:12px;font-weight:700;border:none;cursor:pointer;font-family:'Inter',sans-serif;}
    .act-view{background:#E3F2FD;color:#1976D2;}.act-cancel{background:#FFF0F1;color:#E23744;margin-left:6px;}
  </style>
</head>
<body>
<div class="sidebar">
  <div class="sb-brand"><div class="sb-logo"><svg width="20" height="20" fill="#fff" viewBox="0 0 24 24"><path d="M18 8h1a4 4 0 0 1 0 8h-1"/><path d="M2 8h16v9a4 4 0 0 1-4 4H6a4 4 0 0 1-4-4V8z"/></svg></div><div><div class="sb-brand-name">HotPlate</div><div style="font-size:10px;color:rgba(255,255,255,0.4);">Admin Panel</div></div></div>
  <div class="sb-admin">Main Menu</div>
  <div class="sb-nav">
    <a href="dashboard.jsp"             class="sb-link"><svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/></svg>Dashboard</a>
    <a href="order-management.jsp"      class="sb-link active"><svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"/><line x1="3" y1="6" x2="21" y2="6"/></svg>Orders</a>
    <a href="restaurant-management.jsp" class="sb-link"><svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/></svg>Restaurants</a>
    <a href="menu-management.jsp"       class="sb-link"><svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><line x1="8" y1="6" x2="21" y2="6"/><line x1="8" y1="12" x2="21" y2="12"/><line x1="8" y1="18" x2="21" y2="18"/></svg>Menu Items</a>
    <a href="../index.jsp"              class="sb-link"><svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="m3 9 9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/></svg>View Website</a>
  </div>
  <div class="sb-bottom"><div class="sb-user"><div class="sb-avatar">A</div><div><div class="sb-uname">Admin User</div><div class="sb-urole">Super Admin</div></div></div><a href="AdminLogoutServlet" class="sb-link" style="margin-top:8px;"><svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/></svg>Logout</a></div>
</div>
<div class="main">
  <div class="topbar"><div class="topbar-title">Order Management</div><div style="font-size:13px;color:#888;">Total: <strong>1,284 orders today</strong></div></div>
  <div class="content">
    <div class="filters-row">
      <div class="fchip active" onclick="filterOrders('all',this)">All Orders</div>
      <div class="fchip" onclick="filterOrders('Preparing',this)">Preparing</div>
      <div class="fchip" onclick="filterOrders('Out for Delivery',this)">Out for Delivery</div>
      <div class="fchip" onclick="filterOrders('Delivered',this)">Delivered</div>
      <div class="fchip" onclick="filterOrders('Cancelled',this)">Cancelled</div>
      <input class="search-input" type="text" placeholder="Search by order ID or customer..." oninput="searchOrders(this.value)">
    </div>
    <div class="section-card">
      <table>
        <thead><tr><th>Order ID</th><th>Customer</th><th>Restaurant</th><th>Items</th><th>Amount</th><th>Time</th><th>Status</th><th>Actions</th></tr></thead>
        <tbody id="ordersTable">
          <tr data-status="Delivered"><td><strong>#HP847291</strong></td><td>Arjun Mehta</td><td>KFC</td><td>Chicken Lollipop x2</td><td>&#8377;558</td><td>10 mins ago</td><td><span class="badge green">Delivered</span></td><td><button class="act-btn act-view">View</button></td></tr>
          <tr data-status="Out for Delivery"><td><strong>#HP847290</strong></td><td>Priya Sharma</td><td>Biryani House</td><td>Chicken Biryani x1, Naan x2</td><td>&#8377;447</td><td>18 mins ago</td><td><span class="badge orange">Out for Delivery</span></td><td><button class="act-btn act-view">View</button><button class="act-btn act-cancel">Cancel</button></td></tr>
          <tr data-status="Preparing"><td><strong>#HP847289</strong></td><td>Rahul Kumar</td><td>Domino's Pizza</td><td>Margherita Pizza x2</td><td>&#8377;799</td><td>22 mins ago</td><td><span class="badge blue">Preparing</span></td><td><button class="act-btn act-view">View</button><button class="act-btn act-cancel">Cancel</button></td></tr>
          <tr data-status="Delivered"><td><strong>#HP847288</strong></td><td>Sneha Patel</td><td>McDonald's</td><td>Burger x1, Fries x1</td><td>&#8377;249</td><td>35 mins ago</td><td><span class="badge green">Delivered</span></td><td><button class="act-btn act-view">View</button></td></tr>
          <tr data-status="Cancelled"><td><strong>#HP847287</strong></td><td>Vikram Singh</td><td>Dosa Plaza</td><td>Masala Dosa x2</td><td>&#8377;180</td><td>41 mins ago</td><td><span class="badge red">Cancelled</span></td><td><button class="act-btn act-view">View</button></td></tr>
          <tr data-status="Out for Delivery"><td><strong>#HP847286</strong></td><td>Anjali Nair</td><td>Sushi Sakura</td><td>Sushi Platter x1</td><td>&#8377;1,200</td><td>52 mins ago</td><td><span class="badge orange">Out for Delivery</span></td><td><button class="act-btn act-view">View</button></td></tr>
          <tr data-status="Delivered"><td><strong>#HP847285</strong></td><td>Ravi Reddy</td><td>Wow China</td><td>Noodles x1, Spring Roll x2</td><td>&#8377;427</td><td>1 hr ago</td><td><span class="badge green">Delivered</span></td><td><button class="act-btn act-view">View</button></td></tr>
          <tr data-status="Preparing"><td><strong>#HP847284</strong></td><td>Meena Joshi</td><td>Cafe Coffee Day</td><td>Cappuccino x2, Sandwich x1</td><td>&#8377;378</td><td>1 hr ago</td><td><span class="badge blue">Preparing</span></td><td><button class="act-btn act-view">View</button><button class="act-btn act-cancel">Cancel</button></td></tr>
        </tbody>
      </table>
    </div>
  </div>
</div>
<script>
function filterOrders(status,el){
  document.querySelectorAll('.fchip').forEach(c=>c.classList.remove('active'));
  el.classList.add('active');
  document.querySelectorAll('#ordersTable tr').forEach(r=>{
    r.style.display = (status==='all'||r.dataset.status===status)?'':'none';
  });
}
function searchOrders(q){
  q=q.toLowerCase();
  document.querySelectorAll('#ordersTable tr').forEach(r=>{
    r.style.display=r.textContent.toLowerCase().includes(q)?'':'none';
  });
}
</script>
</body></html>
