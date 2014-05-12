package com.chj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.chj.entity.Company;
import com.chj.entity.CompanyTagRecord;
import com.chj.entity.Personnel;
import com.chj.entity.Shop;
import com.chj.entity.User;

public interface UserManager {
	public Object login(Personnel per);

	public List<Company> companyList(HashMap<String, Object> mapparam);

	public Long addComPanyInfo(Company company,String sevatag);

	public Object delCompanyInfo(String companyId);

	public Object companyListCount(HashMap<String, Object> mapparam);

	public Object updateCompanyInfo(Company company, Long updateCompanyId,String ctg);

	public List<Object> shopList(HashMap<String, Object> shopmap);

	public Object shopListCount(HashMap<String, Object> shopmap);

	public Long addUserInfo(User user);

	public List<Object> findServiceInfo(HashMap<String, Object> sinfo);

	public List<Object> findTagSecondList();

	public List<Object> findTagThirdList(Map<String, Object> map);

	public Long saveTag(CompanyTagRecord ctg);

	public String findTheUsername(Long userId);

	public Object verifyTheAccount(String account);

	public Long getCompanyId(Long CompanyIdNum);

	public List<User> findUserList(HashMap<String,Object> parm);

	public	Object findUserListCount(HashMap<String,Object> parm);

	public HashMap findUserInfo(Long userId);

	public Object addUserdaily(HashMap msp);

	public List finduserDailyList(HashMap<String, Object> uList);

	public Object finduserDailyListCount(HashMap<String, Object> uList);

	public void deleteUserListInfo(List list);

    public Long addMemberInfo(User user);
    public Object updateMemberInfo(User user);

	public Object findCredentialsCredentials(HashMap map);

	public Object findUserNickNameImage(Long userId);
	
	public void updateEventualLoginTime(Long id);//最后的登陆时间

	public Object addcodeofuserregirter(String name, Integer numCode);

	public Object findUserCodeInfolt(HashMap map);

	public Object findUserCodeInfoltCount(HashMap map);

	public void deleteTbCodelst(String codeIdes);

	public Object checkfullInfo();

	public void updateShopProductStock();

	public List<HashMap> findAppVersionList();

	public void updateAppVersion(HashMap<String, Object> map);
	
}
