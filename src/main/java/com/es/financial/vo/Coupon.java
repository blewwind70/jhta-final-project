package com.es.financial.vo;

import java.util.Date;

import com.es.management.vo.CustomerRank;

public class Coupon {
	
	private Integer id;
	private String distributeType;
	private Date distributUntil;
	private String reason;
	private String name;
	private CustomerRank customerRank;

	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDistributeType() {
		return distributeType;
	}
	public void setDistributeType(String distributeType) {
		this.distributeType = distributeType;
	}
	public Date getDistributUntil() {
		return distributUntil;
	}
	public void setDistributUntil(Date distributUntil) {
		this.distributUntil = distributUntil;
	}
	
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public CustomerRank getCustomerRank() {
		return customerRank;
	}
	public void setCustomerRank(CustomerRank customerRank) {
		this.customerRank = customerRank;
	}
	@Override
	public String toString() {
		return "Coupon [id=" + id + ", distributeType=" + distributeType + ", distributUntil=" + distributUntil
				+ ", reason=" + reason + ", name=" + name + ", customerRank=" + customerRank + "]";
	}
	
	
}
