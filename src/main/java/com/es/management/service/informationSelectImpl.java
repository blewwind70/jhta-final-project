package com.es.management.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.es.common.vo.Criteria;
import com.es.management.mapper.CustomerMapper;
import com.es.management.vo.Customer;

@Service
public class informationSelectImpl implements InformationSelectService{

	@Autowired
	private CustomerMapper customerMapper;
	
	
	@Override
	public List<Customer> getAllCustomers() {
		return customerMapper.getAllCustomers();
	}
	
	@Override
	public Customer getDetailCustomer(int id) {
		return customerMapper.getDetailCustomer(id);
	}
	
	@Override
	public List<Customer> searchByCustomers(Criteria criteria) {
		return customerMapper.searchByCustomers(criteria);
	}
}
