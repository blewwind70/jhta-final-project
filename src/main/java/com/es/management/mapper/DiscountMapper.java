package com.es.management.mapper;

import java.util.List;
import java.util.Map;

import com.es.management.vo.Discount;
import com.es.management.web.form.DiscountForm;

public interface DiscountMapper {
	
	// 0 또는 -값이면 전체검색 1이상의 값이면 해당하는 row값을 뽑아냄
	List<Discount> getDiscount(int discountId);
	// discount row값을 저장
	void insertDiscount(DiscountForm discountForm);
	// discount row값을 삭제
	void deleteDiscount(Map<String, Object> checkNo);
}
