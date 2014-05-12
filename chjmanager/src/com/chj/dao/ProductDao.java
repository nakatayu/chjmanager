package com.chj.dao;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.poi.hslf.model.Picture;
import org.springframework.stereotype.Repository;

import com.chj.entity.Personnel;
import com.chj.entity.Product;
import com.chj.entity.ProductShop;
import com.chj.entity.Producttag;
import com.chj.entity.Shop;
import com.chj.entity.Shoparea;
import com.chj.entity.Shoptag;

@Repository
public class ProductDao extends BaseDao {
	// 商品列表
	public List<HashMap> findProductList(HashMap<String, Object> productList) {
		List<HashMap> product = this.getSqlMapClientTemplate().queryForList(
				"findproductList", productList);
		if (product.size() > 0) {
			for (HashMap app : product) {
				Long productId = Long.valueOf(app.get("product_id").toString());
				Object obj = this.getSqlMapClientTemplate().queryForObject(
						"productCommeCont", productId);
				app.put("comCount", obj);

				Object obj1 = this.getSqlMapClientTemplate().queryForObject(
						"findcompanyName", app.get("company_id").toString());
				app.put("company", obj1);
			}
		}
		return product;
	}

	// 商品列表分页
	public Object productPageCount(Map<String, Object> mapparam) {// list分页

		Object map = this.getSqlMapClientTemplate().queryForObject(
				"queryProductCount", mapparam);
		return map;

	}

	// 商品保存
	public Long insertProductInfo(Product product, List<Producttag> stList,
			Map<String, Object> pic, List<Long> flavors,
			List<Map<String, Object>> attrSkuList, String attrListHidden) {
		Long companyinfo = (Long) this.getSqlMapClientTemplate().insert(
				"saveProductInfo", product);
		// 商品店铺关系
		// Long companyShopProductId = insertCompanyShopProduct(companyinfo,
		// product.getCompanyShopId());

		pic.put("productId", companyinfo);
		String filepathArray[] = pic.get("filePathArray").toString()
				.split("####");
		for (String filepath : filepathArray) {
			pic.put("filePath", filepath);
			this.getSqlMapClientTemplate().insert("saveProductPicture", pic);
		}

		insertProductTag(companyinfo, stList);
		insertAppend(companyinfo, flavors);
		insertAttributeValue(companyinfo, attrSkuList, attrListHidden);
		return companyinfo;
	}

	// 商品店铺关系
	public Long insertCompanyShopProduct(Long companyinfo, Long companyShopId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("companyinfo", companyinfo);
		map.put("companyShopId", companyShopId);
		Long companyShopProductId = (Long) this.getSqlMapClientTemplate()
				.insert("insertCompanyShopProduct", map);
		return companyShopProductId;
	}

	/*
	 * //价格保存 public void insertPrice(Long productId,Map<String,Object> price){
	 * price.put("productId", productId);
	 * this.getSqlMapClientTemplate().insert("insertPrice", price); }
	 */

	// 保存标签的关联表 已选标签
	public void insertProductTag(Long productId, List<Producttag> stList) {
		if (stList != null && stList.size() != 0) {
			for (int i = 0; i < stList.size(); i++) {
				Producttag producttag = stList.get(i);
				producttag.setProductId(productId);
				this.getSqlMapClientTemplate().insert("saveProductTag",
						producttag);
			}
		}
	}

	// 保存口味
	public void insertAppend(Long productId, List<Long> flavors) {
		if (flavors != null && flavors.size() != 0) {
			Map m = new HashMap();
			m.put("productId", productId);
			for (int i = 0; i < flavors.size(); i++) {
				m.put("appendId", flavors.get(i));
				this.getSqlMapClientTemplate().insert("insertAppend", m);
			}
		}
	}

