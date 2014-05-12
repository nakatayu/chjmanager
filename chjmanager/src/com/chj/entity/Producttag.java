package com.chj.entity;

import java.util.Date;
/**
 *对应数据库：tb_product_tag
 */ 
public class Producttag implements java.io.Serializable {
	private static final long serialVersionUID = -2461749752726404917L;
	 /**
	   *  Fields 
	   */ 
	private Long productTagId;
	private Long productId;
	private Long tagId;
	private Date addTime;
	private String status; 
	

	public Producttag(){
	}
	
	public Long getProductTagId() {
		return productTagId;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductTagId(Long productTagId) {
		this.productTagId = productTagId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
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
