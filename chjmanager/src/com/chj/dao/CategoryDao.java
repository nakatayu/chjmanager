package com.chj.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public class CategoryDao extends BaseDao {

	public List<Object> findShopstairtagList() {
		Object tags = this.getSqlMapClientTemplate().queryForList(
				"queryShopstairtagList");
		return (List<Object>) tags;
	}

	public List<Object> findCategory(Map<String, Object> tagparam) {
		Object tags = this.getSqlMapClientTemplate().queryForList(
				"querysecondtagList", tagparam);
		return (List<Object>) tags;
	}

	public Object findProductCategorys(HashMap param) {
		List list = this.getSqlMapClientTemplate().queryForList(
				"theCategoryFullInfo", param);
		return list;
	}

	public HashMap findCategoryImageInfo(String categoryId) {
		HashMap map = (HashMap) this.getSqlMapClientTemplate().queryForObject(
				"theCategoryImageInfo", categoryId);
		return map;
	}

	public Object pinnterNewCategory(HashMap param) {
		Object obj=this.getSqlMapClientTemplate().insert("pinTheCategory",param);
		return obj;
	}

	public Object pinnterCategoryImage(HashMap param) {
		Integer i=this.getSqlMapClientTemplate().update("updTheCategoryImage",param);
		return i;
	}

	public Object deltheCategoryInfo(String categoryId) {
		Integer i=this.getSqlMapClientTemplate().update("updTheStatusOfCate",categoryId);
		return i;
	}

	public Object updateTheCateNameInfo(HashMap param) {
		Integer i=this.getSqlMapClientTemplate().update("updTheCateName",param);
		return i;
	}
}
