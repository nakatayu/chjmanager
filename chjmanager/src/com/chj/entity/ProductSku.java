package com.chj.entity;

import java.sql.Timestamp;
import java.util.Date;

/**
 * 
 */

public class ProductSku  implements java.io.Serializable {


    /**
	 * 
	 */
	private static final long serialVersionUID = 1951913516142059115L;
	// Fields    

     private Long productSkuId;
     private Long productId;
     private String skuNo;
     private String skuKind;
     private String price;
     private String status;
     private String oldPrice;

     private String stock;//中间值，由店铺下的商品查到
     private Long companyShopProductSkuId;//中间值，由店铺下的商品查到

    public Long getProductSkuId() {
		return productSkuId;
	}

	public void setProductSkuId(Long productSkuId) {
		this.productSkuId = productSkuId;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public String getSkuNo() {
		return skuNo;
	}

	public void setSkuNo(String skuNo) {
		this.skuNo = skuNo;
	}

	public String getSkuKind() {
		return skuKind;
	}

	public void setSkuKind(String skuKind) {
		this.skuKind = skuKind;
	}

	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	/** default constructor */
    public ProductSku() {
    }

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getStock() {
		return stock;
	}

	public void setStock(String stock) {
		this.stock = stock;
	}

	public String getOldPrice() {
		return oldPrice;
	}

	public void setOldPrice(String oldPrice) {
		this.oldPrice = oldPrice;
	}

	public Long getCompanyShopProductSkuId() {
		return companyShopProductSkuId;
	}

	public void setCompanyShopProductSkuId(Long companyShopProductSkuId) {
		this.companyShopProductSkuId = companyShopProductSkuId;
	}

    

}