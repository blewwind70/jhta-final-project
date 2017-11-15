package com.es.pos.service;

import java.util.List;
import java.util.Map;

import com.es.financial.vo.CouponCustomer;
import com.es.management.vo.Customer;
import com.es.management.vo.Discount;
import com.es.pos.vo.Ticket;
import com.es.pos.vo.TicketReceipt;

public interface PaymentService {

	void sellMovieTicket(List<Ticket> tickets, List<Discount> discounts, TicketReceipt receipt);
	
	List<Discount> findAllDiscounts();
	Discount findDiscountInfo(int discountId);
	Map<String, Object> findCustomerInfo(Map<String, String> map);
	Customer findCustomerInfo(int customerId);
	
	CouponCustomer findCouponOfCustomer(int customerId);
	
	void changeUsedCoupone(CouponCustomer couponCustomer);
	void changeCustomerMiliege(Customer customer);
}