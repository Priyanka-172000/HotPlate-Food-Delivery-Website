<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Order Confirmed - HotPlate</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
  <style>
    *{margin:0;padding:0;box-sizing:border-box;}
    body{font-family:'Inter',sans-serif;background:#f8f8f8;color:#1C1C1C;}
    a{text-decoration:none;color:inherit;}
    .container{max-width:720px;margin:0 auto;padding:0 24px;}
    .page{padding:48px 0 80px;}

    /* Success banner */
    .success-banner{background:linear-gradient(135deg,#26A541,#1e8032);border-radius:20px;padding:36px 32px;text-align:center;color:#fff;margin-bottom:28px;position:relative;overflow:hidden;}
    .success-banner::before{content:'';position:absolute;top:-40px;right:-40px;width:160px;height:160px;border-radius:50%;background:rgba(255,255,255,0.08);}
    .success-icon{width:72px;height:72px;background:rgba(255,255,255,0.2);border-radius:50%;display:flex;align-items:center;justify-content:center;margin:0 auto 18px;}
    .success-title{font-size:26px;font-weight:900;margin-bottom:8px;}
    .success-sub{font-size:15px;opacity:0.85;margin-bottom:18px;}
    .order-id{background:rgba(255,255,255,0.18);border-radius:10px;padding:10px 20px;display:inline-block;font-size:14px;font-weight:700;}

    /* ETA Card */
    .eta-card{background:#fff;border-radius:16px;border:1px solid #eee;padding:24px;margin-bottom:20px;display:flex;align-items:center;gap:20px;}
    .eta-icon{width:60px;height:60px;background:#FFF0F1;border-radius:14px;display:flex;align-items:center;justify-content:center;flex-shrink:0;}
    .eta-time{font-size:32px;font-weight:900;color:#E23744;}
    .eta-label{font-size:14px;color:#666;margin-top:4px;}

    /* Tracking Steps */
    .track-card{background:#fff;border-radius:16px;border:1px solid #eee;padding:24px;margin-bottom:20px;}
    .track-title{font-size:16px;font-weight:800;margin-bottom:24px;}
    .track-steps{display:flex;flex-direction:column;gap:0;}
    .tstep{display:flex;gap:16px;align-items:flex-start;padding-bottom:24px;position:relative;}
    .tstep:last-child{padding-bottom:0;}
    .tstep-left{display:flex;flex-direction:column;align-items:center;gap:0;flex-shrink:0;}
    .tstep-dot{width:32px;height:32px;border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:14px;font-weight:800;z-index:1;}
    .tstep-dot.done{background:#26A541;color:#fff;}
    .tstep-dot.active{background:#E23744;color:#fff;animation:pulse 1.5s infinite;}
    .tstep-dot.pending{background:#f0f0f0;color:#aaa;}
    .tstep-line{width:2px;flex:1;min-height:24px;margin-top:4px;}
    .tstep-line.done{background:#26A541;}
    .tstep-line.pending{background:#e8e8e8;}
    .tstep-info{padding-top:6px;}
    .tstep-name{font-size:14px;font-weight:800;color:#1C1C1C;}
    .tstep-name.pending{color:#aaa;}
    .tstep-time{font-size:12px;color:#888;margin-top:3px;}
    .tstep-desc{font-size:13px;color:#666;margin-top:4px;}

    @keyframes pulse{0%,100%{box-shadow:0 0 0 0 rgba(226,55,68,0.4);}50%{box-shadow:0 0 0 8px rgba(226,55,68,0);}}

    /* Delivery agent */
    .agent-card{background:#fff;border-radius:16px;border:1px solid #eee;padding:20px 24px;margin-bottom:20px;display:flex;align-items:center;justify-content:space-between;}
    .agent-left{display:flex;align-items:center;gap:14px;}
    .agent-avatar{width:52px;height:52px;border-radius:50%;background:linear-gradient(135deg,#E23744,#ff6b6b);display:flex;align-items:center;justify-content:center;font-size:20px;font-weight:900;color:#fff;}
    .agent-name{font-size:15px;font-weight:800;}
    .agent-sub{font-size:12px;color:#888;margin-top:2px;}
    .agent-rating{font-size:13px;color:#26A541;font-weight:700;margin-top:4px;}
    .call-btn{display:flex;align-items:center;gap:8px;background:#E23744;color:#fff;border:none;border-radius:10px;padding:10px 18px;font-size:14px;font-weight:700;cursor:pointer;font-family:'Inter',sans-serif;}

    /* Order items */
    .items-card{background:#fff;border-radius:16px;border:1px solid #eee;padding:24px;margin-bottom:20px;}
    .item-row{display:flex;justify-content:space-between;font-size:14px;color:#555;padding:7px 0;border-bottom:1px solid #f8f8f8;}
    .item-row:last-child{border-bottom:none;}
    .total-row{display:flex;justify-content:space-between;font-size:16px;font-weight:900;padding-top:14px;margin-top:8px;border-top:2px solid #eee;}

    /* Feedback */
    .feedback-card{background:#fff;border-radius:16px;border:1px solid #eee;padding:24px;margin-bottom:20px;}
    .fb-title{font-size:16px;font-weight:800;margin-bottom:6px;}
    .fb-sub{font-size:13px;color:#888;margin-bottom:20px;}
    .stars{display:flex;gap:8px;margin-bottom:20px;}
    .star{font-size:36px;cursor:pointer;transition:transform 0.2s;filter:grayscale(1);}
    .star.lit{filter:none;}
    .star:hover{transform:scale(1.2);}
    .fb-textarea{width:100%;padding:12px 14px;border:1.5px solid #e8e8e8;border-radius:10px;font-size:14px;font-family:'Inter',sans-serif;outline:none;min-height:90px;resize:vertical;margin-bottom:14px;}
    .fb-textarea:focus{border-color:#E23744;}
    .fb-submit{background:#E23744;color:#fff;border:none;border-radius:10px;padding:12px 28px;font-size:15px;font-weight:800;cursor:pointer;font-family:'Inter',sans-serif;}
    .fb-thanks{display:none;text-align:center;padding:20px;background:#F0FFF4;border-radius:12px;color:#26A541;font-weight:800;font-size:16px;}

    .action-row{display:flex;gap:12px;margin-top:8px;}
    .action-btn{flex:1;padding:14px;border-radius:12px;font-size:15px;font-weight:800;text-align:center;cursor:pointer;border:none;font-family:'Inter',sans-serif;}
    .action-btn.primary{background:#E23744;color:#fff;}
    .action-btn.secondary{background:#fff;color:#E23744;border:2px solid #E23744;}
  </style>
</head>
<body>
<jsp:include page="components/navbar.jsp"/>

<div class="page">
  <div class="container">

    <!-- Success Banner -->
    <div class="success-banner">
      <div class="success-icon">
        <svg width="36" height="36" fill="none" stroke="#fff" stroke-width="3" viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"/></svg>
      </div>
      <div class="success-title">Order Confirmed!</div>
      <div class="success-sub">Payment successful. Your food is being prepared.</div>
      <div class="order-id">Order ID: <strong id="orderId">#HP123456</strong></div>
    </div>

    <!-- ETA -->
    <div class="eta-card">
      <div class="eta-icon">
        <svg width="30" height="30" fill="none" stroke="#E23744" stroke-width="2" viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"/><polyline points="12 6 12 12 16 14"/></svg>
      </div>
      <div>
        <div class="eta-time" id="etaTime">35 mins</div>
        <div class="eta-label">Estimated delivery time</div>
      </div>
      <div style="margin-left:auto;text-align:right;">
        <div style="font-size:13px;font-weight:800;color:#1C1C1C;" id="deliveryAddr">Loading...</div>
        <div style="font-size:12px;color:#888;margin-top:4px;">Delivery address</div>
      </div>
    </div>

    <!-- Live Tracking -->
    <div class="track-card">
      <div class="track-title">Live Order Tracking</div>
      <div class="track-steps">

        <div class="tstep">
          <div class="tstep-left">
            <div class="tstep-dot done">&#10003;</div>
            <div class="tstep-line done"></div>
          </div>
          <div class="tstep-info">
            <div class="tstep-name">Order Placed</div>
            <div class="tstep-time" id="t1time"></div>
            <div class="tstep-desc">We received your order successfully</div>
          </div>
        </div>

        <div class="tstep">
          <div class="tstep-left">
            <div class="tstep-dot done">&#10003;</div>
            <div class="tstep-line done"></div>
          </div>
          <div class="tstep-info">
            <div class="tstep-name">Payment Confirmed</div>
            <div class="tstep-time" id="t2time"></div>
            <div class="tstep-desc" id="payMethodText">Payment received</div>
          </div>
        </div>

        <div class="tstep">
          <div class="tstep-left">
            <div class="tstep-dot active">&#9679;</div>
            <div class="tstep-line pending"></div>
          </div>
          <div class="tstep-info">
            <div class="tstep-name">Preparing Your Food</div>
            <div class="tstep-time" id="t3time"></div>
            <div class="tstep-desc">The restaurant is preparing your order</div>
          </div>
        </div>

        <div class="tstep">
          <div class="tstep-left">
            <div class="tstep-dot pending">4</div>
            <div class="tstep-line pending"></div>
          </div>
          <div class="tstep-info">
            <div class="tstep-name pending">Out for Delivery</div>
            <div class="tstep-time">Estimated in 15 mins</div>
          </div>
        </div>

        <div class="tstep">
          <div class="tstep-left">
            <div class="tstep-dot pending">5</div>
          </div>
          <div class="tstep-info">
            <div class="tstep-name pending">Delivered</div>
            <div class="tstep-time" id="etaDelivery"></div>
          </div>
        </div>

      </div>
    </div>

    <!-- Delivery Agent -->
    <div class="agent-card">
      <div class="agent-left">
        <div class="agent-avatar">R</div>
        <div>
          <div class="agent-name">Rajan Kumar</div>
          <div class="agent-sub">Delivery Partner</div>
          <div class="agent-rating">&#9733; 4.8 &middot; 1,240 deliveries</div>
        </div>
      </div>
      <button class="call-btn" onclick="alert('Calling Rajan Kumar...\n+91 98765 43210')">
        <svg width="16" height="16" fill="#fff" viewBox="0 0 24 24"><path d="M6.6 10.8c1.4 2.8 3.8 5.1 6.6 6.6l2.2-2.2c.3-.3.7-.4 1-.2 1.1.4 2.3.6 3.6.6.6 0 1 .4 1 1V20c0 .6-.4 1-1 1-9.4 0-17-7.6-17-17 0-.6.4-1 1-1h3.5c.6 0 1 .4 1 1 0 1.3.2 2.5.6 3.6.1.3 0 .7-.2 1L6.6 10.8z"/></svg>
        Call
      </button>
    </div>

    <!-- Order Items -->
    <div class="items-card">
      <div style="font-size:16px;font-weight:800;margin-bottom:16px;">Your Order from <span id="restNameConfirm"></span></div>
      <div id="orderItemsList"></div>
      <div class="total-row"><span>Total Paid</span><span id="totalPaid">&#8377;0</span></div>
    </div>

    <!-- Feedback (shown after delivery) -->
    <div class="feedback-card" id="feedbackSection">
      <div class="fb-title">How was your experience?</div>
      <div class="fb-sub">Your feedback helps us improve for everyone</div>
      <div class="stars" id="starRow">
        <span class="star" onclick="rateStar(1)">&#9733;</span>
        <span class="star" onclick="rateStar(2)">&#9733;</span>
        <span class="star" onclick="rateStar(3)">&#9733;</span>
        <span class="star" onclick="rateStar(4)">&#9733;</span>
        <span class="star" onclick="rateStar(5)">&#9733;</span>
      </div>
      <div id="ratingLabel" style="font-size:14px;color:#E23744;font-weight:700;margin-bottom:14px;"></div>
      <textarea class="fb-textarea" id="fbComment" placeholder="Tell us what you loved or how we can improve..."></textarea>
      <button class="fb-submit" onclick="submitFeedback()">Submit Feedback</button>
      <div class="fb-thanks" id="fbThanks">&#127881; Thank you! Your feedback means a lot to us.</div>
    </div>

    <div class="action-row">
      <a href="index.jsp" class="action-btn secondary">Order Again</a>
      <a href="order-history.jsp" class="action-btn primary">View All Orders</a>
    </div>

  </div>
</div>

<jsp:include page="components/footer.jsp"/>

<script>
// Generate order data
const orderId = 'HP' + Math.floor(100000 + Math.random() * 900000);
document.getElementById('orderId').textContent = '#' + orderId;

const now = new Date();
function fmtTime(d){ return d.toLocaleTimeString('en-IN',{hour:'2-digit',minute:'2-digit'}); }
document.getElementById('t1time').textContent = fmtTime(now);
document.getElementById('t2time').textContent = fmtTime(new Date(now.getTime()+30000));

const eta = 30 + Math.floor(Math.random()*15);
document.getElementById('etaTime').textContent = eta + ' mins';
const etaDate = new Date(now.getTime() + eta*60000);
document.getElementById('etaDelivery').textContent = 'By ' + fmtTime(etaDate);
document.getElementById('t3time').textContent = 'Now - ' + fmtTime(etaDate);

// Address
const addr = sessionStorage.getItem('orderAddress') || 'Bangalore';
document.getElementById('deliveryAddr').textContent = addr.length > 35 ? addr.substring(0,35)+'...' : addr;

// Payment method label
const methods = {upi:'UPI Payment', card:'Card Payment', netbank:'Net Banking', cod:'Cash on Delivery'};
const pm = sessionStorage.getItem('paymentMethod') || 'upi';
document.getElementById('payMethodText').textContent = methods[pm] || 'Payment done';

// Order items
const cart = JSON.parse(sessionStorage.getItem('curryCart') || '{}');
const items = cart.items || [];
document.getElementById('restNameConfirm').textContent = cart.restaurant || 'Restaurant';

let html = '', subtotal = 0;
items.forEach(item => {
  subtotal += item.price * item.qty;
  html += `<div class="item-row"><span>${item.name} x${item.qty}</span><span>&#8377;${item.price*item.qty}</span></div>`;
});
document.getElementById('orderItemsList').innerHTML = html || '<div style="font-size:13px;color:#aaa;">No items</div>';
const total = parseInt(sessionStorage.getItem('orderTotal') || subtotal);
document.getElementById('totalPaid').innerHTML = '&#8377;' + total;

// Star rating
let selectedRating = 0;
const labels = ['','Terrible','Bad','Okay','Good','Excellent!'];
function rateStar(n) {
  selectedRating = n;
  document.querySelectorAll('.star').forEach((s,i) => s.classList.toggle('lit', i < n));
  document.getElementById('ratingLabel').textContent = labels[n];
}

function submitFeedback() {
  if (selectedRating === 0) { alert('Please select a star rating'); return; }
  document.getElementById('fbComment').style.display = 'none';
  document.querySelector('.fb-submit').style.display = 'none';
  document.getElementById('starRow').style.pointerEvents = 'none';
  document.getElementById('fbThanks').style.display = 'block';
}

// Auto-progress tracking (simulate)
setTimeout(() => {
  const step4dot = document.querySelectorAll('.tstep-dot')[3];
  const step4line = document.querySelectorAll('.tstep-line')[3];
  step4dot.className = 'tstep-dot active';
  step4dot.textContent = '';
  step4dot.innerHTML = '&#9679;';
  if(step4line) step4line.className = 'tstep-line done';
  document.querySelectorAll('.tstep-name')[3].classList.remove('pending');
  document.getElementById('t3time').textContent = fmtTime(now);
}, 15000);
</script>
</body>
</html>
