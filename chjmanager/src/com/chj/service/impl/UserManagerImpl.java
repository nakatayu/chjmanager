package com.chj.service.impl;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chj.common.Commonparam;
import com.chj.dao.UserDao;
import com.chj.entity.Company;
import com.chj.entity.CompanyShop;
import com.chj.entity.CompanyTagRecord;
import com.chj.entity.Personnel;
import com.chj.entity.User;
import com.chj.service.UserManager;

@Service
@Transactional
public class UserManagerImpl implements UserManager {
	@Autowired
	UserDao userDao;

	@Override
	public Object login(Personnel per) {

		return userDao.login(per);

	}

	/**
	 * 根据店铺Id获取企业Id
	 * */
	@Override
	public Long getCompanyId(Long CompanyIdNum) {
		return userDao.getCompanyId(CompanyIdNum);
	}

	@Override
	public List<Company> companyList(HashMap<String, Object> mapparam) {

		return (List<Company>) userDao.companyList(mapparam);
	}

	@Override
	public Long addComPanyInfo(Company company, String sevatag) {

		Long cid = userDao.addComPanyInfo(company);
		if (sevatag != null && !sevatag.equals("")) {

			String[] tags = sevatag.split(",");
			List<CompanyTagRecord> stList = new ArrayList<CompanyTagRecord>();
			for (int i = 0; i < tags.length; i++) {

				CompanyTagRecord ctg = new CompanyTagRecord();
				ctg.setTagId(Long.parseLong(tags[i]));
				ctg.setCompanyId(cid);
				ctg.setAddTime(new Date());
				stList.add(ctg);
				Long savetag = userDao.saveTag(ctg);
			}
		}

		return (long) 1;
	}

	@Override
	public Object delCompanyInfo(String companyId) {

		return userDao.delCompanyInfo(companyId);
	}

	@Override
	public Object companyListCount(HashMap<String, Object> mapparam) {

		return userDao.companyListCount(mapparam);
	}

	@Override
	public Object updateCompanyInfo(Company company, Long updateCompanyId,
			String sevatag) {

		userDao.updateCompanyInfo(company);
		if (sevatag != null && !sevatag.equals("")
				&& sevatag.trim().length() > 0) {
			userDao.delComaanyTab(updateCompanyId);

			String[] tags = sevatag.split(",");
			List<CompanyTagRecord> stList = new ArrayList<CompanyTagRecord>();
			for (int i = 0; i < tags.length; i++) {

				CompanyTagRecord ctg = new CompanyTagRecord();
				ctg.setTagId(Long.parseLong(tags[i]));
				ctg.setCompanyId(updateCompanyId);
				ctg.setAddTime(Commonparam.StringtoDate(Commonparam
						.Date2Str(new Date())));
				stList.add(ctg);
				Long savetag = userDao.saveTag(ctg);
			}
		}

		return 1;

	}

	@Override
	public List<Object> shopList(HashMap<String, Object> shopmap) {

		return userDao.shopList(shopmap);
	}

	@Override
	public Object shopListCount(HashMap<String, Object> shopmap) {

		return userDao.shopListCount(shopmap);
	}

	@Override
	public Long addUserInfo(User user) {

		return userDao.addUserInfo(user);
	}

	@Override
	public List<Object> findServiceInfo(HashMap<String, Object> sinfo) {

		return userDao.findServiceInfo(sinfo);
	}

	@Override
	public List<Object> findTagSecondList() {

		return userDao.findTagSecondList();
	}

	@Override
	public List<Object> findTagThirdList(Map<String, Object> map) {

		return userDao.findTagThirdList(map);
	}

	@Override
	public Long saveTag(CompanyTagRecord ctg) {

		return userDao.saveTag(ctg);
	}

	@Override
	public String findTheUsername(Long userId) {
		return userDao.findTheUsername(userId);
	}

	@Override
	public Object verifyTheAccount(String account) {

		return userDao.verifyTheAccount(account);
	}

