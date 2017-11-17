package com.es.financial.service;

import java.util.List;

import com.es.common.vo.Criteria;
import com.es.financial.vo.Coupon;
import com.es.financial.vo.CouponCustomer;
import com.es.financial.vo.GiftCustomer;
import com.es.management.vo.Customer;

public interface CouponService {
	
	Coupon addCoupon(Coupon coupon);
	void changeReceived(int[] gid);
	
	List<Customer> searchByOther(Criteria criteria);
	List<Customer> searchByCoupon(Criteria criteria);
	List<Customer> searchByGift(Criteria criteria);
	
	Customer getDetailCustomer(int id);
	List<CouponCustomer> getDetailCoupon(int id);
	List<GiftCustomer> getDetailGift(int id);
	
	
}
