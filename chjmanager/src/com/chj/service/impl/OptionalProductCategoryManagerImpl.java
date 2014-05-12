package com.chj.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chj.dao.CompanyDao;
import com.chj.dao.OptionalProductCategoryDao;
import com.chj.entity.ProductShop;
import com.chj.entity.ShopProduct;
import com.chj.entity.ShopProductPart;
import com.chj.service.OptionalProductCategoryManager;

@Service
@Transactional
public class OptionalProductCategoryManagerImpl implements OptionalProductCategoryManager {
	
	@Autowired
	OptionalProductCategoryDao optionalCategoryDao;
	
	@Autowired
	CompanyDao companyDao;
	
	/**
	 * 所属店铺OptionalProductCategory.xml
	 * */
		@Override
		public List<Map<String, Object>> findOptionalCategory(Map<String, Object> category) {
			return optionalCategoryDao.findOptionalCategory(category);
		}
	
		public List<ProductShop> findProductShop(Long companyId) {
			return optionalCategoryDao.findProductShop(companyId);
		}

		@Override
		public List<ShopProductPart> findShopUnselectProduct(
				Map<String, Object> param) {
			return optionalCategoryDao.findShopUnselectProduct(param);
		}

		@Override
		public Object findShopUnselectProductCount(Map<String, Object> param) {
			return optionalCategoryDao.findShopUnselectProductCount(param);
		}

		@Override
		public List<Object> selectShopProductSkuList(Long shopId,String productId) {
			return optionalCategoryDao.selectShopProductSkuList(shopId,productId);
		}

		@Override
		public void addCompanyShopProduct(String data) {
			JSONArray array = JSONArray.fromObject(data);
			for(int i=0; i<array.size();i++){
				JSONObject product = array.getJSONObject(i);
				Long companyShopProductId = optionalCategoryDao.selectShopProductId(product.getLong("shopId"),product.getLong("productId"));
						
				if(companyShopProductId == null){
					companyShopProductId = optionalCategoryDao.insertCompanyShopProduct(product);
					
				}
				else{
					 product.put("companyShopProductId", companyShopProductId);
					 optionalCategoryDao.updateCompanyShopProduct(product);
				}
				
				JSONArray skuArray = product.getJSONArray("skuList");
				for(int h=0; h<skuArray.size();h++){
				  optionalCategoryDao.insertCompanyShopProductSku(skuArray.getJSONObject(h),companyShopProductId);
				}
			}
			
			
		}

		@Override
		public List<ShopProduct> findShopSelectedProduct(
				Map<String, Object> param) {
			return optionalCategoryDao.findShopSelectedProduct(param);	
		}

		@Override
		public Object findShopSelectedProductCount(Map<String, Object> param) {
			return optionalCategoryDao.findShopSelectedProductCount(param);
		
		}

		@Override
		public void deleteShopSelectedProduct(String ids, Long shopId) {
			for(String id:ids.split(",")){
				 optionalCategoryDao.deleteShopSelectedProduct(Long.valueOf(id),shopId);
			}
		}	
}
