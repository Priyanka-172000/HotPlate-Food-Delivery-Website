<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Checkout - HotPlate</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
  <style>
    *{margin:0;padding:0;box-sizing:border-box;}
    body{font-family:'Inter',sans-serif;background:#f8f8f8;color:#1C1C1C;}
    a{text-decoration:none;color:inherit;}
    .container{max-width:1100px;margin:0 auto;padding:0 24px;}
    .page{padding:36px 0 80px;}
    .page-title{font-size:24px;font-weight:900;margin-bottom:28px;}
    .layout{display:flex;gap:28px;align-items:flex-start;}
    .left{flex:1;}
    .right{width:340px;flex-shrink:0;}
    .card{background:#fff;border-radius:16px;border:1px solid #eee;padding:24px;margin-bottom:20px;}
    .card-title{font-size:16px;font-weight:800;margin-bottom:20px;padding-bottom:14px;border-bottom:1px solid #f5f5f5;display:flex;align-items:center;gap:8px;}
    .frow{display:grid;grid-template-columns:1fr 1fr;gap:14px;}
    .fg{margin-bottom:16px;}
    .fg label{display:block;font-size:13px;font-weight:700;color:#444;margin-bottom:6px;}
    .fg input,.fg select,.fg textarea{width:100%;padding:12px 14px;border:1.5px solid #e8e8e8;border-radius:10px;font-size:14px;font-family:'Inter',sans-serif;outline:none;transition:border-color 0.2s;}
    .fg input:focus,.fg select:focus,.fg textarea:focus{border-color:#E23744;box-shadow:0 0 0 3px rgba(226,55,68,0.08);}

    /* Payment methods */
    .pay-methods{display:flex;flex-direction:column;gap:12px;}
    .pay-opt{border:2px solid #e8e8e8;border-radius:12px;padding:16px 18px;cursor:pointer;transition:all 0.18s;display:flex;align-items:center;gap:14px;}
    .pay-opt:hover{border-color:#E23744;background:#FFF8F8;}
    .pay-opt.selected{border-color:#E23744;background:#FFF0F1;}
    .pay-opt input[type=radio]{accent-color:#E23744;width:18px;height:18px;cursor:pointer;}
    .pay-logo{width:44px;height:44px;border-radius:10px;object-fit:contain;background:#f5f5f5;padding:4px;}
    .pay-info-name{font-size:15px;font-weight:800;}
    .pay-info-sub{font-size:12px;color:#888;margin-top:2px;}

    /* UPI sub-options */
    .upi-apps{display:flex;gap:12px;margin-top:14px;flex-wrap:wrap;}
    .upi-app{display:flex;flex-direction:column;align-items:center;gap:6px;cursor:pointer;padding:10px 14px;border:2px solid #e8e8e8;border-radius:12px;transition:all 0.18s;min-width:80px;}
    .upi-app:hover,.upi-app.selected{border-color:#E23744;background:#FFF0F1;}
    .upi-app img{width:36px;height:36px;border-radius:8px;object-fit:cover;}
    .upi-app span{font-size:11px;font-weight:700;color:#444;}
    .upi-divider{display:flex;align-items:center;gap:10px;margin:14px 0;color:#aaa;font-size:13px;}
    .upi-divider::before,.upi-divider::after{content:'';flex:1;height:1px;background:#eee;}
    .upi-id-row{display:flex;gap:10px;align-items:center;}
    .upi-id-input{flex:1;padding:12px 14px;border:1.5px solid #e8e8e8;border-radius:10px;font-size:14px;font-family:'Inter',sans-serif;outline:none;transition:border-color 0.2s;}
    .upi-id-input:focus{border-color:#E23744;}
    .verify-btn{padding:12px 20px;background:#E23744;color:#fff;border:none;border-radius:10px;font-size:14px;font-weight:700;cursor:pointer;font-family:'Inter',sans-serif;}

    /* Card fields */
    .card-fields{margin-top:14px;}

    /* Hidden sections */
    .pay-detail{display:none;margin-top:16px;padding-top:16px;border-top:1px solid #f5f5f5;}
    .pay-detail.active{display:block;}

    /* Bill */
    .bill-card{background:#fff;border-radius:16px;border:1px solid #eee;padding:22px;margin-bottom:16px;}
    .bill-title{font-size:16px;font-weight:800;margin-bottom:18px;padding-bottom:12px;border-bottom:1px solid #f5f5f5;}
    .bill-row{display:flex;justify-content:space-between;font-size:14px;color:#666;padding:5px 0;}
    .bill-row.total{font-size:17px;font-weight:900;color:#1C1C1C;border-top:1px solid #eee;padding-top:14px;margin-top:8px;}
    .bill-save{background:#F0FFF4;border-radius:8px;padding:8px 12px;font-size:13px;font-weight:700;color:#26A541;margin:8px 0;display:flex;justify-content:space-between;}

    .place-btn{width:100%;background:#E23744;color:#fff;border:none;border-radius:12px;padding:16px;font-size:17px;font-weight:900;cursor:pointer;font-family:'Inter',sans-serif;transition:background 0.18s;margin-top:4px;}
    .place-btn:hover{background:#C62233;}
    .safe-note{text-align:center;font-size:12px;color:#aaa;margin-top:10px;}

    /* Login Required Modal */
    .login-overlay{position:fixed;inset:0;background:rgba(0,0,0,0.55);backdrop-filter:blur(6px);z-index:9999;display:none;align-items:center;justify-content:center;animation:fadeInOverlay 0.3s ease;}
    .login-overlay.show{display:flex;}
    @keyframes fadeInOverlay{from{opacity:0}to{opacity:1}}
    .login-modal{background:#fff;border-radius:20px;padding:40px 36px;max-width:420px;width:92%;text-align:center;box-shadow:0 20px 60px rgba(0,0,0,0.25);animation:slideUp 0.35s cubic-bezier(0.16,1,0.3,1);}
    @keyframes slideUp{from{opacity:0;transform:translateY(40px) scale(0.96)}to{opacity:1;transform:translateY(0) scale(1)}}
    .login-modal-icon{width:72px;height:72px;background:linear-gradient(135deg,#FFF0F1 0%,#FFD6D9 100%);border-radius:50%;display:flex;align-items:center;justify-content:center;margin:0 auto 20px;}
    .login-modal h3{font-size:22px;font-weight:900;color:#1C1C1C;margin-bottom:8px;}
    .login-modal p{font-size:14px;color:#777;line-height:1.6;margin-bottom:28px;}
    .login-modal-btn{display:inline-block;background:#E23744;color:#fff;border:none;border-radius:12px;padding:14px 40px;font-size:16px;font-weight:800;cursor:pointer;font-family:'Inter',sans-serif;transition:all 0.2s;text-decoration:none;}
    .login-modal-btn:hover{background:#C62233;transform:translateY(-1px);box-shadow:0 6px 20px rgba(226,55,68,0.35);}
    .login-modal-close{display:block;margin-top:16px;background:none;border:none;color:#999;font-size:14px;font-weight:600;cursor:pointer;font-family:'Inter',sans-serif;padding:8px;}
    .login-modal-close:hover{color:#555;}

    /* Steps indicator */
    .steps{display:flex;align-items:center;gap:0;margin-bottom:32px;}
    .step{display:flex;align-items:center;gap:8px;font-size:13px;font-weight:700;color:#aaa;}
    .step.done{color:#26A541;}
    .step.active{color:#E23744;}
    .step-num{width:28px;height:28px;border-radius:50%;border:2px solid currentColor;display:flex;align-items:center;justify-content:center;font-size:12px;font-weight:800;}
    .step-line{flex:1;height:2px;background:#e8e8e8;margin:0 8px;}
    .step.done .step-line{background:#26A541;}
  </style>
</head>
<body>
<jsp:include page="components/navbar.jsp"/>

<%
  boolean isLoggedIn = (session.getAttribute("user") != null);
%>

<!-- Login Required Modal -->
<div class="login-overlay" id="loginOverlay">
  <div class="login-modal">
    <div class="login-modal-icon">
      <svg width="36" height="36" fill="none" stroke="#E23744" stroke-width="2" viewBox="0 0 24 24">
        <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/>
        <circle cx="12" cy="7" r="4"/>
      </svg>
    </div>
    <h3>Sign In Required</h3>
    <p>Please sign in to your account to place your order. Your cart items will be saved.</p>
    <a href="login.jsp?redirect=checkout" class="login-modal-btn" id="loginRedirectBtn">Sign In &rarr;</a>
    <button class="login-modal-close" onclick="closeLoginModal()">Continue Browsing</button>
  </div>
</div>

<div class="page">
  <div class="container">
    <div class="steps">
      <div class="step done"><div class="step-num">&#10003;</div> Cart</div>
      <div class="step-line"></div>
      <div class="step active"><div class="step-num">2</div> Delivery</div>
      <div class="step-line"></div>
      <div class="step"><div class="step-num">3</div> Payment</div>
      <div class="step-line"></div>
      <div class="step"><div class="step-num">4</div> Confirmation</div>
    </div>

    <div class="page-title">Checkout</div>
    <div class="layout">
      <div class="left">

        <!-- Delivery Address -->
        <div class="card">
          <div class="card-title">
            <svg width="18" height="18" fill="#E23744" viewBox="0 0 24 24"><path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/></svg>
            Delivery Address
          </div>
          <div class="frow">
            <div class="fg"><label>Full Name</label><input type="text" id="dName" placeholder="John Doe" required></div>
            <div class="fg"><label>Phone Number</label><input type="tel" id="dPhone" placeholder="+91 9876543210" required></div>
          </div>
          <div class="fg"><label>Street Address</label><input type="text" id="dStreet" placeholder="House/Flat no., Street name" required></div>
          <div class="frow">
            <div class="fg"><label>City</label><input type="text" id="dCity" value="Bangalore" required></div>
            <div class="fg"><label>PIN Code</label><input type="text" id="dPin" placeholder="560001" required></div>
          </div>
          <div class="fg"><label>Delivery Instructions (optional)</label><input type="text" id="dNotes" placeholder="E.g. Ring bell twice, leave at door..."></div>
        </div>

        <!-- Payment Method -->
        <div class="card">
          <div class="card-title">
            <svg width="18" height="18" fill="none" stroke="#E23744" stroke-width="2" viewBox="0 0 24 24"><rect x="1" y="4" width="22" height="16" rx="2"/><line x1="1" y1="10" x2="23" y2="10"/></svg>
            Payment Method
          </div>
          <div class="pay-methods">

            <!-- UPI -->
            <div class="pay-opt selected" onclick="selectPay('upi',this)">
              <input type="radio" name="pay" value="upi" checked>
              <div style="width:44px;height:44px;background:#f0f0f0;border-radius:10px;display:flex;align-items:center;justify-content:center;">
                <svg width="22" height="22" viewBox="0 0 40 40" fill="none"><rect width="40" height="40" rx="8" fill="#6739B7"/><text x="50%" y="60%" text-anchor="middle" fill="#fff" font-size="14" font-weight="bold" font-family="Arial">UPI</text></svg>
              </div>
              <div style="flex:1">
                <div class="pay-info-name">UPI</div>
                <div class="pay-info-sub">Google Pay, PhonePe, Paytm, BHIM UPI</div>
              </div>
              <div class="pay-detail active" id="detail-upi" style="display:none"></div>
            </div>
            <!-- UPI Detail Panel -->
            <div class="pay-detail active" id="detail-upi" style="padding:0 0 0 10px;">
              <div class="upi-apps">
                <div class="upi-app selected" onclick="selectUpiApp('gpay',this)">
                  <div style="width:36px;height:36px;background:#4285F4;border-radius:8px;display:flex;align-items:center;justify-content:center;"><svg width="20" height="20" viewBox="0 0 24 24" fill="#fff"><path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"/><path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/><path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"/><path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" fill="#EA4335"/></svg></div>
                  <span>Google Pay</span>
                </div>
                <div class="upi-app" onclick="selectUpiApp('phonepe',this)">
                  <div style="width:36px;height:36px;background:#5f259f;border-radius:8px;display:flex;align-items:center;justify-content:center;"><svg width="20" height="20" viewBox="0 0 24 24" fill="#fff"><circle cx="12" cy="12" r="10"/><text x="50%" y="55%" text-anchor="middle" font-size="9" font-weight="bold" fill="#5f259f">Pe</text></svg></div>
                  <span>PhonePe</span>
                </div>
                <div class="upi-app" onclick="selectUpiApp('paytm',this)">
                  <div style="width:36px;height:36px;background:#00B9F1;border-radius:8px;display:flex;align-items:center;justify-content:center;"><svg width="20" height="20" viewBox="0 0 24 24" fill="#fff"><text x="50%" y="65%" text-anchor="middle" font-size="8" font-weight="bold">Paytm</text></svg></div>
                  <span>Paytm</span>
                </div>
                <div class="upi-app" onclick="selectUpiApp('bhim',this)">
                  <div style="width:36px;height:36px;background:#00693C;border-radius:8px;display:flex;align-items:center;justify-content:center;"><svg width="20" height="20" viewBox="0 0 24 24" fill="#fff"><text x="50%" y="65%" text-anchor="middle" font-size="8" font-weight="bold">BHIM</text></svg></div>
                  <span>BHIM</span>
                </div>
              </div>
              <div id="upiAppMsg" style="font-size:13px;color:#26A541;font-weight:700;margin:8px 0;display:none;">You will be redirected to complete payment</div>
              <div class="upi-divider">or enter UPI ID</div>
              <div class="upi-id-row">
                <input class="upi-id-input" type="text" id="upiId" placeholder="yourname@upi (e.g. 9876543210@gpay)">
                <button class="verify-btn" onclick="verifyUpi()">Verify</button>
              </div>
              <div id="upiVerifyMsg" style="font-size:13px;margin-top:8px;display:none;"></div>
            </div>

            <!-- Credit/Debit Card -->
            <div class="pay-opt" onclick="selectPay('card',this)">
              <input type="radio" name="pay" value="card">
              <div style="width:44px;height:44px;background:#f0f0f0;border-radius:10px;display:flex;align-items:center;justify-content:center;">
                <svg width="22" height="18" fill="none" stroke="#555" stroke-width="1.8" viewBox="0 0 24 20"><rect x="1" y="1" width="22" height="18" rx="3"/><line x1="1" y1="7" x2="23" y2="7"/><rect x="3" y="11" width="6" height="2" rx="1" fill="#555"/></svg>
              </div>
              <div style="flex:1">
                <div class="pay-info-name">Credit / Debit Card</div>
                <div class="pay-info-sub">Visa, Mastercard, RuPay, Amex</div>
              </div>
            </div>
            <div class="pay-detail" id="detail-card" style="padding:0 0 0 10px;">
              <div class="fg"><label>Card Number</label>
                <input type="text" id="cardNum" placeholder="1234 5678 9012 3456" maxlength="19" oninput="formatCard(this)">
              </div>
              <div class="frow">
                <div class="fg"><label>Expiry Date</label><input type="text" id="cardExp" placeholder="MM / YY" maxlength="7" oninput="formatExpiry(this)"></div>
                <div class="fg"><label>CVV</label><input type="password" id="cardCvv" placeholder="&#9679;&#9679;&#9679;" maxlength="4"></div>
              </div>
              <div class="fg"><label>Name on Card</label><input type="text" id="cardName" placeholder="As printed on card"></div>
              <div style="display:flex;gap:12px;margin-top:8px;align-items:center;">
                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Visa_Inc._logo.svg/200px-Visa_Inc._logo.svg.png" style="height:24px;opacity:0.7;">
                <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Mastercard-logo.svg/200px-Mastercard-logo.svg.png" style="height:28px;opacity:0.7;">
                <span style="font-size:12px;color:#aaa;">Your card details are encrypted and secure</span>
              </div>
            </div>

            <!-- Net Banking -->
            <div class="pay-opt" onclick="selectPay('netbank',this)">
              <input type="radio" name="pay" value="netbank">
              <div style="width:44px;height:44px;background:#f0f0f0;border-radius:10px;display:flex;align-items:center;justify-content:center;">
                <svg width="22" height="22" fill="none" stroke="#555" stroke-width="1.8" viewBox="0 0 24 24"><rect x="3" y="10" width="18" height="11" rx="1"/><path d="M3 10l9-7 9 7"/><line x1="12" y1="10" x2="12" y2="21"/><line x1="7" y1="10" x2="7" y2="21"/><line x1="17" y1="10" x2="17" y2="21"/></svg>
              </div>
              <div style="flex:1">
                <div class="pay-info-name">Net Banking</div>
                <div class="pay-info-sub">SBI, HDFC, ICICI, Axis and all banks</div>
              </div>
            </div>
            <div class="pay-detail" id="detail-netbank" style="padding:0 0 0 10px;">
              <div class="fg">
                <label>Select Your Bank</label>
                <select id="bankSelect">
                  <option value="">-- Select Bank --</option>
                  <option>State Bank of India</option>
                  <option>HDFC Bank</option>
                  <option>ICICI Bank</option>
                  <option>Axis Bank</option>
                  <option>Kotak Mahindra Bank</option>
                  <option>Punjab National Bank</option>
                  <option>Bank of Baroda</option>
                  <option>Yes Bank</option>
                  <option>IndusInd Bank</option>
                </select>
              </div>
              <div style="font-size:13px;color:#888;">You will be redirected to your bank's secure payment page.</div>
            </div>

            <!-- Cash on Delivery -->
            <div class="pay-opt" onclick="selectPay('cod',this)">
              <input type="radio" name="pay" value="cod">
              <div style="width:44px;height:44px;background:#f0f0f0;border-radius:10px;display:flex;align-items:center;justify-content:center;">
                <svg width="22" height="22" fill="none" stroke="#555" stroke-width="1.8" viewBox="0 0 24 24"><rect x="1" y="6" width="22" height="14" rx="2"/><path d="M16 10a2 2 0 0 1-4 0"/><circle cx="8" cy="13" r="1" fill="#555"/><circle cx="16" cy="13" r="1" fill="#555"/></svg>
              </div>
              <div style="flex:1">
                <div class="pay-info-name">Cash on Delivery</div>
                <div class="pay-info-sub">Pay in cash when your order arrives</div>
              </div>
            </div>
            <div class="pay-detail" id="detail-cod" style="padding:0 0 0 10px;">
              <div style="background:#FFFBEB;border:1px solid #FFE9A0;border-radius:10px;padding:12px 14px;font-size:13px;color:#856404;">
                <strong>Note:</strong> Please keep exact change ready. Our delivery partner may not carry change for large amounts.
              </div>
            </div>

          </div>
        </div>

      </div>

      <!-- Order Summary -->
      <div class="right">
        <div class="bill-card">
          <div class="bill-title">Order Summary</div>
          <div id="summaryItems" style="margin-bottom:12px;padding-bottom:12px;border-bottom:1px solid #f5f5f5;"></div>
          <div class="bill-row"><span>Item Total</span><span id="s-subtotal">&#8377;0</span></div>
          <div class="bill-row"><span>Delivery</span><span id="s-delivery" style="color:#26A541;">FREE</span></div>
          <div class="bill-row"><span>Platform Fee</span><span>&#8377;5</span></div>
          <div class="bill-row"><span>GST (5%)</span><span id="s-gst">&#8377;0</span></div>
          <div class="bill-save" id="s-saving" style="display:none;"><span>You save</span><span id="s-saveAmt"></span></div>
          <div class="bill-row total"><span>Grand Total</span><span id="s-total">&#8377;0</span></div>
          <button class="place-btn" onclick="placeOrder()">Place Order &rarr;</button>
          <div class="safe-note">&#128274; 100% Safe &amp; Secure Checkout</div>
        </div>
      </div>
    </div>
  </div>
</div>

<jsp:include page="components/footer.jsp"/>

<script>
// Load cart
const cart = JSON.parse(sessionStorage.getItem('curryCart') || '{}');
const items = cart.items || [];
const discount = parseInt(sessionStorage.getItem('cartDiscount') || '0');

window.addEventListener('DOMContentLoaded', () => {
  // Build summary
  let subtotal = 0;
  let html = '';
  items.forEach(item => {
    subtotal += item.price * item.qty;
    html += `<div style="display:flex;justify-content:space-between;font-size:13px;color:#666;padding:4px 0;">
      <span>${item.name} x${item.qty}</span><span>&#8377;${item.price * item.qty}</span>
    </div>`;
  });
  document.getElementById('summaryItems').innerHTML = html || '<div style="font-size:13px;color:#aaa;">No items</div>';

  const delivery = subtotal >= 299 ? 0 : 40;
  const gst = Math.round(subtotal * 0.05);
  const total = subtotal + gst + 5 + delivery - discount;

  document.getElementById('s-subtotal').textContent = '&#8377;' + subtotal;
  document.getElementById('s-delivery').textContent = delivery === 0 ? 'FREE' : '&#8377;' + delivery;
  document.getElementById('s-gst').textContent = '&#8377;' + gst;
  document.getElementById('s-total').textContent = '&#8377;' + total;
  if (discount > 0) {
    document.getElementById('s-saving').style.display = 'flex';
    document.getElementById('s-saveAmt').textContent = '-&#8377;' + discount;
  }
  sessionStorage.setItem('orderTotal', total);
  sessionStorage.setItem('orderRestaurant', cart.restaurant || '');
});

let selectedPay = 'upi';
let selectedUpiApp = 'gpay';

function selectPay(method, el) {
  selectedPay = method;
  document.querySelectorAll('.pay-opt').forEach(o => o.classList.remove('selected'));
  document.querySelectorAll('.pay-opt input[type=radio]').forEach(r => r.checked = false);
  el.classList.add('selected');
  el.querySelector('input[type=radio]').checked = true;
  // Show/hide detail panels
  document.querySelectorAll('.pay-detail').forEach(d => d.classList.remove('active'));
  const det = document.getElementById('detail-' + method);
  if (det) det.classList.add('active');
}

function selectUpiApp(app, el) {
  selectedUpiApp = app;
  document.querySelectorAll('.upi-app').forEach(a => a.classList.remove('selected'));
  el.classList.add('selected');
  document.getElementById('upiAppMsg').style.display = 'block';
}

function verifyUpi() {
  const id = document.getElementById('upiId').value.trim();
  const msg = document.getElementById('upiVerifyMsg');
  if (!id || !id.includes('@')) {
    msg.textContent = 'Please enter a valid UPI ID (e.g. name@gpay)';
    msg.style.color = '#E23744';
    msg.style.display = 'block';
    return;
  }
  msg.textContent = '&#10003; UPI ID verified successfully!';
  msg.style.color = '#26A541';
  msg.style.display = 'block';
}

function formatCard(input) {
  let v = input.value.replace(/\D/g,'').substring(0,16);
  input.value = v.replace(/(.{4})/g,'$1 ').trim();
}
function formatExpiry(input) {
  let v = input.value.replace(/\D/g,'').substring(0,4);
  if (v.length >= 2) v = v.substring(0,2) + ' / ' + v.substring(2);
  input.value = v;
}

function placeOrder() {
  // Check if user is logged in (server-side check via JSP)
  var isLoggedIn = <%= isLoggedIn %>;
  if (!isLoggedIn) {
    showLoginModal();
    return;
  }

  // Validate address
  if (!document.getElementById('dName').value.trim()) { alert('Please enter your name'); return; }
  if (!document.getElementById('dPhone').value.trim()) { alert('Please enter phone number'); return; }
  if (!document.getElementById('dStreet').value.trim()) { alert('Please enter street address'); return; }
  if (!document.getElementById('dPin').value.trim()) { alert('Please enter PIN code'); return; }

  // Validate payment
  if (selectedPay === 'card') {
    const num = document.getElementById('cardNum').value.replace(/\s/g,'');
    if (num.length < 16) { alert('Please enter a valid 16-digit card number'); return; }
    if (!document.getElementById('cardExp').value.includes('/')) { alert('Please enter card expiry date'); return; }
    if (document.getElementById('cardCvv').value.length < 3) { alert('Please enter CVV'); return; }
    if (!document.getElementById('cardName').value.trim()) { alert('Please enter name on card'); return; }
  }
  if (selectedPay === 'netbank' && !document.getElementById('bankSelect').value) {
    alert('Please select your bank'); return;
  }

  // Save order info
  sessionStorage.setItem('paymentMethod', selectedPay);
  sessionStorage.setItem('orderAddress', document.getElementById('dStreet').value + ', ' + document.getElementById('dCity').value + ' - ' + document.getElementById('dPin').value);

  // For UPI app: simulate redirect
  if (selectedPay === 'upi' && selectedUpiApp && !document.getElementById('upiId').value.trim()) {
    const apps = {
      gpay: 'gpay',
      phonepe: 'phonepe',
      paytm: 'paytm',
      bhim: 'bhim'
    };
    var total = sessionStorage.getItem('orderTotal') || '0';
    var appParam = apps[selectedUpiApp] || 'gpay';
    sessionStorage.setItem('pendingOrder', 'true');
    window.location.href = 'payment-process.jsp?method=upi&amount=' + total + '&app=' + appParam;
    return;
  }

  var total2 = sessionStorage.getItem('orderTotal') || '0';
  window.location.href = 'payment-process.jsp?method=' + selectedPay + '&amount=' + total2;
}

// Login modal functions
function showLoginModal() {
  document.getElementById('loginOverlay').classList.add('show');
  document.body.style.overflow = 'hidden';
}

function closeLoginModal() {
  document.getElementById('loginOverlay').classList.remove('show');
  document.body.style.overflow = '';
}

// Close modal on ESC key
document.addEventListener('keydown', function(e) {
  if (e.key === 'Escape') closeLoginModal();
});

// Close modal on overlay click (outside the modal box)
document.getElementById('loginOverlay').addEventListener('click', function(e) {
  if (e.target === this) closeLoginModal();
});
</script>
</body>
</html>

