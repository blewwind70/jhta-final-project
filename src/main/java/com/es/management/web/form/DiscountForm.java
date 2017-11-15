package com.es.management.web.form;

import java.util.Date;

import com.es.management.vo.CustomerType;

public class DiscountForm {

	private String name;
	private String detail;
	private Integer discountPercent;
	private Date startedDate;
	private Date endDate;
	private String discountType;
	private String discountPrice;
	private Integer customerTypeId;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public Integer getDiscountPercent() {
		return discountPercent;
	}
	public void setDiscountPercent(Integer discountPercent) {
		this.discountPercent = discountPercent;
	}
	public Date getStartedDate() {
		return startedDate;
	}
	public void setStartedDate(Date startedDate) {
		this.startedDate = startedDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public String getDiscountType() {
		return discountType;
	}
	public void setDiscountType(String discountType) {
		this.discountType = discountType;
	}
	public String getDiscountPrice() {
		return discountPrice;
	}
	public void setDiscountPrice(String discountPrice) {
		this.discountPrice = discountPrice;
	}
	public Integer getCustomerTypeId() {
		return customerTypeId;
	}
	public void setCustomerTypeId(Integer customerTypeId) {
		this.customerTypeId = customerTypeId;
	}
	@Override
	public String toString() {
		return "DiscountForm [name=" + name + ", detail=" + detail + ", discountPercent="
				+ discountPercent + ", startedDate=" + startedDate + ", endDate=" + endDate + ", discountType="
				+ discountType + ", discountPrice=" + discountPrice + ", customerTypeId=" + customerTypeId + "]";
	}
	
	
}
