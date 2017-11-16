package com.es.financial.web;


import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.es.financial.form.CouponForm;
import com.es.financial.mapper.CouponMapper;
import com.es.financial.service.CouponService;
import com.es.financial.vo.Coupon;
import com.es.financial.vo.Gift;
import com.es.management.vo.CustomerRank;

@Controller
public class CouponController {
	
	
	
	@Autowired
	CouponService couponService;
	
	@PostMapping("/add.esc")
	public String submit(CouponForm couponForm) {
		
		Coupon coupon = new Coupon();
		BeanUtils.copyProperties(couponForm, coupon);
		CustomerRank customerRank = new CustomerRank();
		customerRank.setId(couponForm.getRank());
		coupon.setCustomerRank(customerRank);
		
		
		return "redirect:/financial/managementCoupon.esc";
	}
	
	/*@RequestMapping("/changeReceived.esc")
	public String update(Gift gift) {
		
		for(int i=0;i<10;i++ ) {	
			couponService.changeReceived(gift);
		}
		couponService.changeReceived(gift);
		
		return "redirect:managementCoupon.esc";
	}*/
	
	@RequestMapping("/managementCoupon.esc")
	public String management() {		
		
		return "managementCoupon";
	}
	
}
