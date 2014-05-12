package com.chj.service;

import java.util.HashMap;
import java.util.List;

import com.chj.entity.Area;


public interface LocationManage {

	List<Object> findLocationManageList(HashMap<String, Object> manage);

	Object findLocationManageCount();

	Long delLocationmanage(String loctionManageIds);

	List<Object> findLocationManageSubsetList(HashMap<String, Object> sublm);

	Object findLocationManageSubsetListCount(HashMap<String, Object> sublm);

	Long addLocationManageList(Area area);

	Object LocationManageList(String areaid);

	int updateLoactionManageInfo(Area area);

	Long addPLocationManageList(Area area);

	String addLocationManage(String areaId);

	Object findLoactionManageInfo(String areaId);

}
