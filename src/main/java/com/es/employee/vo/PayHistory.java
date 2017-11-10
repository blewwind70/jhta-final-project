package com.es.employee.vo;

import java.util.Date;

public class PayHistory {

	private Integer id;
	private Integer hourlyPay;
	private Employee employee;
	private Date startedDate;
	private Date endedDate;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getHourlyPay() {
		return hourlyPay;
	}
	public void setHourlyPay(Integer hourlyPay) {
		this.hourlyPay = hourlyPay;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public Date getStartedDate() {
		return startedDate;
	}
	public void setStartedDate(Date startedDate) {
		this.startedDate = startedDate;
	}
	public Date getEndedDate() {
		return endedDate;
	}
	public void setEndedDate(Date endedDate) {
		this.endedDate = endedDate;
	}
}
