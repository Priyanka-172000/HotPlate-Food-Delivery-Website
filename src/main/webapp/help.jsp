<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8"><title>Help Centre - HotPlate</title>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800;900&display=swap" rel="stylesheet">
<style>*{margin:0;padding:0;box-sizing:border-box;}body{font-family:Inter,sans-serif;color:#1C1C1C;background:#f8f8f8;}a{text-decoration:none;color:inherit;}.container{max-width:1100px;margin:0 auto;padding:0 24px;}.hero{background:linear-gradient(135deg,#1a1a2e 0%,#16213e 55%,#6B1E1E 100%);color:#fff;padding:64px 0;text-align:center;}.hero h1{font-size:40px;font-weight:900;margin-bottom:12px;}.hero p{font-size:16px;color:rgba(255,255,255,0.72);}.page{padding:56px 0;}.card{background:#fff;border-radius:18px;border:1px solid #eee;padding:32px;margin-bottom:24px;}.card-title{font-size:20px;font-weight:800;margin-bottom:16px;}.card-text{font-size:14px;color:#555;line-height:1.8;}
.faq-list{display:flex;flex-direction:column;gap:12px;}
.faq-item{background:#fff;border:1px solid #eee;border-radius:12px;overflow:hidden;}
.faq-q{padding:16px 20px;font-size:14px;font-weight:700;cursor:pointer;display:flex;justify-content:space-between;align-items:center;}
.faq-q:hover{background:#FFF0F1;color:#E23744;}
.faq-a{display:none;padding:0 20px 16px;font-size:13px;color:#666;line-height:1.7;}
.faq-a.open{display:block;}
.grid2{display:grid;grid-template-columns:1fr 1fr;gap:20px;}
.help-card{background:#fff;border:1px solid #eee;border-radius:14px;padding:24px;text-align:center;}
.help-icon{font-size:32px;margin-bottom:12px;}
.help-title{font-size:15px;font-weight:800;margin-bottom:6px;}
.help-text{font-size:13px;color:#666;}
</style></head><body>
<jsp:include page="components/navbar.jsp"/>
<div class="hero"><div class="container"><h1>Help Centre</h1><p>Find answers to the most common questions or get in touch with our team.</p></div></div>
<div class="page"><div class="container">
<div class="grid2" style="margin-bottom:32px;">
  <div class="help-card"><div class="help-icon">&#128222;</div><div class="help-title">Call Us</div><div class="help-text">+91 12345 67890<br>Mon–Sun, 9 AM – 11 PM</div></div>
  <div class="help-card"><div class="help-icon">&#128140;</div><div class="help-title">Email Us</div><div class="help-text">hotplate@gmail.com<br>Reply within 2 hours</div></div>
</div>
<div class="card"><div class="card-title">Frequently Asked Questions</div>
<div class="faq-list">
  <div class="faq-item"><div class="faq-q" onclick="toggle(this)">How do I track my order? <span>+</span></div><div class="faq-a">After placing your order, go to the order confirmation page and you will see a live tracking section showing the 5-step delivery status in real time.</div></div>
  <div class="faq-item"><div class="faq-q" onclick="toggle(this)">What if my food arrives cold or late? <span>+</span></div><div class="faq-a">Contact us within 30 minutes of delivery on hotplate@gmail.com or +91 12345 67890. We will offer a refund or free reorder immediately.</div></div>
  <div class="faq-item"><div class="faq-q" onclick="toggle(this)">How do I cancel my order? <span>+</span></div><div class="faq-a">You can cancel your order within 2 minutes of placing it. Go to Your Cart, then Order History and tap Cancel. After 2 minutes, the restaurant may have started preparing your food.</div></div>
  <div class="faq-item"><div class="faq-q" onclick="toggle(this)">Which payment methods are accepted? <span>+</span></div><div class="faq-a">We accept UPI (Google Pay, PhonePe, Paytm, BHIM), Credit/Debit Cards (Visa, Mastercard, RuPay), Net Banking, and Cash on Delivery.</div></div>
  <div class="faq-item"><div class="faq-q" onclick="toggle(this)">How do I apply a coupon code? <span>+</span></div><div class="faq-a">On the Cart page, enter your coupon code in the box at the bottom of your order items and tap APPLY. Valid codes: WELCOME50, FREEDEL, WEEKEND20.</div></div>
  <div class="faq-item"><div class="faq-q" onclick="toggle(this)">Is my payment information secure? <span>+</span></div><div class="faq-a">Yes. All payments are processed through industry-standard SSL encryption. We never store your card details on our servers.</div></div>
</div></div>
</div></div>
<jsp:include page="components/footer.jsp"/>
<script>function toggle(el){var a=el.nextElementSibling;a.classList.toggle('open');el.querySelector('span').textContent=a.classList.contains('open')?'-':'+'}</script>
</body></html>
