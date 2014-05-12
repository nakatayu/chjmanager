package com.chj.service.impl;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chj.common.Commonparam;
import com.chj.dao.PersonnelDao;
import com.chj.entity.Personnel;
import com.chj.service.PersonnelManager;

@Service
@Transactional
public class PersonnelManagerImpl implements PersonnelManager {
	@Autowired
	PersonnelDao personnelDao;

	/**
	 * 获取企业 账号列表和数量
	 * */
	@Override
	public List<Personnel> findPersonnelList(HashMap<String, Object> mapparam) {
		return (List<Personnel>) personnelDao.findPersonnelList(mapparam);
	}

	@Override
	public Object findPersonnelListCount(HashMap<String, Object> parm) {
		return personnelDao.findPersonnelListCount(parm);
	}

	/**
	 * 获取企业 账号详细信息
	 * */
	@Override
	public Personnel findpersonnelInfo(Long personnelId) {
		return personnelDao.findpersonnelInfo(personnelId);
	}

	// 新建管理人员账号
	@Override
	public Long newPersonnelInfo(HashMap<String, Object> mapparam) {

		Long id = (Long) personnelDao.newPersonnelInfo(mapparam);
		return id;
	}

	// 删除管理人员账号
	@Override
	public void delPersonnelInfo(List list) {

		personnelDao.delPersonnelInfo(list);
	}

	// 查询管理人员账号信息
	@Override
	public Personnel findPersonnelInfo(Long id) {

		return personnelDao.findPersonnelInfo(id);
	}

	// 更新管理人员账号信息
	@Override
	public void updatePersonnelInfo(HashMap<String, Object> mapparam) {

		personnelDao.updatePersonnelInfo(mapparam);
	}

	// 检查账号是否重复
	@Override
	public Long checkName(HashMap<String, Object> name) {

		return (Long) personnelDao.checkName(name);
	}

