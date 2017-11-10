package com.es.employee.vo;

import java.util.Date;

import com.es.util.TimeSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class EmployeeTimetable {

	private Integer id;
	private Date startedAt;
	private Date endedAt;
	private Employee employee;
	@JsonSerialize(using=TimeSerializer.class)
	private Date restStartedAt;
	@JsonSerialize(using=TimeSerializer.class)
	private Date restEndedAt;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getStartedAt() {
		return startedAt;
	}
	public void setStartedAt(Date startedAt) {
		this.startedAt = startedAt;
	}
	public Date getEndedAt() {
		return endedAt;
	}
	public void setEndedAt(Date endedAt) {
		this.endedAt = endedAt;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public Date getRestStartedAt() {
		return restStartedAt;
	}
	public void setRestStartedAt(Date restStartedAt) {
		this.restStartedAt = restStartedAt;
	}
	public Date getRestEndedAt() {
		return restEndedAt;
	}
	public void setRestEndedAt(Date restEndedAt) {
		this.restEndedAt = restEndedAt;
	}
}
