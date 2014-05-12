package com.chj.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chj.dao.CompanyDao;
import com.chj.entity.Company;
import com.chj.entity.CompanyShopCategory;
import com.chj.service.CompanyManager;

@Service
@Transactional
public class CompanyManagerImpl implements CompanyManager{
	
	@Autowired
	CompanyDao companyDao;

	@Override //企业查询
	public Company findCompanyInfo(Long id) {
		
		return companyDao.findCompanyInfo(id);
	}

	@Override  //企业更新
	public void updateCompanyInfoSave(Company company) {
		
		companyDao.updateCompanyInfoSave(company);
	}

	//根据店铺ID 查找企业ID
	@Override
	public Long findCompanyId(Long companyShopId) {
		
		return companyDao.findCompanyId(companyShopId);
	}
	//店铺 查询企业信息
	@Override
	public Company findShopCheckCompanyInfo(Long id) {
		return companyDao.findShopCheckCompanyInfo(id);
	}

	@Override
	public List<Object> findCompanyShopCategoryList(
			HashMap<String, Object> compayshopcategoryList) {
		
		return (List<Object>)companyDao.findCompanyShopCategoryList(compayshopcategoryList);
	}
	//列表分页
	@Override
	public Long findCompanyTypeListCount(){
		
		return (Long)companyDao.findCompanyTypeListCount();
	}
	@Override
	public List<Object> findCompanyShopCategoryList(Map<String, Object> map) {
		
		return companyDao.findCompanyShopCategoryList(map);
	}

	@Override
	public Long seveCompanyShopCategory(CompanyShopCategory companysa) {
		
		return companyDao.seveCompanyShopCategory(companysa);
	}

	@Override
	public CompanyShopCategory findCompanyTypeInfo(Long companyShopCategoryId) {
		
		return companyDao.findCompanyTypeInfo(companyShopCategoryId);
	}

	@Override
	public void updateCompanyTypeInfo(CompanyShopCategory companyShopCategory) {
		
		companyDao.updateCompanyTypeInfo(companyShopCategory);
	}

	// 店铺类型  开发区
	@Override
	public List<Object> findShopTypeList(HashMap<String, Object> shoptypeList) {
		
		return companyDao.findShopTypeList(shoptypeList);
	}

	// 店铺类型  开发区
	@Override
	public List<Object> findShopTypeList(Map<String, Object> map) {
		
		return companyDao.findShopTypeList(map);
	}

	@Override
	public Long seveShopType(CompanyShopCategory companysca) {
		
		return companyDao.seveShopType(companysca);
	}

	@Override
	public CompanyShopCategory findShopTypeInfo(Long companyShopCategoryId) {
		
		return companyDao.findShopTypeInfo(companyShopCategoryId);
	}

	@Override
	public void updateShopTypeInfo(CompanyShopCategory companyShopCategory) {
		
		companyDao.updateShopTypeInfo(companyShopCategory);
	}

	@Override
	public Object findCompanyOffull(HashMap map) {
		return companyDao.findCompanyOffull(map);
	}
	//删除企业类型
	@Override
	public void deleteCompanyType(List list) {
		
		companyDao.deleteCompanyType(list);
	}
	//店铺类型列表分页
	@Override
	public Long findShopTypeListCount() {
		
		return(Long)companyDao.findShopTypeListCount();
	}

	@Override
	public Object findcompanyName(String str) {
		
		return companyDao.findcompanyName(str);
	}

	@Override
	public String companyWebExtend(String companyIdlist, String column,
			Integer filValue, Integer filnum) {
		String[] companyIds = companyIdlist.split(",");
		String msg = null;
		if (companyIds.length > 0) {
			HashMap<String, Object> map1 = new HashMap<String, Object>();
			map1.put("filValue", filValue);
			map1.put("filName", column);
			
			if (filnum > 0) {
				Integer i = companyDao.queryNumberCompany(map1);
				if (i + companyIds.length > filnum) {
					msg = "已有" + i + "个设置，总设置个数大于限定值！";
				}
			}
			if (msg == null) {
				for (String companyId : companyIds) {
					map1.put("companyId", companyId);
					companyDao.updCompanyRelation(map1);
				}
			}
		} else {
			msg = "数据错误!";
		}
		return msg;
	}
	
	
}






