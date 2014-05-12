package com.chj.entity;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * 商铺下产品--部分属性
 */

public class ShopProductPart implements java.io.Serializable {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -9141027578144728701L;
	private String productId;
	private String productName;
	private List<Object> skuList;
	
	
	
	public ShopProductPart() {
		super();
	}



	public List<Object> getSkuList() {
		return skuList;
	}



	public void setSkuList(List<Object> skuList) {
		this.skuList = skuList;
	}



	public String getProductName() {
		return productName;
	}



	public void setProductName(String productName) {
		this.productName = productName;
	}



	public String getProductId() {
		return productId;
	}



	public void setProductId(String productId) {
		this.productId = productId;
	}


}