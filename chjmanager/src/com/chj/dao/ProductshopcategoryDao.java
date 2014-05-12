package com.chj.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.chj.entity.Category;
import com.chj.entity.Company;
import com.chj.entity.Productshopcategory;
import com.chj.entity.Shop;
import com.chj.entity.Shoparea;
import com.chj.entity.Shoptag;

@Repository
public class ProductshopcategoryDao extends BaseDao{
	//分类列表
		public List<Object> findProductShopCategoryList(HashMap<String, Object> ProductShopCategoryList){
			List Category = this.getSqlMapClientTemplate().queryForList(
					"findProductShopCategoryList", ProductShopCategoryList); 
			return Category;
		}
	//商品分类列表分页
		public Object findProductShopCategoryListPageCount(Map<String, Object> page) {
			
			Object pages = this.getSqlMapClientTemplate().queryForObject(
					"queryProductShopCategoryPageCount", page);
			return pages;
			
		}
	//商品分类数量计算
		public Map<String,Object> findProductShopCategoryListCount(Map<String,Object> m){
			Map<String,Object> counts = (Map<String,Object>)this.getSqlMapClientTemplate().queryForObject(
					"findCount", m);
			return counts;
			
		}
		
		//删除分类	
		public void deleteCategory(List list) {
			if (list != null && list.size() != 0) {
				for (int i = 0; i < list.size(); i++) {
					Map map = new HashMap();
					map.put("categoryId", list.get(i));
					this.getSqlMapClientTemplate().update("deleteProductShopCategory", map);
				}
			}
		}
	//增加分类	
		public Object addProductShopCategory(Productshopcategory productshopcategory) {
			
			Object categorys = this.getSqlMapClientTemplate().insert(
					"insertProductShopCategory", productshopcategory);
			return categorys;
		}
		
		//企业后台   分类更新   Productshopcategory.xml
		public void updateCategory(Map<String, Object> category){
			this.getSqlMapClientTemplate().update("updateCategory", category);
		}
		 
		public Object updateCompanyShopProductStock(HashMap map) {
			
			this.getSqlMapClientTemplate().update("updateCompanyShopProductFunctionType",map);
			return this.getSqlMapClientTemplate().update("updateCompanyShopProductStock", map);
		}
		public void insertCategory(Map<String, Object> category) {
			
			this.getSqlMapClientTemplate().insert("insertpsCategory", category);			
		}
		
		
		
		
		
}