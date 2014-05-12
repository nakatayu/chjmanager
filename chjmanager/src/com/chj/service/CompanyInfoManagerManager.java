package com.chj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.chj.entity.Company;
import com.chj.entity.CompanyTag;

public interface CompanyInfoManagerManager {
	public List<Company> findCompanyList(HashMap<String, Object> parm);//开发区后台  企业列表
	public Long findCompanyListCount(HashMap<String, Object> parm); //开发区后台  企业列表的分页
	public void deleteCompanyListInfo(List list);//开发区后台   删除企业
	public Company findCompanyInfo(Long companyId);//开发区后台   企业查询
	public void updateCompanyInfo(Company company,List<CompanyTag> companyTag);//开发区后台  企业更新
	public Long newCompany(Company company,List<CompanyTag> companyTag);//开发区后台   创建企业
	public List<Object> findCompanyType();//开发去后台  企业类型下拉框
	public List<Map> findCompanyTag(Long companyId);//开发区后台  企业标签
	public void companyAuditPass(List list);//开发区后台  企业审核通过
	public void companyAuditNoPass(List list);//开发区后台   企业审核不通过
	public void closeCompany(List list);//开发区后台   企业关闭
	public Long checkExamineResult(Long parma);//开发区后台   查看企业当前状态
	public Long findxinbake(HashMap<String, Object> parm);//开发区后台  查看是否是辛巴克创建用户
	public void updateCompanyStar(HashMap map);//开发区后台 企业星级数修改  
	public void companyCloseOrOpen(HashMap map);//开发区后台 企业审核 关闭或开启
}
