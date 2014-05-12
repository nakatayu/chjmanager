package com.chj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.chj.entity.Personnel;

public interface PersonnelManager {
	
	public List<Personnel> findPersonnelList(HashMap<String, Object> mapparam);
	
	public Object findPersonnelListCount(HashMap<String, Object> mapparam);
	
	public Personnel findpersonnelInfo(Long personnelId);//获取账号信息
	
	public Long newPersonnelInfo(HashMap<String,Object> mapparam);//新建管理人员账号
	
	public void delPersonnelInfo(List list);//删除管理人员账号
	
	public Personnel findPersonnelInfo(Long id);//查询管理人员账号信息
	
	public void updatePersonnelInfo(HashMap<String, Object> mapparam);//更新管理人员账号信息
	
	public Long checkName(HashMap<String,Object> name);//检查账号是否重复
	
	public Object selectRoleOfPersonnel(Integer type, Long setPerelId, Long perelId);
	
	public Object selRolePernelMger(Integer type, Long setPerelId, Long perelId);
	
	public void updRolePersonnel(Long personnelId, String role, String actions);
	
	public void addnewRolePersonnel(Long personnelId,String name, String actions,Integer type, Boolean b);
	
	public void updRolePenel(Integer roleID, String actions, String name);

	public Object selectRoleAction(Integer type);

	public Object selectActionRole(Integer type);

	public Integer checkPersonnelName(String name);
 	
}
