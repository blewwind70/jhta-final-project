package com.es.financial.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.es.common.vo.Criteria;
import com.es.financial.mapper.CouponMapper;
import com.es.financial.mapper.FinTestMapper;
import com.es.financial.vo.Coupon;
import com.es.management.mapper.CustomerMapper;
import com.es.management.vo.Customer;

@Service
public class CouponServiceImpl implements CouponService {

	@Autowired
	private  CouponMapper couponMapper;
	
	@Autowired
	private CustomerMapper customerMapper;
	
	@Autowired
	private FinTestMapper finTestMapper;
	
	
	@Override
	public void addCoupon(Coupon coupon) {
		
		couponMapper.addCoupon(coupon);
	}
	// Customer의 검색조건에 맞는 값 조회
	
	@Override
	public List<Customer> searchByCoupon(Criteria criteria) {
		return customerMapper.searchByCoupon(criteria);
	}
		
	public List<Customer> searchByGift(Criteria criteria) {
		return customerMapper.searchByGift(criteria);
	}
	@Override
	public List<Customer> searchByOther(Criteria criteria) {
		return customerMapper.searchByOther(criteria);
	}
	
	// Customer의 모든값 조회
	@Override
	public List<Customer> getAllCustomers() {
		return customerMapper.getAllCustomers();
	}
	// Customer의 상세정보 중 사용자 조회
	@Override
	public Customer searchDetailCustomer(int id) {
		return customerMapper.searchDetailCustomer(id);
	}


}