	// 保存属性
	public void insertAttributeValue(Long productId,
			List<Map<String, Object>> attrList, String attrListHidden) {
		if (attrList != null && attrList.size() != 0) {
			Map m = new HashMap();
			m.put("productId", productId);
			// {"颜色":"白,黄","尺寸":"大,小"} attrListHidden
			//
			Map attributeValueIdMap = new HashMap();
			JSONObject objAttr = JSONObject.fromObject(attrListHidden);
			for (Object attrFirst : objAttr.keySet()) {

				m.put("attriBute", attrFirst.toString().replace(":", ""));
				Long attrFirstId = (Long) this.getSqlMapClientTemplate()
						.insert("insertAttribute", m);
				String[] attrValueLsit = objAttr.get(attrFirst).toString()
						.split(",");
				for (Object attrVal : attrValueLsit) {
					m.put("attrFirstId", attrFirstId);
					m.put("attributeValue", attrVal);
					// 保存属性值
					Long attributeValueId = (Long) this
							.getSqlMapClientTemplate().insert("insertValue", m);

					attributeValueIdMap.put(
							attrFirst.toString().replace(":", "") + "-"
									+ attrVal, attributeValueId);
				}

			}
			for (int i = 0; i < attrList.size(); i++) {
				DecimalFormat df = new DecimalFormat("000");
				String shCode = productId + df.format(i + 1);
				m.put("skuNo", shCode);
				m.put("status", "T");
				m.put("skuKind", attrList.get(i).get("attriBute"));// 杯型:中杯,颜色:白

				m.put("price", attrList.get(i).get("price"));
				m.put("oldPrice", attrList.get(i).get("oldPrice"));
				// 商品sku tb_product_sku
				Long skuId = (Long) this.getSqlMapClientTemplate().insert(
						"insertProductSku", m);
				// m.put("companyShopProductId", companyShopProductId);
				m.put("skuId", skuId);
				// 店铺sku tb_company_shop_product_sku
				// this.getSqlMapClientTemplate().insert("insertCompanyShopProductSku",
				// m);
				String[] list = m.get("skuKind").toString().split(",");
				for (String attrFirstAttr : list) {
					if (attrFirstAttr.trim().length() > 0) {
						m.put("attrValueId", attributeValueIdMap
								.get(attrFirstAttr.trim().replace(":", "-")));
						this.getSqlMapClientTemplate().insert(
								"insertProductAttributeValueSku", m);
					}

				}

			}
		}
	}

	// 商品删除
	public void deleteProductInfo(Personnel user, List list) {
		if (list != null && list.size() != 0) {
			for (int i = 0; i < list.size(); i++) {
				Long productId = Long.valueOf(list.get(i).toString());
				HashMap<Object, Object> map=new HashMap<Object, Object>();
				map.put("productId", productId);
				if (user.getType() != 1) {
					map.put("companyId", user.getCompanyId());
				}
				this.getSqlMapClientTemplate().update("deleteProductInfo", map);
				
				map.put("tableName", "tb_company_shop_product");
				map.put("tableColumn", "product_id");
				map.put("columnValue", productId);
				
				this.getSqlMapClientTemplate().update("deleteTablesColumn", map);		
			}
		}
	}

	// 删除商品店铺关系

	// 删除已选标签
	public void deleteShopTag(long shopId) {
		Map map = new HashMap();
		map.put("shopId", shopId);
		this.getSqlMapClientTemplate().delete("deleteShopTag", map);
	}

	// 商品查询 Product.xml
	public Object findProductInfo(Long productId) {
		Object info = this.getSqlMapClientTemplate().queryForObject(
				"findProductInfo", productId);
		return info;
	}

	// 商品图片查询
	public Object findPictureInfo(Long productId) {

		Object info = this.getSqlMapClientTemplate().queryForList(
				"findPictureInfo", productId);
		return info;
	}

	// 查找已选标签 Producttag.xml
	public List<Map> findProductTag(Long product) {
		List<Map> productId = this.getSqlMapClientTemplate().queryForList(
				"findProductTag", product);
		return productId;
	}

	// 所属店铺
	public List<Map<String, Object>> findProductBelongShop(
			Map<String, Object> BelongShop) {
		List<Map<String, Object>> shops = this.getSqlMapClientTemplate()
				.queryForList("queryProductBelongShop", BelongShop);
		return shops;
	}

	// 自动生成编号
	public Integer generateProductCode(long companyId) {
		Integer productCode = (Integer) this.getSqlMapClientTemplate()
				.queryForObject("generateProductCode", companyId);
		return productCode;
	}

	// 口味选择（附加属性）
	public List<Map<String, Object>> CustomizeFlavors(
			Map<String, Object> flavors) {

		List<Map<String, Object>> flavorss = this.getSqlMapClientTemplate()
				.queryForList("findAppend", flavors);
		return flavorss;
	}

	// 店铺商品分类选择
	public List<Map<String, Object>> findOptionalCategory(
			Map<String, Object> category) {

		List<Map<String, Object>> categorys = this.getSqlMapClientTemplate()
				.queryForList("findOptionalCategory", category);
		return categorys;
	}

	public Object updateTheProductInfo(HashMap product) {
		Integer i = this.getSqlMapClientTemplate().update(
				"updateTheProductInfo", product);
		return Long.valueOf(i);
	}

