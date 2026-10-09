<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Cart - HotPlate</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
  <style>
    *{margin:0;padding:0;box-sizing:border-box;}
    body{font-family:'Inter',sans-serif;background:#f8f8f8;color:#1C1C1C;}
    a{text-decoration:none;color:inherit;}
    .container{max-width:1100px;margin:0 auto;padding:0 24px;}
    .page{padding:32px 0 80px;}
    .page-title{font-size:24px;font-weight:900;margin-bottom:24px;}
    .layout{display:flex;gap:24px;align-items:flex-start;}
    .left{flex:1;}
    .right{width:340px;flex-shrink:0;}

    .empty{background:#fff;border-radius:16px;border:1px solid #eee;padding:80px 24px;text-align:center;}
    .empty svg{margin-bottom:20px;opacity:0.3;}
    .empty h3{font-size:20px;font-weight:800;margin-bottom:10px;}
    .empty p{font-size:14px;color:#777;margin-bottom:24px;}
    .browse-btn{display:inline-block;background:#E23744;color:#fff;border-radius:10px;padding:12px 28px;font-size:15px;font-weight:700;}

    .card{background:#fff;border-radius:16px;border:1px solid #eee;overflow:hidden;margin-bottom:16px;}
    .card-head{padding:16px 20px;border-bottom:1px solid #f5f5f5;display:flex;align-items:center;gap:12px;}
    .rest-thumb{width:44px;height:44px;border-radius:10px;object-fit:cover;flex-shrink:0;}
    .rest-name-txt{font-size:16px;font-weight:800;}
    .rest-loc-txt{font-size:12px;color:#888;margin-top:2px;}

    .cart-item{display:flex;align-items:center;gap:14px;padding:16px 20px;border-bottom:1px solid #f8f8f8;}
    .cart-item:last-child{border-bottom:none;}
    .ci-dot-veg{width:14px;height:14px;border:2px solid #26A541;border-radius:2px;position:relative;flex-shrink:0;}
    .ci-dot-veg::after{content:'';position:absolute;top:2px;left:2px;width:6px;height:6px;border-radius:50%;background:#26A541;}
    .ci-dot-nveg{width:14px;height:14px;border:2px solid #E23744;border-radius:2px;position:relative;flex-shrink:0;}
    .ci-dot-nveg::after{content:'';position:absolute;top:2px;left:2px;width:6px;height:6px;border-radius:50%;background:#E23744;}
    .ci-name{flex:1;font-size:14px;font-weight:700;}
    .ci-qty{display:flex;align-items:center;border:1.5px solid #E23744;border-radius:8px;overflow:hidden;}
    .ci-btn{width:32px;height:32px;background:#E23744;color:#fff;border:none;font-size:16px;font-weight:800;cursor:pointer;font-family:'Inter',sans-serif;}
    .ci-num{width:32px;text-align:center;font-size:14px;font-weight:800;color:#E23744;}
    .ci-price{font-size:14px;font-weight:800;min-width:60px;text-align:right;}

    .coupon-box{display:flex;align-items:center;gap:12px;padding:14px 20px;border-top:1px solid #f5f5f5;}
    .coupon-input{flex:1;border:none;outline:none;font-size:14px;font-family:'Inter',sans-serif;}
    .coupon-apply{background:none;border:none;color:#E23744;font-size:13px;font-weight:800;cursor:pointer;font-family:'Inter',sans-serif;}
    .coupon-success{display:none;background:#F0FFF4;border:1px solid #B2DFDB;border-radius:8px;padding:10px 14px;font-size:13px;color:#26A541;font-weight:700;margin:0 20px 14px;}

    .bill-card{background:#fff;border-radius:16px;border:1px solid #eee;padding:22px;}
    .bill-title{font-size:16px;font-weight:800;margin-bottom:18px;padding-bottom:14px;border-bottom:1px solid #f5f5f5;}
    .bill-row{display:flex;justify-content:space-between;font-size:14px;color:#666;padding:5px 0;}
    .bill-save{display:none;background:#F0FFF4;border-radius:8px;padding:8px 12px;font-size:13px;font-weight:700;color:#26A541;justify-content:space-between;margin:8px 0;}
    .bill-total{display:flex;justify-content:space-between;font-size:16px;font-weight:900;color:#1C1C1C;border-top:1px solid #eee;padding-top:14px;margin-top:8px;}
    .checkout-btn{display:block;background:#E23744;color:#fff;border-radius:12px;padding:15px 20px;text-align:center;font-size:16px;font-weight:800;margin-top:18px;cursor:pointer;transition:background 0.18s;}
    .checkout-btn:hover{background:#C62233;}
    .safe-txt{text-align:center;font-size:12px;color:#aaa;margin-top:10px;}
  </style>
</head>
<body>
<jsp:include page="components/navbar.jsp"/>

<div class="page">
  <div class="container">
    <div class="page-title">Your Cart</div>

    <div id="emptyCart" class="empty" style="display:none;">
      <svg width="80" height="80" viewBox="0 0 24 24" fill="none" stroke="#ccc" stroke-width="1.5">
        <path d="M6 2 3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"/>
        <line x1="3" y1="6" x2="21" y2="6"/>
        <path d="M16 10a4 4 0 0 1-8 0"/>
      </svg>
      <h3>Your cart is empty</h3>
      <p>Looks like you haven't added anything yet. Explore restaurants and add your favourite items!</p>
      <a href="restaurants.jsp" class="browse-btn">Browse Restaurants</a>
    </div>

    <div id="cartContent" style="display:none;">
      <div class="layout">
        <div class="left">
          <div class="card">
            <div class="card-head">
              <img class="rest-thumb" id="restThumb" src="images/restaurants/kfc.jpg" alt="">
              <div>
                <div class="rest-name-txt" id="restName">Restaurant</div>
                <div class="rest-loc-txt">Indiranagar, Bangalore</div>
              </div>
            </div>
            <div id="cartItemsList"></div>
            <div id="couponSuccess" class="coupon-success"></div>
            <div class="coupon-box">
              <svg width="18" height="18" fill="none" stroke="#E23744" stroke-width="2" viewBox="0 0 24 24">
                <path d="M20.59 13.41l-7.17 7.17a2 2 0 0 1-2.83 0L2 12V2h10l8.59 8.59a2 2 0 0 1 0 2.82z"/>
                <line x1="7" y1="7" x2="7.01" y2="7"/>
              </svg>
              <input class="coupon-input" type="text" id="couponInput" placeholder="Enter coupon code (try: WELCOME50)">
              <button class="coupon-apply" onclick="applyCoupon()">APPLY</button>
            </div>
          </div>
        </div>

        <div class="right">
          <div class="bill-card">
            <div class="bill-title">Bill Summary</div>
            <div class="bill-row"><span>Item Total</span><span id="itemTotal">&#8377;0</span></div>
            <div class="bill-row"><span>Delivery Fee</span><span id="deliveryFee">FREE</span></div>
            <div class="bill-row"><span>Platform Fee</span><span>&#8377;5</span></div>
            <div class="bill-row"><span>GST &amp; Taxes (5%)</span><span id="gstAmt">&#8377;0</span></div>
            <div class="bill-save" id="savingRow"><span>You save</span><span id="savingAmt"></span></div>
            <div class="bill-total"><span>To Pay</span><span id="toPay">&#8377;0</span></div>
            <div class="checkout-btn" onclick="goCheckout()">Proceed to Checkout &#8594;</div>
            <div class="safe-txt">&#128274; 100% Safe &amp; Secure Payments</div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<jsp:include page="components/footer.jsp"/>

<script>
var RS = '\u20B9'; // Rupee symbol - works in all browsers
var discount = 0;

window.addEventListener('DOMContentLoaded', function() {
  var cart = JSON.parse(sessionStorage.getItem('curryCart') || '{}');
  var items = cart.items || [];

  if (items.length === 0) {
    document.getElementById('emptyCart').style.display = 'block';
    return;
  }
  document.getElementById('cartContent').style.display = 'block';
  if (cart.restaurant) document.getElementById('restName').textContent = cart.restaurant;
  if (cart.restImg)    document.getElementById('restThumb').src = cart.restImg;

  renderCart(items);
});

function renderCart(items) {
  var subtotal = 0;
  var html = '';
  for (var i = 0; i < items.length; i++) {
    var item = items[i];
    subtotal += item.price * item.qty;
    html += '<div class="cart-item">' +
      '<div class="' + (item.veg ? 'ci-dot-veg' : 'ci-dot-nveg') + '"></div>' +
      '<div class="ci-name">' + item.name + '</div>' +
      '<div class="ci-qty">' +
        '<button class="ci-btn" onclick="updateQty(' + i + ',-1)">&#8722;</button>' +
        '<span class="ci-num">' + item.qty + '</span>' +
        '<button class="ci-btn" onclick="updateQty(' + i + ',1)">+</button>' +
      '</div>' +
      '<div class="ci-price">' + RS + (item.price * item.qty) + '</div>' +
    '</div>';
  }
  document.getElementById('cartItemsList').innerHTML = html;

  var gst = Math.round(subtotal * 0.05);
  var delivery = subtotal >= 299 ? 0 : 40;
  var total = subtotal + gst + 5 + delivery - discount;

  document.getElementById('itemTotal').textContent = RS + subtotal;
  document.getElementById('gstAmt').textContent    = RS + gst;
  document.getElementById('toPay').textContent     = RS + total;

  if (delivery === 0) {
    document.getElementById('deliveryFee').textContent = 'FREE';
    document.getElementById('deliveryFee').style.color = '#26A541';
  } else {
    document.getElementById('deliveryFee').textContent = RS + delivery;
    document.getElementById('deliveryFee').style.color = '#666';
  }

  if (discount > 0) {
    var sr = document.getElementById('savingRow');
    sr.style.display = 'flex';
    document.getElementById('savingAmt').textContent = '-' + RS + discount;
  }

  sessionStorage.setItem('orderTotal', total);
  sessionStorage.setItem('orderSubtotal', subtotal);
  sessionStorage.setItem('cartDiscount', discount);
}

function updateQty(idx, delta) {
  var cart = JSON.parse(sessionStorage.getItem('curryCart') || '{}');
  cart.items[idx].qty += delta;
  if (cart.items[idx].qty <= 0) cart.items.splice(idx, 1);
  sessionStorage.setItem('curryCart', JSON.stringify(cart));
  if (cart.items.length === 0) { location.reload(); return; }
  renderCart(cart.items);
}

function applyCoupon() {
  var code = document.getElementById('couponInput').value.toUpperCase().trim();
  var discounts = { 'WELCOME50': 50, 'FREEDEL': 40, 'WEEKEND20': 30 };
  var msg = document.getElementById('couponSuccess');

  if (discounts.hasOwnProperty(code)) {
    discount = discounts[code];
    sessionStorage.setItem('cartDiscount', discount);
    msg.style.display = 'block';
    msg.textContent = 'Coupon "' + code + '" applied! You save ' + RS + discount;
    document.getElementById('couponInput').disabled = true;
    document.querySelector('.coupon-apply').textContent = 'APPLIED';
    document.querySelector('.coupon-apply').style.color = '#26A541';
    var cart = JSON.parse(sessionStorage.getItem('curryCart') || '{}');
    renderCart(cart.items || []);
  } else {
    msg.style.display = 'block';
    msg.style.background = '#FFF0F1';
    msg.style.borderColor = '#FFD6D9';
    msg.style.color = '#E23744';
    msg.textContent = 'Invalid coupon. Try: WELCOME50, FREEDEL or WEEKEND20';
  }
}

function goCheckout() {
  window.location.href = 'checkout.jsp';
}
</script>
</body>
</html>
