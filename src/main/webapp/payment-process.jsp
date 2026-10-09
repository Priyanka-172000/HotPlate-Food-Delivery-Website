<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Processing Payment - HotPlate</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800;900&display=swap" rel="stylesheet">
  <style>
    *{margin:0;padding:0;box-sizing:border-box;}
    body{font-family:'Inter',sans-serif;background:#f8f8f8;min-height:100vh;display:flex;align-items:center;justify-content:center;}
    .box{background:#fff;border-radius:20px;border:1px solid #eee;padding:48px 40px;max-width:440px;width:92%;text-align:center;box-shadow:0 8px 32px rgba(0,0,0,0.08);}
    .spinner{width:64px;height:64px;border:5px solid #f0f0f0;border-top-color:#E23744;border-radius:50%;animation:spin 0.9s linear infinite;margin:0 auto 24px;}
    @keyframes spin{to{transform:rotate(360deg)}}
    .title{font-size:20px;font-weight:800;margin-bottom:10px;}
    .sub{font-size:14px;color:#666;line-height:1.6;margin-bottom:28px;}
    .amount{font-size:32px;font-weight:900;color:#E23744;margin-bottom:6px;}
    .amount-lbl{font-size:13px;color:#888;}
    .progress-bar{width:100%;height:6px;background:#f0f0f0;border-radius:10px;margin:28px 0 16px;overflow:hidden;}
    .progress-fill{height:100%;background:#E23744;border-radius:10px;transition:width 0.5s ease;width:0%;}
    .step-text{font-size:13px;color:#888;font-weight:600;}
    /* Success state */
    .success-box{display:none;}
    .tick{width:72px;height:72px;background:#26A541;border-radius:50%;display:flex;align-items:center;justify-content:center;margin:0 auto 20px;}
    .success-title{font-size:22px;font-weight:900;color:#26A541;margin-bottom:8px;}
    .success-sub{font-size:14px;color:#666;margin-bottom:28px;}
    .go-btn{display:inline-block;background:#E23744;color:#fff;border-radius:12px;padding:14px 32px;font-size:15px;font-weight:800;}

    /* UPI App Page */
    .upi-page{display:none;text-align:center;}
    .upi-app-icon{width:80px;height:80px;border-radius:20px;margin:0 auto 16px;}
    .upi-app-name{font-size:20px;font-weight:800;margin-bottom:8px;}
    .upi-amount{font-size:28px;font-weight:900;color:#E23744;margin:16px 0 6px;}
    .upi-to{font-size:13px;color:#666;margin-bottom:24px;}
    .upi-confirm-btn{background:#E23744;color:#fff;border:none;border-radius:12px;padding:14px 40px;font-size:16px;font-weight:800;cursor:pointer;font-family:'Inter',sans-serif;width:100%;margin-bottom:12px;}
    .upi-cancel-btn{background:#f0f0f0;color:#555;border:none;border-radius:12px;padding:12px 40px;font-size:14px;font-weight:700;cursor:pointer;font-family:'Inter',sans-serif;width:100%;}
    .upi-secure{font-size:12px;color:#aaa;margin-top:14px;}
  </style>
</head>
<body>
<div class="box" id="mainBox">

  <!-- UPI App Screen (shows first if UPI app selected) -->
  <div class="upi-page" id="upiPage">
    <img src="" alt="" class="upi-app-icon" id="upiAppIcon">
    <div class="upi-app-name" id="upiAppName">Google Pay</div>
    <div class="upi-to">Paying to <strong>HotPlate</strong></div>
    <div class="upi-amount">&#8377;<span id="upiAmt">0</span></div>
    <div style="font-size:13px;color:#888;margin-bottom:24px;">Order confirmed. Confirm payment to proceed.</div>
    <button class="upi-confirm-btn" onclick="confirmUpi()">Confirm &amp; Pay</button>
    <button class="upi-cancel-btn" onclick="window.location.href='checkout.jsp'">Cancel</button>
    <div class="upi-secure">&#128274; 256-bit SSL encrypted transaction</div>
  </div>

  <!-- Processing Screen -->
  <div id="processingPage">
    <div class="spinner" id="spinnerEl"></div>
    <div class="amount">&#8377;<span id="amtDisplay">0</span></div>
    <div class="amount-lbl">Processing payment</div>
    <div class="progress-bar"><div class="progress-fill" id="progressFill"></div></div>
    <div class="step-text" id="stepText">Connecting to payment gateway...</div>
  </div>

  <!-- Success Screen -->
  <div class="success-box" id="successPage">
    <div class="tick">
      <svg width="36" height="36" fill="none" stroke="#fff" stroke-width="3" viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"/></svg>
    </div>
    <div class="success-title">Payment Successful!</div>
    <div class="success-sub">Your payment of <strong>&#8377;<span id="successAmt">0</span></strong> was received.<br>Your order is now being prepared.</div>
    <a href="order-confirm.jsp" class="go-btn">Track Your Order &rarr;</a>
  </div>

</div>

<script>
var params = new URLSearchParams(window.location.search);
var method = params.get('method') || 'upi';
var amount = params.get('amount') || '0';
var upiApp = params.get('app') || 'gpay';

document.getElementById('amtDisplay').textContent = amount;
document.getElementById('successAmt').textContent = amount;
document.getElementById('upiAmt').textContent = amount;

var upiApps = {
  gpay:   { name:'Google Pay',  icon:'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c7/Google_Pay_Logo_%282020%29.svg/200px-Google_Pay_Logo_%282020%29.svg.png', bg:'#4285F4' },
  phonepe:{ name:'PhonePe',     icon:'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/PhonePe_Logo.svg/200px-PhonePe_Logo.svg.png', bg:'#5f259f' },
  paytm:  { name:'Paytm',       icon:'https://upload.wikimedia.org/wikipedia/commons/4/42/Paytm_logo.png', bg:'#00B9F1' },
  bhim:   { name:'BHIM UPI',    icon:'', bg:'#00693C' }
};

if (method === 'upi' && (upiApp === 'gpay' || upiApp === 'phonepe' || upiApp === 'paytm' || upiApp === 'bhim')) {
  var app = upiApps[upiApp] || upiApps.gpay;
  document.getElementById('upiAppIcon').src = app.icon;
  document.getElementById('upiAppIcon').style.background = app.bg;
  document.getElementById('upiAppName').textContent = app.name;
  document.getElementById('upiPage').style.display = 'block';
  document.getElementById('processingPage').style.display = 'none';
} else {
  startProcessing();
}

function confirmUpi() {
  document.getElementById('upiPage').style.display = 'none';
  document.getElementById('processingPage').style.display = 'block';
  startProcessing();
}

var steps = [
  'Connecting to payment gateway...',
  'Verifying payment details...',
  'Processing transaction...',
  'Confirming with bank...',
  'Payment authorised!'
];

function startProcessing() {
  var fill = document.getElementById('progressFill');
  var stepEl = document.getElementById('stepText');
  var idx = 0;
  var interval = setInterval(function() {
    idx++;
    fill.style.width = (idx * 20) + '%';
    stepEl.textContent = steps[Math.min(idx, steps.length-1)];
    if (idx >= 5) {
      clearInterval(interval);
      setTimeout(showSuccess, 600);
    }
  }, 700);
}

function showSuccess() {
  document.getElementById('processingPage').style.display = 'none';
  document.getElementById('successPage').style.display = 'block';
  sessionStorage.setItem('paymentDone', 'true');
  // Auto-redirect after 3 seconds
  setTimeout(function(){ window.location.href = 'order-confirm.jsp'; }, 3000);
}
</script>
</body>
</html>
