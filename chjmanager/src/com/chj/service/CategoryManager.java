package com.chj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface CategoryManager {
	
	public List<Object> findShopstairtagList(); 
	
	public List<Object> findCategory(Map<String,Object>  tagparam);
	
	public Object findProductCategorys(HashMap param);

	public HashMap findCategoryImageInfo(String categoryId);

	public Object pinnterNewCategory(HashMap param);

	public Object pinnterCategoryImage(HashMap param);

	public Object deltheCategoryInfo(String categoryId);

	public Object updateTheCateNameInfo(HashMap param);
	
}
