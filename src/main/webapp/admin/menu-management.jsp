<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Menu Management - HotPlate Admin</title>
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

    .add-card{background:#fff;border-radius:16px;border:1px solid #eee;padding:24px;margin-bottom:24px;}
    .add-title{font-size:16px;font-weight:800;margin-bottom:18px;}
    .form-grid{display:grid;grid-template-columns:1.3fr 0.7fr 1fr 1fr;gap:14px;margin-bottom:14px;}
    .fg label{display:block;font-size:12px;font-weight:700;color:#666;margin-bottom:6px;}
    .fg input,.fg select,.fg textarea{width:100%;padding:11px 14px;border:1.5px solid #e8e8e8;border-radius:10px;font-size:14px;font-family:'Inter',sans-serif;outline:none;transition:border-color 0.2s;}
    .fg input:focus,.fg select:focus,.fg textarea:focus{border-color:#E23744;}
    .desc-row{margin-bottom:16px;}
    .add-actions{display:flex;align-items:center;gap:14px;}
    .add-btn{background:#E23744;color:#fff;border:none;border-radius:10px;padding:12px 28px;font-size:14px;font-weight:800;cursor:pointer;font-family:'Inter',sans-serif;transition:background 0.18s;}
    .add-btn:hover{background:#C62233;}
    .add-msg{font-size:13px;font-weight:700;padding:8px 14px;border-radius:8px;display:none;}
    .add-msg.success{background:#F0FFF4;color:#26A541;display:block;}
    .add-msg.error{background:#FFF0F1;color:#E23744;display:block;}

    .section-card{background:#fff;border-radius:16px;border:1px solid #eee;overflow:hidden;}
    .sc-head{display:flex;align-items:center;justify-content:space-between;padding:20px 24px;border-bottom:1px solid #f5f5f5;}
    .sc-title{font-size:16px;font-weight:800;}
    .search-input{padding:9px 16px;border:1.5px solid #e8e8e8;border-radius:10px;font-size:13px;font-family:'Inter',sans-serif;outline:none;width:220px;}
    table{width:100%;border-collapse:collapse;}
    th{padding:12px 16px;text-align:left;font-size:12px;font-weight:700;color:#888;text-transform:uppercase;letter-spacing:0.5px;border-bottom:1px solid #f5f5f5;background:#fafafa;}
    td{padding:12px 16px;font-size:14px;border-bottom:1px solid #f8f8f8;vertical-align:middle;}
    tr:hover td{background:#fafafa;}
    .item-img{width:46px;height:40px;border-radius:8px;object-fit:cover;}
    .veg-dot{display:inline-block;width:12px;height:12px;border:2px solid #26A541;border-radius:2px;position:relative;}
    .veg-dot::after{content:'';position:absolute;top:1px;left:1px;width:5px;height:5px;border-radius:50%;background:#26A541;}
    .nveg-dot{display:inline-block;width:12px;height:12px;border:2px solid #E23744;border-radius:2px;position:relative;}
    .nveg-dot::after{content:'';position:absolute;top:1px;left:1px;width:5px;height:5px;border-radius:50%;background:#E23744;}
    .del-btn{background:#FFF0F1;color:#E23744;border:none;border-radius:8px;padding:6px 12px;font-size:12px;font-weight:700;cursor:pointer;font-family:'Inter',sans-serif;}
    .empty-row td{text-align:center;padding:40px;color:#aaa;}

    /* Duplicate confirm modal */
    .modal-overlay{display:none;position:fixed;inset:0;background:rgba(0,0,0,0.5);z-index:2000;align-items:center;justify-content:center;}
    .modal-overlay.show{display:flex;}
    .modal-box{background:#fff;border-radius:16px;padding:28px;max-width:420px;width:90%;text-align:center;}
    .modal-icon{width:56px;height:56px;background:#FFF3E0;border-radius:50%;display:flex;align-items:center;justify-content:center;margin:0 auto 16px;}
    .modal-title{font-size:18px;font-weight:800;margin-bottom:10px;}
    .modal-text{font-size:14px;color:#666;margin-bottom:24px;line-height:1.6;}
    .modal-actions{display:flex;gap:12px;}
    .modal-btn{flex:1;padding:12px;border-radius:10px;font-size:14px;font-weight:700;cursor:pointer;border:none;font-family:'Inter',sans-serif;}
    .modal-btn.cancel{background:#f0f0f0;color:#555;}
    .modal-btn.confirm{background:#E23744;color:#fff;}
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
    <a href="menu-management.jsp"       class="sb-link active"><svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><line x1="8" y1="6" x2="21" y2="6"/><line x1="8" y1="12" x2="21" y2="12"/><line x1="8" y1="18" x2="21" y2="18"/></svg>Menu Items</a>
    <a href="users.jsp"                 class="sb-link"><svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/></svg>Users</a>
    <a href="../index.jsp"              class="sb-link"><svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="m3 9 9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/></svg>View Website</a>
  </div>
  <div class="sb-bottom"><div class="sb-user"><div class="sb-avatar">A</div><div><div class="sb-uname">Admin User</div><div class="sb-urole">Super Admin</div></div></div><a href="AdminLogoutServlet" class="sb-link" style="margin-top:8px;"><svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/></svg>Logout</a></div>
</div>

<div class="main">
  <div class="topbar"><div class="topbar-title">Menu Management</div><div style="font-size:13px;color:#888;" id="totalCount">Loading...</div></div>
  <div class="content">

    <!-- Add Item Form -->
    <div class="add-card">
      <div class="add-title">Add New Menu Item</div>
      <div class="form-grid">
        <div class="fg"><label>Food Name *</label><input type="text" id="fName" placeholder="e.g. Chicken Tikka Masala"></div>
        <div class="fg"><label>Price (&#8377;) *</label><input type="number" id="fPrice" placeholder="299"></div>
        <div class="fg"><label>Category</label>
          <select id="fCategory">
            <option>Starters</option>
            <option selected>Main Course</option>
            <option>Breads and Rice</option>
            <option>Beverages</option>
            <option>Desserts</option>
          </select>
        </div>
        <div class="fg"><label>Type</label>
          <select id="fVeg">
            <option value="true">Vegetarian</option>
            <option value="false">Non-Vegetarian</option>
          </select>
        </div>
      </div>
      <div class="desc-row fg">
        <label>Description</label>
        <textarea id="fDesc" rows="2" placeholder="Short description of the dish..."></textarea>
      </div>
      <div class="add-actions">
        <button class="add-btn" onclick="submitMenuItem(false)">+ Add Menu Item</button>
        <div class="add-msg" id="addMsg"></div>
      </div>
    </div>

    <!-- Existing Items Table -->
    <div class="section-card">
      <div class="sc-head">
        <div class="sc-title">All Menu Items</div>
        <input class="search-input" type="text" id="searchBox" placeholder="Search items..." oninput="filterTable(this.value)">
      </div>
      <table>
        <thead><tr><th>Image</th><th>Name</th><th>Category</th><th>Type</th><th>Price</th><th>Description</th><th>Action</th></tr></thead>
        <tbody id="itemsTableBody">
          <tr class="empty-row"><td colspan="7">Loading menu items...</td></tr>
        </tbody>
      </table>
    </div>

  </div>
</div>

<!-- Duplicate Confirmation Modal -->
<div class="modal-overlay" id="dupModal">
  <div class="modal-box">
    <div class="modal-icon">
      <svg width="28" height="28" fill="none" stroke="#F57C00" stroke-width="2" viewBox="0 0 24 24"><path d="M10.29 3.86 1.82 18a2 2 0 0 0 1.71 3h16.94a2 2 0 0 0 1.71-3L13.71 3.86a2 2 0 0 0-3.42 0z"/><line x1="12" y1="9" x2="12" y2="13"/><line x1="12" y1="17" x2="12.01" y2="17"/></svg>
    </div>
    <div class="modal-title">Item Already Exists</div>
    <div class="modal-text" id="dupText">This item is already on the menu for this restaurant. Do you still want to add it as a new entry?</div>
    <div class="modal-actions">
      <button class="modal-btn cancel" onclick="closeDupModal()">Cancel</button>
      <button class="modal-btn confirm" onclick="confirmAddAnyway()">Yes, Add Anyway</button>
    </div>
  </div>
</div>

<script>
var allItems = [];

function loadItems() {
  fetch('MenuItemServlet?action=list')
    .then(r => r.json())
    .then(data => {
      allItems = data;
      renderTable(allItems);
      document.getElementById('totalCount').textContent = allItems.length + ' menu items total';
    })
    .catch(err => {
      document.getElementById('itemsTableBody').innerHTML = '<tr class="empty-row"><td colspan="7">Failed to load items. Refresh the page.</td></tr>';
    });
}

function renderTable(items) {
  var tbody = document.getElementById('itemsTableBody');
  if (items.length === 0) {
    tbody.innerHTML = '<tr class="empty-row"><td colspan="7">No menu items found. Add your first item above.</td></tr>';
    return;
  }
  var html = '';
  items.forEach(function(item) {
    var vegBadge = item.veg === 'true' ? '<span class="veg-dot"></span> Veg' : '<span class="nveg-dot"></span> Non-Veg';
    html += '<tr>' +
      '<td><img class="item-img" src="../' + item.image + '" onerror="this.style.display=\'none\'" alt=""></td>' +
      '<td><strong>' + escapeHtml(item.name) + '</strong></td>' +
      '<td>' + escapeHtml(item.category) + '</td>' +
      '<td>' + vegBadge + '</td>' +
      '<td>&#8377;' + escapeHtml(item.price) + '</td>' +
      '<td style="max-width:280px;color:#777;font-size:13px;">' + escapeHtml(item.description) + '</td>' +
      '<td><button class="del-btn" onclick="deleteItem(\'' + item.id + '\')">Delete</button></td>' +
    '</tr>';
  });
  tbody.innerHTML = html;
}

function filterTable(q) {
  q = q.toLowerCase();
  var filtered = allItems.filter(function(i) {
    return i.name.toLowerCase().includes(q) || i.category.toLowerCase().includes(q);
  });
  renderTable(filtered);
}

function escapeHtml(s) {
  if (!s) return '';
  var d = document.createElement('div');
  d.textContent = s;
  return d.innerHTML;
}

var pendingItem = null;

function submitMenuItem(force) {
  var name = document.getElementById('fName').value.trim();
  var price = document.getElementById('fPrice').value.trim();
  var category = document.getElementById('fCategory').value;
  var veg = document.getElementById('fVeg').value;
  var desc = document.getElementById('fDesc').value.trim();
  var msg = document.getElementById('addMsg');

  if (!name || !price) {
    msg.className = 'add-msg error';
    msg.textContent = 'Please fill in food name and price.';
    return;
  }

  if (!force) {
    // Check for duplicate first
    var fd = new URLSearchParams();
    fd.append('action', 'checkDuplicate');
    fd.append('name', name);
    fd.append('restaurantId', '1');

    fetch('MenuItemServlet', { method: 'POST', body: fd })
      .then(r => r.json())
      .then(data => {
        if (data.duplicate) {
          pendingItem = { name: name, price: price, category: category, veg: veg, desc: desc };
          document.getElementById('dupText').textContent = '"' + name + '" already exists on this menu. Do you still want to add it as a new entry?';
          document.getElementById('dupModal').classList.add('show');
        } else {
          doSubmit(name, price, category, veg, desc, false);
        }
      });
    return;
  }
  doSubmit(name, price, category, veg, desc, true);
}

function doSubmit(name, price, category, veg, desc, force) {
  var fd = new URLSearchParams();
  fd.append('action', 'add');
  fd.append('name', name);
  fd.append('price', price);
  fd.append('category', category);
  fd.append('veg', veg);
  fd.append('description', desc);
  fd.append('restaurantId', '1');
  if (force) fd.append('force', 'true');

  fetch('MenuItemServlet', { method: 'POST', body: fd })
    .then(r => r.json())
    .then(data => {
      var msg = document.getElementById('addMsg');
      if (data.success) {
        msg.className = 'add-msg success';
        msg.textContent = '\u2713 ' + data.message;
        document.getElementById('fName').value = '';
        document.getElementById('fPrice').value = '';
        document.getElementById('fDesc').value = '';
        loadItems();
        setTimeout(function(){ msg.style.display='none'; }, 4000);
      } else {
        msg.className = 'add-msg error';
        msg.textContent = data.message || 'Failed to add item.';
      }
    });
}

function confirmAddAnyway() {
  closeDupModal();
  if (pendingItem) {
    doSubmit(pendingItem.name, pendingItem.price, pendingItem.category, pendingItem.veg, pendingItem.desc, true);
    pendingItem = null;
  }
}

function closeDupModal() {
  document.getElementById('dupModal').classList.remove('show');
}

function deleteItem(id) {
  if (!confirm('Delete this menu item?')) return;
  var fd = new URLSearchParams();
  fd.append('action', 'delete');
  fd.append('id', id);
  fetch('MenuItemServlet', { method: 'POST', body: fd })
    .then(r => r.json())
    .then(function(){ loadItems(); });
}

loadItems();
</script>
</body>
</html>
