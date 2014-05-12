package com.chj.service.impl;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chj.dao.AdvertisementDao;
import com.chj.entity.Advertisement;
import com.chj.service.AdvertisementManager;

@Service
@Transactional
public class AdvertisementManagerImpl implements AdvertisementManager{
	@Autowired
	AdvertisementDao advertisementDao;
	
//app广告图片列表
	@Override
	public  List<Object> findAdvertiSementList(HashMap<String, Object> advertisement) {
		List<Object> adverti = advertisementDao.findAdvertiSementList(advertisement);
		return adverti;
	}
	
//app首页中显示列表显示的内容是什么模块
		@Override
		public HashMap<String, Object> tbFirstExtend() {
		  HashMap<String, Object> tbFirstExtendInfo = advertisementDao.tbFirstExtend();
		  return tbFirstExtendInfo;
		}
		
//更新app列表也页显示的内容
	    @Override
		public void updateAppToFirstExtendInfo(HashMap<String, Object> updateAppToFirstExtend) {
		  advertisementDao.updateAppToFirstExtendInfo(updateAppToFirstExtend);
		}
		
 
//广告删除
	@Override
	public void deleteAdvertiSementInfo(List list) {
		// TODO Auto-generated method stub
		advertisementDao.deleteAdvertiSementInfo(list);
	}
//增加	
	@Override
	public Object insertAdvertiSementInfo(Advertisement advertisement) {
		Object qw = advertisementDao.insertAdvertiSementInfo(advertisement);
		return  qw;
	}
//查找	
	@Override
	public Object findAdvertiSementInfo(
			Advertisement advertisement) {
		Object adverti = advertisementDao.findAdvertiSementInfo(advertisement);
		return adverti;
	}
//更新	
	@Override
	public void updateAdvertiSementInfo(Map<String, Object> advertisement) {
		advertisementDao.updateAdvertiSementInfo(advertisement);
	}
	
	
	//查找web广告图片列表
		@Override
		public  List<Object> findWebAdvertisementList() {
			List<Object> adverti = advertisementDao.findWebAdvertisementList();
			return adverti;
		}
	
		//查找web广告图片详情
		@Override
		public Object selectWebDetail(Long advertisement) {
			Object adverti = advertisementDao.findWebAdvertisementInfo(advertisement);
			return adverti;
		}
		
		//更新web广告图片信息
		@Override
		public void updateWebAdvertisementInfo(Map<String, Object> advertisement) //更新web广告图片的信息
		{
			advertisementDao.updateWebAdvertisementInfo(advertisement);
		}
		
		
		//读取关键词列表
		@Override
		public List<Object> selectControlList(HashMap<String,Object> mapparm){
			return (List<Object>)advertisementDao.selectControlList(mapparm);
		}
		//读取关键词列表  分页
		@Override
		public  Long selectControlListPageCount() {
			return (Long)advertisementDao.selectControlListPageCount();
		}
		
		//更新 关键词	
		@Override
		public void updateControl(HashMap<String, Object> updateControl) {
			advertisementDao.updateControl(updateControl);
		}
		//增加关键词
		@Override
		public Object addControl(HashMap<String, Object> addControl) {
			Object qw = advertisementDao.addControl(addControl);
			return  qw;
		}
		//删除关键词
		@Override
		public void deleteControl(List list) {
			advertisementDao.deleteControl(list);
		} 


		@Override
		public int importControlfromExcel(InputStream io){
			return advertisementDao.importControlfromExcel(io);
		}
		 
}
