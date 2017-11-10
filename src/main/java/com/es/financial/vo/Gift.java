package com.es.financial.vo;

import java.util.Date;

import com.es.management.vo.CustomerRank;

public class Gift {

	private Integer id;
	private String distributeType;
	private Date distributeUntil;
	private Integer received;
	private String name;
	private String reason;
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
	public Date getDistributeUntil() {
		return distributeUntil;
	}
	public void setDistributeUntil(Date distributeUntil) {
		this.distributeUntil = distributeUntil;
	}
	public Integer getReceived() {
		return received;
	}
	public void setReceived(Integer received) {
		this.received = received;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public CustomerRank getCustomerRank() {
		return customerRank;
	}
	public void setCustomerRank(CustomerRank customerRank) {
		this.customerRank = customerRank;
	}
}
