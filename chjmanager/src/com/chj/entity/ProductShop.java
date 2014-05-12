package com.chj.entity;

import java.util.List;
import java.util.Map;

public class ProductShop {
	private String productName;
	private int skuCount;
	private Long productId;
	private List<Map<String, Object>> sku;
	public String getProductName() {
		return productName;
	}
	public Long getProductId() {
		return productId;
	}
	public List<Map<String, Object>> getSku() {
		return sku;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public void setProductId(Long productId) {
		this.productId = productId;
	}
	public void setSku(List<Map<String, Object>> sku) {
		this.sku = sku;
		this.skuCount= sku.size();
	}
	public int getSkuCount() {
		return skuCount;
	}
	public void setSkuCount(int skuCount) {
		this.skuCount = skuCount;
	}
}
