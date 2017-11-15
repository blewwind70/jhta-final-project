package com.es.financial.web;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.es.financial.form.CouponForm;
import com.es.financial.service.CouponService;
import com.es.financial.vo.Coupon;
import com.es.management.vo.Customer;
import com.es.management.vo.CustomerRank;

@Controller
public class CouponController {
	
	@Autowired
	private CouponService couponService;
	
	@PostMapping("/add.esc")
	public String submit(CouponForm couponForm) {
		
		Coupon coupon = new Coupon();
		BeanUtils.copyProperties(couponForm, coupon);
		CustomerRank customerRank = new CustomerRank();
		customerRank.setId(couponForm.getRank());
		coupon.setCustomerRank(customerRank);
		
		System.out.println(coupon);
		
		return "redirect:/financial/managementCoupon.esc";
	}
	
	@RequestMapping("/managementCoupon.esc")
	public String management(Model model) {
		
		List<Customer> customers = couponService.getAllCustomers();
		model.addAttribute("customers", customers);
		
		
		return "managementCoupon";
	}
	
}
