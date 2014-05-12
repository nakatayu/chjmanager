package com.chj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.chj.entity.Company;
import com.chj.entity.CompanyShopCategory;


public interface CompanyManager {
	public Long findCompanyId(Long companyShopId);//根据店铺ID 查找企业ID
	public Company findShopCheckCompanyInfo(Long id); //店铺 查询企业信息
	
	public Company findCompanyInfo(Long id); //查询企业信息
	
	public void updateCompanyInfoSave(Company company);//企业更新
	
	public List<Object> findCompanyShopCategoryList(HashMap<String, Object> compayshopcategoryList);//企业类型列表
	public Long findCompanyTypeListCount();//列表分页
	public void deleteCompanyType(List list);//删除企业类型
	
	public List<Object> findCompanyShopCategoryList(Map<String, Object> map);// 企业类型  开发区
	
	public Long seveCompanyShopCategory(CompanyShopCategory companysa);
	
	public CompanyShopCategory findCompanyTypeInfo(Long companyShopCategoryId);
	
	public void updateCompanyTypeInfo(CompanyShopCategory companyShopCategory);
	
	public List<Object> findShopTypeList(HashMap<String, Object> shoptypeList);

	public List<Object> findShopTypeList(Map<String, Object> map);// 店铺类型  开发区
	public Long findShopTypeListCount();//店铺类型列表分页
	
	public Long seveShopType(CompanyShopCategory companysca);
	
	public CompanyShopCategory findShopTypeInfo(Long companyShopCategoryId);
	
	public void updateShopTypeInfo(CompanyShopCategory companyShopCategory);
	
	public Object findCompanyOffull(HashMap map);
	
	public Object findcompanyName(String str);
	
	public String companyWebExtend(String companyIdlist, String column,
			Integer filValue, Integer filnum);
	
}