	public Object findProductImages(Long productId) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"findProductImages", productId);
		return obj;
	}

	public Object findProductSkus(Long productId) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"findProductSkus", productId);
		return obj;
	}

	public Object findproductAttributes(Long productId) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"findproductAttributes", productId);
		return obj;
	}

	public Object findproductAttributeValues(Long productAttributeId) {
		Object obj = this.getSqlMapClientTemplate().queryForList(
				"findproductAttributeValues", productAttributeId);
		return obj;
	}

	public Object deleteTheProductImages(Long productId) {
		Object obj = this.getSqlMapClientTemplate().delete(
				"deleteTheProductImages", productId);
		return obj;
	}

	public Object insertNewProductImages(HashMap map) {
		Object obj = this.getSqlMapClientTemplate().insert(
				"saveProductPicture", map);
		return obj;
	}

	public Long addTheNewAttribute(HashMap attrMap) {
		Long id = (Long) this.getSqlMapClientTemplate().insert(
				"insertAttribute", attrMap);
		return id;
	}

	public Long addTheNewAttributeValue(HashMap<String, Object> valap) {
		Long id = (Long) this.getSqlMapClientTemplate().insert("insertValue",
				valap);
		return id;
	}

	public Long addTheProductSku(HashMap param) {
		Long skuId = (Long) this.getSqlMapClientTemplate().insert(
				"insertProductSku", param);
		return skuId;
	}

	public Object addTheProductAttributeValuesSku(HashMap parm) {
		Object skuId = this.getSqlMapClientTemplate().insert(
				"insertProductAttributeValueSku", parm);
		return skuId;
	}

	public Object updateTheAttrType(Long attributeId) {
		this.getSqlMapClientTemplate().update("updateTheAttrType", attributeId);
		Integer a = this.getSqlMapClientTemplate().update("updateTheSkuType",
				attributeId);
		return a;
	}

	public Integer updateTheSkuType(Long skuId) {
		Integer a = this.getSqlMapClientTemplate().update("updateProSkuType",
				skuId);
		this.getSqlMapClientTemplate().update("updshopproductSku",skuId);
		
		return a;
	}

	public void updateProductSkuPrice(Long skuId, String price, String oldPrice) {

		HashMap param = new HashMap();
		param.put("skuId", skuId);
		param.put("price", price);
		param.put("oldPrice", oldPrice);

		this.getSqlMapClientTemplate().update("updateProductSkuPrice", param);
	}

	// 开发区 店铺进入商品列表
	public List<Object> findShopProductList(HashMap<String, Object> productList) {
		List<HashMap> product = this.getSqlMapClientTemplate().queryForList(
				"findShopProductList", productList);
		for (HashMap app : product) {
			Long shopId = Long.valueOf(app.get("company_shop_id").toString());
			Object obj = this.getSqlMapClientTemplate().queryForObject(
					"findcompanyName", app.get("company_id").toString());
			app.put("company", obj);
			Object obj1 = this.getSqlMapClientTemplate().queryForObject(
					"shopNameselet", shopId);
			app.put("shop", obj1);

		}
		return (List) product;
	}

	// 开发区 店铺进入商品列表分页
	public Object findShopProductListCount(Map<String, Object> mapparam) {
		Object map = this.getSqlMapClientTemplate().queryForObject(
				"findShopProductListCount", mapparam);
		return map;
	}

	public Object findProductCommenst(HashMap<String, Object> prodCommlst) {

		return this.getSqlMapClientTemplate().queryForList("findProduCommst",
				prodCommlst);
	}

	public Object findProductCommenstCount(HashMap<String, Object> prodCommlst) {

		return this.getSqlMapClientTemplate().queryForObject(
				"findProduCommstCount", prodCommlst);
	}

	public Object updtProductCommentl(HashMap map) {

		return this.getSqlMapClientTemplate()
				.update("updtProductCommentl", map);

	}

	// Product.xml
	public Integer findWebExtendCount(HashMap map) {

		return (Integer) this.getSqlMapClientTemplate().queryForObject(
				"findWebExtendCount", map);
	}

	// Product.xml
	public void companyShopProductWebExtend(HashMap map) {

		this.getSqlMapClientTemplate().update("companyShopProductWebExtend",
				map);
	}

	public void updadelAppend(Long productId) {

		this.getSqlMapClientTemplate().update("updadelAppend", productId);
	}

	public Integer findSKUnumber(Long productId) {

		return (Integer) this.getSqlMapClientTemplate().queryForObject(
				"findSKUnumber", productId);
	}

}
