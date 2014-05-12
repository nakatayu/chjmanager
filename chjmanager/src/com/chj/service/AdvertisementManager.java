package com.chj.service;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.chj.dao.BaseDao;
import com.chj.entity.Advertisement;
import com.chj.entity.Productshopcategory;

@Repository
public interface AdvertisementManager {
	public  List<Object> findAdvertiSementList(HashMap<String, Object> advertisement); //广告设置

	public void deleteAdvertiSementInfo(List list);//删除广告
	
	public HashMap<String, Object> tbFirstExtend();//app首页中显示列表显示的内容是什么模块
	
	public Object insertAdvertiSementInfo(Advertisement advertisement);//增加
	
	public  Object findAdvertiSementInfo(Advertisement advertisement); //查找 
	
	public void updateAdvertiSementInfo(Map<String, Object> advertisement);//更新 

	public  void updateAppToFirstExtendInfo(HashMap<String, Object> updateAppToFirstExtend);//更新app首页推荐的列表
	
	public List<Object> findWebAdvertisementList();//更新web图片列表
	
	public Object selectWebDetail(Long advertisement);//查看web广告的详细信息
	
	public void updateWebAdvertisementInfo(Map<String, Object> advertisement);//更新web广告图片的信息
	
	public Long selectControlListPageCount();//关键词列表分页
	
	public List<Object> selectControlList(HashMap<String,Object> mapparm);//读取关键词列表
	public void updateControl(HashMap<String, Object>  updateControl);//更新 关键词
	public Object addControl(HashMap<String, Object> addControl);//增加关键词
	public void deleteControl(List list);//删除关键词

	public int importControlfromExcel(InputStream io);
}
