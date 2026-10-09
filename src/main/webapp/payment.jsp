<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Payment - CurryDash</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
  <style>
    *{margin:0;padding:0;box-sizing:border-box;}
    body{font-family:'Inter',sans-serif;background:#f8f8f8;color:#1C1C1C;min-height:100vh;}
    a{text-decoration:none;color:inherit;}
    .container{max-width:520px;margin:0 auto;padding:0 24px;}

    /* Steps */
    .steps{display:flex;align-items:center;padding:20px 24px;max-width:1100px;margin:0 auto;}
    .step{display:flex;align-items:center;gap:8px;font-size:13px;font-weight:700;}
    .step-num{width:28px;height:28px;border-radius:50%;display:flex;align-items:center;justify-content:center;font-size:12px;font-weight:800;}
    .step.done .step-num{background:#E23744;color:#fff;}
    .step.active .step-num{background:#E23744;color:#fff;}
    .step.inactive .step-num{background:#e8e8e8;color:#aaa;}
    .step.inactive span{color:#aaa;}
    .step-line{flex:1;height:2px;background:#e8e8e8;margin:0 8px;}
    .step-line.done{background:#E23744;}

    .pay-wrap{padding:32px 0 80px;}
    .pay-card{background:#fff;border-radius:20px;border:1px solid #eee;overflow:hidden;box-shadow:0 4px 20px rgba(0,0,0,0.08);}
    .pay-header{background:linear-gradient(135deg,#1a1a2e,#E23744);padding:28px 28px 22px;color:#fff;}
    .pay-header h2{font-size:20px;font-weight:900;margin-bottom:4px;}
    .pay-header p{font-size:13px;opacity:0.8;}
    .pay-amount{font-size:32px;font-weight:900;margin-top:16px;}
    .pay-body{padding:28px;}

    /* UPI payment */
    .upi-screen{text-align:center;}
    .upi-app-logo{width:72px;height:72px;border-radius:16px;object-fit:cover;margin:0 auto 14px;display:block;}
    .upi-title{font-size:18px;font-weight:800;margin-bottom:6px;}
    .upi-sub{font-size:14px;color:#777;margin-bottom:24px;}
    .qr-box{width:180px;height:180px;background:#f8f8f8;border:2px dashed #ddd;border-radius:16px;margin:0 auto 20px;display:flex;align-items:center;justify-content:center;flex-direction:column;gap:8px;}
    .qr-box svg{opacity:0.4;}
    .qr-box span{font-size:12px;color:#aaa;}
    .upi-id-display{background:#f8f8f8;border-radius:10px;padding:12px 16px;font-size:15px;font-weight:700;color:#E23744;margin-bottom:20px;border:1px solid #eee;}
    .timer{font-size:13px;color:#E23744;font-weight:700;margin-bottom:20px;}
    .open-app-btn{display:block;background:#E23744;color:#fff;border-radius:12px;padding:14px;text-align:center;font-size:16px;font-weight:800;cursor:pointer;border:none;width:100%;font-family:'Inter',sans-serif;margin-bottom:10px;}
    .open-app-btn:hover{background:#C62233;}
    .or-txt{text-align:center;color:#aaa;font-size:13px;margin:12px 0;}

    /* Card payment */
    .card-display{background:linear-gradient(135deg,#1C1C2E,#E23744);border-radius:16px;padding:24px;color:#fff;margin-bottom:24px;position:relative;overflow:hidden;}
    .card-display::before{content:'';position:absolute;right:-30px;top:-30px;width:180px;height:180px;border-radius:50%;background:rgba(255,255,255,0.06);}
    .card-chip{width:36px;height:28px;background:linear-gradient(135deg,#f0c040,#d4a520);border-radius:6px;margin-bottom:20px;}
    .card-num-display{font-size:20px;font-weight:700;letter-spacing:4px;margin-bottom:20px;font-family:monospace;}
    .card-bottom{display:flex;justify-content:space-between;font-size:12px;opacity:0.8;}
    .card-bottom span{display:block;font-size:15px;font-weight:700;margin-top:4px;opacity:1;}

    /* COD */
    .cod-box{text-align:center;padding:20px 0;}
    .cod-icon{font-size:64px;margin-bottom:16px;}
    .cod-title{font-size:18px;font-weight:800;margin-bottom:8px;}
    .cod-sub{font-size:14px;color:#777;line-height:1.7;}

    .pay-btn{width:100%;background:#E23744;color:#fff;border:none;border-radius:12px;padding:15px;font-size:16px;font-weight:800;cursor:pointer;font-family:'Inter',sans-serif;transition:background 0.18s;margin-top:16px;}
    .pay-btn:hover{background:#C62233;}
    .secure{display:flex;align-items:center;justify-content:center;gap:6px;font-size:12px;color:#aaa;margin-top:12px;}

    /* Processing overlay */
    .processing{position:fixed;inset:0;background:rgba(0,0,0,0.6);display:none;align-items:center;justify-content:center;z-index:9999;flex-direction:column;gap:20px;}
    .processing.show{display:flex;}
    .spinner{width:56px;height:56px;border:5px solid rgba(255,255,255,0.2);border-top-color:#fff;border-radius:50%;animation:spin 0.8s linear infinite;}
    @keyframes spin{to{transform:rotate(360deg);}}
    .proc-text{color:#fff;font-size:18px;font-weight:800;}
  </style>
</head>
<body>
<jsp:include page="components/navbar.jsp"/>

<div class="steps">
  <div class="step done"><div class="step-num">&#10003;</div><span>Cart</span></div>
  <div class="step-line done"></div>
  <div class="step done"><div class="step-num">&#10003;</div><span>Checkout</span></div>
  <div class="step-line done"></div>
  <div class="step active"><div class="step-num">3</div><span>Payment</span></div>
  <div class="step-line"></div>
  <div class="step inactive"><div class="step-num">4</div><span>Confirmed</span></div>
</div>

<div class="pay-wrap">
  <div class="container">
    <div class="pay-card">
      <div class="pay-header">
        <h2>Complete Payment</h2>
        <p id="payMethodLabel">Pay securely via UPI</p>
        <div class="pay-amount">&#8377;<span id="payAmount">0</span></div>
      </div>
      <div class="pay-body">

        <!-- UPI SCREEN -->
        <div id="upiScreen" class="upi-screen">
          <img id="upiAppLogo" class="upi-app-logo" src="" alt="">
          <div class="upi-title" id="upiAppName">PhonePe</div>
          <div class="upi-sub">Scan the QR code or open your UPI app</div>
          <div class="qr-box">
            <svg width="100" height="100" viewBox="0 0 100 100">
              <rect x="10" y="10" width="30" height="30" fill="none" stroke="#333" stroke-width="3"/>
              <rect x="15" y="15" width="20" height="20" fill="#333"/>
              <rect x="60" y="10" width="30" height="30" fill="none" stroke="#333" stroke-width="3"/>
              <rect x="65" y="15" width="20" height="20" fill="#333"/>
              <rect x="10" y="60" width="30" height="30" fill="none" stroke="#333" stroke-width="3"/>
              <rect x="15" y="65" width="20" height="20" fill="#333"/>
              <rect x="60" y="60" width="10" height="10" fill="#333"/>
              <rect x="75" y="60" width="15" height="10" fill="#333"/>
              <rect x="60" y="75" width="15" height="10" fill="#333"/>
              <rect x="80" y="80" width="10" height="10" fill="#333"/>
            </svg>
            <span>Scan to pay</span>
          </div>
          <div class="upi-id-display">currydash@upi</div>
          <div class="timer" id="timerDisplay">Expires in: <span id="countdown">10:00</span></div>
          <button class="open-app-btn" id="openAppBtn" onclick="openUpiApp()">Open <span id="appNameBtn">PhonePe</span> &rarr;</button>
          <div class="or-txt">&#8212; or &#8212;</div>
          <button class="pay-btn" onclick="simulatePayment()">Confirm Payment</button>
        </div>

        <!-- CARD SCREEN -->
        <div id="cardScreen" style="display:none;">
          <div class="card-display">
            <div class="card-chip"></div>
            <div class="card-num-display" id="displayCardNum">•••• •••• •••• ••••</div>
            <div class="card-bottom">
              <div>Card Holder<span id="displayCardName">YOUR NAME</span></div>
              <div>Expires<span id="displayExpiry">MM/YY</span></div>
            </div>
          </div>
          <div style="font-size:13px;color:#777;text-align:center;margin-bottom:20px;">Paying &#8377;<span id="cardPayAmt">0</span> securely</div>
          <button class="pay-btn" onclick="simulatePayment()">Pay Now &#8377;<span id="cardPayBtn">0</span></button>
        </div>

        <!-- NET BANKING SCREEN -->
        <div id="netScreen" style="display:none;text-align:center;padding:20px 0;">
          <div style="font-size:48px;margin-bottom:16px;">&#127968;</div>
          <div style="font-size:17px;font-weight:800;margin-bottom:8px;">Net Banking</div>
          <div style="font-size:14px;color:#777;margin-bottom:24px;">You will be redirected to your bank's secure page</div>
          <div style="background:#f8f8f8;border-radius:12px;padding:16px;font-size:15px;font-weight:700;color:#1C1C1C;margin-bottom:20px;" id="bankDisplay">State Bank of India</div>
          <button class="pay-btn" onclick="simulatePayment()">Continue to Bank &rarr;</button>
        </div>

        <!-- COD SCREEN -->
        <div id="codScreen" style="display:none;">
          <div class="cod-box">
            <div class="cod-icon">&#128181;</div>
            <div class="cod-title">Cash on Delivery</div>
            <div class="cod-sub">Keep &#8377;<span id="codAmt">0</span> ready when your order arrives.<br>Our delivery partner will collect payment.</div>
          </div>
          <button class="pay-btn" onclick="simulatePayment()">Confirm Order &rarr;</button>
        </div>

        <div class="secure">
          <svg width="12" height="12" fill="#26A541" viewBox="0 0 24 24"><path d="M12 1L3 5v6c0 5.55 3.84 10.74 9 12 5.16-1.26 9-6.45 9-12V5l-9-4z"/></svg>
          Secured by 256-bit SSL encryption
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Processing overlay -->
<div class="processing" id="processing">
  <div class="spinner"></div>
  <div class="proc-text" id="procText">Processing payment...</div>
</div>

<jsp:include page="components/footer.jsp"/>
<script>
  const UPI_APPS = {
    phonepe: { name:'PhonePe', logo:'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/PhonePe_Logo.png/200px-PhonePe_Logo.png', scheme:'phonepe://pay' },
    gpay:    { name:'Google Pay', logo:'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f2/Google_Pay_Logo.svg/200px-Google_Pay_Logo.svg.png', scheme:'tez://upi/pay' },
    paytm:   { name:'Paytm', logo:'https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Paytm_Logo_%28standalone%29.svg/200px-Paytm_Logo_%28standalone%29.svg.png', scheme:'paytmmp://pay' },
    bhim:    { name:'BHIM', logo:'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/BHIM_logo_%28svg%29.svg/200px-BHIM_logo_%28svg%29.svg.png', scheme:'upi://pay' }
  };

  window.addEventListener('DOMContentLoaded', function(){
    const total   = sessionStorage.getItem('orderTotal') || '0';
    const method  = sessionStorage.getItem('payMethod')  || 'upi';
    const upiApp  = sessionStorage.getItem('upiApp')     || 'phonepe';
    const bank    = sessionStorage.getItem('bankSelect')  || 'State Bank of India';
    const cart    = JSON.parse(sessionStorage.getItem('curryCart')||'{}');

    document.getElementById('payAmount').textContent = total;

    // Show correct screen
    document.getElementById('upiScreen').style.display  = 'none';
    document.getElementById('cardScreen').style.display  = 'none';
    document.getElementById('netScreen').style.display   = 'none';
    document.getElementById('codScreen').style.display   = 'none';

    if(method==='upi'){
      document.getElementById('upiScreen').style.display='block';
      const app = UPI_APPS[upiApp] || UPI_APPS.phonepe;
      document.getElementById('upiAppLogo').src      = app.logo;
      document.getElementById('upiAppName').textContent = app.name;
      document.getElementById('appNameBtn').textContent = app.name;
      document.getElementById('payMethodLabel').textContent = 'Pay via ' + app.name;
      startTimer(600);
    } else if(method==='card'){
      document.getElementById('cardScreen').style.display='block';
      document.getElementById('payMethodLabel').textContent='Pay via Card';
      document.getElementById('cardPayAmt').textContent=total;
      document.getElementById('cardPayBtn').textContent=total;
      // Load card details from checkout form (stored in sessionStorage if needed)
    } else if(method==='netbanking'){
      document.getElementById('netScreen').style.display='block';
      document.getElementById('payMethodLabel').textContent='Net Banking';
      document.getElementById('bankDisplay').textContent = bank;
    } else if(method==='cod'){
      document.getElementById('codScreen').style.display='block';
      document.getElementById('payMethodLabel').textContent='Cash on Delivery';
      document.getElementById('codAmt').textContent=total;
    }
  });

  function startTimer(seconds){
    const el = document.getElementById('countdown');
    const t = setInterval(()=>{
      const m=Math.floor(seconds/60), s=seconds%60;
      el.textContent=(m<10?'0':'')+m+':'+(s<10?'0':'')+s;
      if(--seconds<0){ clearInterval(t); el.textContent='Expired'; }
    },1000);
  }

  function openUpiApp(){
    const upiApp = sessionStorage.getItem('upiApp')||'phonepe';
    const app = UPI_APPS[upiApp]||UPI_APPS.phonepe;
    const total = sessionStorage.getItem('orderTotal')||'0';
    const upiUrl = `${app.scheme}?pa=currydash@upi&pn=CurryDash&am=${total}&cu=INR&tn=FoodOrder`;
    window.location.href = upiUrl;
    // After redirect attempt, auto-confirm after 3 seconds (simulated)
    setTimeout(()=>{ simulatePayment(); }, 5000);
  }

  function simulatePayment(){
    const overlay = document.getElementById('processing');
    overlay.classList.add('show');
    const method = sessionStorage.getItem('payMethod')||'upi';
    const msgs = ['Processing payment...','Verifying transaction...','Confirming with bank...','Almost done...'];
    let i=0;
    const intv = setInterval(()=>{
      document.getElementById('procText').textContent = msgs[i++] || msgs[msgs.length-1];
      if(i>=msgs.length){ clearInterval(intv);
        // Generate order ID
        sessionStorage.setItem('orderId', 'CD'+Date.now().toString().slice(-8));
        sessionStorage.setItem('payStatus','SUCCESS');
        window.location.href='order-confirmed.jsp';
      }
    }, 900);
  }
</script>
</body>
</html>
