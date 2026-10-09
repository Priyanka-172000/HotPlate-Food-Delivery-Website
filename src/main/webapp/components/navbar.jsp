<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav style="position:sticky;top:0;z-index:1000;background:#fff;border-bottom:1px solid #e8e8e8;box-shadow:0 2px 8px rgba(0,0,0,0.07);font-family:'Inter',sans-serif;">
  <div style="max-width:1200px;margin:0 auto;padding:0 24px;display:flex;align-items:center;gap:16px;height:68px;">

    <a href="index.jsp" style="display:flex;align-items:center;gap:9px;font-size:21px;font-weight:900;color:#E23744;text-decoration:none;white-space:nowrap;flex-shrink:0;">
      <div style="width:34px;height:34px;background:#E23744;border-radius:9px;display:flex;align-items:center;justify-content:center;">
        <svg width="20" height="20" fill="#fff" viewBox="0 0 24 24"><path d="M18 8h1a4 4 0 0 1 0 8h-1"/><path d="M2 8h16v9a4 4 0 0 1-4 4H6a4 4 0 0 1-4-4V8z"/><line x1="6" y1="1" x2="6" y2="4"/><line x1="10" y1="1" x2="10" y2="4"/><line x1="14" y1="1" x2="14" y2="4"/></svg>
      </div>
      HotPlate
    </a>

    <!-- Navbar Search - submits to restaurants.jsp -->
    <form action="restaurants.jsp" method="get" style="flex:1;display:flex;align-items:center;background:#f8f8f8;border:1.5px solid #e8e8e8;border-radius:30px;padding:0 6px 0 16px;gap:8px;max-width:400px;">
      <svg width="16" height="16" fill="none" stroke="#999" stroke-width="2" viewBox="0 0 24 24"><circle cx="11" cy="11" r="8"/><path d="m21 21-4.35-4.35"/></svg>
      <input type="text" name="search" placeholder="Search restaurants, dishes..."
             style="border:none;background:transparent;font-size:14px;outline:none;width:100%;font-family:'Inter',sans-serif;padding:9px 0;">
      <button type="submit" style="background:#E23744;border:none;border-radius:24px;padding:7px 14px;cursor:pointer;color:#fff;font-size:13px;font-weight:700;font-family:'Inter',sans-serif;white-space:nowrap;">Search</button>
    </form>

    <div style="display:flex;align-items:center;gap:2px;">
      <a href="index.jsp"       style="font-size:14px;font-weight:600;color:#555;padding:8px 13px;border-radius:8px;text-decoration:none;" onmouseover="this.style.background='#FFF0F1';this.style.color='#E23744'" onmouseout="this.style.background='transparent';this.style.color='#555'">Home</a>
      <a href="restaurants.jsp" style="font-size:14px;font-weight:600;color:#555;padding:8px 13px;border-radius:8px;text-decoration:none;" onmouseover="this.style.background='#FFF0F1';this.style.color='#E23744'" onmouseout="this.style.background='transparent';this.style.color='#555'">Restaurants</a>
    </div>

    <div style="display:flex;align-items:center;gap:8px;flex-shrink:0;">
      <a href="login.jsp"    style="padding:9px 20px;border:2px solid #E23744;border-radius:8px;font-size:14px;font-weight:700;color:#E23744;text-decoration:none;">Sign In</a>
      <a href="register.jsp" style="padding:9px 20px;background:#E23744;border-radius:8px;font-size:14px;font-weight:700;color:#fff;text-decoration:none;">Sign Up</a>
      <a href="cart.jsp"     style="display:flex;align-items:center;gap:6px;padding:9px 18px;background:#E23744;border-radius:8px;font-size:14px;font-weight:700;color:#fff;text-decoration:none;">
        <svg width="16" height="16" fill="none" stroke="#fff" stroke-width="2" viewBox="0 0 24 24"><path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"/><line x1="3" y1="6" x2="21" y2="6"/><path d="M16 10a4 4 0 0 1-8 0"/></svg>
        Cart
      </a>
    </div>

  </div>
</nav>
