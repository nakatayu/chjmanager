package com.chj.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.chj.entity.Company;
import com.chj.entity.CompanyTag;
import com.chj.entity.Shoptag;

@Repository
public class CompanyInfoManagerDao extends BaseDao {
	
	//开发区后台  企业列表  company.xml
	public List<Company> findCompanyList(HashMap<String, Object> parm) {
		List<Company> companyList = this.getSqlMapClientTemplate().queryForList(
				"findCompanyList", parm);
		return companyList;
	}
	//开发区后台  企业列表的分页  company.xml
	public Long findCompanyListCount(HashMap<String, Object> parm) {
		Long companyListCountPage = (Long)this.getSqlMapClientTemplate().queryForObject(
				"queryCompanyCount", parm);
		return companyListCountPage;
	}
	//开发区后台   删除企业   company.xml
	public void deleteCompanyListInfo(List list) {
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				HashMap map = new HashMap();
				map.put("companyId", list.get(i));
				deleteCompanyShopProduct(map);//删除企业店铺的商品
				deleteCompanyShop(map);//删除企业店铺
				deleteCompanyServiceInfo(map);//删除企业共享漕河泾信息
				deleteCompanyPersonnel(map);//删除企业人员
				deleteCompanyCircle(map);//删除企业圈子  箐汇
				deleteCompanyActivity(map);//删除企业活动  菁彩
				deleteComapnyTopic(map);//删除企业话题  瞩目漕河泾
				this.getSqlMapClientTemplate().update("deleteCompanyListInfo", map);//删除企业
			}
		}
		
	}
	public void deleteCompanyShop(HashMap map){//删除店铺 Shop.xml
		if(map!=null && map.size()>0){
			this.getSqlMapClientTemplate().update("deleteCompanyShop",map);
		}
	}
	public void deleteCompanyShopProduct(HashMap map){//删除企业下店铺的商品  Product.xml
		if(map!=null && map.size()>0){
			this.getSqlMapClientTemplate().update("deleteCompanyShopProduct",map);
		}
	}
	public void deleteCompanyServiceInfo(HashMap map){//删除企业的共享漕河泾信息    Servicelist.xml
		if(map!=null&& map.size()>0){
			this.getSqlMapClientTemplate().update("deleteCompanyServiceInfo",map);
		}
	}
	public void deleteCompanyPersonnel(HashMap map){//删除企业人员 Personnel.xml
		if(map!= null&& map.size()>0){
			this.getSqlMapClientTemplate().update("deleteCompanyPersonnel",map);
		}
	}
	public void deleteCompanyCircle(HashMap map){//删除企业圈子 箐汇 Circle.xml
		if(map!=null&& map.size()>0){
			this.getSqlMapClientTemplate().update("deleteCompanyCircle",map);
		}
	}
	public void deleteCompanyActivity(HashMap map){//删除企业活动  菁彩 Activity.xml
		if(map!=null&& map.size()>0){
			this.getSqlMapClientTemplate().update("deleteCompanyActivity",map);
		}
	}
	public void deleteComapnyTopic(HashMap map){//删除企业话题  瞩目漕河泾 Topic.xml
		if(map!=null&& map.size()>0){
			this.getSqlMapClientTemplate().update("deleteCompanyTopic",map);
		}
	}
	
	//开发区后台   企业查询    company.xml
	public Company findCompanyInfo(Long companyId){
		Company companyInfo=(Company)this.getSqlMapClientTemplate().queryForObject(
				"findCompanyInfo",companyId);
		return companyInfo;
	}
	//开发区后台  企业更新  company.xml
	public void updateCompanyInfo(Company company,List<CompanyTag> companyTag) {
		Map m = new HashMap();
		m.put("companyId",company.getCompanyId());
		if (companyTag != null && companyTag.size() != 0) {
			this.getSqlMapClientTemplate().delete("deleteCompanyTag", m);//删除原来的企业标签
			for (int i = 0; i < companyTag.size(); i++) {
				CompanyTag st = companyTag.get(i);
				st.setCompanyId(company.getCompanyId());
				this.getSqlMapClientTemplate().insert("updateCompanyTag", st);//添加新的企业标签
			}
		}	
		this.getSqlMapClientTemplate().update("updateCompanyInfoSave", company);//保存企业信息	
	}
	//开发区后台   创建企业  company.xml
	public Long newCompany(Company company,List<CompanyTag> companyTag) {
		Long companyId=(Long)this.getSqlMapClientTemplate().insert("newCompany",company);
		insertCompanyTag(companyId, companyTag);//企业保存标签
		return companyId;
	}
	//开发区后台   保存企业信息的标签   CompanyTag.xml
	public void insertCompanyTag(Long companyId,List<CompanyTag> companyTag) {
		if (companyTag != null && companyTag.size() != 0) {
			for (int i = 0; i < companyTag.size(); i++) {
				CompanyTag cTag = companyTag.get(i);
				cTag.setCompanyId(companyId);
				this.getSqlMapClientTemplate().insert("insertCompanyTag", cTag);
			}
		}
	}
	
	//开发去后台  企业类型下拉框   Productshopcategory.xml
	public List<Object> findCompanyType() {
		List<Object> companyType = this.getSqlMapClientTemplate().queryForList("findCompanyType");
		return  companyType;  
	}
	
	//开发区后台  企业标签   CompanyTag.xml
	public List<Map> findCompanyTag(Long companyId) {
		List<Map> companyTag = this.getSqlMapClientTemplate().queryForList(
				"findCompanyTag", companyId);
		return companyTag;
	}
	//开发区后台  企业审核通过    company.xml
	public void companyAuditPass(List list) {
		if (list != null && list.size() != 0) {
			for (int i = 0; i < list.size(); i++) {
				Map map = new HashMap();
				map.put("companyId", list.get(i));
				this.getSqlMapClientTemplate().update("updateCompanyAuditPass", map);
			}
		}
	}
	//开发区后台   企业审核不通过    company.xml
	public void companyAuditNoPass(List list) {
		if (list != null && list.size() != 0) {
			for (int i = 0; i < list.size(); i++) {
				Map map = new HashMap();
				map.put("companyId", list.get(i));
				this.getSqlMapClientTemplate().update("updateCompanyAuditNoPass", map);
			}
		}
	}
	//开发区后台  企业关闭    company.xml
	public void closeCompany(List list) {
		if (list != null && list.size() != 0) {
			for (int i = 0; i < list.size(); i++) {
				Map map = new HashMap();
				map.put("companyId", list.get(i));
				this.getSqlMapClientTemplate().update("closeCompany", map);
			}
		}
	}
	//开发区后台   查看企业当前状态
	public Long checkExamineResult(Long parma) {
		Long examineResult =(Long)this.getSqlMapClientTemplate().queryForObject("checkExamineResult",parma);
		return examineResult;
	}
	//开发区后台 查看是否是辛巴克企业  Company.xml
	public Long findxinbake(HashMap<String, Object> parm){
		Long companyId = (Long)this.getSqlMapClientTemplate().queryForObject("findxinbake",parm);
		return companyId;
	}
	//开发区后台  企业星级数修改
	public void updateCompanyStar(HashMap map) {
		this.getSqlMapClientTemplate().update("updateCompanyStar",map);
	}
	//开发区后台  企业审核 关闭或开启
	public void companyCloseOrOpen(HashMap mapparm) {
		this.getSqlMapClientTemplate().update("companyClosrOrOpen",mapparm);
	}
}
