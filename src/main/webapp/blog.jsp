<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Blog - HotPlate</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
  <style>
    *{margin:0;padding:0;box-sizing:border-box;}body{font-family:'Inter',sans-serif;color:#1C1C1C;background:#f8f8f8;}
    a{text-decoration:none;color:inherit;}.container{max-width:1100px;margin:0 auto;padding:0 24px;}
    .hero{background:linear-gradient(135deg,#1a1a2e 0%,#16213e 55%,#6B1E1E 100%);color:#fff;padding:64px 0;text-align:center;}
    .hero h1{font-size:40px;font-weight:900;margin-bottom:12px;}.hero p{font-size:16px;color:rgba(255,255,255,0.72);}
    .page{padding:56px 0;}
    .blog-grid{display:grid;grid-template-columns:repeat(3,1fr);gap:24px;}
    .blog-card{background:#fff;border-radius:16px;border:1px solid #eee;overflow:hidden;transition:box-shadow 0.2s;}
    .blog-card:hover{box-shadow:0 6px 24px rgba(0,0,0,0.1);}
    .blog-img{height:180px;overflow:hidden;background:#f0f0f0;}
    .blog-img img{width:100%;height:100%;object-fit:cover;}
    .blog-body{padding:20px;}
    .blog-tag{font-size:11px;font-weight:700;color:#E23744;text-transform:uppercase;letter-spacing:1px;margin-bottom:8px;}
    .blog-title{font-size:16px;font-weight:800;margin-bottom:8px;line-height:1.4;}
    .blog-excerpt{font-size:13px;color:#666;line-height:1.6;margin-bottom:14px;}
    .blog-meta{font-size:12px;color:#aaa;display:flex;justify-content:space-between;}
  </style>
</head>
<body>
<jsp:include page="components/navbar.jsp"/>
<div class="hero"><div class="container"><h1>HotPlate Blog</h1><p>Food stories, tips, and updates from India's favourite delivery platform.</p></div></div>
<div class="page">
  <div class="container">
    <div class="blog-grid">
      <div class="blog-card">
        <div class="blog-img"><img src="images/categories/biryani.jpg" alt="Biryani" onerror="this.parentElement.style.background='#FFF0F1'"></div>
        <div class="blog-body">
          <div class="blog-tag">Food &amp; Culture</div>
          <div class="blog-title">The Ultimate Guide to Bangalore's Best Biryani Spots</div>
          <div class="blog-excerpt">From Dum Biryani in Indiranagar to the spicy Hyderabadi versions in BTM, we ranked them all so you don't have to.</div>
          <div class="blog-meta"><span>Rahul Sharma</span><span>June 15, 2026</span></div>
        </div>
      </div>
      <div class="blog-card">
        <div class="blog-img"><img src="images/categories/pizza.jpg" alt="Pizza" onerror="this.parentElement.style.background='#FCE4EC'"></div>
        <div class="blog-body">
          <div class="blog-tag">Tips &amp; Tricks</div>
          <div class="blog-title">How to Get Maximum Discounts on HotPlate Every Week</div>
          <div class="blog-excerpt">Did you know you can stack HotPlate Pro discounts with bank offers? Here's the ultimate money-saving playbook for food delivery.</div>
          <div class="blog-meta"><span>Priya Nair</span><span>June 10, 2026</span></div>
        </div>
      </div>
      <div class="blog-card">
        <div class="blog-img"><img src="images/categories/dosa.jpg" alt="Dosa" onerror="this.parentElement.style.background='#E8F5E9'"></div>
        <div class="blog-body">
          <div class="blog-tag">Health</div>
          <div class="blog-title">5 Healthy Meal Options You Can Order at 2 AM</div>
          <div class="blog-excerpt">Late-night hunger doesn't have to mean junk food. These restaurants on HotPlate serve nutritious options around the clock.</div>
          <div class="blog-meta"><span>Arjun Mehta</span><span>June 5, 2026</span></div>
        </div>
      </div>
      <div class="blog-card">
        <div class="blog-img"><img src="images/categories/burger.jpg" alt="Burger" onerror="this.parentElement.style.background='#E3F2FD'"></div>
        <div class="blog-body">
          <div class="blog-tag">New Feature</div>
          <div class="blog-title">Introducing HotPlate Pro: Premium Deliveries, Zero Fees</div>
          <div class="blog-excerpt">Our new subscription plan gives you free delivery on every order, priority support, and exclusive early access to new restaurants.</div>
          <div class="blog-meta"><span>HotPlate Team</span><span>May 28, 2026</span></div>
        </div>
      </div>
      <div class="blog-card">
        <div class="blog-img"><img src="images/categories/coffee.jpg" alt="Coffee" onerror="this.parentElement.style.background:'#EFEBE9'"></div>
        <div class="blog-body">
          <div class="blog-tag">Lifestyle</div>
          <div class="blog-title">Work From Home? Here's How to Build the Perfect Food Routine</div>
          <div class="blog-excerpt">The best WFH productivity hack isn't a Pomodoro timer — it's having the right meal at the right time. Here's our guide.</div>
          <div class="blog-meta"><span>Sneha Patel</span><span>May 20, 2026</span></div>
        </div>
      </div>
      <div class="blog-card">
        <div class="blog-img"><img src="images/categories/desserts.jpg" alt="Desserts" onerror="this.parentElement.style.background='#FFF8E1'"></div>
        <div class="blog-body">
          <div class="blog-tag">Trending</div>
          <div class="blog-title">Top 10 Desserts You Must Try This Monsoon Season</div>
          <div class="blog-excerpt">Warm gulab jamuns, creamy rabri falooda, and indulgent chocolate lava cakes — we have ranked the best dessert deliveries for the season.</div>
          <div class="blog-meta"><span>HotPlate Team</span><span>May 12, 2026</span></div>
        </div>
      </div>
    </div>
  </div>
</div>
<jsp:include page="components/footer.jsp"/>
</body></html>
