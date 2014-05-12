package com.chj.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chj.dao.AddproductattributeDao;
import com.chj.entity.Addproductattribute;
import com.chj.entity.ProductAttribute;
import com.chj.service.AddproductattributeManager;

@Service
@Transactional
public class AddproductattributeManagerImpl implements AddproductattributeManager{
	@Autowired
	AddproductattributeDao addproductattributeDao;
	
//增加商品属性名称
	@Override
	public Object insertProductAttribute(Addproductattribute addproductattribute) {
		// TODO Auto-generated method stub
		Object Pa = addproductattributeDao.insertProductAttribute(addproductattribute);
		return Pa;
	}
	
//删除商品属性	
	@Override
	public void deleteProductAttribute(List list) {
		// TODO Auto-generated method stub
		addproductattributeDao.deleteProductAttribute(list);
	}
//商品属性分页
	@Override
	public Object findProductAttributeListCount(Map<String, Object> page) {
		// TODO Auto-generated method stub
		return addproductattributeDao.findProductAttributeListCount(page);
	}
//口味选择	(附加属性)
	@Override
	public List<Object> findCustomizeFlavors(HashMap<String, Object> flavors) {
		// TODO Auto-generated method stub
		return addproductattributeDao.findCustomizeFlavors(flavors);
	}
	
//商品属性分页     开发区
	@Override
	public Object findCompanyManagerProductAttributeListCount(Map<String, Object> page) {
		// TODO Auto-generated method stub
		return addproductattributeDao.findCompanyManagerProductAttributeListCount(page);
	}
//口味选择	(附加属性)  开发区
	@Override
	public List<Object> findCompanyManagerProductAttributeList(HashMap<String, Object> flavors) {
		// TODO Auto-generated method stub
		return addproductattributeDao.findCompanyManagerProductAttributeList(flavors);
	}
}
