package com.es.financial.mapper;

import java.util.List;

import com.es.financial.vo.Coupon;

public interface CouponMapper {
	
	void addCoupon(Coupon coupon);
	 void changeReceived(int gid);
}
