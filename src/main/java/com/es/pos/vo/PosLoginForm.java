package com.es.pos.vo;

public class PosLoginForm {

	private Integer posId;
	private Long empId;
	private Long empPwd;
	
	public Integer getPosId() {
		return posId;
	}
	public void setPosId(Integer posId) {
		this.posId = posId;
	}
	public Long getEmpId() {
		return empId;
	}
	public void setEmpId(Long empId) {
		this.empId = empId;
	}
	public Long getEmpPwd() {
		return empPwd;
	}
	public void setEmpPwd(Long empPwd) {
		this.empPwd = empPwd;
	}
}
