<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Contact Us - HotPlate</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">
  <style>
    *{margin:0;padding:0;box-sizing:border-box;}body{font-family:'Inter',sans-serif;color:#1C1C1C;background:#f8f8f8;}
    a{text-decoration:none;color:inherit;}.container{max-width:1100px;margin:0 auto;padding:0 24px;}
    .hero{background:linear-gradient(135deg,#1a1a2e 0%,#16213e 55%,#6B1E1E 100%);color:#fff;padding:64px 0;text-align:center;}
    .hero h1{font-size:40px;font-weight:900;margin-bottom:12px;}
    .hero p{font-size:16px;color:rgba(255,255,255,0.72);}
    .page{padding:56px 0;}
    .layout{display:grid;grid-template-columns:1.1fr 0.9fr;gap:40px;align-items:start;}
    .card{background:#fff;border-radius:18px;border:1px solid #eee;padding:32px;}
    .card-title{font-size:20px;font-weight:800;margin-bottom:24px;}
    .info-item{display:flex;align-items:flex-start;gap:16px;margin-bottom:24px;}
    .info-icon{width:46px;height:46px;border-radius:12px;display:flex;align-items:center;justify-content:center;flex-shrink:0;}
    .info-label{font-size:12px;font-weight:700;color:#888;text-transform:uppercase;letter-spacing:0.5px;margin-bottom:4px;}
    .info-value{font-size:15px;font-weight:700;color:#1C1C1C;}
    .info-sub{font-size:13px;color:#666;margin-top:2px;}
    .fg{margin-bottom:16px;}
    .fg label{display:block;font-size:13px;font-weight:700;color:#444;margin-bottom:6px;}
    .fg input,.fg select,.fg textarea{width:100%;padding:12px 14px;border:1.5px solid #e8e8e8;border-radius:10px;font-size:14px;font-family:'Inter',sans-serif;outline:none;transition:border-color 0.2s;}
    .fg input:focus,.fg select:focus,.fg textarea:focus{border-color:#E23744;box-shadow:0 0 0 3px rgba(226,55,68,0.08);}
    .fg textarea{min-height:120px;resize:vertical;}
    .send-btn{width:100%;background:#E23744;color:#fff;border:none;border-radius:10px;padding:14px;font-size:15px;font-weight:800;cursor:pointer;font-family:'Inter',sans-serif;transition:background 0.18s;}
    .send-btn:hover{background:#C62233;}
    .success-msg{display:none;background:#F0FFF4;border:1px solid #B2DFDB;border-radius:10px;padding:14px 16px;font-size:14px;font-weight:700;color:#26A541;margin-top:12px;text-align:center;}
    .map-box{background:#f0f0f0;border-radius:14px;height:220px;display:flex;align-items:center;justify-content:center;margin-top:20px;border:1px solid #eee;overflow:hidden;}
    .map-box iframe{width:100%;height:100%;border:none;}
    .hours-grid{display:grid;grid-template-columns:1fr 1fr;gap:8px;margin-top:16px;}
    .hour-row{display:flex;justify-content:space-between;font-size:13px;padding:8px 0;border-bottom:1px solid #f5f5f5;}
    .hour-row:last-child{border-bottom:none;}
  </style>
</head>
<body>
<jsp:include page="components/navbar.jsp"/>
<div class="hero">
  <div class="container">
    <h1>Contact Us</h1>
    <p>We're here to help 24/7. Reach out to us anytime.</p>
  </div>
</div>
<div class="page">
  <div class="container">
    <div class="layout">

      <!-- Contact Info -->
      <div>
        <div class="card" style="margin-bottom:24px;">
          <div class="card-title">Get in Touch</div>

          <div class="info-item">
            <div class="info-icon" style="background:#FFF0F1;">
              <svg width="22" height="22" fill="#E23744" viewBox="0 0 24 24"><path d="M6.6 10.8c1.4 2.8 3.8 5.1 6.6 6.6l2.2-2.2c.3-.3.7-.4 1-.2 1.1.4 2.3.6 3.6.6.6 0 1 .4 1 1V20c0 .6-.4 1-1 1-9.4 0-17-7.6-17-17 0-.6.4-1 1-1h3.5c.6 0 1 .4 1 1 0 1.3.2 2.5.6 3.6.1.3 0 .7-.2 1L6.6 10.8z"/></svg>
            </div>
            <div>
              <div class="info-label">Phone</div>
              <div class="info-value"><a href="tel:+911234567890">+91 12345 67890</a></div>
              <div class="info-sub">Mon–Sun, 9 AM – 11 PM</div>
            </div>
          </div>

          <div class="info-item">
            <div class="info-icon" style="background:#E3F2FD;">
              <svg width="22" height="22" fill="#1976D2" viewBox="0 0 24 24"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"/><polyline points="22,6 12,13 2,6"/></svg>
            </div>
            <div>
              <div class="info-label">Email</div>
              <div class="info-value"><a href="mailto:hotplate@gmail.com">hotplate@gmail.com</a></div>
              <div class="info-sub">We reply within 2 hours</div>
            </div>
          </div>

          <div class="info-item">
            <div class="info-icon" style="background:#E8F5E9;">
              <svg width="22" height="22" fill="#26A541" viewBox="0 0 24 24"><path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/></svg>
            </div>
            <div>
              <div class="info-label">Address</div>
              <div class="info-value">BTM Layout, Bangalore</div>
              <div class="info-sub">BTM 2nd Stage, Bangalore, Karnataka – 560076</div>
            </div>
          </div>

        </div>

        <div class="card">
          <div class="card-title" style="margin-bottom:16px;">Support Hours</div>
          <div class="hour-row"><span>Customer Support</span><span style="font-weight:700;color:#26A541;">24/7</span></div>
          <div class="hour-row"><span>Order Issues</span><span style="font-weight:700;">9 AM – 11 PM</span></div>
          <div class="hour-row"><span>Partner Support</span><span style="font-weight:700;">10 AM – 7 PM</span></div>
          <div class="hour-row"><span>Billing Queries</span><span style="font-weight:700;">Mon–Fri, 10 AM – 6 PM</span></div>
        </div>
      </div>

      <!-- Contact Form -->
      <div class="card">
        <div class="card-title">Send Us a Message</div>
        <div class="fg"><label>Your Name</label><input type="text" id="cName" placeholder="John Doe"></div>
        <div class="fg"><label>Email Address</label><input type="email" id="cEmail" placeholder="you@example.com"></div>
        <div class="fg"><label>Subject</label>
          <select id="cSubject">
            <option>Order Issue</option>
            <option>Payment Problem</option>
            <option>Restaurant Feedback</option>
            <option>Delivery Complaint</option>
            <option>Partner with Us</option>
            <option>General Enquiry</option>
          </select>
        </div>
        <div class="fg"><label>Message</label><textarea id="cMsg" placeholder="Describe your issue or question in detail..."></textarea></div>
        <button class="send-btn" onclick="sendMessage()">Send Message &rarr;</button>
        <div class="success-msg" id="successMsg">&#10003; Message sent successfully! We'll get back to you within 2 hours.</div>
      </div>

    </div>
  </div>
</div>
<jsp:include page="components/footer.jsp"/>
<script>
function sendMessage() {
  var name = document.getElementById('cName').value.trim();
  var email = document.getElementById('cEmail').value.trim();
  var msg = document.getElementById('cMsg').value.trim();
  if (!name || !email || !msg) { alert('Please fill in all fields.'); return; }
  document.getElementById('successMsg').style.display = 'block';
  document.getElementById('cName').value = '';
  document.getElementById('cEmail').value = '';
  document.getElementById('cMsg').value = '';
  setTimeout(function(){ document.getElementById('successMsg').style.display='none'; }, 5000);
}
</script>
</body></html>
