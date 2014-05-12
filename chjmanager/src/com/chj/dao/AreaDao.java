package com.chj.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public class AreaDao extends BaseDao{
	
	/**
	 * 一级区域
	 * */
	public List<HashMap> findArea() {
		Object area = this.getSqlMapClientTemplate().queryForList("queryFirstArea");
		return (List<HashMap>) area;
	}
	
	/**
	 *  二级区域
	 * */
	public List<HashMap> findSecondArea(Long areaId) {
		Object area = this.getSqlMapClientTemplate().queryForList("querySecondArea",areaId);
		return (List<HashMap>) area;
	}
	
	
	
	
	
	public List<Object> findThirdArea(Object obj) {
		Object area = this.getSqlMapClientTemplate().queryForList(
				"queryThirdArea",obj);
		return (List<Object>) area;
	}
	//地址下拉框
	public List<Object> findDetailedAddress() {
		Object address = this.getSqlMapClientTemplate().queryForList(
				"queryDetailedAddress");
		return (List<Object>) address;  
	}
	//店铺服务地址
	public List<Object> findShopThirdArea(Map obj) {
		Object address = this.getSqlMapClientTemplate().queryForList(
				"findShopThirdArea",obj);
		return (List<Object>) address;
	}
	
}
