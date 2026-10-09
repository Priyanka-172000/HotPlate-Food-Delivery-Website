package com.fooddelivery.dao;

import com.fooddelivery.model.Payment;

public interface PaymentDAO {

    boolean makePayment(Payment payment);

    Payment getPaymentByOrderId(int orderId);
}