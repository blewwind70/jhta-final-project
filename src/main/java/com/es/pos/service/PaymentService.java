package com.es.pos.service;

import java.util.List;

import com.es.management.vo.Discount;

public interface PaymentService {

	List<Discount> findAllDiscounts();
}