	@Override
	public List<User> findUserList(HashMap<String, Object> parm) {
		return userDao.findUserList(parm);
	}

	@Override
	public Object findUserListCount(HashMap<String, Object> parm) {
		return userDao.findUserListCount(parm);
	}

	public HashMap findUserInfo(Long userId) {
		return userDao.findUserInfo(userId);
	}

	@Override
	public Object addUserdaily(HashMap msp) {

		return userDao.addUserdaily(msp);
	}

	@Override
	public List finduserDailyList(HashMap<String, Object> uList) {

		return userDao.finduserDailyList(uList);
	}

	@Override
	public Object finduserDailyListCount(HashMap<String, Object> uList) {

		return userDao.finduserDailyListCount(uList);
	}

	@Override
	public void deleteUserListInfo(List list) {
		userDao.deleteUserListInfo(list);
	}

	@Override
	public Long addMemberInfo(User user) {
		return userDao.addMemberInfo(user);
	}

	@Override
	public Object updateMemberInfo(User user) {
		Object object = userDao.updateMemberInfo(user);
		return object;
	}

	@Override
	public Object findCredentialsCredentials(HashMap map) {

		return userDao.findCredentialsCredentials(map);
	}

	@Override
	public Object findUserNickNameImage(Long userId) {

		return userDao.findCredentialsCredentials(userId);
	}

	// 最后的登陆时间
	@Override
	public void updateEventualLoginTime(Long id) {

		userDao.updateEventualLoginTime(id);
	}

	@Override
	public Object addcodeofuserregirter(String name, Integer numCode) {
		if (numCode != null && numCode > 0) {
			for (int i = 0; i < numCode; i++) {
				Long num = userDao.selectUserCode();
				if (num == null) {
					num = 10001L;
				}				
				String code=new DecimalFormat("000000").format(Math.random()*num);
				HashMap map = new HashMap();
				map.put("code", num+code);
				map.put("depart", name);
				map.put("beUsed", "F");
				map.put("number", num + 1);
				
				userDao.addcodeofuserregirter(map);
			}
		}
		return null;
	}

	@Override
	public Object findUserCodeInfolt(HashMap map) {
		List<HashMap> list = userDao.findUserCodeInfolt(map);
		for (HashMap hml : list) {
			if (hml.get("be_used") != null && "T".equals(hml.get("be_used"))) {
				if(hml.get("user_id")!=null){
					Long i = Long.valueOf(hml.get("user_id").toString());
					hml.put("user", userDao.findTheUsername(i));	
				}else{
					hml.put("user", "此用户没有注册成功！！！");
				}				
			}
		}
		return list;
	}

	@Override
	public Object findUserCodeInfoltCount(HashMap map) {

		return userDao.findUserCodeInfoltCount(map);
	}

	@Override
	public void deleteTbCodelst(String codeIdes) {
		if (codeIdes != null) {
			String[] codeId = codeIdes.split(",");
			for (String codId : codeId) {
				userDao.deleteTbCodelst(Long.parseLong(codId));
			}
		}
	}

	@Override
	public Object checkfullInfo() {
		
		HashMap<String, Object> map=new HashMap<String, Object>();		
		map.put("companyNum", userDao.findcompanyNum());
		map.put("shopNum", userDao.findshopNum());
		map.put("serviceNum", userDao.findserviceNum());
		map.put("topicNum", userDao.findtopicNum());
		map.put("activityNum", userDao.findactivityNum());
		map.put("circleNum", userDao.findcircleNum());
		map.put("pushNum", userDao.findpushNum());
				
		return map;
	}

	@Override
	public void updateShopProductStock() {
		
		userDao.updateShopProductStock();		
	}

	@Override
	public List<HashMap> findAppVersionList() {
		
		return userDao.findAppVersionList();
	}

	@Override
	public void updateAppVersion(HashMap<String, Object> map) {
		userDao.updateAppVersion(map);		
	}

}
