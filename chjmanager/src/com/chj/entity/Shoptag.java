package com.chj.entity;

import java.util.Date;
/**
 *对应数据库：tb_company_shop_tag
 */ 
public class Shoptag implements java.io.Serializable {
	private static final long serialVersionUID = -2461749752726404917L;
	 /**
	   *  Fields 
	   */ 
	private Long companyShopId;
	private Long shopTagId;
	private Long tagId;
	private Date addTime;
	private String status; 
	

	public Shoptag(){
	}
	
	public Long getShopTagId() {
		return shopTagId;
	}

	public void setShopTagId(Long shopTagId) {
		this.shopTagId = shopTagId;
	}

	public Long getCompanyShopId() {
		return companyShopId;
	}

	public Long getTagId() {
		return tagId;
	}

	public Date getAddTime() {
		return addTime;
	}

	public String getStatus() {
		return status;
	}

	public void setCompanyShopId(Long companyShopId) {
		this.companyShopId = companyShopId;
	}

	public void setTagId(Long tagId) {
		this.tagId = tagId;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	
}
