package com.chj.entity;

/**
 * tb_product_shop_category
 */

public class OptionalProductCategory implements java.io.Serializable {
	/**
	 * Fields
	 */
	private static final long serialVersionUID = -2461749752726404917L;

	private Long productShopCategoryId;
	private String name;
	private Long shopId;
	
	public Long getProductShopCategoryId() {
		return productShopCategoryId;
	}
	public String getName() {
		return name;
	}
	public Long getShopId() {
		return shopId;
	}
	public void setProductShopCategoryId(Long productShopCategoryId) {
		this.productShopCategoryId = productShopCategoryId;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setShopId(Long shopId) {
		this.shopId = shopId;
	}
	

}
