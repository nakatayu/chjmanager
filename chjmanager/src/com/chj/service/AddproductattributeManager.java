package com.chj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.chj.entity.Addproductattribute;

public interface AddproductattributeManager {
	public Object findCompanyManagerProductAttributeListCount(Map<String, Object> page);//商品属性分页     开发区
	public List<Object> findCompanyManagerProductAttributeList(HashMap<String, Object> flavors);//口味选择	(附加属性)  开发区
	
	public Object insertProductAttribute (Addproductattribute addproductattribute);//增加商品属性
	
	public void deleteProductAttribute(List list);//删除商品属性
	
	public Object findProductAttributeListCount(Map<String, Object> page);//商品属性分页
	
	public List<Object> findCustomizeFlavors(HashMap<String, Object> flavors);//口味选择（附加属性）列表
}
