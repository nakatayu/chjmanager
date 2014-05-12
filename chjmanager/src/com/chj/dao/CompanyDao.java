package com.chj.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.chj.entity.Company;
import com.chj.entity.CompanyShopCategory;
import com.chj.entity.PayType;
import com.chj.entity.Shop;
import com.chj.entity.Shoparea;
import com.chj.entity.Shoptag;

@Repository
public class CompanyDao extends BaseDao {

	// 企业查询 company.xml
	public Company findCompanyInfo(Long id) {
		return (Company) this.getSqlMapClientTemplate().queryForObject(
				"findCompanyInfo", id);
	}

	// 店铺 查询企业信息
	public Company findShopCheckCompanyInfo(Long id) {
		return (Company) this.getSqlMapClientTemplate().queryForObject(
				"findShopCheckCompanyInfo", id);
	}

	// 企业更新保存
	public void updateCompanyInfoSave(Company company) {
		this.getSqlMapClientTemplate().update("updateCompanyInfoSave", company);
	}

	// 根据店铺ID 查找企业ID company
	public Long findCompanyId(Long companyShopId) {
		
		return (Long) this.getSqlMapClientTemplate().queryForObject(
				"findCompanyId", companyShopId);
	}

	// 企业类型 开发区 Company.xml

	public List<Object> findCompanyShopCategoryList(
			HashMap<String, Object> compayshopcategoryList) {
		
		List<Object> compayshopcategorylist = (List<Object>) this
				.getSqlMapClientTemplate().queryForList(
						"findCompanyShopCategoryList", compayshopcategoryList);
		return (List<Object>) compayshopcategorylist;
	}

	// 列表分页
	public Long findCompanyTypeListCount() {
		return (Long) this.getSqlMapClientTemplate().queryForObject(
				"findCompanyTypeListCount");
	}

	// 企业类型 开发区 Company.xml

	public List<Object> findCompanyShopCategoryList(Map<String, Object> map) {
		
		Object compayshopcategorylist = this.getSqlMapClientTemplate()
				.queryForList("findCompanyShopCategoryList", map);
		return (List) compayshopcategorylist;
	}

	// 企业类型 开发区 Company.xml 添加

	public Long seveCompanyShopCategory(CompanyShopCategory companysa) {
		
		Long companysa1 = (Long) this.getSqlMapClientTemplate().insert(
				"instCompanyShopCategory", companysa);
		return companysa1;
	}

	// 企业类型 开发区 Company.xml 查询

	public CompanyShopCategory findCompanyTypeInfo(Long companyShopCategoryId) {
		
		return (CompanyShopCategory) this.getSqlMapClientTemplate()
				.queryForObject("findCompanyTypeInfo", companyShopCategoryId);
	}

	// 企业类型 开发区 Company.xml 更新

	public void updateCompanyTypeInfo(CompanyShopCategory companyShopCategory) {
		
		this.getSqlMapClientTemplate().update("updateCompanyTypeInfo",
				companyShopCategory);
	}

	// 店铺类型 开发区 Company.xml 列表

	public List<Object> findShopTypeList(HashMap<String, Object> shoptypeList) {
		
		Object shoptypelist = this.getSqlMapClientTemplate().queryForList(
				"findShopTypeList", shoptypeList);
		return (List) shoptypelist;
	}

	// 店铺类型 开发区 Company.xml 列表

	public List<Object> findShopTypeList(Map<String, Object> map) {
		
		Object shoptypelist = this.getSqlMapClientTemplate().queryForList(
				"findShopTypeList", map);
		return (List) shoptypelist;
	}

	// 店铺类型列表分页
	public Long findShopTypeListCount() {
		return (Long) this.getSqlMapClientTemplate().queryForObject(
				"findShopTypeListCount");
	}

	// 店铺类型 开发区 Company.xml 添加
	public Long seveShopType(CompanyShopCategory companysca) {
		
		Long companysca1 = (Long) this.getSqlMapClientTemplate().insert(
				"instShopType", companysca);
		return companysca1;
	}

	// 店铺类型 开发区 Company.xml 查询

	public CompanyShopCategory findShopTypeInfo(Long companyShopCategoryId) {
		
		return (CompanyShopCategory) this.getSqlMapClientTemplate()
				.queryForObject("findShopTypeInfo", companyShopCategoryId);
	}

	// 店铺类型 开发区 Company.xml 更新

	public void updateShopTypeInfo(CompanyShopCategory companyShopCategory) {
		
		this.getSqlMapClientTemplate().update("updateShopTypeInfo",
				companyShopCategory);
	}

	public Object findCompanyOffull(HashMap map) {
		
		return this.getSqlMapClientTemplate().queryForList("findCompanyOffull",
				map);
	}

	// 删除企业类型
	public void deleteCompanyType(List list) {
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				HashMap map = new HashMap();
				map.put("companyShopCategoryId", list.get(i));
				this.getSqlMapClientTemplate().update("deleteCompanyType", map);
			}
		}
	}

	public Object findcompanyName(String str) {
		return this.getSqlMapClientTemplate().queryForObject("findcompanyName",
				str);
	}

	public Integer queryNumberCompany(HashMap<String, Object> map) {
		Integer i = (Integer) this.getSqlMapClientTemplate().queryForObject(
				"queryNumberCompany", map);
		return i;
	}

	public void updCompanyRelation(HashMap<String, Object> map) {
		
		this.getSqlMapClientTemplate().update("updCompanyRelation", map);		
	}

}
