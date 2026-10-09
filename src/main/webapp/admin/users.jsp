<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Users - HotPlate Admin</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
  <style>
    *{margin:0;padding:0;box-sizing:border-box;}
    body{font-family:'Inter',sans-serif;background:#f0f2f5;color:#1C1C1C;display:flex;min-height:100vh;}
    a{text-decoration:none;color:inherit;}
    .sidebar{width:240px;background:#1C1C1C;flex-shrink:0;position:fixed;top:0;left:0;height:100vh;z-index:100;display:flex;flex-direction:column;}
    .sb-brand{display:flex;align-items:center;gap:10px;padding:24px 20px;border-bottom:1px solid rgba(255,255,255,0.1);}
    .sb-logo{width:34px;height:34px;background:#E23744;border-radius:9px;display:flex;align-items:center;justify-content:center;}
    .sb-brand-name{font-size:18px;font-weight:900;color:#fff;}
    .sb-admin{font-size:11px;color:rgba(255,255,255,0.4);font-weight:600;letter-spacing:1px;padding:16px 20px 8px;text-transform:uppercase;}
    .sb-nav{display:flex;flex-direction:column;padding:0 12px;}
    .sb-link{display:flex;align-items:center;gap:12px;padding:11px 12px;border-radius:10px;font-size:14px;font-weight:600;color:rgba(255,255,255,0.65);margin-bottom:2px;transition:all 0.18s;}
    .sb-link:hover,.sb-link.active{background:rgba(226,55,68,0.18);color:#fff;}.sb-link.active{background:#E23744;}
    .sb-bottom{margin-top:auto;padding:16px 12px;border-top:1px solid rgba(255,255,255,0.1);}
    .sb-user{display:flex;align-items:center;gap:10px;padding:10px 12px;}
    .sb-avatar{width:36px;height:36px;border-radius:50%;background:#E23744;color:#fff;display:flex;align-items:center;justify-content:center;font-size:14px;font-weight:800;}
    .sb-uname{font-size:13px;font-weight:700;color:#fff;}.sb-urole{font-size:11px;color:rgba(255,255,255,0.45);}
    .main{margin-left:240px;flex:1;}
    .topbar{background:#fff;border-bottom:1px solid #e8e8e8;padding:0 32px;height:64px;display:flex;align-items:center;justify-content:space-between;}
    .topbar-title{font-size:20px;font-weight:800;}
    .content{padding:32px;}

    .stats-row{display:grid;grid-template-columns:repeat(3,1fr);gap:20px;margin-bottom:24px;}
    .stat-card{background:#fff;border-radius:16px;padding:22px 24px;border:1px solid #eee;}
    .stat-num{font-size:26px;font-weight:900;}
    .stat-label{font-size:13px;color:#888;font-weight:600;margin-top:4px;}

    .section-card{background:#fff;border-radius:16px;border:1px solid #eee;overflow:hidden;}
    .sc-head{display:flex;align-items:center;justify-content:space-between;padding:20px 24px;border-bottom:1px solid #f5f5f5;}
    .sc-title{font-size:16px;font-weight:800;}
    .search-input{padding:9px 16px;border:1.5px solid #e8e8e8;border-radius:10px;font-size:13px;font-family:'Inter',sans-serif;outline:none;width:240px;}
    table{width:100%;border-collapse:collapse;}
    th{padding:12px 16px;text-align:left;font-size:12px;font-weight:700;color:#888;text-transform:uppercase;letter-spacing:0.5px;border-bottom:1px solid #f5f5f5;background:#fafafa;}
    td{padding:14px 16px;font-size:14px;border-bottom:1px solid #f8f8f8;vertical-align:middle;}
    tr:hover td{background:#fafafa;}
    .user-avatar{width:36px;height:36px;border-radius:50%;background:linear-gradient(135deg,#E23744,#ff6b6b);color:#fff;display:flex;align-items:center;justify-content:center;font-size:14px;font-weight:800;}
    .ud-row{display:flex;align-items:center;gap:12px;}
    .empty-row td{text-align:center;padding:50px;color:#aaa;}
  </style>
</head>
<body>
<div class="sidebar">
  <div class="sb-brand"><div class="sb-logo"><svg width="20" height="20" fill="#fff" viewBox="0 0 24 24"><path d="M18 8h1a4 4 0 0 1 0 8h-1"/><path d="M2 8h16v9a4 4 0 0 1-4 4H6a4 4 0 0 1-4-4V8z"/></svg></div><div><div class="sb-brand-name">HotPlate</div><div style="font-size:10px;color:rgba(255,255,255,0.4);">Admin Panel</div></div></div>
  <div class="sb-admin">Main Menu</div>
  <div class="sb-nav">
    <a href="dashboard.jsp"             class="sb-link"><svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/></svg>Dashboard</a>
    <a href="order-management.jsp"      class="sb-link"><svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"/></svg>Orders</a>
    <a href="restaurant-management.jsp" class="sb-link"><svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/></svg>Restaurants</a>
    <a href="menu-management.jsp"       class="sb-link"><svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><line x1="8" y1="6" x2="21" y2="6"/><line x1="8" y1="12" x2="21" y2="12"/><line x1="8" y1="18" x2="21" y2="18"/></svg>Menu Items</a>
    <a href="users.jsp"                 class="sb-link active"><svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/></svg>Users</a>
    <a href="../index.jsp"              class="sb-link"><svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="m3 9 9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/></svg>View Website</a>
  </div>
  <div class="sb-bottom"><div class="sb-user"><div class="sb-avatar">A</div><div><div class="sb-uname">Admin User</div><div class="sb-urole">Super Admin</div></div></div><a href="AdminLogoutServlet" class="sb-link" style="margin-top:8px;"><svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/></svg>Logout</a></div>
</div>

<div class="main">
  <div class="topbar"><div class="topbar-title">Registered Users</div><div style="font-size:13px;color:#888;" id="topCount">Loading...</div></div>
  <div class="content">

    <div class="stats-row">
      <div class="stat-card"><div class="stat-num" id="statTotal">0</div><div class="stat-label">Total Registered Users</div></div>
      <div class="stat-card"><div class="stat-num" id="statThisMonth">0</div><div class="stat-label">Joined This Month</div></div>
      <div class="stat-card"><div class="stat-num" id="statToday">0</div><div class="stat-label">Joined Today</div></div>
    </div>

    <div class="section-card">
      <div class="sc-head">
        <div class="sc-title">All Users</div>
        <input class="search-input" type="text" id="searchBox" placeholder="Search by name, email, or phone..." oninput="filterUsers(this.value)">
      </div>
      <table>
        <thead><tr><th>User</th><th>Email</th><th>Phone</th><th>Address</th><th>Joined On</th></tr></thead>
        <tbody id="usersTableBody">
          <tr class="empty-row"><td colspan="5">Loading users...</td></tr>
        </tbody>
      </table>
    </div>

  </div>
</div>

<script>
var allUsers = [];

function loadUsers() {
  fetch('UserAdminServlet?action=list')
    .then(r => r.json())
    .then(data => {
      allUsers = data;
      renderUsers(allUsers);
      document.getElementById('topCount').textContent = allUsers.length + ' total users';
      document.getElementById('statTotal').textContent = allUsers.length;

      var today = new Date().toISOString().slice(0,10);
      var thisMonth = today.slice(0,7);
      var todayCount = allUsers.filter(u => u.joined === today).length;
      var monthCount = allUsers.filter(u => u.joined && u.joined.startsWith(thisMonth)).length;
      document.getElementById('statToday').textContent = todayCount;
      document.getElementById('statThisMonth').textContent = monthCount;
    })
    .catch(() => {
      document.getElementById('usersTableBody').innerHTML = '<tr class="empty-row"><td colspan="5">Failed to load users.</td></tr>';
    });
}

function renderUsers(users) {
  var tbody = document.getElementById('usersTableBody');
  if (users.length === 0) {
    tbody.innerHTML = '<tr class="empty-row"><td colspan="5">No users registered yet.</td></tr>';
    return;
  }
  var html = '';
  users.forEach(function(u) {
    var initial = (u.name || '?').charAt(0).toUpperCase();
    html += '<tr>' +
      '<td><div class="ud-row"><div class="user-avatar">' + initial + '</div><strong>' + escapeHtml(u.name) + '</strong></div></td>' +
      '<td>' + escapeHtml(u.email) + '</td>' +
      '<td>' + escapeHtml(u.phone || '-') + '</td>' +
      '<td style="max-width:260px;color:#777;">' + escapeHtml(u.address || '-') + '</td>' +
      '<td>' + escapeHtml(u.joined || '-') + '</td>' +
    '</tr>';
  });
  tbody.innerHTML = html;
}

function filterUsers(q) {
  q = q.toLowerCase();
  var filtered = allUsers.filter(function(u) {
    return (u.name||'').toLowerCase().includes(q) ||
           (u.email||'').toLowerCase().includes(q) ||
           (u.phone||'').toLowerCase().includes(q);
  });
  renderUsers(filtered);
}

function escapeHtml(s) {
  if (!s) return '';
  var d = document.createElement('div');
  d.textContent = s;
  return d.innerHTML;
}

loadUsers();
</script>
</body>
</html>
