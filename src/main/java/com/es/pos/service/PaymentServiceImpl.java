package com.es.pos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.es.management.vo.Discount;
import com.es.pos.mapper.PosTestMapper;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Autowired
	private PosTestMapper posTestMapper;
	
	@Override
	public List<Discount> findAllDiscounts() {
		return posTestMapper.getDiscount(0);
	}

}
