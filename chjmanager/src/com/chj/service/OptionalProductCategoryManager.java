package com.chj.service;

import java.util.List;
import java.util.Map;

import com.chj.entity.OptionalProductCategory;
import com.chj.entity.ProductShop;
import com.chj.entity.ShopProduct;
import com.chj.entity.ShopProductPart;


public interface OptionalProductCategoryManager{
	
		public List<Map<String, Object>> findOptionalCategory(Map<String, Object> category);
		
		public List<ProductShop> findProductShop(Long companyId);
		
		public List<ShopProductPart> findShopUnselectProduct(
				Map<String, Object> param);
		public Object findShopUnselectProductCount(Map<String, Object> param);
		public List<Object> selectShopProductSkuList(Long shopId,String productId);
		public void addCompanyShopProduct(String data);
		public List<ShopProduct> findShopSelectedProduct(
				Map<String, Object> param);
		public Object findShopSelectedProductCount(Map<String, Object> param);
		public void deleteShopSelectedProduct(String ids, Long shopId);
		
}