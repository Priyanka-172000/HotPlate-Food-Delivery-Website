<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  // Determine the correct base path relative to where this footer is included from
  String uri = request.getRequestURI();
  String ctx = request.getContextPath();
  // If we're inside /admin/, go up one level; otherwise stay at root
  String base = uri.contains("/admin/") ? "../" : "";
%>
<footer style="background:#1C1C1C;color:rgba(255,255,255,0.7);font-family:'Inter',sans-serif;padding:48px 0 0;margin-top:auto;">
  <div style="max-width:1200px;margin:0 auto;padding:0 24px;">
    <div style="display:grid;grid-template-columns:2fr 1fr 1fr 1fr;gap:40px;margin-bottom:40px;">

      <!-- Brand -->
      <div>
        <a href="<%= base %>index.jsp" style="display:flex;align-items:center;gap:10px;margin-bottom:14px;text-decoration:none;">
          <div style="width:36px;height:36px;background:#E23744;border-radius:9px;display:flex;align-items:center;justify-content:center;">
            <svg width="20" height="20" fill="#fff" viewBox="0 0 24 24"><path d="M18 8h1a4 4 0 0 1 0 8h-1"/><path d="M2 8h16v9a4 4 0 0 1-4 4H6a4 4 0 0 1-4-4V8z"/><line x1="6" y1="1" x2="6" y2="4"/><line x1="10" y1="1" x2="10" y2="4"/><line x1="14" y1="1" x2="14" y2="4"/></svg>
          </div>
          <span style="font-size:20px;font-weight:900;color:#fff;">HotPlate</span>
        </a>
        <p style="font-size:13px;line-height:1.8;color:rgba(255,255,255,0.55);">India's fastest food delivery. Order from 500+ restaurants in 100+ cities. Hot food in 30 minutes, guaranteed.</p>
        <div style="display:flex;gap:10px;margin-top:18px;">
          <span style="background:rgba(255,255,255,0.08);border-radius:8px;padding:8px 14px;font-size:12px;font-weight:700;color:#fff;cursor:default;">App Store</span>
          <span style="background:rgba(255,255,255,0.08);border-radius:8px;padding:8px 14px;font-size:12px;font-weight:700;color:#fff;cursor:default;">Play Store</span>
        </div>
      </div>

      <!-- Company -->
      <div>
        <h4 style="font-size:14px;font-weight:700;color:#fff;margin-bottom:16px;">Company</h4>
        <div style="display:flex;flex-direction:column;gap:11px;">
          <a href="<%= base %>about.jsp"  style="font-size:13px;color:rgba(255,255,255,0.55);text-decoration:none;" onmouseover="this.style.color='#fff'" onmouseout="this.style.color='rgba(255,255,255,0.55)'">About Us</a>
          <a href="<%= base %>careers.jsp" style="font-size:13px;color:rgba(255,255,255,0.55);text-decoration:none;" onmouseover="this.style.color='#fff'" onmouseout="this.style.color='rgba(255,255,255,0.55)'">Careers</a>
          <a href="<%= base %>blog.jsp"   style="font-size:13px;color:rgba(255,255,255,0.55);text-decoration:none;" onmouseover="this.style.color='#fff'" onmouseout="this.style.color='rgba(255,255,255,0.55)'">Blog</a>
          <a href="<%= base %>press.jsp"  style="font-size:13px;color:rgba(255,255,255,0.55);text-decoration:none;" onmouseover="this.style.color='#fff'" onmouseout="this.style.color='rgba(255,255,255,0.55)'">Press</a>
        </div>
      </div>

      <!-- For You -->
      <div>
        <h4 style="font-size:14px;font-weight:700;color:#fff;margin-bottom:16px;">For You</h4>
        <div style="display:flex;flex-direction:column;gap:11px;">
          <a href="<%= base %>restaurants.jsp"        style="font-size:13px;color:rgba(255,255,255,0.55);text-decoration:none;" onmouseover="this.style.color='#fff'" onmouseout="this.style.color='rgba(255,255,255,0.55)'">Restaurants</a>
          <a href="<%= base %>partner.jsp"            style="font-size:13px;color:rgba(255,255,255,0.55);text-decoration:none;" onmouseover="this.style.color='#fff'" onmouseout="this.style.color='rgba(255,255,255,0.55)'">Partner With Us</a>
          <a href="<%= base %>rider.jsp"              style="font-size:13px;color:rgba(255,255,255,0.55);text-decoration:none;" onmouseover="this.style.color='#fff'" onmouseout="this.style.color='rgba(255,255,255,0.55)'">Become a Rider</a>
          <a href="<%= base %>pro.jsp"                style="font-size:13px;color:rgba(255,255,255,0.55);text-decoration:none;" onmouseover="this.style.color='#fff'" onmouseout="this.style.color='rgba(255,255,255,0.55)'">HotPlate Pro</a>
        </div>
      </div>

      <!-- Support -->
      <div>
        <h4 style="font-size:14px;font-weight:700;color:#fff;margin-bottom:16px;">Support</h4>
        <div style="display:flex;flex-direction:column;gap:11px;">
          <a href="<%= base %>help.jsp"    style="font-size:13px;color:rgba(255,255,255,0.55);text-decoration:none;" onmouseover="this.style.color='#fff'" onmouseout="this.style.color='rgba(255,255,255,0.55)'">Help Centre</a>
          <a href="<%= base %>contact.jsp" style="font-size:13px;color:rgba(255,255,255,0.55);text-decoration:none;" onmouseover="this.style.color='#fff'" onmouseout="this.style.color='rgba(255,255,255,0.55)'">Contact Us</a>
          <a href="<%= base %>privacy.jsp" style="font-size:13px;color:rgba(255,255,255,0.55);text-decoration:none;" onmouseover="this.style.color='#fff'" onmouseout="this.style.color='rgba(255,255,255,0.55)'">Privacy Policy</a>
          <a href="<%= base %>terms.jsp"   style="font-size:13px;color:rgba(255,255,255,0.55);text-decoration:none;" onmouseover="this.style.color='#fff'" onmouseout="this.style.color='rgba(255,255,255,0.55)'">Terms of Service</a>
        </div>
      </div>

    </div>
    <div style="border-top:1px solid rgba(255,255,255,0.1);padding:20px 0;display:flex;justify-content:space-between;align-items:center;">
      <span style="font-size:13px;color:rgba(255,255,255,0.4);">&copy; 2026 HotPlate Technologies Pvt. Ltd. All rights reserved.</span>
      <span style="font-size:13px;color:rgba(255,255,255,0.4);">
        India &middot; &#8377; INR &middot;
        <a href="<%= base %>admin/admin-login.jsp" style="color:rgba(255,255,255,0.4);text-decoration:none;" onmouseover="this.style.color='#fff'" onmouseout="this.style.color='rgba(255,255,255,0.4)'">Admin Login</a>
      </span>
    </div>
  </div>
</footer>
