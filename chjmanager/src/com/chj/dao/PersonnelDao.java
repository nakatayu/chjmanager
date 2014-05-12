package com.chj.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.chj.entity.Personnel;
import com.chj.utils.MD5Util;

@Repository
public class PersonnelDao extends BaseDao {

	/**
	 * 获取管理员的列表和数量
	 */
	public List<Personnel> findPersonnelList(HashMap<String, Object> mapparam) {
		List<Personnel> findPersonnelList = this.getSqlMapClientTemplate()
				.queryForList("findPersonnelList1", mapparam);
		return findPersonnelList;
	}

	public Object findPersonnelListCount(HashMap<String, Object> mapparam) {
		Object delcp = this.getSqlMapClientTemplate().queryForObject(
				"findPersonnelListCount1", mapparam);
		return delcp;
	}

	/**
	 * 获取管理员的详细信息
	 */
	public Personnel findpersonnelInfo(Long personnelId) {
		Personnel findpersonnelInfo = (Personnel) this
				.getSqlMapClientTemplate().queryForObject("findpersonnelInfo1",
						personnelId);
		return findpersonnelInfo;
	}

	// 新建管理人员账号
	public Long newPersonnelInfo(HashMap<String, Object> mapparam) {
		Long id = (Long) this.getSqlMapClientTemplate().insert(
				"newPersonnelInfo", mapparam);
		return id;
	}

	// 删除管理人员账号
	public void delPersonnelInfo(List<Long> idList) {
		if (idList != null && idList.size() != 0) {
			for (int i = 0; i < idList.size(); i++) {
				Map map = new HashMap();
				map.put("id", idList.get(i));
				this.getSqlMapClientTemplate().update("delPersonnelInfo", map);
			}
		}
	}

	// 查询管理人员账号信息
	public Personnel findPersonnelInfo(Long id) {
		Personnel per = (Personnel) this.getSqlMapClientTemplate()
				.queryForObject("findPersonnelInfo", id);
		return per;
	}

	// 更新管理人员账号信息
	public void updatePersonnelInfo(HashMap<String, Object> mapparam) {
		this.getSqlMapClientTemplate().update("updatePersonnelInfo", mapparam);
	}

	// 检查账号是否重复
	public Long checkName(HashMap<String, Object> name) {
		Long checkName = (Long) this.getSqlMapClientTemplate().queryForObject(
				"checkName", name);
		return checkName;
	}

	public List selectRoleOfPersonnel(HashMap map) {

		return this.getSqlMapClientTemplate().queryForList("selectRolePernel",
				map);
	}

	public Object queryRoleRole(Long setPerelId) {

		return this.getSqlMapClientTemplate().queryForList("queryRolePernel",
				setPerelId);
	}

	public Object queryPernelActions(Long setPerelId) {

		return this.getSqlMapClientTemplate().queryForList(
				"queryPernelActions", setPerelId);

	}

	public List<HashMap> selRolePernelMger(Long perelId) {

		return this.getSqlMapClientTemplate().queryForList("selRolePernelMger",
				perelId);
	}

	public Object selecRoleActions(Long roleID) {

		return this.getSqlMapClientTemplate().queryForList("selecRoleActions",
				roleID);
	}

	public void detRolePernel(Long personnelId) {

		this.getSqlMapClientTemplate().delete("detRolePernel", personnelId);
	}

	public void addRolePernel(HashMap map) {

		this.getSqlMapClientTemplate().insert("addRolePernel", map);
	}

	public void detActionsPernel(Long personnelId) {

		this.getSqlMapClientTemplate().delete("detActionsPernel", personnelId);
	}

	public void addActionPernel(HashMap map) {

		this.getSqlMapClientTemplate().insert("addActionPernel", map);
	}

	public Long addRolePersonnel(HashMap map) {
		Object roleId = this.getSqlMapClientTemplate().insert(
				"addRolePersonnel", map);
		return (Long) roleId;
	}

	public void addRoleAction(HashMap map) {

		this.getSqlMapClientTemplate().insert("addRoleAction", map);
	}

	public List selCompanyRole(String type) {

		return this.getSqlMapClientTemplate().queryForList("selCompanyRole",
				type);
	}

	public void detRoleActions(Integer roleID) {

		this.getSqlMapClientTemplate().delete("detRoleActions", roleID);
	}

	public void updRoleActionsName(HashMap map) {

		this.getSqlMapClientTemplate().update("updRoleActionsName", map);
	}

	public Integer checkPersonnelName(String name) {

		return (Integer) this.getSqlMapClientTemplate().queryForObject(
				"checkPersonnelName", name);
	}
}
