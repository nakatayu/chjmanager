package com.chj.entity;

/**
 * 对应数据库表：tb_product_category
 */

public class Category implements java.io.Serializable {

	/**
	 * Fields
	 */
	private Long productCategoryId;
	private String name;
	private Long parentId;

	/**
	 * full constructor
	 */
	public Category(Long productCategoryId, String Name, Long parentId) {
		this.productCategoryId = productCategoryId;
		this.name = name;
		this.parentId = parentId;
	}

	public Long getProductCategoryId() {
		return productCategoryId;
	}

	public String getName() {
		return name;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setProductCategoryId(Long productCategoryId) {
		this.productCategoryId = productCategoryId;
	}

	public void setName(String name) {
		name = name;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

}
