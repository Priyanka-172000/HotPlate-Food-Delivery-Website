<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%  String error = (String) request.getAttribute("error"); %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Create Account - HotPlate</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800;900&display=swap" rel="stylesheet">
  <style>
    *{margin:0;padding:0;box-sizing:border-box;}
    body{font-family:'Inter',sans-serif;background:#f8f8f8;min-height:100vh;}
    a{text-decoration:none;color:inherit;}
    .page{display:flex;min-height:100vh;}
    /* Left panel */
    .left{flex:1;background:linear-gradient(160deg,#1a1a2e 0%,#16213e 50%,#6B1E1E 100%);display:flex;flex-direction:column;justify-content:center;padding:60px 56px;position:relative;overflow:hidden;}
    .left::before{content:'';position:absolute;inset:0;background:radial-gradient(ellipse at 30% 70%,rgba(226,55,68,0.2) 0%,transparent 60%);}
    .brand{display:flex;align-items:center;gap:12px;margin-bottom:56px;position:relative;z-index:1;}
    .brand-img{width:42px;height:42px;border-radius:50%;object-fit:cover;}
    .brand-name{font-size:24px;font-weight:900;color:#fff;}
    .left-title{font-size:38px;font-weight:900;color:#fff;line-height:1.15;margin-bottom:18px;position:relative;z-index:1;}
    .left-title span{color:#E23744;}
    .left-sub{font-size:15px;color:rgba(255,255,255,0.68);line-height:1.7;margin-bottom:40px;position:relative;z-index:1;}
    .feat-list{display:flex;flex-direction:column;gap:16px;position:relative;z-index:1;}
    .feat{display:flex;align-items:center;gap:14px;font-size:14px;color:rgba(255,255,255,0.75);font-weight:600;}
    .feat-icon{width:40px;height:40px;border-radius:10px;background:rgba(255,255,255,0.1);display:flex;align-items:center;justify-content:center;flex-shrink:0;}
    .food-images{display:flex;gap:12px;margin-top:44px;position:relative;z-index:1;}
    .food-images img{width:70px;height:70px;border-radius:12px;object-fit:cover;border:2px solid rgba(255,255,255,0.2);}
    /* Right panel */
    .right{width:520px;flex-shrink:0;background:#fff;display:flex;align-items:center;justify-content:center;padding:40px;}
    .form-box{width:100%;max-width:420px;}
    .form-box h2{font-size:26px;font-weight:900;margin-bottom:6px;}
    .form-box p{font-size:14px;color:#777;margin-bottom:28px;}
    .error-box{background:#FFF0F1;border:1px solid #FFD6D9;color:#E23744;border-radius:10px;padding:12px 16px;font-size:13px;font-weight:600;margin-bottom:18px;}
    .fgroup{margin-bottom:16px;}
    .fgroup label{display:block;font-size:13px;font-weight:700;color:#444;margin-bottom:6px;}
    .fgroup input,.fgroup textarea,.fgroup select{width:100%;padding:12px 16px;border:1.5px solid #e8e8e8;border-radius:10px;font-size:14px;font-family:'Inter',sans-serif;color:#1C1C1C;background:#f9f9f9;outline:none;transition:border-color 0.2s,background 0.2s;}
    .fgroup input:focus,.fgroup textarea:focus{border-color:#E23744;background:#fff;box-shadow:0 0 0 3px rgba(226,55,68,0.08);}
    .fgroup textarea{min-height:80px;resize:vertical;}
    .frow{display:grid;grid-template-columns:1fr 1fr;gap:14px;}
    .submit-btn{width:100%;background:#E23744;color:#fff;border:none;border-radius:10px;padding:14px;font-size:16px;font-weight:800;cursor:pointer;font-family:'Inter',sans-serif;transition:background 0.18s;margin-top:6px;}
    .submit-btn:hover{background:#C62233;}
    .switch{text-align:center;margin-top:18px;font-size:14px;color:#777;}
    .switch a{color:#E23744;font-weight:700;}
    .divider{display:flex;align-items:center;gap:12px;margin:18px 0;color:#bbb;font-size:13px;}
    .divider::before,.divider::after{content:'';flex:1;height:1px;background:#e8e8e8;}
  </style>
</head>
<body>
<div class="page">

  <!-- LEFT -->
  <div class="left">
    <div class="brand">
      <img src="images/categories/biryani.jpg" class="brand-img" alt="HotPlate">
      <span class="brand-name">HotPlate</span>
    </div>
    <h2 class="left-title">Join millions of<br><span>happy foodies</span></h2>
    <p class="left-sub">Create your free account and start ordering from 500+ top restaurants near you. Hot food in 30 minutes.</p>
    <div class="feat-list">
      <div class="feat">
        <div class="feat-icon">
          <svg width="18" height="18" fill="#E23744" viewBox="0 0 24 24"><path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z"/></svg>
        </div>
        30-minute guaranteed delivery
      </div>
      <div class="feat">
        <div class="feat-icon">
          <svg width="18" height="18" fill="#E23744" viewBox="0 0 24 24"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
        </div>
        500+ top-rated restaurants
      </div>
      <div class="feat">
        <div class="feat-icon">
          <svg width="18" height="18" fill="#E23744" viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"/><path fill="#fff" d="M9 12l2 2 4-4"/></svg>
        </div>
        Exclusive deals and cashbacks
      </div>
    </div>
    <div class="food-images">
      <img src="images/categories/biryani.jpg" alt="Biryani">
      <img src="images/categories/pizza.jpg" alt="Pizza">
      <img src="images/categories/burger.jpg" alt="Burger">
      <img src="images/categories/desserts.jpg" alt="Desserts">
    </div>
  </div>

  <!-- RIGHT -->
  <div class="right">
    <div class="form-box" id="formBox">
      <h2>Create your account</h2>
      <p>It's free and takes less than a minute</p>
      <% if (error != null) { %><div class="error-box">&#9888; <%= error %></div><% } %>
      <div id="regMsg" style="display:none;font-size:13px;font-weight:700;padding:12px 16px;border-radius:10px;margin-bottom:16px;"></div>
      <form id="regForm" onsubmit="return submitRegister(event)">
        <div class="frow">
          <div class="fgroup">
            <label>Full Name</label>
            <input type="text" id="rName" placeholder="John Doe" required>
          </div>
          <div class="fgroup">
            <label>Phone Number</label>
            <input type="tel" id="rPhone" placeholder="+91 9876543210" required>
          </div>
        </div>
        <div class="fgroup">
          <label>Email Address</label>
          <input type="email" id="rEmail" placeholder="you@example.com" required>
        </div>
        <div class="fgroup">
          <label>Password</label>
          <input type="password" id="rPassword" placeholder="Minimum 8 characters" required minlength="6">
        </div>
        <div class="fgroup">
          <label>Delivery Address</label>
          <textarea id="rAddress" placeholder="House no., Street, Area, City..."></textarea>
        </div>
        <button type="submit" class="submit-btn" id="regSubmitBtn">Create Account &rarr;</button>
      </form>
      <div class="switch">Already have an account? <a href="login.jsp">Sign In</a></div>
    </div>
  </div>

</div>

<script>
function submitRegister(e) {
  e.preventDefault();
  var btn = document.getElementById('regSubmitBtn');
  var msg = document.getElementById('regMsg');
  btn.disabled = true;
  btn.textContent = 'Creating account...';

  var fd = new URLSearchParams();
  fd.append('action', 'register');
  fd.append('name', document.getElementById('rName').value.trim());
  fd.append('phone', document.getElementById('rPhone').value.trim());
  fd.append('email', document.getElementById('rEmail').value.trim());
  fd.append('password', document.getElementById('rPassword').value);
  fd.append('address', document.getElementById('rAddress').value.trim());

  fetch('admin/UserAdminServlet', { method: 'POST', body: fd })
    .then(function(r){ return r.json(); })
    .then(function(data){
      if (data.success) {
        msg.style.display = 'block';
        msg.style.background = '#F0FFF4';
        msg.style.color = '#26A541';
        msg.textContent = '\u2713 ' + data.message + ' Redirecting to sign in...';
        document.getElementById('regForm').style.display = 'none';
        setTimeout(function(){ window.location.href = 'login.jsp'; }, 1500);
      } else {
        btn.disabled = false;
        btn.textContent = 'Create Account \u2192';
        msg.style.display = 'block';
        msg.style.background = '#FFF0F1';
        msg.style.color = '#E23744';
        msg.textContent = '\u26A0 ' + (data.message || 'Registration failed. Please try again.');
      }
    })
    .catch(function(){
      btn.disabled = false;
      btn.textContent = 'Create Account \u2192';
      msg.style.display = 'block';
      msg.style.background = '#FFF0F1';
      msg.style.color = '#E23744';
      msg.textContent = '\u26A0 Something went wrong. Please try again.';
    });

  return false;
}
</script>
</body>
</html>
