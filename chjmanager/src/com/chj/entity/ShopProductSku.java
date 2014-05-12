package com.chj.entity;

/**
 * 
 * tb_company_shop_product_sku
 *
 */
public class ShopProductSku implements java.io.Serializable {

	private static final long serialVersionUID = 1951913516142059115L;
	// Fields

	private Long companyShopProductSkuId;
	private Long companyShopProductId;
	private Long productSkuId;
	private String stock;
	private String stockDay;

	private Object sku;

	public ShopProductSku() {
		super();
	}

	public Long getCompanyShopProductSkuId() {
		return companyShopProductSkuId;
	}

	public void setCompanyShopProductSkuId(Long companyShopProductSkuId) {
		this.companyShopProductSkuId = companyShopProductSkuId;
	}

	public Long getCompanyShopProductId() {
		return companyShopProductId;
	}

	public void setCompanyShopProductId(Long companyShopProductId) {
		this.companyShopProductId = companyShopProductId;
	}

	public Long getProductSkuId() {
		return productSkuId;
	}

	public void setProductSkuId(Long productSkuId) {
		this.productSkuId = productSkuId;
	}

	public String getStock() {
		return stock;
	}

	public void setStock(String stock) {
		this.stock = stock;
	}

	public Object getSku() {
		return sku;
	}

	public void setSku(Object sku) {
		this.sku = sku;
	}

	public String getStockDay() {
		return stockDay;
	}

	public void setStockDay(String stockDay) {
		this.stockDay = stockDay;
	}

}