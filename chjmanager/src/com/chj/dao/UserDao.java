package com.chj.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.chj.entity.Company;
import com.chj.entity.CompanyShop;
import com.chj.entity.CompanyTagRecord;
import com.chj.entity.Personnel;
import com.chj.entity.User;
import com.chj.utils.MD5Util;

@Repository
public class UserDao extends BaseDao {

	public Personnel login(Personnel per) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"loginUserServer", per);// personnel.xml
		return (Personnel) obj;
	}

	/**
	 * 获取企业Id号
	 */
	public Long getCompanyId(Long CompanyIdNum) {
		Long getCompanyIdNum = (Long) this.getSqlMapClientTemplate()
				.queryForObject("getCompanyIdNum", CompanyIdNum);
		return getCompanyIdNum;
	}

	public Object companyList(HashMap<String, Object> mapparam) {
		Object companyList = this.getSqlMapClientTemplate().queryForList(
				"queryCompany", mapparam);
		return companyList;
	}

	public Long addComPanyInfo(Company company) {

		Object sevecp = this.getSqlMapClientTemplate()
				.insert("sevecp", company);
		return (Long) sevecp;
	}

	public Object delCompanyInfo(String companyId) {

		Object delcp = this.getSqlMapClientTemplate().delete("delcpInfo",
				Long.valueOf(companyId));
		return delcp;
	}

	public Object companyListCount(HashMap<String, Object> mapparam) {

		Object delcp = this.getSqlMapClientTemplate().queryForObject(
				"queryCompanyCount", mapparam);
		return delcp;
	}

	public Object updateCompanyInfo(Company company) {

		Object updateC = this.getSqlMapClientTemplate().update(
				"updateCompanyInfo", company);
		return updateC;
	}

	public List<Object> shopList(HashMap<String, Object> shopmap) {

		Object findShop = (List<CompanyShop>) this.getSqlMapClientTemplate()
				.queryForList("findShop", shopmap);
		return (List<Object>) findShop;
	}

	public Object shopListCount(HashMap<String, Object> shopmap) {

		Object findShonCount = this.getSqlMapClientTemplate().queryForObject(
				"findShopCount", shopmap);
		return findShonCount;
	}

	public Long addUserInfo(User user) {

		Long adduserinfo = (Long) this.getSqlMapClientTemplate().insert(
				"insertUserInfo", user);
		return adduserinfo;
	}

	public List<Object> findServiceInfo(HashMap<String, Object> sinfo) {

		Object findserInfo = this.getSqlMapClientTemplate().queryForList(
				"findserInfo", sinfo);
		return (List<Object>) findserInfo;
	}

	public List<Object> findTagSecondList() {

		Object findstag = this.getSqlMapClientTemplate().queryForList(
				"findTagList");
		return (List<Object>) findstag;
	}

	public List<Object> findTagThirdList(Map<String, Object> map) {

		Object findtagname = this.getSqlMapClientTemplate().queryForList(
				"queryTagNameList", map);
		return (List<Object>) findtagname;
	}

	public Long saveTag(CompanyTagRecord ctg) {

		Object savetag = this.getSqlMapClientTemplate()
				.insert("insertTag", ctg);
		return (Long) savetag;
	}

	public void delComaanyTab(Long updateCompanyId) {

		Object del = this.getSqlMapClientTemplate().delete("delCompanyTag",
				updateCompanyId);
	}

	public String findTheUsername(Long userId) {
		String name = (String) this.getSqlMapClientTemplate().queryForObject(
				"findTheUsername", userId);
		return name;
	}

	public Object verifyTheAccount(String account) {
		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"verifyTheAccount", account);
		return obj;
	}

	public Object addShopUserManagerInfo(String account, String pawd) {
		HashMap user = new HashMap();
		user.put("account", account);
		String pwd = null;
		try {
			pwd = MD5Util.digest(pawd);
			user.put("pawd", pwd);
			user.put("phone", new Date().getTime());
		} catch (Exception e) {
		}
		Object obj = this.getSqlMapClientTemplate().insert(
				"addShopUserManagerInfo", user);
		return obj;
	}

	public List<User> findUserList(HashMap<String, Object> parm) {

		List<User> userList = this.getSqlMapClientTemplate().queryForList(
				"findUserList", parm);
		return userList;
	}

	public Object findUserListCount(HashMap<String, Object> parm) {
		Long userListCountPage = (Long) this.getSqlMapClientTemplate()
				.queryForObject("queryUserCount", parm);
		return userListCountPage;
	}

	public HashMap findUserInfo(Long userId) {
		HashMap userInfo = (HashMap) this.getSqlMapClientTemplate()
				.queryForObject("findUserInfo", userId);
		return userInfo;
	}

	public Object addUserdaily(HashMap msp) {
		this.getSqlMapClientTemplate().insert("addUserdaily", msp);// 登录日志，Personnel.xml
		return null;
	}

	public List finduserDailyList(HashMap<String, Object> uList) {

		return this.getSqlMapClientTemplate().queryForList("finduserDailyList",
				uList);
	}

	public Object finduserDailyListCount(HashMap<String, Object> uList) {
		return this.getSqlMapClientTemplate().queryForObject(
				"finduserDailyListCount", uList);
	}

	public void deleteUserListInfo(List list) {
		if (list != null && list.size() != 0) {
			for (int i = 0; i < list.size(); i++) {
				Map map = new HashMap();
				map.put("userId", list.get(i));
				this.getSqlMapClientTemplate()
						.update("deleteUserListInfo", map);
			}
		}
	}

	public Long addMemberInfo(User user) {
		Long addMemberinfo = (Long) this.getSqlMapClientTemplate().insert(
				"addMemberInfo", user);
		return addMemberinfo;
	}

	public Object updateMemberInfo(User user) {
		Object result = this.getSqlMapClientTemplate().update(
				"updateMemberInfo", user);
		return result;
	}

	public Object findCredentialsCredentials(HashMap map) {
		return this.getSqlMapClientTemplate().queryForObject("findCredentials",
				map);
	}

	public Object findCredentialsCredentials(Long userId) {

		return this.getSqlMapClientTemplate().queryForObject(
				"findUserNickName", userId);
	}

	// 最后的登陆时间 Personnel.xml
	public void updateEventualLoginTime(Long id) {
		this.getSqlMapClientTemplate().update("updateEventualLoginTime", id);
	}

	public Long selectUserCode() {

		return (Long) this.getSqlMapClientTemplate().queryForObject(
				"selectUserCode");
	}

	public void addcodeofuserregirter(HashMap map) {

		this.getSqlMapClientTemplate().insert("addcodeofregter", map);
	}

	public List<HashMap> findUserCodeInfolt(HashMap map) {

		return this.getSqlMapClientTemplate().queryForList("finserCodlt", map);
	}

	public Object findUserCodeInfoltCount(HashMap map) {

		return this.getSqlMapClientTemplate().queryForObject(
				"finserCodltCount", map);
	}

	public void deleteTbCodelst(Long codeId) {

		this.getSqlMapClientTemplate().update("delTbCodelst", codeId);

	}

	public Object findcompanyNum() {
		HashMap map = new HashMap();
		map.put("table", "tb_company");
		map.put("companyExamineResult", "examine_result");
		return this.getSqlMapClientTemplate().queryForObject("findtablesNum",
				map);
	}

	public Object findshopNum() {
		HashMap map = new HashMap();
		map.put("table", "tb_company_shop");
		map.put("shopExamineResult", "examine_result");
		return this.getSqlMapClientTemplate().queryForObject("findtablesNum",
				map);
	}

	public Object findserviceNum() {
		HashMap map = new HashMap();
		map.put("table", "tb_service");
		map.put("serviceExamineResult", "examine_result");
		return this.getSqlMapClientTemplate().queryForObject("findtablesNum",
				map);
	}

	public Object findtopicNum() {
		HashMap map = new HashMap();
		map.put("table", "tb_topic");
		map.put("topicExamineResult", "examine_result");
		return this.getSqlMapClientTemplate().queryForObject("findtablesNum",
				map);
	}

	public Object findactivityNum() {
		HashMap map = new HashMap();
		map.put("table", "tb_activity");
		map.put("activityExamineResult", "examine_result");
		return this.getSqlMapClientTemplate().queryForObject("findtablesNum",
				map);
	}

	public Object findcircleNum() {
		HashMap map = new HashMap();
		map.put("table", "tb_circle");
		map.put("circleExamineResult", "examine_result");
		return this.getSqlMapClientTemplate().queryForObject("findtablesNum",
				map);
	}

	public Object findpushNum() {
		HashMap map = new HashMap();
		map.put("table", "tb_push");
		map.put("pushExamineResult", "status");
		return this.getSqlMapClientTemplate().queryForObject("findtablesNum",
				map);
	}

	public void updateShopProductStock() {
				
		this.getSqlMapClientTemplate().update("updShopProductStocktimer");

	}

	public List<HashMap> findAppVersionList() {
		
		return this.getSqlMapClientTemplate().queryForList("findAppVersionList");
	}

	public void updateAppVersion(HashMap<String, Object> map) {
		
		this.getSqlMapClientTemplate().update("updateAppVersion",map);		
	}
}
