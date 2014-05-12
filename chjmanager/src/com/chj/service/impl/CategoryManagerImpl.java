package com.chj.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chj.dao.CategoryDao;
import com.chj.service.CategoryManager;



@Service
@Transactional
public class CategoryManagerImpl implements CategoryManager{

	@Autowired
	CategoryDao  categoryDao;
	
	@Override
	public List<Object> findShopstairtagList() {
		// TODO Auto-generated method stub
		return categoryDao.findShopstairtagList();
	}

	@Override
	public List<Object> findCategory(Map<String, Object> tagparam) {
		// TODO Auto-generated method stub
		return categoryDao.findCategory(tagparam);
	}

	@Override
	public Object findProductCategorys(HashMap param) {
		return categoryDao.findProductCategorys(param);
	}

	@Override
	public HashMap findCategoryImageInfo(String categoryId) {
		return categoryDao.findCategoryImageInfo(categoryId);
	}

	@Override
	public Object pinnterNewCategory(HashMap param) {
		return categoryDao.pinnterNewCategory(param);
	}

	@Override
	public Object pinnterCategoryImage(HashMap param) {

		return categoryDao.pinnterCategoryImage(param);
	}

	@Override
	public Object deltheCategoryInfo(String categoryId) {
		
		return categoryDao.deltheCategoryInfo(categoryId);
	}

	@Override
	public Object updateTheCateNameInfo(HashMap param) {
		return categoryDao.updateTheCateNameInfo(param);
	}
	
}
