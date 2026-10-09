<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
  String category = request.getParameter("category");
  String search   = request.getParameter("search");
  if (search != null) search = search.trim().toLowerCase();

  String pageTitle = "All Restaurants";
  if (category != null && !category.isEmpty())
    pageTitle = category.substring(0,1).toUpperCase() + category.substring(1) + " Restaurants";
  if (search != null && !search.isEmpty())
    pageTitle = "Search: \"" + request.getParameter("search").trim() + "\"";

  String[][] restaurants = {
    {"1","KFC",             "images/restaurants/kfc.jpg",            "Chicken, Burgers, Fast Food",     "30-40 min","4.3","250","chicken,burger,fast food","40% OFF up to Rs.120"},
    {"2","Domino's Pizza",  "images/restaurants/dominos.jpg",        "Pizza, Pasta, Italian",           "25-35 min","4.5","400","pizza,pasta,italian",     "Buy 1 Get 1 Free"},
    {"3","Biryani House",   "images/restaurants/biryani-house.jpg",  "Biryani, Mughlai, North Indian",  "40-50 min","4.6","350","biryani,mughlai,north indian","30% OFF on first order"},
    {"4","McDonald's",      "images/restaurants/mcdonalds.jpg",      "Burgers, Fast Food, Shakes",      "20-30 min","4.2","200","burger,fast food,shakes", "Free item on Rs.199+"},
    {"5","Sushi Sakura",    "images/restaurants/sushi-sakura.jpg",   "Japanese, Sushi, Rolls",          "45-55 min","4.7","800","sushi,japanese,rolls",    "20% OFF weekends"},
    {"6","Cafe Coffee Day", "images/restaurants/cafe-coffee.jpg",    "Coffee, Beverages, Sandwiches",   "15-25 min","4.1","300","coffee,beverages,sandwich","Buy 2 Get 1 Free"},
    {"7","Dosa Plaza",      "images/restaurants/dosa-plaza.jpg",     "South Indian, Dosa, Idli",        "25-35 min","4.4","180","dosa,south indian,idli",  "Flat Rs.50 off on Rs.249+"},
    {"8","Wow China",       "images/restaurants/wow-china.jpg",      "Chinese, Noodles, Dim Sum",       "35-45 min","4.0","280","chinese,noodles,dim sum", "Extra 15% OFF"},
    {"9","The Salad Bowl",  "images/restaurants/salad-bowl.jpg",     "Healthy, Salads, Wraps",          "20-30 min","4.3","320","healthy,salad,wraps",     "10% cashback"},
    {"10","Dessert Factory","images/restaurants/dessert-factory.jpg","Desserts, Ice Cream, Cakes",      "30-40 min","4.5","250","desserts,ice cream,cakes","Free dessert on Rs.399+"}
  };

  // Filter by category AND/OR search
  boolean hasCategory = (category != null && !category.isEmpty());
  boolean hasSearch   = (search != null && !search.isEmpty());

  java.util.List<String[]> filtered = new java.util.ArrayList<>();
  for (String[] r : restaurants) {
    boolean catMatch  = !hasCategory || r[7].contains(category.toLowerCase());
    boolean srchMatch = !hasSearch   || r[1].toLowerCase().contains(search)
                                     || r[3].toLowerCase().contains(search)
                                     || r[7].contains(search);
    if (catMatch && srchMatch) filtered.add(r);
  }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><%= pageTitle %> - HotPlate</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
  <style>
    *{margin:0;padding:0;box-sizing:border-box;}
    body{font-family:'Inter',sans-serif;color:#1C1C1C;background:#f8f8f8;}
    a{text-decoration:none;color:inherit;}
    .container{max-width:1100px;margin:0 auto;padding:0 24px;}

    /* Page Header */
    .page-head{background:linear-gradient(135deg,#1a1a2e 0%,#16213e 55%,#6B1E1E 100%);color:#fff;padding:36px 0;}
    .page-head h1{font-size:30px;font-weight:900;margin-bottom:8px;}
    .page-head p{font-size:14px;color:rgba(255,255,255,0.68);margin-bottom:22px;}

    /* Search bar inside header */
    .header-search{display:flex;gap:0;background:#fff;border-radius:12px;overflow:hidden;max-width:560px;margin-bottom:22px;box-shadow:0 4px 16px rgba(0,0,0,0.2);}
    .header-search input{flex:1;padding:14px 18px;border:none;outline:none;font-size:15px;font-family:'Inter',sans-serif;color:#1C1C1C;}
    .header-search button{background:#E23744;color:#fff;border:none;padding:14px 24px;font-size:15px;font-weight:700;cursor:pointer;font-family:'Inter',sans-serif;transition:background 0.18s;}
    .header-search button:hover{background:#C62233;}

    /* Filter chips */
    .filters{display:flex;flex-wrap:wrap;gap:10px;}
    .chip{padding:8px 18px;border-radius:30px;font-size:13px;font-weight:700;color:rgba(255,255,255,0.8);background:rgba(255,255,255,0.1);border:1px solid rgba(255,255,255,0.2);cursor:pointer;transition:all 0.18s;text-decoration:none;}
    .chip:hover,.chip.active{background:#E23744;border-color:#E23744;color:#fff;}

    /* Results area */
    .rest-page{padding:32px 0 80px;}
    .result-info{font-size:14px;font-weight:700;color:#666;margin-bottom:22px;}
    .result-info span{color:#E23744;}

    /* Restaurant cards */
    .rlist{display:flex;flex-direction:column;gap:16px;}
    .rcard{background:#fff;border:1px solid #e8e8e8;border-radius:16px;display:flex;overflow:hidden;transition:box-shadow 0.2s,transform 0.2s;cursor:pointer;}
    .rcard:hover{box-shadow:0 6px 24px rgba(0,0,0,0.1);transform:translateY(-1px);}
    .rc-img{width:220px;flex-shrink:0;overflow:hidden;position:relative;background:#f5f5f5;}
    .rc-img img{width:100%;height:100%;object-fit:cover;display:block;transition:transform 0.3s;}
    .rcard:hover .rc-img img{transform:scale(1.04);}
    .rc-badge{position:absolute;top:12px;left:12px;background:rgba(0,0,0,0.7);color:#fff;border-radius:6px;padding:4px 10px;font-size:11px;font-weight:600;}
    .rc-promo{position:absolute;bottom:12px;left:12px;background:#E23744;color:#fff;border-radius:6px;padding:4px 10px;font-size:11px;font-weight:700;}
    .rc-body{padding:22px 24px;display:flex;flex-direction:column;justify-content:center;}
    .rc-name{font-size:20px;font-weight:900;margin-bottom:8px;}
    .rc-meta{display:flex;align-items:center;gap:10px;margin-bottom:10px;}
    .rc-rating{color:#3D9B35;font-weight:800;font-size:14px;}
    .rc-type{font-size:13px;color:#777;}
    .rc-foot{display:flex;gap:20px;font-size:13px;color:#555;font-weight:600;}

    /* No results */
    .no-results{background:#fff;border-radius:16px;border:1px solid #eee;padding:72px 24px;text-align:center;}
    .no-results svg{opacity:0.25;margin-bottom:20px;}
    .no-results h3{font-size:20px;font-weight:800;margin-bottom:10px;color:#1C1C1C;}
    .no-results p{font-size:14px;color:#888;margin-bottom:24px;}
    .no-results a{display:inline-block;background:#E23744;color:#fff;border-radius:10px;padding:12px 28px;font-size:15px;font-weight:700;}
  </style>
</head>
<body>
<jsp:include page="components/navbar.jsp"/>

<!-- Page Header -->
<div class="page-head">
  <div class="container">
    <h1><%= pageTitle %></h1>
    <p>Discover the best food and beverages in Bangalore</p>

    <!-- Search Bar -->
    <form class="header-search" action="restaurants.jsp" method="get">
      <% if (hasCategory) { %><input type="hidden" name="category" value="<%= category %>"><% } %>
      <input type="text" name="search" placeholder="Search by name, cuisine (e.g. Sushi Sakura, biryani...)"
             value="<%= request.getParameter("search") != null ? request.getParameter("search") : "" %>">
      <button type="submit">Search</button>
    </form>

    <!-- Category Filters -->
    <div class="filters">
      <a href="restaurants.jsp" class="chip <%= (!hasCategory && !hasSearch) ? "active" : "" %>">All</a>
      <a href="restaurants.jsp?category=pizza"       class="chip <%= "pizza".equals(category)       ? "active":"" %>">Pizza</a>
      <a href="restaurants.jsp?category=burger"      class="chip <%= "burger".equals(category)      ? "active":"" %>">Burgers</a>
      <a href="restaurants.jsp?category=biryani"     class="chip <%= "biryani".equals(category)     ? "active":"" %>">Biryani</a>
      <a href="restaurants.jsp?category=chinese"     class="chip <%= "chinese".equals(category)     ? "active":"" %>">Chinese</a>
      <a href="restaurants.jsp?category=dosa"        class="chip <%= "dosa".equals(category)        ? "active":"" %>">South Indian</a>
      <a href="restaurants.jsp?category=chicken"     class="chip <%= "chicken".equals(category)     ? "active":"" %>">Chicken</a>
      <a href="restaurants.jsp?category=desserts"    class="chip <%= "desserts".equals(category)    ? "active":"" %>">Desserts</a>
      <a href="restaurants.jsp?category=coffee"      class="chip <%= "coffee".equals(category)      ? "active":"" %>">Coffee</a>
      <a href="restaurants.jsp?category=healthy"     class="chip <%= "healthy".equals(category)     ? "active":"" %>">Healthy</a>
    </div>
  </div>
</div>

<!-- Results -->
<div class="rest-page">
  <div class="container">

    <div class="result-info">
      <% if (hasSearch) { %>
        Showing <span><%= filtered.size() %></span> result<%= filtered.size() != 1 ? "s" : "" %> for "<%= request.getParameter("search").trim() %>"
      <% } else { %>
        <span><%= filtered.size() %></span> Restaurant<%= filtered.size() != 1 ? "s" : "" %> near you
      <% } %>
    </div>

    <% if (filtered.isEmpty()) { %>
    <div class="no-results">
      <svg width="80" height="80" fill="none" stroke="#ccc" stroke-width="1.5" viewBox="0 0 24 24">
        <circle cx="11" cy="11" r="8"/><path d="m21 21-4.35-4.35"/>
        <line x1="8" y1="11" x2="14" y2="11"/>
      </svg>
      <h3>No restaurants found</h3>
      <% if (hasSearch) { %>
        <p>We couldn't find any restaurants matching "<strong><%= request.getParameter("search").trim() %></strong>".<br>Try a different name or browse by category.</p>
      <% } else { %>
        <p>No restaurants available in this category right now.<br>Try a different filter.</p>
      <% } %>
      <a href="restaurants.jsp">View All Restaurants</a>
    </div>
    <% } else { %>
    <div class="rlist">
      <% for (String[] r : filtered) {
           String url = "menu.jsp?restaurant=" + r[0] + "&name=" + java.net.URLEncoder.encode(r[1], "UTF-8"); %>
      <a href="<%= url %>" class="rcard">
        <div class="rc-img">
          <img src="<%= r[2] %>" alt="<%= r[1] %>">
          <div class="rc-badge"><%= r[4] %></div>
          <div class="rc-promo"><%= r[8] %></div>
        </div>
        <div class="rc-body">
          <div class="rc-name"><%= r[1] %></div>
          <div class="rc-meta">
            <span class="rc-rating">&#9733; <%= r[5] %></span>
            <span class="rc-type"><%= r[3] %></span>
          </div>
          <div class="rc-foot">
            <span><%= r[4] %></span>
            <span>&#8377;<%= r[6] %> for two</span>
          </div>
        </div>
      </a>
      <% } %>
    </div>
    <% } %>

  </div>
</div>

<jsp:include page="components/footer.jsp"/>
</body>
</html>
