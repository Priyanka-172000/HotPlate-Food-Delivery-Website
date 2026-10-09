<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>HotPlate - Order Food Online | 30 Min Delivery</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
  <style>
    *{margin:0;padding:0;box-sizing:border-box;}
    body{font-family:'Inter',sans-serif;color:#1C1C1C;background:#fff;}
    a{text-decoration:none;color:inherit;}
    .container{max-width:1200px;margin:0 auto;padding:0 24px;}

    /* HERO */
    .hero{position:relative;min-height:500px;display:flex;align-items:center;overflow:hidden;}
    .hero-bg{position:absolute;inset:0;z-index:0;}
    .hero-bg img{width:100%;height:100%;object-fit:cover;display:block;}
    .hero-overlay{position:absolute;inset:0;background:linear-gradient(90deg,rgba(10,5,5,0.88) 0%,rgba(10,5,5,0.65) 55%,rgba(10,5,5,0.2) 100%);}
    .hero-content{position:relative;z-index:2;padding:70px 0;}
    .hero-layout{display:flex;align-items:center;justify-content:space-between;gap:48px;}
    .hero-left{flex:1;max-width:560px;}
    .hero-badge{display:inline-flex;align-items:center;gap:7px;background:rgba(226,55,68,0.18);border:1px solid rgba(226,55,68,0.4);border-radius:30px;padding:7px 16px;font-size:13px;font-weight:700;color:#ff8a8a;margin-bottom:22px;}
    .hero-title{font-size:50px;font-weight:900;line-height:1.08;color:#fff;margin-bottom:18px;}
    .hero-title span{color:#E23744;}
    .hero-sub{font-size:16px;color:rgba(255,255,255,0.72);margin-bottom:36px;line-height:1.6;}
    .search-bar{display:flex;align-items:center;background:#fff;border-radius:12px;overflow:hidden;box-shadow:0 8px 32px rgba(0,0,0,0.3);max-width:540px;}
    .search-loc{display:flex;align-items:center;gap:7px;padding:16px 18px;border-right:1.5px solid #e8e8e8;font-size:14px;font-weight:700;color:#1C1C1C;white-space:nowrap;cursor:pointer;}
    .search-input{flex:1;padding:16px 14px;border:none;outline:none;font-size:14px;font-family:'Inter',sans-serif;}
    .search-btn{background:#E23744;color:#fff;border:none;padding:16px 28px;font-size:15px;font-weight:800;cursor:pointer;font-family:'Inter',sans-serif;}
    .hero-stats{display:flex;align-items:center;gap:20px;margin-top:22px;}
    .hstat{font-size:13px;color:rgba(255,255,255,0.72);}
    .hstat strong{color:#fff;}
    .hdot{width:4px;height:4px;border-radius:50%;background:rgba(255,255,255,0.3);}
    .hero-right{flex-shrink:0;}
    .hero-cards{display:grid;grid-template-columns:1fr 1fr;gap:14px;}
    .hero-card{background:rgba(255,255,255,0.1);border:1px solid rgba(255,255,255,0.18);border-radius:16px;padding:18px 22px;text-align:center;backdrop-filter:blur(12px);transition:all 0.22s;cursor:pointer;display:flex;flex-direction:column;align-items:center;gap:8px;width:135px;}
    .hero-card:hover{background:rgba(255,255,255,0.2);transform:translateY(-3px);}
    .hero-card img{width:56px;height:56px;border-radius:10px;object-fit:cover;}
    .hero-card span{font-size:13px;font-weight:700;color:#fff;}

    /* CATEGORIES */
    .section{padding:52px 0 40px;}
    .section-title{font-size:22px;font-weight:800;color:#1C1C1C;margin-bottom:28px;}
    .cats-row{display:flex;gap:22px;overflow-x:auto;padding-bottom:6px;scrollbar-width:none;}
    .cats-row::-webkit-scrollbar{display:none;}
    .cat-item{flex-shrink:0;display:flex;flex-direction:column;align-items:center;gap:10px;cursor:pointer;transition:transform 0.2s;}
    .cat-item:hover{transform:translateY(-4px);}
    .cat-circle{width:110px;height:110px;border-radius:50%;overflow:hidden;border:3px solid #fff;box-shadow:0 4px 16px rgba(0,0,0,0.14);transition:box-shadow 0.2s;}
    .cat-item:hover .cat-circle{box-shadow:0 8px 28px rgba(226,55,68,0.25);border-color:#E23744;}
    .cat-circle img{width:100%;height:100%;object-fit:cover;display:block;}
    .cat-name{font-size:13px;font-weight:700;color:#1C1C1C;text-align:center;}

    /* OFFERS */
    .offers-row{display:grid;grid-template-columns:repeat(3,1fr);gap:16px;margin-bottom:52px;}
    .offer-card{border-radius:14px;padding:22px 24px;display:flex;align-items:center;gap:16px;border:1px solid transparent;transition:box-shadow 0.2s;cursor:pointer;}
    .offer-card:hover{box-shadow:0 6px 20px rgba(0,0,0,0.1);}
    .offer-card.pink{background:#FFF0F1;border-color:#FFD6D9;}
    .offer-card.yellow{background:#FFFBEB;border-color:#FFE9A0;}
    .offer-card.green{background:#F0FFF4;border-color:#B2DFDB;}
    .offer-img{width:56px;height:56px;border-radius:10px;object-fit:cover;flex-shrink:0;}
    .offer-title{font-size:17px;font-weight:800;color:#1C1C1C;}
    .offer-sub{font-size:12px;color:#666;margin:3px 0 7px;}
    .offer-code{font-size:12px;font-weight:800;color:#E23744;}

    /* RESTAURANTS */
    .rest-header{display:flex;align-items:center;justify-content:space-between;margin-bottom:24px;}
    .see-all{font-size:14px;font-weight:700;color:#E23744;}
    .rest-grid{display:grid;grid-template-columns:repeat(4,1fr);gap:20px;margin-bottom:72px;}
    .rest-card{border-radius:14px;overflow:hidden;border:1px solid #e8e8e8;transition:box-shadow 0.2s,transform 0.2s;background:#fff;cursor:pointer;}
    .rest-card:hover{box-shadow:0 8px 24px rgba(0,0,0,0.12);transform:translateY(-3px);}
    .rest-img-wrap{height:185px;overflow:hidden;position:relative;background:#f0f0f0;}
    .rest-img-wrap img{width:100%;height:100%;object-fit:cover;display:block;transition:transform 0.35s;}
    .rest-card:hover .rest-img-wrap img{transform:scale(1.06);}
    .rest-badge{position:absolute;bottom:12px;left:12px;background:rgba(0,0,0,0.72);color:#fff;border-radius:6px;padding:4px 10px;font-size:11px;font-weight:600;}
    .rest-promo{position:absolute;bottom:12px;right:12px;background:#E23744;color:#fff;border-radius:6px;padding:4px 10px;font-size:10px;font-weight:700;}
    .rest-body{padding:14px 16px;}
    .rest-name{font-size:16px;font-weight:800;color:#1C1C1C;margin-bottom:5px;}
    .rest-meta{display:flex;align-items:center;gap:10px;margin-bottom:9px;}
    .rest-rating{color:#3D9B35;font-weight:700;font-size:14px;}
    .rest-type{font-size:12px;color:#888;}
    .rest-foot{display:flex;justify-content:space-between;font-size:12px;color:#666;}
  </style>
</head>
<body>
<jsp:include page="components/navbar.jsp"/>

<!-- HERO -->
<section class="hero">
  <div class="hero-bg">
    <img src="images/hero/hero-bg.jpg" alt="HotPlate">
    <div class="hero-overlay"></div>
  </div>
  <div class="hero-content" style="width:100%;">
    <div class="container">
      <div class="hero-layout">
        <div class="hero-left">
          <div class="hero-badge">
            <svg width="14" height="14" fill="#ff8a8a" viewBox="0 0 24 24"><path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z"/></svg>
            30-minute delivery guaranteed
          </div>
          <h1 class="hero-title">Hungry? <span>Food</span><br>is on its way!</h1>
          <p class="hero-sub">Order from your favourite restaurants and get hot food delivered to your door in 30 minutes.</p>
          <div class="search-bar">
            <div class="search-loc">
              <svg width="15" height="15" fill="#E23744" viewBox="0 0 24 24"><path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/></svg>
              Bangalore
            </div>
            <input class="search-input" type="text" placeholder="Search for restaurants, dishes...">
            <button class="search-btn" onclick="window.location='restaurants.jsp'">Search</button>
          </div>
          <div class="hero-stats">
            <div class="hstat"><strong>500+</strong> Restaurants</div>
            <div class="hdot"></div>
            <div class="hstat"><strong>100+</strong> Cities</div>
            <div class="hdot"></div>
            <div class="hstat"><strong>10M+</strong> Orders</div>
          </div>
        </div>
        <div class="hero-right">
          <div class="hero-cards">
            <a href="restaurants.jsp?category=pizza" class="hero-card">
              <img src="images/categories/pizza.jpg" alt="Pizza">
              <span>Pizza</span>
            </a>
            <a href="restaurants.jsp?category=burger" class="hero-card">
              <img src="images/categories/burger.jpg" alt="Burgers">
              <span>Burgers</span>
            </a>
            <a href="restaurants.jsp?category=biryani" class="hero-card">
              <img src="images/categories/biryani.jpg" alt="Biryani">
              <span>Biryani</span>
            </a>
            <a href="restaurants.jsp?category=chicken" class="hero-card">
              <img src="images/categories/chicken.jpg" alt="Chicken">
              <span>Chicken</span>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- FOOD CATEGORIES -->
<section class="section">
  <div class="container">
    <h2 class="section-title">What's on your mind?</h2>
    <div class="cats-row">
      <a href="restaurants.jsp?category=biryani"  class="cat-item"><div class="cat-circle"><img src="images/categories/biryani.jpg"  alt="Biryani"></div><span class="cat-name">Biryani</span></a>
      <a href="restaurants.jsp?category=pizza"    class="cat-item"><div class="cat-circle"><img src="images/categories/pizza.jpg"    alt="Pizza"></div><span class="cat-name">Pizza</span></a>
      <a href="restaurants.jsp?category=burger"   class="cat-item"><div class="cat-circle"><img src="images/categories/burger.jpg"   alt="Burgers"></div><span class="cat-name">Burgers</span></a>
      <a href="restaurants.jsp?category=dosa"     class="cat-item"><div class="cat-circle"><img src="images/categories/dosa.jpg"     alt="Dosa"></div><span class="cat-name">Dosa</span></a>
      <a href="restaurants.jsp?category=sushi"    class="cat-item"><div class="cat-circle"><img src="images/categories/sushi.jpg"    alt="Sushi"></div><span class="cat-name">Sushi</span></a>
      <a href="restaurants.jsp?category=pasta"    class="cat-item"><div class="cat-circle"><img src="images/categories/pasta.jpg"    alt="Pasta"></div><span class="cat-name">Pasta</span></a>
      <a href="restaurants.jsp?category=desserts" class="cat-item"><div class="cat-circle"><img src="images/categories/desserts.jpg" alt="Desserts"></div><span class="cat-name">Desserts</span></a>
      <a href="restaurants.jsp?category=chinese"  class="cat-item"><div class="cat-circle"><img src="images/categories/chinese.jpg"  alt="Chinese"></div><span class="cat-name">Chinese</span></a>
      <a href="restaurants.jsp?category=chicken"  class="cat-item"><div class="cat-circle"><img src="images/categories/chicken.jpg"  alt="Chicken"></div><span class="cat-name">Chicken</span></a>
      <a href="restaurants.jsp?category=coffee"   class="cat-item"><div class="cat-circle"><img src="images/categories/coffee.jpg"   alt="Coffee"></div><span class="cat-name">Coffee</span></a>
      <a href="restaurants.jsp?category=salad"    class="cat-item"><div class="cat-circle"><img src="images/categories/salad.jpg"    alt="Salad"></div><span class="cat-name">Salad</span></a>
      <a href="restaurants.jsp?category=icecream" class="cat-item"><div class="cat-circle"><img src="images/categories/icecream.jpg" alt="Ice Cream"></div><span class="cat-name">Ice Cream</span></a>
      <a href="restaurants.jsp?category=idli"     class="cat-item"><div class="cat-circle"><img src="images/categories/idli.jpg"     alt="Idli"></div><span class="cat-name">Idli</span></a>
      <a href="restaurants.jsp?category=sandwich" class="cat-item"><div class="cat-circle"><img src="images/categories/sandwich.jpg" alt="Sandwich"></div><span class="cat-name">Sandwich</span></a>
    </div>
  </div>
</section>

<!-- BEST OFFERS -->
<div class="container">
  <h2 class="section-title">Best Offers For You</h2>
  <div class="offers-row">
    <div class="offer-card pink">
      <img src="images/categories/burger.jpg" class="offer-img" alt="offer">
      <div>
        <div class="offer-title">Get 50% Off</div>
        <div class="offer-sub">On your first 3 orders</div>
        <div class="offer-code">Use: WELCOME50</div>
      </div>
    </div>
    <div class="offer-card yellow">
      <img src="images/categories/biryani.jpg" class="offer-img" alt="offer">
      <div>
        <div class="offer-title">Free Delivery</div>
        <div class="offer-sub">On orders above &#8377;299</div>
        <div class="offer-code">Use: FREEDEL</div>
      </div>
    </div>
    <div class="offer-card green">
      <img src="images/categories/desserts.jpg" class="offer-img" alt="offer">
      <div>
        <div class="offer-title">Weekend Special</div>
        <div class="offer-sub">Extra 20% cashback</div>
        <div class="offer-code">Use: WEEKEND20</div>
      </div>
    </div>
  </div>
</div>

<!-- TOP RESTAURANTS -->
<div class="container">
  <div class="rest-header">
    <h2 class="section-title" style="margin:0">Top Restaurants Near You</h2>
    <a href="restaurants.jsp" class="see-all">See all &rarr;</a>
  </div>
  <div class="rest-grid">

    <a href="menu.jsp?restaurant=1&name=KFC" class="rest-card">
      <div class="rest-img-wrap">
        <img src="images/restaurants/kfc.jpg" alt="KFC">
        <div class="rest-badge">&#9733; 4.3 &middot; 30-40 min</div>
        <div class="rest-promo">40% OFF</div>
      </div>
      <div class="rest-body">
        <div class="rest-name">KFC</div>
        <div class="rest-meta"><span class="rest-rating">&#9733; 4.3</span><span class="rest-type">Chicken &middot; Burgers</span></div>
        <div class="rest-foot"><span>30-40 min</span><span>&#8377;250 for two</span></div>
      </div>
    </a>

    <a href="menu.jsp?restaurant=2&name=Dominos" class="rest-card">
      <div class="rest-img-wrap">
        <img src="images/restaurants/dominos.jpg" alt="Dominos">
        <div class="rest-badge">&#9733; 4.5 &middot; 25-35 min</div>
        <div class="rest-promo">Buy 1 Get 1</div>
      </div>
      <div class="rest-body">
        <div class="rest-name">Domino's Pizza</div>
        <div class="rest-meta"><span class="rest-rating">&#9733; 4.5</span><span class="rest-type">Pizza &middot; Pasta</span></div>
        <div class="rest-foot"><span>25-35 min</span><span>&#8377;400 for two</span></div>
      </div>
    </a>

    <a href="menu.jsp?restaurant=3&name=Biryani+House" class="rest-card">
      <div class="rest-img-wrap">
        <img src="images/restaurants/biryani-house.jpg" alt="Biryani House">
        <div class="rest-badge">&#9733; 4.6 &middot; 40-50 min</div>
        <div class="rest-promo">30% OFF</div>
      </div>
      <div class="rest-body">
        <div class="rest-name">Biryani House</div>
        <div class="rest-meta"><span class="rest-rating">&#9733; 4.6</span><span class="rest-type">Biryani &middot; Mughlai</span></div>
        <div class="rest-foot"><span>40-50 min</span><span>&#8377;350 for two</span></div>
      </div>
    </a>

    <a href="menu.jsp?restaurant=7&name=Dosa+Plaza" class="rest-card">
      <div class="rest-img-wrap">
        <img src="images/restaurants/dosa-plaza.jpg" alt="Dosa Plaza">
        <div class="rest-badge">&#9733; 4.4 &middot; 25-35 min</div>
        <div class="rest-promo">&#8377;50 OFF</div>
      </div>
      <div class="rest-body">
        <div class="rest-name">Dosa Plaza</div>
        <div class="rest-meta"><span class="rest-rating">&#9733; 4.4</span><span class="rest-type">South Indian &middot; Dosa</span></div>
        <div class="rest-foot"><span>25-35 min</span><span>&#8377;180 for two</span></div>
      </div>
    </a>

    <a href="menu.jsp?restaurant=4&name=McDonalds" class="rest-card">
      <div class="rest-img-wrap">
        <img src="images/restaurants/mcdonalds.jpg" alt="McDonalds">
        <div class="rest-badge">&#9733; 4.2 &middot; 20-30 min</div>
        <div class="rest-promo">Free Item</div>
      </div>
      <div class="rest-body">
        <div class="rest-name">McDonald's</div>
        <div class="rest-meta"><span class="rest-rating">&#9733; 4.2</span><span class="rest-type">Burgers &middot; Fast Food</span></div>
        <div class="rest-foot"><span>20-30 min</span><span>&#8377;200 for two</span></div>
      </div>
    </a>

    <a href="menu.jsp?restaurant=5&name=Sushi+Sakura" class="rest-card">
      <div class="rest-img-wrap">
        <img src="images/restaurants/sushi-sakura.jpg" alt="Sushi Sakura">
        <div class="rest-badge">&#9733; 4.7 &middot; 45-55 min</div>
        <div class="rest-promo">20% OFF</div>
      </div>
      <div class="rest-body">
        <div class="rest-name">Sushi Sakura</div>
        <div class="rest-meta"><span class="rest-rating">&#9733; 4.7</span><span class="rest-type">Japanese &middot; Sushi</span></div>
        <div class="rest-foot"><span>45-55 min</span><span>&#8377;800 for two</span></div>
      </div>
    </a>

    <a href="menu.jsp?restaurant=6&name=Cafe+Coffee+Day" class="rest-card">
      <div class="rest-img-wrap">
        <img src="images/restaurants/cafe-coffee.jpg" alt="Cafe Coffee Day">
        <div class="rest-badge">&#9733; 4.1 &middot; 15-25 min</div>
        <div class="rest-promo">Buy 2 Get 1</div>
      </div>
      <div class="rest-body">
        <div class="rest-name">Cafe Coffee Day</div>
        <div class="rest-meta"><span class="rest-rating">&#9733; 4.1</span><span class="rest-type">Coffee &middot; Beverages</span></div>
        <div class="rest-foot"><span>15-25 min</span><span>&#8377;300 for two</span></div>
      </div>
    </a>

    <a href="menu.jsp?restaurant=8&name=Wow+China" class="rest-card">
      <div class="rest-img-wrap">
        <img src="images/restaurants/wow-china.jpg" alt="Wow China">
        <div class="rest-badge">&#9733; 4.0 &middot; 35-45 min</div>
        <div class="rest-promo">15% OFF</div>
      </div>
      <div class="rest-body">
        <div class="rest-name">Wow China</div>
        <div class="rest-meta"><span class="rest-rating">&#9733; 4.0</span><span class="rest-type">Chinese &middot; Noodles</span></div>
        <div class="rest-foot"><span>35-45 min</span><span>&#8377;280 for two</span></div>
      </div>
    </a>

  </div>
</div>

<jsp:include page="components/footer.jsp"/>
</body>
</html>
