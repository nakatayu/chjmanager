package com.chj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public interface AreaManager {
	public List<HashMap> findArea(); //获取一级的区域
	public List<HashMap> findSecondArea(Long areaId);  //获取二级的区域
	
	
	public List<Object> findThirdArea(Object obj);
	public List<Object> findDetailedAddress();//地址下拉框
	public List<Object> findShopThirdArea(Map obj);
}
