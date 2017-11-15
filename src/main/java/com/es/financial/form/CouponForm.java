package com.es.financial.form;

import java.util.Date;

public class CouponForm {
	
	private String distributeType;
	private Date distributUntil;
	private String reason;
	private String name;
	private Integer rank;
	
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
	public Integer getRank() {
		return rank;
	}
	public void setRank(Integer rank) {
		this.rank = rank;
	}
	@Override
	public String toString() {
		return "CouponForm [distributeType=" + distributeType + ", distributUntil=" + distributUntil + ", reason="
				+ reason + ", name=" + name + ", rank=" + rank + "]";
	}
	
	
}
