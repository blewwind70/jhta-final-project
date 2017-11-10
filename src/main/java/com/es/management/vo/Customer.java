package com.es.management.vo;

import java.util.Date;

import com.es.util.DateSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

public class Customer {

	private Integer id;
	private String username;
	private String password;
	private String name;
	private String phone;
	private String email;
	private	Integer gender;
	private Integer miliege;
	private String imageUri;
	private Integer deleted;
	private String thirdParty;
	private Date createdAt;
	private Date updatedAt;
	private CustomerRank customerRank;
	private CustomerType customerTypes;
	@JsonSerialize(using=DateSerializer.class)
	private Date birth;	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getGender() {
		return gender;
	}
	public void setGender(Integer gender) {
		this.gender = gender;
	}
	public Integer getMiliege() {
		return miliege;
	}
	public void setMiliege(Integer miliege) {
		this.miliege = miliege;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getImageUri() {
		return imageUri;
	}
	public void setImageUri(String imageUri) {
		this.imageUri = imageUri;
	}
	public Integer getDeleted() {
		return deleted;
	}
	public void setDeleted(Integer deleted) {
		this.deleted = deleted;
	}
	public String getThirdParty() {
		return thirdParty;
	}
	public void setThirdParty(String thirdParty) {
		this.thirdParty = thirdParty;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public CustomerType getCustomerTypes() {
		return customerTypes;
	}
	public void setCustomerTypes(CustomerType customerTypes) {
		this.customerTypes = customerTypes;
	}
	public CustomerRank getCustomerRank() {
		return customerRank;
	}
	public void setCustomerRank(CustomerRank customerRank) {
		this.customerRank = customerRank;
	}

}
