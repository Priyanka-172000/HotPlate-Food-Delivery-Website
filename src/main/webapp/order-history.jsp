<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700;800;900&display=swap" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Orders – QuickBite</title>
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/navbar.css">
  <style>
    .orders-page { padding: 40px 0 80px; min-height: 70vh; }
    .oh-title { font-size: 26px; font-weight: 800; margin-bottom: 24px; }
    .order-card { background: white; border: 1px solid var(--border); border-radius: var(--radius-md); padding: 20px; margin-bottom: 16px; }
    .oc-top { display: flex; align-items: center; gap: 16px; margin-bottom: 14px; }
    .oc-icon { font-size: 36px; }
    .oc-name { font-size: 16px; font-weight: 700; }
    .oc-meta { font-size: 13px; color: var(--text-light); margin-top: 2px; }
    .oc-status { margin-left: auto; padding: 4px 12px; border-radius: 20px; font-size: 12px; font-weight: 600; }
    .status-delivered { background: #E8F5E9; color: #2E7D32; }
    .status-pending { background: #FFF8E1; color: #E65100; }
    .oc-items { font-size: 14px; color: var(--text-mid); margin-bottom: 12px; padding-bottom: 12px; border-bottom: 1px solid var(--border); }
    .oc-footer { display: flex; align-items: center; justify-content: space-between; }
    .oc-total { font-size: 15px; font-weight: 700; color: var(--text-dark); }
    .reorder-btn { background: var(--primary-light); color: var(--primary); border: 1.5px solid var(--primary); padding: 8px 18px; border-radius: 8px; font-size: 13px; font-weight: 700; cursor: pointer; text-decoration: none; transition: all 0.2s; }
    .reorder-btn:hover { background: var(--primary); color: white; }
  </style>
</head>
<body>

<jsp:include page="components/navbar.jsp"/>

<div class="orders-page">
  <div class="container">
    <div class="oh-title">My Orders</div>

    <div class="order-card">
      <div class="oc-top">
        <span class="oc-icon">🍗</span>
        <div>
          <div class="oc-name">KFC</div>
          <div class="oc-meta">📅 Today, 11:30 AM · Order #QB84721</div>
        </div>
        <span class="oc-status status-delivered">✓ Delivered</span>
      </div>
      <div class="oc-items">Zinger Burger × 1 · Crispy Fries × 1</div>
      <div class="oc-footer">
        <span class="oc-total">&#8377;321</span>
        <a href="menu.jsp?restaurant=1&name=KFC" class="reorder-btn">🔄 Reorder</a>
      </div>
    </div>

    <div class="order-card">
      <div class="oc-top">
        <span class="oc-icon">🍕</span>
        <div>
          <div class="oc-name">Domino's Pizza</div>
          <div class="oc-meta">📅 Yesterday, 8:45 PM · Order #QB83902</div>
        </div>
        <span class="oc-status status-delivered">✓ Delivered</span>
      </div>
      <div class="oc-items">Farmhouse Pizza (Medium) × 1 · Garlic Bread × 1 · Pepsi × 2</div>
      <div class="oc-footer">
        <span class="oc-total">&#8377;649</span>
        <a href="menu.jsp?restaurant=2&name=Dominos" class="reorder-btn">🔄 Reorder</a>
      </div>
    </div>

    <div class="order-card">
      <div class="oc-top">
        <span class="oc-icon">🍛</span>
        <div>
          <div class="oc-name">Biryani House</div>
          <div class="oc-meta">📅 Jun 24, 1:15 PM · Order #QB82456</div>
        </div>
        <span class="oc-status status-delivered">✓ Delivered</span>
      </div>
      <div class="oc-items">Chicken Biryani × 2 · Raita × 1</div>
      <div class="oc-footer">
        <span class="oc-total">&#8377;498</span>
        <a href="menu.jsp?restaurant=3&name=Biryani+House" class="reorder-btn">🔄 Reorder</a>
      </div>
    </div>

  </div>
</div>

<jsp:include page="components/footer.jsp"/>
</body>
</html>
