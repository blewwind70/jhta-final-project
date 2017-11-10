package com.es.pos.vo;

import java.util.Date;

import com.es.employee.vo.Employee;

public class PosLoginHistory {

	private Integer id;
	private Date signedIn;
	private Date signedOut;
	private Employee employee;
	private Pos pos;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Date getSignedIn() {
		return signedIn;
	}
	public void setSignedIn(Date signedIn) {
		this.signedIn = signedIn;
	}
	public Date getSignedOut() {
		return signedOut;
	}
	public void setSignedOut(Date signedOut) {
		this.signedOut = signedOut;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public Pos getPos() {
		return pos;
	}
	public void setPos(Pos pos) {
		this.pos = pos;
	}
}
