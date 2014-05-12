package com.chj.entity;

import java.util.Date;

/**
 * Personnel
 */

public class Personnel implements java.io.Serializable {
	
	private Long id;
	private Long organizationalID;
	private Long companyId;//判断状态 1是开发区，2是企业，3是店铺

	private String name;
	private String userName;  //账号
	private String pwd;       //密码
	private String gender;
	private String email;
	private String phone;
	private String cardNo;
	private Date createdDate;
	private Date endTime;
	private String status;    
	private Integer deleteFlag;
	private Integer type;//判断状态 1是开发区，2是企业，3是店铺
	
    public Long getCompanyId() {
		return companyId;
	}
	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}
	
	
	public Long getId() {
		return id;
	}
	public Long getOrganizationalID() {
		return organizationalID;
	}
	public String getName() {
		return name;
	}
	public String getUserName() {
		return userName;
	}
	public String getPwd() {
		return pwd;
	}
	public String getGender() {
		return gender;
	}
	public String getEmail() {
		return email;
	}
	public String getPhone() {
		return phone;
	}
	public String getCardNo() {
		return cardNo;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public String getStatus() {
		return status;
	}
	public Integer getType() {
		return type;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public void setOrganizationalID(Long organizationalID) {
		this.organizationalID = organizationalID;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getDeleteFlag() {
		return deleteFlag;
	}
	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	
	
	
}
