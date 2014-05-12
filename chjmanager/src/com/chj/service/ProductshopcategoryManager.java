package com.chj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.chj.entity.Category;
import com.chj.entity.Productshopcategory;

public interface ProductshopcategoryManager {
	
	public List<Object> findProductShopCategoryList(HashMap<String, Object> ProductShopCategoryList);//分类
	
	public Object findProductShopCategoryListPageCount(Map<String, Object> page);//分类分页
	
	public void deleteCategory(List list);//删除分类
	
	public void updateCategory(Map<String, Object> productshopcategory);//更新分类
	
	public Object addProductShopCategory(Productshopcategory productshopcategory);//增加分类
	
	public  Map<String,Object> findProductShopCategoryListCount(Map<String,Object> m);//数量计算

	public void updateCompanyShopProductStock(HashMap map);
}
