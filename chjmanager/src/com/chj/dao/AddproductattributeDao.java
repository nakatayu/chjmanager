package com.chj.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.chj.entity.Addproductattribute;

@Repository
public class AddproductattributeDao extends BaseDao {
	// 增加附加属性 Addproductattribute.xml
	public Object insertProductAttribute(Addproductattribute addproductattribute) {

		Object Pa = this.getSqlMapClientTemplate().insert(
				"insertProductAttribute", addproductattribute);
		return Pa;
	}

	// 删除附加属性 Addproductattribute.xml
	public void deleteProductAttribute(List list) {

		if (list != null && list.size() != 0) {
			for (int i = 0; i < list.size(); i++) {
				Map map = new HashMap();
				map.put("appendId", list.get(i));
				/*this.getSqlMapClientTemplate().delete("delProductAttribute",
						map);*/
				this.getSqlMapClientTemplate().update("delProductAttribute",map);
			}
		}
	}

	// 商品属性分页
	public Object findProductAttributeListCount(Map<String, Object> page) {

		Object pages = this.getSqlMapClientTemplate().queryForObject(
				"queryProductAttributeCount", page);
		return pages;

	}

	// 口味选择（附加属性）列表 Addproductattribute.xml
	public List<Object> findCustomizeFlavors(Map<String, Object> flavors) {

		Object flavorss = this.getSqlMapClientTemplate().queryForList(
				"queryProductAppend", flavors);
		return (List) flavorss;
	}

	// 商品属性分页 开发区 Addproductattribute.xml
	public Object findCompanyManagerProductAttributeListCount(
			Map<String, Object> page) {
		Object pages = this.getSqlMapClientTemplate().queryForObject(
				"findCompanyManagerProductAttributeListCount", page);
		return pages;
	}

	// 口味选择 (附加属性) 开发区 Addproductattribute.xml
	public List<Object> findCompanyManagerProductAttributeList(
			HashMap<String, Object> flavors) {
		Object flavorss = this.getSqlMapClientTemplate().queryForList(
				"findCompanyManagerProductAttributeList", flavors);
		return (List) flavorss;
	}
}
