package com.chj.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chj.dao.CompanyInfoManagerDao;
import com.chj.entity.Company;
import com.chj.entity.CompanyTag;
import com.chj.service.CompanyInfoManagerManager;

@Service
@Transactional
public class CompanyInfoManagerImpl implements CompanyInfoManagerManager{
	@Autowired
	CompanyInfoManagerDao companyInfoManagerDao; 
	
	//开发区后台  企业列表
	@Override
	public List<Company> findCompanyList(HashMap<String, Object> parm) {
		
		return (List<Company>) companyInfoManagerDao.findCompanyList(parm);
	}
	//开发区后台  企业列表的分页
	@Override
	public Long findCompanyListCount(HashMap<String, Object> parm) {
		
		return companyInfoManagerDao.findCompanyListCount(parm);
	}
	//开发区后台   删除企业
	@Override
	public void deleteCompanyListInfo(List list) {
		companyInfoManagerDao.deleteCompanyListInfo(list);
	}
	//开发区后台   企业查询
	@Override 
	public Company findCompanyInfo(Long companyId) {
		
		Company companyInfo = companyInfoManagerDao.findCompanyInfo(companyId);
		 return companyInfo;
	}
	//开发区后台  企业更新
	@Override
	public void updateCompanyInfo(Company company,List<CompanyTag> companyTag) {
		companyInfoManagerDao.updateCompanyInfo(company,companyTag);
	}
	//开发区后台   创建企业
	@Override
	public Long newCompany(Company company,List<CompanyTag> companyTag) {
		
		return companyInfoManagerDao.newCompany(company,companyTag);
	}
	//开发去后台  企业类型下拉框
	@Override
	public List<Object> findCompanyType() {
		return (List<Object>)companyInfoManagerDao.findCompanyType();	
	}
	//开发区后台  企业标签
	@Override
	public List<Map> findCompanyTag(Long companyId) {
		
		return companyInfoManagerDao.findCompanyTag(companyId);
	}
	//开发区后台  企业审核通过
	@Override
	public void companyAuditPass(List list) {
		
		companyInfoManagerDao.companyAuditPass(list);
	}
	//开发区后台   企业审核不通过
	@Override
	public void companyAuditNoPass(List list) {
		
		companyInfoManagerDao.companyAuditNoPass(list);
	}
	//开发区后台  企业关闭
	@Override
	public void closeCompany(List list) {
		
		companyInfoManagerDao.closeCompany(list);
	}
	//开发区后台   查看企业当前状态
	@Override
	public Long checkExamineResult(Long parma) {
		
		Long examineResult =(Long)companyInfoManagerDao.checkExamineResult(parma);
		return examineResult;
	}
	//开发区后台 查看是否是辛巴克企业
	@Override
	public Long findxinbake(HashMap<String, Object> parm) {
		
		return companyInfoManagerDao.findxinbake(parm);
	}
	//开发区后台  企业星级数修改
	@Override
	public void updateCompanyStar(HashMap map) {
		
		companyInfoManagerDao.updateCompanyStar(map);
	}
	//开发区后台  企业审核 关闭或开启
	@Override
	public void companyCloseOrOpen(HashMap map) {
		
		companyInfoManagerDao.companyCloseOrOpen(map);
	}
}
