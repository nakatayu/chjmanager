package com.chj.entity;

import java.util.Date;

public class Productshopcategory implements java.io.Serializable {
	/**
	 * Fields
	 */
	private static final long serialVersionUID = -2461749752726404917L;

	private String name;
	private Long parentId;
	private Long shopId;
	private Date creationTime; 
	

	private Long productShopCategoryId;
	
	
	public Date getCreationTime() {
		return creationTime;
	}

	public void setCreationTime(Date creationTime) {
		this.creationTime = creationTime;
	}

	public Long getProductShopCategoryId() {
		return productShopCategoryId;
	}

	public void setProductShopCategoryId(Long productShopCategoryId) {
		this.productShopCategoryId = productShopCategoryId;
	}

	public String getName() {
		return name;
	}

	public Long getParentId() {
		return parentId;
	}

	public Long getShopId() {
		return shopId;
	}


	public void setName(String name) {
		this.name = name;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public void setShopId(Long shopId) {
		this.shopId = shopId;
	}

}
