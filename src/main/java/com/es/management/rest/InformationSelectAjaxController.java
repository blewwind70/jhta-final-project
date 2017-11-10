package com.es.management.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.es.common.vo.Criteria;
import com.es.management.service.InformationSelectService;
import com.es.management.vo.Customer;

@RestController
public class InformationSelectAjaxController {
 
	@Autowired
	private InformationSelectService informationSelectService;
	
	@RequestMapping("/getDetailCustomer.esc")
	@ResponseBody
	public Customer getDetailCustomer(int id) {
		Customer customer = informationSelectService.getDetailCustomer(id);
		return customer;
	}
	
	@RequestMapping("/getSearchCustomers.esc")
	@ResponseBody
	public List<Customer> getSearchCustomers(Criteria criteria) {
		return informationSelectService.searchByCustomers(criteria);
	}
}
