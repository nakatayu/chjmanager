package com.chj.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chj.dao.PushDao;
import com.chj.entity.Advertisement;
import com.chj.entity.Push;
import com.chj.service.PushManager;

@Service
@Transactional
public class PushManagerImpl implements PushManager{
	
	@Autowired
	PushDao pushDao;
//增加推送对象信息
	@Override
	public Object insertPushInfo(Push push,String tagList) {
		// TODO Auto-generated method stub
	  Object pushs = pushDao.insertPushInfo(push,tagList);
		return pushs;
	}
//推送信息列表显示	
	@Override
	public List<HashMap> findPushListInfo(HashMap<String, Object> pushInfo){
		// TODO Auto-generated method stub
		List<HashMap>  p = pushDao.findPushListInfo(pushInfo);
		return p;
	}
//推送列表分页	
	@Override
	public Object findPushListInfoCount(Map<String, Object> pushInfopages) {
		// TODO Auto-generated method stub
		return pushDao.findPushListInfoCount(pushInfopages);
	}
//查询显示推送信息	
	@Override
	public  Object findPushInfo(Push push) {
		// TODO Auto-generated method stub
		Object pushInfo = pushDao.findPushInfo(push);
		return pushInfo;
	}
// 更新   推送对象基本信息	
	@Override
	public void updatePushInfo(Map<String, Object> pushInfo) {
		// TODO Auto-generated method stub
		pushDao.updatePushInfo(pushInfo);
	}
//点击查看  更改状态为审核中..	
	@Override
	public void updatePushInfoStatus(Map<String, Object> pushInfostatus) {
		// TODO Auto-generated method stub
		pushDao.updatePushInfoStatus(pushInfostatus);
	}
//伪删除  更改	DeleteFlag status	
	@Override
	public void updatePushInfoDeleteFlag(Map<String, Object> deleteFlagStatus) {
		// TODO Auto-generated method stub
		pushDao.updatePushInfoDeleteFlag(deleteFlagStatus);
	}
	@Override
	public Object findOrganizationName(HashMap map) {
		// TODO Auto-generated method stub
		return pushDao.findOrganizationName(map);
	}
	@Override
	public Push findPushInfoDetail(Long pushId) {
		// TODO Auto-generated method stub
		return pushDao.findPushInfoDetail(pushId);
	}
	@Override
	public Object findPushInfoTagList(Long pushId) {
		// TODO Auto-generated method stub
		return pushDao.findPushInfoTagList(pushId);
	}
	@Override
	public ArrayList<Object> findPushPhoneId(Push push) {
		// TODO Auto-generated method stub
		return  pushDao.findPushPhoneId(push);
	}
	
}
