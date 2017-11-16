package com.es.financial.vo;

import java.util.Date;

import com.es.management.vo.Customer;
import com.es.pos.vo.TicketReceipt;
import com.es.util.DateSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class CouponCustomer {

	private Integer id;
	private Integer used;
	@JsonSerialize(using=DateSerializer.class)
	private Date receivedAt;
	@JsonSerialize(using=DateSerializer.class)
	private Date expiredAt;
	private Customer customer;
	private Coupon coupon;
	private TicketReceipt ticketReceipt;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUsed() {
		return used;
	}
	public void setUsed(Integer used) {
		this.used = used;
	}
	public Date getReceivedAt() {
		return receivedAt;
	}
	public void setReceivedAt(Date receivedAt) {
		this.receivedAt = receivedAt;
	}
	public Date getExpiredAt() {
		return expiredAt;
	}
	public void setExpiredAt(Date expiredAt) {
		this.expiredAt = expiredAt;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public Coupon getCoupon() {
		return coupon;
	}
	public void setCoupon(Coupon coupon) {
		this.coupon = coupon;
	}
	public TicketReceipt getTicketReceipt() {
		return ticketReceipt;
	}
	public void setTicketReceipt(TicketReceipt ticketReceipt) {
		this.ticketReceipt = ticketReceipt;
	}
}
