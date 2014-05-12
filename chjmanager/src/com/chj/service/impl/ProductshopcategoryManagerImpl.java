package com.chj.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chj.dao.ProductshopcategoryDao;
import com.chj.entity.Category;
import com.chj.entity.Productshopcategory;
import com.chj.service.ProductshopcategoryManager;

@Service
@Transactional
public class ProductshopcategoryManagerImpl implements
		ProductshopcategoryManager {

	@Autowired
	ProductshopcategoryDao productshopcategoryDao;

	// 分类列表
	@Override
	public List<Object> findProductShopCategoryList(
			HashMap<String, Object> ProductShopCategoryList) {

		return productshopcategoryDao
				.findProductShopCategoryList(ProductShopCategoryList);
	}

	// 分类分页
	@Override
	public Object findProductShopCategoryListPageCount(Map<String, Object> page) {

		return productshopcategoryDao
				.findProductShopCategoryListPageCount(page);
	}

	// 删除分类
	@Override
	public void deleteCategory(List list) {

		productshopcategoryDao.deleteCategory(list);
	}

	// 增加分类
	@Override
	public Object addProductShopCategory(Productshopcategory productshopcategory) {

		Object qw = productshopcategoryDao
				.addProductShopCategory(productshopcategory);
		return qw;
	}

	// 更新分类
	@Override
	public void updateCategory(Map<String, Object> category) {

		String categoryId =category.get("categoryId").toString().trim();
		if (categoryId == null || categoryId.length() == 0) {
			
			productshopcategoryDao.insertCategory(category);
		}else{
			productshopcategoryDao.updateCategory(category);
		}	
	}

	// 数量计算
	@Override
	public Map<String, Object> findProductShopCategoryListCount(
			Map<String, Object> m) {

		return productshopcategoryDao.findProductShopCategoryListCount(m);
	}

	@Override
	public void updateCompanyShopProductStock(HashMap map) {

		productshopcategoryDao.updateCompanyShopProductStock(map);
	}
}
