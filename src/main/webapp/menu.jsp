<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
  // Helper: make a safe JS id from item name
  private String safeId(String s) {
    return s.replaceAll("[^a-zA-Z0-9]", "_");
  }
%>
<%
  String restaurantId   = request.getParameter("restaurant");
  String restaurantName = request.getParameter("name");
  if (restaurantName == null) restaurantName = "Restaurant";
  if (restaurantId   == null) restaurantId   = "1";

  String[][] restInfo = {
    {"1","images/restaurants/kfc.jpg",            "Chicken, Burgers, Fast Food",    "4.3","30-40 min","250"},
    {"2","images/restaurants/dominos.jpg",         "Pizza, Pasta, Italian",          "4.5","25-35 min","400"},
    {"3","images/restaurants/biryani-house.jpg",   "Biryani, Mughlai, North Indian", "4.6","40-50 min","350"},
    {"4","images/restaurants/mcdonalds.jpg",       "Burgers, Fast Food, Shakes",     "4.2","20-30 min","200"},
    {"5","images/restaurants/sushi-sakura.jpg",    "Japanese, Sushi, Rolls",         "4.7","45-55 min","800"},
    {"6","images/restaurants/cafe-coffee.jpg",     "Coffee, Beverages, Snacks",      "4.1","15-25 min","300"},
    {"7","images/restaurants/dosa-plaza.jpg",      "South Indian, Dosa, Idli",       "4.4","25-35 min","180"},
    {"8","images/restaurants/wow-china.jpg",       "Chinese, Noodles, Dim Sum",      "4.0","35-45 min","280"},
    {"9","images/restaurants/salad-bowl.jpg",      "Healthy, Salads, Wraps",         "4.3","20-30 min","320"},
    {"10","images/restaurants/dessert-factory.jpg","Desserts, Ice Cream, Cakes",     "4.5","30-40 min","250"}
  };

  String rImg="images/restaurants/kfc.jpg", rCuisine="Food", rRating="4.3", rTime="30-40 min", rCost="200";
  for (String[] ri : restInfo) {
    if (ri[0].equals(restaurantId)) {
      rImg=ri[1]; rCuisine=ri[2]; rRating=ri[3]; rTime=ri[4]; rCost=ri[5]; break;
    }
  }

  // name, isVeg, price, desc, img
  String[][][] menu = {
    { // Starters
      {"Crispy Veg Spring Rolls","true", "149","Golden rolls stuffed with vegetables and noodles",       "images/menu/vegballs.jpg"},
      {"Paneer Tikka",           "true", "229","Marinated cottage cheese grilled in tandoor with spices","images/menu/butter-chicken.jpg"},
      {"Chicken Lollipop",       "false","279","Spicy chicken lollipops with schezwan dipping sauce",    "images/menu/lollipop.jpg"},
      {"Fish Fingers",           "false","249","Crispy battered fish fingers served with tartar sauce",  "images/menu/fishfingers.jpg"},
      {"Burger",                  "true","69","Crispy battered tikki & bun served with tartar sauce",    "images/menu/chicken-zinger.jpg"},
      {"Pizza",                   "true","149","Crispy pizza with loaded cheese",                        "images/menu/margheritta-pizza.jpg"},
      {"Pepparazi",               "fase","249","Crispy battered fish fingers served with tartar sauce",  "images/menu/pepparazi.jpg"},
      {"Cheese Popcorn",           "true","232","Crispy battered cheese popcorn served with tartar sauce","images/menu/popcorn-chicken.jpg"},
      {"Fresh fries",             "true","120","Crispy  french fries served with tartar sauce",           "images/menu/freshfries.jpg"},
      {"Gobi Manchurian",         "true","315","Crispy battered gobi with tangy served with tartar sauce",  "images/menu/gobi-manchurian.jpg"}





    },
    { // Main Course
      {"Butter Chicken",         "false","349","Tender chicken in rich creamy tomato-butter gravy",      "images/menu/butter-chicken.jpg"},
      {"Dal Makhani",            "true", "249","Slow-cooked black lentils with butter and cream",        "images/menu/dalmakhani.jpg"},
      {"Paneer Butter Masala",   "true", "299","Soft paneer cubes in smooth buttery tomato gravy",      "images/menu/paneerbuttermasala.jpg"},
      {"Chicken Biryani",        "false","349","Fragrant basmati rice cooked with spiced chicken",       "images/menu/chicken-biryani.jpg"},
      {"Veg Biryani",            "true", "249","Aromatic basmati with fresh vegetables and saffron",    "images/menu/veg-biryani.jpg"},
      {"Masala dosa",           "true","90","Crispy battered fish fingers served with tartar sauce",  "images/menu/masala-dosa.jpg"}

    },
    { // Breads and Rice
      {"Butter Naan",            "true", "49", "Soft leavened bread topped with butter",                "images/menu/naan.jpg"},
      {"Garlic Naan",            "true", "59", "Naan topped with garlic and coriander",                 "images/menu/naan.jpg"},
      {"Laccha Paratha",         "true", "55", "Flaky layered whole wheat bread",                       "images/menu/lachhaparatha.jpg"},
      {"Steamed Rice",           "true", "79", "Fluffy basmati steamed rice",                           "images/menu/steamedrice.jpg"}
    },
    { // Beverages
      {"Mango Lassi",            "true", "99", "Chilled yoghurt drink blended with Alphonso mango",     "images/menu/mango-lassi.jpg"},
      {"Masala Chai",            "true", "49", "Spiced Indian tea brewed with ginger and cardamom",     "images/menu/masalachai.jpg"},
      {"Fresh Lime Soda",        "true", "69", "Chilled lime soda with black salt and mint",            "images/menu/freshlimesode.jpg"},
      {"Cold Coffee",            "true", "129","Rich cold coffee blended with ice cream and milk",      "images/menu/coldcoffee.jpg"}
    }
  };
  String[] sections   = {"Starters","Main Course","Breads and Rice","Beverages"};
  String[] sectionIds = {"starters","maincourse","breads","beverages"};
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><%= restaurantName %> Menu - HotPlate</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
  <style>
    *{margin:0;padding:0;box-sizing:border-box;}
    body{font-family:'Inter',sans-serif;color:#1C1C1C;background:#f8f8f8;}
    a{text-decoration:none;color:inherit;}
    .container{max-width:1200px;margin:0 auto;padding:0 24px;}

    /* Restaurant Hero */
    .rest-hero{background:#fff;padding:28px 0;border-bottom:1px solid #eee;box-shadow:0 2px 8px rgba(0,0,0,0.05);}
    .rh-inner{display:flex;align-items:center;gap:22px;}
    .rh-img{width:120px;height:120px;border-radius:16px;overflow:hidden;border:2px solid #eee;flex-shrink:0;}
    .rh-img img{width:100%;height:100%;object-fit:cover;}
    .rh-name{font-size:26px;font-weight:900;margin-bottom:7px;}
    .rh-meta{display:flex;align-items:center;gap:12px;margin-bottom:11px;}
    .rh-rating{color:#3D9B35;font-weight:800;font-size:15px;}
    .rh-cuisine{font-size:13px;color:#666;}
    .rh-stats{display:flex;gap:20px;font-size:13px;color:#555;font-weight:600;}

    /* Menu Layout */
    .menu-page{padding:28px 0 120px;}
    .menu-layout{display:flex;gap:24px;align-items:flex-start;}

    /* Sidebar */
    .sidebar{width:190px;flex-shrink:0;background:#fff;border-radius:14px;border:1px solid #eee;position:sticky;top:90px;overflow:hidden;}
    .sidebar a{display:block;padding:13px 18px;font-size:13px;font-weight:600;color:#666;border-bottom:1px solid #f5f5f5;transition:all 0.18s;}
    .sidebar a:hover,.sidebar a.active{color:#E23744;background:#FFF0F1;border-left:3px solid #E23744;padding-left:15px;}

    /* Menu Sections */
    .menu-sections{flex:1;display:flex;flex-direction:column;gap:16px;}
    .msection{background:#fff;border-radius:14px;border:1px solid #eee;overflow:hidden;}
    .msec-title{font-size:17px;font-weight:800;padding:16px 20px;border-bottom:1px solid #f5f5f5;}
    .mitem{display:flex;align-items:flex-start;justify-content:space-between;padding:18px 20px;border-bottom:1px solid #f8f8f8;gap:16px;}
    .mitem:last-child{border-bottom:none;}
    .mi-left{flex:1;}
    .veg-dot{display:inline-block;width:14px;height:14px;border:2px solid #26A541;border-radius:2px;position:relative;vertical-align:middle;margin-right:6px;}
    .veg-dot::after{content:'';position:absolute;top:2px;left:2px;width:6px;height:6px;border-radius:50%;background:#26A541;}
    .nveg-dot{display:inline-block;width:14px;height:14px;border:2px solid #E23744;border-radius:2px;position:relative;vertical-align:middle;margin-right:6px;}
    .nveg-dot::after{content:'';position:absolute;top:2px;left:2px;width:6px;height:6px;border-radius:50%;background:#E23744;}
    .mi-name{font-size:15px;font-weight:700;display:inline;}
    .mi-price{font-size:15px;font-weight:800;margin:6px 0;}
    .mi-desc{font-size:13px;color:#777;line-height:1.6;}
    .mi-right{display:flex;flex-direction:column;align-items:center;gap:8px;flex-shrink:0;}
    .mi-img{width:100px;height:88px;border-radius:12px;overflow:hidden;background:#f5f5f5;}
    .mi-img img{width:100%;height:100%;object-fit:cover;display:block;}

    /* ADD button and qty control */
    .add-btn{width:96px;padding:9px 0;text-align:center;border:1.5px solid #E23744;border-radius:8px;font-size:14px;font-weight:800;color:#E23744;cursor:pointer;background:#fff;transition:background 0.18s;user-select:none;}
    .add-btn:hover{background:#FFF0F1;}
    .qty-ctrl{display:flex;align-items:center;width:96px;border:1.5px solid #E23744;border-radius:8px;overflow:hidden;}
    .qty-btn{flex:1;padding:9px 0;background:#E23744;color:#fff;border:none;font-size:16px;font-weight:800;cursor:pointer;font-family:'Inter',sans-serif;}
    .qty-num{flex:1;text-align:center;font-size:14px;font-weight:800;color:#E23744;background:#fff;}

    /* Cart Bar */
    .cart-bar{position:fixed;bottom:28px;left:50%;transform:translateX(-50%) translateY(120px);background:#E23744;color:#fff;border-radius:14px;padding:16px 28px;display:flex;align-items:center;justify-content:space-between;min-width:420px;box-shadow:0 8px 32px rgba(226,55,68,0.45);transition:transform 0.3s ease;z-index:9999;pointer-events:none;}
    .cart-bar.show{transform:translateX(-50%) translateY(0);pointer-events:auto;}
    .cb-info{font-size:15px;font-weight:800;}
    .cb-action{font-size:14px;font-weight:700;border-left:1px solid rgba(255,255,255,0.35);padding-left:20px;cursor:pointer;display:flex;align-items:center;gap:6px;color:#fff;text-decoration:none;}
  </style>
</head>
<body>
<jsp:include page="components/navbar.jsp"/>

<!-- Restaurant Header -->
<div class="rest-hero">
  <div class="container">
    <div class="rh-inner">
      <div class="rh-img"><img src="<%= rImg %>" alt="<%= restaurantName %>"></div>
      <div>
        <div class="rh-name"><%= restaurantName %></div>
        <div class="rh-meta">
          <span class="rh-rating">&#9733; <%= rRating %></span>
          <span class="rh-cuisine"><%= rCuisine %></span>
        </div>
        <div class="rh-stats">
          <span><%= rTime %></span>
          <span>&#8377;<%= rCost %> for two</span>
          <span>Free delivery above &#8377;149</span>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Menu -->
<div class="menu-page">
  <div class="container">
    <div class="menu-layout">

      <!-- Sidebar -->
      <div class="sidebar">
        <% for (int i = 0; i < sections.length; i++) { %>
        <a href="#<%= sectionIds[i] %>" class="sidebar-link"><%= sections[i] %></a>
        <% } %>
      </div>

      <!-- Items -->
      <div class="menu-sections">
        <% for (int s = 0; s < menu.length; s++) { %>
        <div class="msection" id="<%= sectionIds[s] %>">
          <div class="msec-title"><%= sections[s] %></div>

          <% for (String[] item : menu[s]) {
               String itemId   = safeId(item[0]);
               String itemName = item[0].replace("'", "");
               String itemPrice = item[2];
               String itemVeg   = item[1];
          %>
          <div class="mitem" id="row_<%= itemId %>">
            <div class="mi-left">
              <% if ("true".equals(item[1])) { %>
                <span class="veg-dot"></span>
              <% } else { %>
                <span class="nveg-dot"></span>
              <% } %>
              <span class="mi-name"><%= item[0] %></span>
              <div class="mi-price">&#8377;<%= itemPrice %></div>
              <div class="mi-desc"><%= item[3] %></div>
            </div>
            <div class="mi-right">
              <div class="mi-img">
                <img src="<%= item[4] %>" alt="<%= item[0] %>">
              </div>
              <%-- ADD button: no JS regex, just use itemId as element id --%>
              <div class="add-btn"
                   id="addbtn_<%= itemId %>"
                   onclick="addItem('<%= itemId %>','<%= itemName %>',<%= itemPrice %>,'<%= itemVeg %>')">ADD +</div>
            </div>
          </div>
          <% } %>

        </div>
        <% } %>

        <!-- Dynamic items added via Admin Panel appear here automatically -->
        <div class="msection" id="adminAdded" style="display:none;">
          <div class="msec-title">Chef's New Additions</div>
          <div id="adminItemsContainer"></div>
        </div>
      </div>

    </div>
  </div>
</div>

<!-- Cart Bar -->
<div class="cart-bar" id="cartBar">
  <div class="cb-info">
    <span id="cartCount">0</span> item(s) &nbsp;&middot;&nbsp; &#8377;<span id="cartTotal">0</span>
  </div>
  <a href="cart.jsp" class="cb-action" onclick="sessionStorage.setItem('curryCart', JSON.stringify(cart));">
    View Cart
    <svg width="16" height="16" fill="none" stroke="#fff" stroke-width="2.5" viewBox="0 0 24 24">
      <path d="M5 12h14M12 5l7 7-7 7"/>
    </svg>
  </a>
</div>

<script>
var RESTAURANT = '<%= restaurantName.replace("'", "\\'") %>';
var REST_IMG   = '<%= rImg %>';

// Load existing cart from sessionStorage
var cart = JSON.parse(sessionStorage.getItem('curryCart') || 'null');
if (!cart || cart.restaurant !== RESTAURANT) {
  cart = { restaurant: RESTAURANT, restImg: REST_IMG, items: [] };
}

function syncBar() {
  var count = 0, total = 0;
  for (var i = 0; i < cart.items.length; i++) {
    count += cart.items[i].qty;
    total += cart.items[i].price * cart.items[i].qty;
  }
  document.getElementById('cartCount').textContent = count;
  document.getElementById('cartTotal').textContent = total;
  var bar = document.getElementById('cartBar');
  if (count > 0) { bar.classList.add('show'); } else { bar.classList.remove('show'); }
  sessionStorage.setItem('curryCart', JSON.stringify(cart));
}

function addItem(itemId, name, price, veg) {
  // Find existing item
  var existing = null;
  for (var i = 0; i < cart.items.length; i++) {
    if (cart.items[i].id === itemId) { existing = cart.items[i]; break; }
  }
  if (existing) {
    existing.qty++;
  } else {
    cart.items.push({ id: itemId, name: name, price: parseInt(price), qty: 1, veg: veg === 'true' });
  }

  // Replace ADD button with qty control using plain string id
  var btn = document.getElementById('addbtn_' + itemId);
  if (btn) {
    btn.outerHTML =
      '<div class="qty-ctrl" id="qtyctrl_' + itemId + '">' +
        '<button class="qty-btn" onclick="changeQty(\'' + itemId + '\',' + price + ',-1)">&#8722;</button>' +
        '<span class="qty-num" id="qtyn_' + itemId + '">1</span>' +
        '<button class="qty-btn" onclick="changeQty(\'' + itemId + '\',' + price + ',1)">+</button>' +
      '</div>';
  }
  syncBar();
}

function changeQty(itemId, price, delta) {
  var existing = null;
  for (var i = 0; i < cart.items.length; i++) {
    if (cart.items[i].id === itemId) { existing = cart.items[i]; break; }
  }
  if (!existing) return;

  existing.qty += delta;

  if (existing.qty <= 0) {
    // Remove item from array
    cart.items = cart.items.filter(function(it) { return it.id !== itemId; });
    // Restore ADD button
    var ctrl = document.getElementById('qtyctrl_' + itemId);
    if (ctrl) {
      ctrl.outerHTML =
        '<div class="add-btn" id="addbtn_' + itemId + '" ' +
          'onclick="addItem(\'' + itemId + '\',\'' + existing.name + '\',' + price + ',\'' + existing.veg + '\')">ADD +</div>';
    }
  } else {
    var numEl = document.getElementById('qtyn_' + itemId);
    if (numEl) numEl.textContent = existing.qty;
  }
  syncBar();
}

function goToCart() {
  sessionStorage.setItem('curryCart', JSON.stringify(cart));
  window.location.href = 'cart.jsp';
}

// Sidebar highlight on scroll
var sidebarLinks = document.querySelectorAll('.sidebar-link');
var menuSections  = document.querySelectorAll('.msection');
window.addEventListener('scroll', function() {
  var current = '';
  menuSections.forEach(function(sec) {
    if (window.scrollY >= sec.offsetTop - 120) current = sec.id;
  });
  sidebarLinks.forEach(function(link) {
    link.classList.toggle('active', link.getAttribute('href') === '#' + current);
  });
});

// Init bar state
syncBar();

// Load any items added via the Admin Panel for this restaurant (id > 12 are admin-added)
fetch('MenuFetchServlet?restaurantId=' + encodeURIComponent('<%= restaurantId %>'))
  .then(function(r){ return r.json(); })
  .then(function(items){
    var dynamicItems = items.filter(function(it){ return parseInt(it.id) > 12; });
    if (dynamicItems.length === 0) return;

    var container = document.getElementById('adminItemsContainer');
    var html = '';
    dynamicItems.forEach(function(item) {
      var safeName = (item.name || '').replace(/[^a-zA-Z0-9]/g, '_');
      var vegBadge = item.veg === 'true' ? '<span class="veg-dot"></span>' : '<span class="nveg-dot"></span>';
      html += '<div class="mitem" id="row_' + safeName + '">' +
        '<div class="mi-left">' + vegBadge +
        '<span class="mi-name">' + escapeHtml(item.name) + '</span>' +
        '<div class="mi-price">&#8377;' + escapeHtml(item.price) + '</div>' +
        '<div class="mi-desc">' + escapeHtml(item.description || '') + '</div>' +
        '</div>' +
        '<div class="mi-right">' +
        '<div class="mi-img"><img src="' + item.image + '" alt="' + escapeHtml(item.name) + '" onerror="this.style.display=\'none\'"></div>' +
        '<div class="add-btn" id="addbtn_' + safeName + '" onclick="addItem(\'' + safeName + '\',\'' + escapeJs(item.name) + '\',' + item.price + ',\'' + item.veg + '\')">ADD +</div>' +
        '</div>' +
      '</div>';
    });
    container.innerHTML = html;
    document.getElementById('adminAdded').style.display = 'block';
  })
  .catch(function(){ /* silently ignore if backend not reachable */ });

function escapeHtml(s) {
  if (!s) return '';
  var d = document.createElement('div');
  d.textContent = s;
  return d.innerHTML;
}
function escapeJs(s) {
  return (s || '').replace(/'/g, "");
}
</script>

<jsp:include page="components/footer.jsp"/>
</body>
</html>
