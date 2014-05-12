package com.chj.entity;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

/**
 * 对应数据库：tb_company_shop_product
 */

public class ShopProduct implements java.io.Serializable {


	/**
	 * 
	 */
	private static final long serialVersionUID = -9003415372273149557L;
	private Long companyShopProductId;
	private Long companyShopId;
	private Long productId;
	private String functionType;//T推广C促销
	private Integer orderFieldFunction;//T推广C促销排序字段
	private Integer orderFieldCategory; //产品分类排序字段
	private Long productShopCategoryId;// 店铺商品分类
	
	private String productName;//中间值
	private List<Object> shopProductSkuList;
	public ShopProduct() {
		super();
	}


	public Long getCompanyShopProductId() {
		return companyShopProductId;
	}


	public void setCompanyShopProductId(Long companyShopProductId) {
		this.companyShopProductId = companyShopProductId;
	}


	public Long getCompanyShopId() {
		return companyShopId;
	}


	public void setCompanyShopId(Long companyShopId) {
		this.companyShopId = companyShopId;
	}


	public Long getProductId() {
		return productId;
	}


	public void setProductId(Long productId) {
		this.productId = productId;
	}


	public String getFunctionType() {
		return functionType;
	}


	public void setFunctionType(String functionType) {
		this.functionType = functionType;
	}


	public Integer getOrderFieldCategory() {
		return orderFieldCategory;
	}


	public void setOrderFieldCategory(Integer orderFieldCategory) {
		this.orderFieldCategory = orderFieldCategory;
	}


	public Long getProductShopCategoryId() {
		return productShopCategoryId;
	}


	public void setProductShopCategoryId(Long productShopCategoryId) {
		this.productShopCategoryId = productShopCategoryId;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public List<Object> getShopProductSkuList() {
		return shopProductSkuList;
	}


	public void setShopProductSkuList(List<Object> shopProductSkuList) {
		this.shopProductSkuList = shopProductSkuList;
	}


	public Integer getOrderFieldFunction() {
		return orderFieldFunction;
	}


	public void setOrderFieldFunction(Integer orderFieldFunction) {
		this.orderFieldFunction = orderFieldFunction;
	}


}