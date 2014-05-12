package com.chj.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.chj.entity.Area;

@Repository
public class LocationManageDao extends BaseDao {

	/**
	 * 查询一级位置管理列表
	 */
	public List<Object> findLocationManageList(HashMap<String, Object> manage) {
		Object location = this.getSqlMapClientTemplate().queryForList("findLocationManageList",manage);
		return (List<Object>) location;//Area.xml
	}

	public Object findLocationManageCount() {
		// TODO Auto-generated method stub
		Object findCount = this.getSqlMapClientTemplate().queryForObject("findLocationManageCount");
		return findCount;//Area.xml
	}

	public void delLocationmanage(String areaId) {
		// TODO Auto-generated method stub
		 this.getSqlMapClientTemplate().update("delLocationmanage",areaId);//Area.xml
	}

	public List<Object> findLocationManageSubsetList(
			HashMap<String, Object> sublm) {
		// TODO Auto-generated method stub
		Object findlms = this.getSqlMapClientTemplate().queryForList("findLocationManageSubsetList", sublm);
		return (List<Object>) findlms;//Area.xml
	}

	public Object findLocationManageSubsetListCount(
			HashMap<String, Object> sublm) {
		// TODO Auto-generated method stub
		Object lmcount = this.getSqlMapClientTemplate().queryForObject("findLocationManageSubsetListCount",sublm);
		return lmcount;//Area.xml
	}

	public Long addLocationManageList(Area area) {
		// TODO Auto-generated method stub
		Object savelm = this.getSqlMapClientTemplate().insert("addLocationManageList",area);
		return (Long) savelm;//Area.xml
	}
	/**
	 * 显示一级位置详情
	 */
	public Object LocationManageList(String areaid) {
		Object area = this.getSqlMapClientTemplate().queryForObject("LocationManageList",areaid);
		return area ;//Area.xml
	}

	public int updateLoactionManageInfo(Area area) {
		// TODO Auto-generated method stub
		Object upar = this.getSqlMapClientTemplate().update("updateLoactionManageInfo",area);
		return (Integer) upar;//Area.xml
	}

	public Long addPLocationManageList(Area area) {
		// TODO Auto-generated method stub
		Object parea = this.getSqlMapClientTemplate().insert("PLocationManageList",area);
		return (Long) parea ;//Area.xml
	}

	public String addLocationManage(String areaId) {
		// TODO Auto-generated method stub
		Object pname = this.getSqlMapClientTemplate().queryForObject("addLocationManage",areaId);
		return (String) pname;//Area.xml
	}

	public Object findLoactionManageInfo(String areaId) {
		// TODO Auto-generated method stub
		Object am = this.getSqlMapClientTemplate().queryForObject("findLoactionManageInfo",areaId);
		return am;//Area.xml
	}

}
