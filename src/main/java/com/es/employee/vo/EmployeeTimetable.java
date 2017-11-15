package com.es.employee.vo;

import java.util.Date;

import com.es.util.TimeSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;


public class EmployeeTimetable {

	private Integer id;
	@JsonSerialize(using=TimeSerializer.class)
	private Date startedAt;
	@JsonSerialize(using=TimeSerializer.class)
	private Date endedAt;
	private Integer employeeId;
	@JsonSerialize(using=TimeSerializer.class)
	private Date restStartedAt;
	@JsonSerialize(using=TimeSerializer.class)
	private Date restEndedAt;
	private Employee employee;
	private EmployeeManagement management;
	private String managementDetail;
	private Integer managementId;
	
	
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
	public Integer getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
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
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public EmployeeManagement getManagement() {
		return management;
	}
	public void setManagement(EmployeeManagement management) {
		this.management = management;
	}
	public String getManagementDetail() {
		return managementDetail;
	}
	public void setManagementDetail(String managementDetail) {
		this.managementDetail = managementDetail;
	}
	public Integer getManagementId() {
		return managementId;
	}
	public void setManagementId(Integer managementId) {
		this.managementId = managementId;
	}
	@Override
	public String toString() {
		return "EmployeeTimetable [id=" + id + ", startedAt=" + startedAt + ", endedAt=" + endedAt + ", employeeId="
				+ employeeId + ", restStartedAt=" + restStartedAt + ", restEndedAt=" + restEndedAt + ", employee="
				+ employee + ", management=" + management + ", managementDetail=" + managementDetail + ", managementId="
				+ managementId + "]";
	}
	
	
	
}