	@Override
	public Object selectRoleOfPersonnel(Integer type, Long setPerelId,
			Long perelId) {
		// 查询被设置人员权限
		List<String> rotr = (List<String>) personnelDao
				.queryRoleRole(setPerelId);
		List<String> actr = (List<String>) personnelDao
				.queryPernelActions(setPerelId);
		// 查询设置人员(登录的用户)权限
		List<String> perrotr = (List<String>) personnelDao
				.queryRoleRole(perelId);
		List<String> peractr = (List<String>) personnelDao
				.queryPernelActions(perelId);

		HashMap map = new HashMap();
		map.put("type", type);
		map.put("ParentID", null);
		List<HashMap> list = personnelDao.selectRoleOfPersonnel(map);
		List<List<HashMap>> verlist = new ArrayList<List<HashMap>>();
		verlist.add(list);
		while (verlist.size() > 0) {
			List<HashMap> lt = verlist.get(0);
			verlist.remove(0);
			for (HashMap m : lt) {
				String mID = m.get("ID").toString();

				// 检查被设置用户权限,是否已有此项权限
				m.put("select", 0);
				for (String rolID : rotr) {
					if (mID.equals(rolID)) {
						m.put("select", 1);
					}
				}
				for (String actID : actr) {
					if (mID.equals(actID)) {
						m.put("select", 1);
					}
				}
				// 检查登录用户权限,是否可设置此项权限
				m.put("check", 0);
				for (String actID : perrotr) {
					if (mID.equals(actID)) {
						m.put("check", 1);
					}
				}
				for (String actID : peractr) {
					if (mID.equals(actID)) {
						m.put("check", 1);
					}
				}

				map.put("ParentID", m.get("ID"));
				List<HashMap> list2 = personnelDao.selectRoleOfPersonnel(map);
				if (list2.size() > 0) {
					verlist.add(list2);
					m.put("next", list2);
				} else {
					m.put("next", null);
				}
			}
		}
		return list.get(0);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public Object selRolePernelMger(Integer type,Long setPerelId, Long perelId) {
		List<HashMap> rolse = personnelDao.selCompanyRole(type.toString());
		// 查询被设置人员角色
		List<HashMap> blit = personnelDao.selRolePernelMger(setPerelId);
		// 查询(登录的用户)设置人员角色
		List<HashMap> lit = personnelDao.selRolePernelMger(perelId);
		for (HashMap role : rolse) {
			List<String> strlit = (List<String>) personnelDao
					.selecRoleActions(Long.valueOf(role.get("ID").toString()));
			String[] str = strlit.toArray(new String[strlit.size()]);
			String s = Arrays.toString(str);
			role.put("value", s);
			
			role.put("check", 0);
			for (HashMap b : lit) {
				if(role.get("ID").toString().equals(b.get("ID").toString())){
					role.put("check", 1);
				}
			}
			role.put("select", 0);
			for (HashMap p : blit) {
				if (role.get("ID").toString().equals(p.get("ID").toString())) {
					role.put("select", 1);
				}
			}			 
		}		 
		return rolse;
	}

	@Override
	public void updRolePersonnel(Long personnelId, String role, String actions) {
		// 修改用户角色
		personnelDao.detRolePernel(personnelId);
		if (role != null && role.trim().length() > 0) {
			String[] roles = role.split(",");
			for (String strle : roles) {
				HashMap map = new HashMap();
				map.put("personnelId", personnelId);
				map.put("roleId", Long.valueOf(strle));
				personnelDao.addRolePernel(map);
			}
		}
		// 修改用户权限
		personnelDao.detActionsPernel(personnelId);
		if (actions != null && actions.trim().length() > 0) {
			String[] action = actions.split(",");
			for (String ton : action) {
				HashMap map = new HashMap();
				map.put("personnelId", personnelId);
				map.put("actionId", ton);
				personnelDao.addActionPernel(map);
			}
		}
	}
	
	

	@Override
	public Object selectRoleAction(Integer type) {
		HashMap map = new HashMap();
		map.put("type", type);
		map.put("ParentID", null);
		List<HashMap> list = personnelDao.selectRoleOfPersonnel(map);
		List<List<HashMap>> verlist = new ArrayList<List<HashMap>>();
		verlist.add(list);
		while (verlist.size() > 0) {
			List<HashMap> lt = verlist.get(0);
			verlist.remove(0);
			for (HashMap m : lt) {
				map.put("ParentID", m.get("ID"));
				List<HashMap> list2 = personnelDao.selectRoleOfPersonnel(map);
				if (list2.size() > 0) {
					verlist.add(list2);
					m.put("next", list2);
				} else {
					m.put("next", null);
				}
			}
		}
		return list.get(0);
	}

	@Override
	public Object selectActionRole(Integer type) {
		List<HashMap> rolse = personnelDao.selCompanyRole(type.toString());
		for (HashMap role : rolse) {
			List<String> strlit = (List<String>) personnelDao
					.selecRoleActions(Long.valueOf(role.get("ID").toString()));
			String[] str = strlit.toArray(new String[strlit.size()]);
			String s = Arrays.toString(str);
			role.put("value", s);
		}
		return rolse;
	}

	@Override
	public void addnewRolePersonnel(Long personnelId, String name,
			String actions,Integer type, Boolean b) {
		
		HashMap m = new HashMap();
		m.put("name", name);
		m.put("Category", type);
		Long roleId = personnelDao.addRolePersonnel(m);
		if (actions != null && actions.trim().length() > 0) {
			String[] action = actions.split(",");
			for (String ton : action) {
				HashMap map = new HashMap();
				map.put("roleId", roleId);
				map.put("actionId", ton);
				personnelDao.addRoleAction(map);
			}
		}
		// 角色创建成功,自己就自动获得角色
		if(b){
		HashMap map = new HashMap();
		map.put("personnelId", personnelId);
		map.put("roleId", roleId);
		personnelDao.addRolePernel(map);
		}
	}

	@Override
	public void updRolePenel(Integer roleID, String actions, String name) {
		if(name!=null&&!"".equals(name.trim())){
			HashMap map=new HashMap();
			map.put("name", name);
			map.put("RoleID", roleID);
			personnelDao.updRoleActionsName(map);
		}
		personnelDao.detRoleActions(roleID);
		
		if (actions != null && actions.trim().length() > 0) {
			String[] action = actions.split(",");
			for (String ton : action) {
				HashMap map = new HashMap();
				map.put("roleId", roleID);
				map.put("actionId", ton);
				personnelDao.addRoleAction(map);
			}
		}	
	}

	@Override
	public Integer checkPersonnelName(String name) {
		
		return personnelDao.checkPersonnelName(name);
	}	
	
}



