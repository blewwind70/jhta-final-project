package com.es.management.mapper;

import java.util.List;
import java.util.Map;

import com.es.common.vo.Criteria;
import com.es.management.vo.Customer;
import com.es.management.vo.CustomerType;

public interface CustomerMapper {
	
	// Customer의 모든값 조회
	List<Customer> getAllCustomers();
	// Customer의 상세정보 조회
	Customer getDetailCustomer(int id);
	// Customer의 검색조건에 맞는 값 조회
	List<Customer> searchByCustomers(Criteria criteria);
	
	// 쿠폰/사은품 쿠폰으로 조회
	List<Customer> searchByCoupon(Criteria criteria);
	// 쿠폰/사은품 이름, 아이디로 조회
	List<Customer> searchByOther(Criteria criteria);
	// 쿠폰/사은품 사은품으로 조회
	List<Customer> searchByGift(Criteria criteria);
	// 쿠폰/사은품 상세정보
	Customer searchDetailCustomer(int id);
	
	// 키인 저장
	void setByKeyIn(CustomerType customerType);
	// 키인 조회
	List<CustomerType> getKeyInAllSelect();
	// 키인 삭제
	void deleteByKeyIn(Map<String, Object> keys);
	
	
	// typeId = 0이면 전체 검색
	List<CustomerType> getCustomerType(int typeId);
	// name, phone 이름으로 담기
	Customer getCustomerByNameNPhone(Map<String, String> map);
	
	// typeId로 type가져오기
	CustomerType getCustomerTypeByType(int typeId);
}
