<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"><title>Restaurants - HotPlate Admin</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800;900&display=swap" rel="stylesheet">
  <style>
    *{margin:0;padding:0;box-sizing:border-box;}body{font-family:'Inter',sans-serif;background:#f0f2f5;color:#1C1C1C;display:flex;min-height:100vh;}a{text-decoration:none;color:inherit;}
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
    .add-btn{background:#E23744;color:#fff;border:none;border-radius:10px;padding:10px 20px;font-size:14px;font-weight:700;cursor:pointer;font-family:'Inter',sans-serif;}
    .content{padding:32px;}
    .rest-grid{display:grid;grid-template-columns:repeat(3,1fr);gap:20px;}
    .rest-card{background:#fff;border-radius:16px;border:1px solid #eee;overflow:hidden;}
    .rc-img{height:160px;overflow:hidden;position:relative;background:#f5f5f5;}
    .rc-img img{width:100%;height:100%;object-fit:cover;}
    .rc-status{position:absolute;top:12px;right:12px;padding:4px 10px;border-radius:20px;font-size:11px;font-weight:700;}
    .rc-status.active{background:#26A541;color:#fff;}.rc-status.inactive{background:#aaa;color:#fff;}
    .rc-body{padding:16px;}
    .rc-name{font-size:16px;font-weight:800;margin-bottom:6px;}
    .rc-meta{font-size:13px;color:#777;margin-bottom:12px;}
    .rc-stats{display:flex;gap:16px;margin-bottom:14px;}
    .rc-stat{text-align:center;}.rc-stat-num{font-size:16px;font-weight:800;}.rc-stat-lbl{font-size:11px;color:#888;}
    .rc-actions{display:flex;gap:8px;}
    .btn-toggle{flex:1;padding:8px;text-align:center;border-radius:8px;font-size:13px;font-weight:700;border:none;cursor:pointer;font-family:'Inter',sans-serif;}
    .btn-deactivate{background:#FFF0F1;color:#E23744;}
    .btn-activate{background:#E8F5E9;color:#26A541;}
    .btn-delete{padding:8px 12px;background:#f0f0f0;color:#666;border-radius:8px;border:none;cursor:pointer;font-size:13px;font-weight:700;font-family:'Inter',sans-serif;}

    /* Modal */
    .modal-overlay{display:none;position:fixed;inset:0;background:rgba(0,0,0,0.5);z-index:2000;align-items:center;justify-content:center;}
    .modal-overlay.show{display:flex;}
    .modal-box{background:#fff;border-radius:16px;padding:28px;max-width:480px;width:92%;max-height:88vh;overflow-y:auto;}
    .modal-title{font-size:18px;font-weight:800;margin-bottom:20px;}
    .fg{margin-bottom:14px;}
    .fg label{display:block;font-size:12px;font-weight:700;color:#666;margin-bottom:6px;}
    .fg input,.fg select{width:100%;padding:11px 14px;border:1.5px solid #e8e8e8;border-radius:10px;font-size:14px;font-family:'Inter',sans-serif;outline:none;}
    .fg input:focus,.fg select:focus{border-color:#E23744;}
    .frow{display:grid;grid-template-columns:1fr 1fr;gap:12px;}
    .modal-actions{display:flex;gap:12px;margin-top:18px;}
    .modal-btn{flex:1;padding:12px;border-radius:10px;font-size:14px;font-weight:700;cursor:pointer;border:none;font-family:'Inter',sans-serif;}
    .modal-btn.cancel{background:#f0f0f0;color:#555;}
    .modal-btn.confirm{background:#E23744;color:#fff;}
    .modal-msg{font-size:13px;font-weight:700;padding:10px 14px;border-radius:8px;margin-top:10px;display:none;}
    .modal-msg.error{background:#FFF0F1;color:#E23744;display:block;}
    .modal-msg.success{background:#F0FFF4;color:#26A541;display:block;}
  </style>
</head>
<body>
<div class="sidebar">
  <div class="sb-brand"><div class="sb-logo"><svg width="20" height="20" fill="#fff" viewBox="0 0 24 24"><path d="M18 8h1a4 4 0 0 1 0 8h-1"/><path d="M2 8h16v9a4 4 0 0 1-4 4H6a4 4 0 0 1-4-4V8z"/></svg></div><div><div class="sb-brand-name">HotPlate</div></div></div>
  <div class="sb-admin">Main Menu</div>
  <div class="sb-nav">
    <a href="dashboard.jsp"             class="sb-link"><svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/></svg>Dashboard</a>
    <a href="order-management.jsp"      class="sb-link"><svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"/></svg>Orders</a>
    <a href="restaurant-management.jsp" class="sb-link active"><svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/></svg>Restaurants</a>
    <a href="menu-management.jsp"       class="sb-link"><svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><line x1="8" y1="6" x2="21" y2="6"/><line x1="8" y1="12" x2="21" y2="12"/><line x1="8" y1="18" x2="21" y2="18"/></svg>Menu Items</a>
    <a href="users.jsp"                 class="sb-link"><svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/></svg>Users</a>
    <a href="../index.jsp"              class="sb-link"><svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="m3 9 9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/></svg>View Website</a>
  </div>
  <div class="sb-bottom"><div class="sb-user"><div class="sb-avatar">A</div><div><div class="sb-uname">Admin User</div><div class="sb-urole">Super Admin</div></div></div><a href="AdminLogoutServlet" class="sb-link" style="margin-top:8px;"><svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/></svg>Logout</a></div>
</div>
<div class="main">
  <div class="topbar">
    <div class="topbar-title">Restaurant Management</div>
    <button class="add-btn" onclick="openAddModal()">+ Add Restaurant</button>
  </div>
  <div class="content">
    <div class="rest-grid" id="restGrid">
      <div style="grid-column:1/-1;text-align:center;padding:60px;color:#aaa;">Loading restaurants...</div>
    </div>
  </div>
</div>

<!-- Add Restaurant Modal -->
<div class="modal-overlay" id="addModal">
  <div class="modal-box">
    <div class="modal-title">Add New Restaurant</div>
    <div class="fg"><label>Restaurant Name *</label><input type="text" id="rName" placeholder="e.g. Pizza Paradise"></div>
    <div class="frow">
      <div class="fg"><label>Cuisine</label><input type="text" id="rCuisine" placeholder="e.g. Pizza, Italian"></div>
      <div class="fg"><label>Tags (comma separated)</label><input type="text" id="rTags" placeholder="pizza,italian"></div>
    </div>
    <div class="frow">
      <div class="fg"><label>Delivery Time</label><input type="text" id="rTime" placeholder="30-40 min"></div>
      <div class="fg"><label>Cost for Two (&#8377;)</label><input type="number" id="rCost" placeholder="300"></div>
    </div>
    <div class="fg"><label>Image Path</label><input type="text" id="rImage" placeholder="images/restaurants/kfc.jpg" value="images/restaurants/kfc.jpg"></div>
    <div class="fg"><label>Promo Text</label><input type="text" id="rPromo" placeholder="e.g. 20% OFF first order"></div>
    <div id="addModalMsg" class="modal-msg"></div>
    <div class="modal-actions">
      <button class="modal-btn cancel" onclick="closeAddModal()">Cancel</button>
      <button class="modal-btn confirm" onclick="submitRestaurant()">Add Restaurant</button>
    </div>
  </div>
</div>

<script>
var allRest = [];

function loadRestaurants() {
  fetch('RestaurantAdminServlet2?action=list')
    .then(r => r.json())
    .then(data => { allRest = data; renderGrid(); })
    .catch(() => {
      document.getElementById('restGrid').innerHTML = '<div style="grid-column:1/-1;text-align:center;padding:60px;color:#aaa;">Failed to load restaurants.</div>';
    });
}

function renderGrid() {
  var grid = document.getElementById('restGrid');
  if (allRest.length === 0) {
    grid.innerHTML = '<div style="grid-column:1/-1;text-align:center;padding:60px;color:#aaa;">No restaurants yet. Add one above.</div>';
    return;
  }
  var html = '';
  allRest.forEach(function(r) {
    var isActive = (r.status || 'active') === 'active';
    html += '<div class="rest-card">' +
      '<div class="rc-img"><img src="../' + r.image + '" onerror="this.src=\'../images/restaurants/kfc.jpg\'" alt="">' +
      '<span class="rc-status ' + (isActive?'active':'inactive') + '">' + (isActive?'Active':'Inactive') + '</span></div>' +
      '<div class="rc-body">' +
        '<div class="rc-name">' + escapeHtml(r.name) + '</div>' +
        '<div class="rc-meta">' + escapeHtml(r.cuisine || '') + '</div>' +
        '<div class="rc-stats">' +
          '<div class="rc-stat"><div class="rc-stat-num">&#9733; ' + escapeHtml(r.rating||'4.0') + '</div><div class="rc-stat-lbl">Rating</div></div>' +
          '<div class="rc-stat"><div class="rc-stat-num">' + escapeHtml(r.time||'30-40 min') + '</div><div class="rc-stat-lbl">Delivery</div></div>' +
          '<div class="rc-stat"><div class="rc-stat-num">&#8377;' + escapeHtml(r.costForTwo||'300') + '</div><div class="rc-stat-lbl">For Two</div></div>' +
        '</div>' +
        '<div class="rc-actions">' +
          '<button class="btn-toggle ' + (isActive?'btn-deactivate':'btn-activate') + '" onclick="toggleStatus(\'' + r.id + '\')">' + (isActive?'Deactivate':'Activate') + '</button>' +
          '<button class="btn-delete" onclick="deleteRest(\'' + r.id + '\')">Delete</button>' +
        '</div>' +
      '</div>' +
    '</div>';
  });
  grid.innerHTML = html;
}

function toggleStatus(id) {
  var fd = new URLSearchParams();
  fd.append('action','toggleStatus');
  fd.append('id', id);
  fetch('RestaurantAdminServlet2', {method:'POST', body:fd})
    .then(r=>r.json())
    .then(()=>loadRestaurants());
}

function deleteRest(id) {
  if (!confirm('Delete this restaurant?')) return;
  var fd = new URLSearchParams();
  fd.append('action','delete');
  fd.append('id', id);
  fetch('RestaurantAdminServlet2', {method:'POST', body:fd})
    .then(r=>r.json())
    .then(()=>loadRestaurants());
}

function openAddModal(){ document.getElementById('addModal').classList.add('show'); }
function closeAddModal(){
  document.getElementById('addModal').classList.remove('show');
  document.getElementById('addModalMsg').style.display='none';
  document.getElementById('rName').value='';
  document.getElementById('rCuisine').value='';
  document.getElementById('rTags').value='';
  document.getElementById('rTime').value='';
  document.getElementById('rCost').value='';
  document.getElementById('rPromo').value='';
}

function submitRestaurant() {
  var name = document.getElementById('rName').value.trim();
  var msg = document.getElementById('addModalMsg');
  if (!name) {
    msg.className='modal-msg error'; msg.textContent='Restaurant name is required.';
    return;
  }
  var fd = new URLSearchParams();
  fd.append('action','add');
  fd.append('name', name);
  fd.append('cuisine', document.getElementById('rCuisine').value.trim());
  fd.append('tags', document.getElementById('rTags').value.trim());
  fd.append('time', document.getElementById('rTime').value.trim());
  fd.append('costForTwo', document.getElementById('rCost').value.trim());
  fd.append('image', document.getElementById('rImage').value.trim());
  fd.append('promo', document.getElementById('rPromo').value.trim());

  fetch('RestaurantAdminServlet2', {method:'POST', body:fd})
    .then(r=>r.json())
    .then(data=>{
      if (data.success) {
        msg.className='modal-msg success'; msg.textContent=data.message;
        loadRestaurants();
        setTimeout(closeAddModal, 1200);
      } else {
        msg.className='modal-msg error'; msg.textContent=data.message || 'Failed to add restaurant.';
      }
    });
}

function escapeHtml(s){ if(!s) return ''; var d=document.createElement('div'); d.textContent=s; return d.innerHTML; }

loadRestaurants();
</script>
</body></html>
