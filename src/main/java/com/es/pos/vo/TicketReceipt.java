package com.es.pos.vo;

import java.util.Date;

import com.es.employee.vo.Employee;
import com.es.management.vo.Customer;
import com.es.util.DateSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class TicketReceipt {

	private Integer id;
	private String rid;
	private Integer price;
	private String purchaseType;
	private Integer discountedPrice;
	private Pos pos;
	private Customer customer;
	private String deleted;
	@JsonSerialize(using=DateSerializer.class)
	private Date purchaseDate;
	private String creditNo;
	private String printed;
	
	private Employee employee;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRid() {
		return rid;
	}
	public void setRid(String rid) {
		this.rid = rid;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getPurchaseType() {
		return purchaseType;
	}
	public void setPurchaseType(String purchaseType) {
		this.purchaseType = purchaseType;
	}
	public Integer getDiscountedPrice() {
		return discountedPrice;
	}
	public void setDiscountedPrice(Integer discountedPrice) {
		this.discountedPrice = discountedPrice;
	}
	public Pos getPos() {
		return pos;
	}
	public void setPos(Pos pos) {
		this.pos = pos;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	public Date getPurchaseDate() {
		return purchaseDate;
	}
	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
	public String getCreditNo() {
		return creditNo;
	}
	public void setCreditNo(String creditNo) {
		this.creditNo = creditNo;
	}
	public String getPrinted() {
		return printed;
	}
	public void setPrinted(String printed) {
		this.printed = printed;
	}
	
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
}
