package com.chj.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Repository;

import com.chj.entity.ProductShop;
import com.chj.entity.ShopProduct;
import com.chj.entity.ShopProductPart;

@Repository
public class OptionalProductCategoryDao extends BaseDao {

	/*
	 * 获取商品分类
	 */
	public List<Map<String, Object>> findOptionalCategory(
			Map<String, Object> category) {
		List<Map<String, Object>> shopid = this.getSqlMapClientTemplate()
				.queryForList("findOptionalCategory", category);
		return shopid;
	}

	/*
	 * 获取商品分类
	 */
	public List<ProductShop> findProductShop(Long companyId) {
		Map m = new HashMap();
		m.put("companyId", companyId);
		List<ProductShop> psList = new ArrayList<ProductShop>();
		List<Map<String, Object>> skuList = this.getSqlMapClientTemplate()
				.queryForList("findProductShop", m);
		if (skuList != null && skuList.size() != 0) {
			Long productId = Long.parseLong(skuList.get(0).get("productId")
					.toString());
			List<Map<String, Object>> paraList = new ArrayList<Map<String, Object>>();
			Map<String, Object> para = new HashMap<String, Object>();
			ProductShop ps = new ProductShop();
			for (int i = 0; i < skuList.size(); i++) {
				if (productId != Long.parseLong(skuList.get(i).get("productId")
						.toString())) {
					ps.setSku(paraList);
					psList.add(ps);
					ps = new ProductShop();
					paraList = new ArrayList<Map<String, Object>>();
					para = new HashMap<String, Object>();
					para.put("skuName", skuList.get(i).get("skuName")
							.toString());
					para.put("skuId", skuList.get(i).get("skuId").toString());
					paraList.add(para);
					productId = Long.parseLong(skuList.get(i).get("productId")
							.toString());
					ps.setProductId(productId);
					ps.setProductName(skuList.get(i).get("productName")
							.toString());
				} else {
					ps.setProductId(productId);
					ps.setProductName(skuList.get(i).get("productName")
							.toString());
					para = new HashMap<String, Object>();
					para.put("skuName", skuList.get(i).get("skuName")
							.toString());
					para.put("skuId", skuList.get(i).get("skuId").toString());
					paraList.add(para);
				}
				if (i == skuList.size() - 1) {
					ps.setSku(paraList);
					psList.add(ps);
				}
			}
		}
		return psList;
	}

	/**
	 * 店铺待选商品列表
	 * 
	 * @param param
	 * @return
	 */
	// sql 配置文件- ShopProduct.xml
	public List<ShopProductPart> findShopUnselectProduct(
			Map<String, Object> param) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"findShopUnselectProduct", param);
		return (List<ShopProductPart>) obj;
	}

	public Object findShopUnselectProductCount(Map<String, Object> param) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"findShopUnselectProductCount", param);
		return obj;
	}

	public List<Object> selectShopProductSkuList(Long shopId, String productId) {
		HashMap param = new HashMap();
		param.put("productId", Long.valueOf(productId));
		param.put("companyShopProductId",
				selectShopProductId(shopId, Long.valueOf(productId)));

		Object obj = this.getSqlMapClientTemplate().queryForList(
				"selectShopProductSkuList", param);
		return (List<Object>) obj;
	}

	public Long selectShopProductId(Long shopId, Long productId) {
		HashMap param = new HashMap();
		param.put("productId", productId);
		param.put("shopId", shopId);

		return (Long) this.getSqlMapClientTemplate().queryForObject(
				"selectShopProductId", param);
	}

	public Long insertCompanyShopProduct(JSONObject product) {
		HashMap param = new HashMap();
		param.put("productId", product.getLong("productId"));
		param.put("shopId", product.getLong("shopId"));
		param.put("shopCategoryId", product.getLong("shopCategoryId"));
		param.put("functionType", product.getString("functionType"));
		param.put("create_time", new Date());

		return (Long) this.getSqlMapClientTemplate().insert(
				"insertCompanyShopProductZhao", param);
	}

	public void updateCompanyShopProduct(JSONObject product) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("productId", product.getLong("productId"));
		param.put("shopId", product.getLong("shopId"));
		param.put("shopCategoryId", product.getLong("shopCategoryId"));
		param.put("functionType", product.getString("functionType"));
		param.put("create_time", new Date());
		param.put("companyShopProductId",
				product.getLong("companyShopProductId"));
		this.getSqlMapClientTemplate()
				.update("updateCompanyShopProduct", param);
	}

	// shopproduct.xml
	public Long insertCompanyShopProductSku(JSONObject productSku,
			Long companyShopProductId) {
		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("skuId", productSku.getLong("skuId"));
		param.put("stock", productSku.getString("stock"));
		param.put("companyShopProductId", companyShopProductId);
		Long companyShopProductSkuId = (Long) this.getSqlMapClientTemplate()
				.queryForObject("selectCompanyShopProductSkuId", param);
		if (companyShopProductSkuId != null) {
			param.put("companyShopProductSkuId", companyShopProductSkuId);
			this.getSqlMapClientTemplate().update(
					"updateCompanyShopProductSkuZhao", param);
		} else {
			companyShopProductSkuId = (Long) this.getSqlMapClientTemplate()
					.insert("insertCompanyShopProductSkuZhao", param);
		}
		return companyShopProductSkuId;
	}

	public List<ShopProduct> findShopSelectedProduct(Map<String, Object> param) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"selectShopSelectedProductList", param);
		return (List<ShopProduct>) obj;
	}

	public Object findShopSelectedProductCount(Map<String, Object> param) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"selectShopSelectedProductListCount", param);
		return obj;
	}

	// ShopProduct.xml
	public void deleteShopSelectedProduct(Long companyShopProductId, Long shopId) {

		HashMap<String, Long> map = new HashMap<String, Long>();
		map.put("companyShopProductId", companyShopProductId);
		map.put("shopId", shopId);

		this.getSqlMapClientTemplate().update("deleteShopSelectedProduct", map);
		this.getSqlMapClientTemplate().update("deleteShopSelectedProductSku",
				map);

	}

}
