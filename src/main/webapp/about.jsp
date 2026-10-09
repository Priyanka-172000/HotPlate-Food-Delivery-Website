<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>About Us - HotPlate</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
  <style>
    *{margin:0;padding:0;box-sizing:border-box;}body{font-family:'Inter',sans-serif;color:#1C1C1C;}
    a{text-decoration:none;color:inherit;}.container{max-width:1100px;margin:0 auto;padding:0 24px;}
    .hero{background:linear-gradient(135deg,#1a1a2e 0%,#16213e 55%,#6B1E1E 100%);color:#fff;padding:80px 0;text-align:center;}
    .hero h1{font-size:46px;font-weight:900;margin-bottom:16px;}
    .hero p{font-size:17px;color:rgba(255,255,255,0.75);max-width:600px;margin:0 auto;}
    .section{padding:64px 0;}
    .section-title{font-size:28px;font-weight:900;margin-bottom:14px;}
    .section-sub{font-size:15px;color:#666;line-height:1.8;margin-bottom:32px;}
    .stats{display:grid;grid-template-columns:repeat(4,1fr);gap:24px;margin:48px 0;}
    .stat-box{background:#f8f8f8;border-radius:16px;padding:28px;text-align:center;}
    .stat-num{font-size:36px;font-weight:900;color:#E23744;}
    .stat-lbl{font-size:14px;color:#666;font-weight:600;margin-top:6px;}
    .team-grid{display:grid;grid-template-columns:repeat(3,1fr);gap:28px;margin-top:32px;}
    .team-card{background:#fff;border:1px solid #eee;border-radius:16px;padding:28px;text-align:center;}
    .team-avatar{width:72px;height:72px;border-radius:50%;margin:0 auto 14px;display:flex;align-items:center;justify-content:center;font-size:26px;font-weight:900;color:#fff;}
    .team-name{font-size:16px;font-weight:800;margin-bottom:4px;}
    .team-role{font-size:13px;color:#888;}
    .values{display:grid;grid-template-columns:repeat(3,1fr);gap:20px;margin-top:28px;}
    .val-card{background:#FFF0F1;border-radius:14px;padding:24px;}
    .val-icon{font-size:28px;margin-bottom:12px;}
    .val-title{font-size:15px;font-weight:800;margin-bottom:8px;}
    .val-text{font-size:13px;color:#555;line-height:1.6;}
  </style>
</head>
<body>
<jsp:include page="components/navbar.jsp"/>
<div class="hero">
  <div class="container">
    <h1>About HotPlate</h1>
    <p>We're on a mission to deliver happiness — one hot meal at a time — across India's most vibrant cities.</p>
  </div>
</div>
<div class="section" style="background:#fff;">
  <div class="container">
    <div style="display:grid;grid-template-columns:1fr 1fr;gap:60px;align-items:center;">
      <div>
        <div class="section-title">Our Story</div>
        <div class="section-sub">HotPlate was founded in 2022 by a group of food-obsessed engineers in Bangalore who were tired of cold deliveries and limited options. We set out to build a platform that guaranteed hot food in 30 minutes — and we haven't looked back since.<br><br>Today, HotPlate connects millions of hungry customers with 500+ top-rated restaurants across 100+ cities, with a promise that's simple: <strong>hot food, fast delivery, every time.</strong></div>
      </div>
      <div class="stats">
        <div class="stat-box"><div class="stat-num">500+</div><div class="stat-lbl">Restaurants</div></div>
        <div class="stat-box"><div class="stat-num">100+</div><div class="stat-lbl">Cities</div></div>
        <div class="stat-box"><div class="stat-num">10M+</div><div class="stat-lbl">Orders</div></div>
        <div class="stat-box"><div class="stat-num">30 min</div><div class="stat-lbl">Avg Delivery</div></div>
      </div>
    </div>
  </div>
</div>
<div class="section" style="background:#f8f8f8;">
  <div class="container">
    <div class="section-title">Our Values</div>
    <div class="values">
      <div class="val-card"><div class="val-icon">&#9889;</div><div class="val-title">Speed</div><div class="val-text">We guarantee delivery in 30 minutes or your next order is on us. Speed isn't a feature — it's our promise.</div></div>
      <div class="val-card" style="background:#E8F5E9;"><div class="val-icon">&#127919;</div><div class="val-title">Quality</div><div class="val-text">Every restaurant on HotPlate is carefully vetted for food safety, hygiene, and consistency.</div></div>
      <div class="val-card" style="background:#E3F2FD;"><div class="val-icon">&#128512;</div><div class="val-title">Customer First</div><div class="val-text">Our 24/7 support team resolves every issue within the hour. Your satisfaction is non-negotiable.</div></div>
    </div>
  </div>
</div>
<div class="section" style="background:#fff;">
  <div class="container">
    <div class="section-title">Meet the Team</div>
    <div class="team-grid">
      <div class="team-card"><div class="team-avatar" style="background:#E23744;">P</div><div class="team-name">Priyanka D</div><div class="team-role">Co-Founder &amp; CEO</div></div>
      <div class="team-card"><div class="team-avatar" style="background:#1976D2;">A</div><div class="team-name">Athrav K</div><div class="team-role">Co-Founder &amp; CTO</div></div>
      <div class="team-card"><div class="team-avatar" style="background:#26A541;">B</div><div class="team-name">Basavaraj</div><div class="team-role">Head of Operations</div></div>
    </div>
  </div>
</div>
<jsp:include page="components/footer.jsp"/>
</body></html>
