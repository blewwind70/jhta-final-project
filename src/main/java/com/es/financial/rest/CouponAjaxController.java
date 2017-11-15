package com.es.financial.rest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.es.common.vo.Criteria;
import com.es.financial.service.CouponService;
import com.es.management.service.InformationSelectService;
import com.es.management.vo.Customer;

@RestController
public class CouponAjaxController {
	
	@Autowired
	private CouponService couponService;
	
	@Autowired
	private InformationSelectService informationSelectService;
	
	@RequestMapping("/searchCustomers.esc")
	@ResponseBody
	public List<Customer> searchCustomers(Criteria criteria) {
		System.out.println(criteria);
		if(criteria.getOpt().equals("couponId")) {			
			return couponService.searchByCoupon(criteria);
		} else if(criteria.getOpt().equals("giftId")) {
			return couponService.searchByGift(criteria);
		} else {
			System.out.println(criteria);
			return couponService.searchByOther(criteria);
		}
	}
	
	@RequestMapping("/searchDetailCustomers.esc")
	@ResponseBody
	public Customer searchDetailCustomers(int id){
		return couponService.searchDetailCustomer(id);
	}
}
