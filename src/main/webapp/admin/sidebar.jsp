<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  String activePage = (String) request.getAttribute("activePage"); if(activePage==null) activePage=""; %>
<div class="sidebar">
  <div class="sb-brand">
    <div class="sb-logo"><svg width="20" height="20" fill="#fff" viewBox="0 0 24 24"><path d="M18 8h1a4 4 0 0 1 0 8h-1"/><path d="M2 8h16v9a4 4 0 0 1-4 4H6a4 4 0 0 1-4-4V8z"/><line x1="6" y1="1" x2="6" y2="4"/><line x1="10" y1="1" x2="10" y2="4"/><line x1="14" y1="1" x2="14" y2="4"/></svg></div>
    <div><div class="sb-brand-name">HotPlate</div><div style="font-size:10px;color:rgba(255,255,255,0.4);font-weight:600;">Admin Panel</div></div>
  </div>
  <div class="sb-admin">Main Menu</div>
  <div class="sb-nav">
    <a href="dashboard.jsp"             class="sb-link <%= "dashboard".equals(activePage)?"active":"" %>"><svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7"/><rect x="14" y="3" width="7" height="7"/><rect x="14" y="14" width="7" height="7"/><rect x="3" y="14" width="7" height="7"/></svg>Dashboard</a>
    <a href="order-management.jsp"      class="sb-link <%= "orders".equals(activePage)?"active":"" %>"><svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"/><line x1="3" y1="6" x2="21" y2="6"/></svg>Orders</a>
    <a href="restaurant-management.jsp" class="sb-link <%= "restaurants".equals(activePage)?"active":"" %>"><svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/></svg>Restaurants</a>
    <a href="menu-management.jsp"       class="sb-link <%= "menu".equals(activePage)?"active":"" %>"><svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><line x1="8" y1="6" x2="21" y2="6"/><line x1="8" y1="12" x2="21" y2="12"/><line x1="8" y1="18" x2="21" y2="18"/><line x1="3" y1="6" x2="3.01" y2="6"/></svg>Menu Items</a>
    <a href="../index.jsp"              class="sb-link"><svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="m3 9 9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"/></svg>View Website</a>
  </div>
  <div class="sb-bottom">
    <div class="sb-user"><div class="sb-avatar">A</div><div><div class="sb-uname">Admin User</div><div class="sb-urole">Super Admin</div></div></div>
    <a href="AdminLogoutServlet" class="sb-link" style="margin-top:8px;"><svg width="18" height="18" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><polyline points="16 17 21 12 16 7"/><line x1="21" y1="12" x2="9" y2="12"/></svg>Logout</a>
  </div>
</div>
