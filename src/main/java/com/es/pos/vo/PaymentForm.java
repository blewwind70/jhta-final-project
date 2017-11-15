package com.es.pos.vo;

public class PaymentForm {

	private Integer paymentPrice;
	private Integer discountPrice;
	private String purchaseType;
	private Integer movieTimetable;
	private String customerType;
	private String seat;
	private Integer customerId;
	private String usedCoupon;
	private String cardNo;
	private Integer usedPoint;
	private String usedDiscount;
	
	public Integer getPaymentPrice() {
		return paymentPrice;
	}
	public void setPaymentPrice(Integer paymentPrice) {
		this.paymentPrice = paymentPrice;
	}
	public Integer getDiscountPrice() {
		return discountPrice;
	}
	public void setDiscountPrice(Integer discountPrice) {
		this.discountPrice = discountPrice;
	}
	public String getPurchaseType() {
		return purchaseType;
	}
	public void setPurchaseType(String purchaseType) {
		this.purchaseType = purchaseType;
	}
	public Integer getMovieTimetable() {
		return movieTimetable;
	}
	public void setMovieTimetable(Integer movieTimetable) {
		this.movieTimetable = movieTimetable;
	}
	public String getCustomerType() {
		return customerType;
	}
	public void setCustomerType(String customerType) {
		this.customerType = customerType;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public Integer getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}
	public String getUsedCoupon() {
		return usedCoupon;
	}
	public void setUsedCoupon(String usedCoupon) {
		this.usedCoupon = usedCoupon;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public Integer getUsedPoint() {
		return usedPoint;
	}
	public void setUsedPoint(Integer usedPoint) {
		this.usedPoint = usedPoint;
	}
	public String getUsedDiscount() {
		return usedDiscount;
	}
	public void setUsedDiscount(String usedDiscount) {
		this.usedDiscount = usedDiscount;
	}
}
