package com.chj.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chj.dao.AreaDao;
import com.chj.dao.ShopDao;
import com.chj.service.AreaManager;
import com.chj.service.ShopManager;

@Service
@Transactional
public class AreaManagerImpl implements AreaManager {
	@Autowired
	AreaDao areaDao;
	
/**
 * 查找一级区域
 * */
	@Override
	public List<HashMap> findArea() {
		return areaDao.findArea();
	}
	/**
	 * 查找二级区域
	 * */
	public List<HashMap> findSecondArea(Long areaId) {
		return areaDao.findSecondArea(areaId);
	}

	
	
	@Override
	public List<Object> findThirdArea(Object obj) {
		// TODO Auto-generated method stub
		return areaDao.findThirdArea(obj);
	}
	
	//地址下拉框
	@Override
	public List<Object> findDetailedAddress() {
		// TODO Auto-generated method stub
		return areaDao.findDetailedAddress();
	}

	@Override
	public List<Object> findShopThirdArea(Map obj) {
		// TODO Auto-generated method stub
		return areaDao.findShopThirdArea(obj);
	}
}
