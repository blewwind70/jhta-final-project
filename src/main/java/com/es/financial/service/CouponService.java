package com.es.financial.service;

import java.util.List;

import com.es.common.vo.Criteria;
import com.es.financial.vo.Coupon;
import com.es.management.vo.Customer;

public interface CouponService {
	
	void addCoupon(Coupon coupon);
	
	List<Customer> searchByOther(Criteria criteria);
	List<Customer> searchByCoupon(Criteria criteria);
	List<Customer> searchByGift(Criteria criteria);
	List<Customer> getAllCustomers();
	Customer searchDetailCustomer(int id);
	
}
