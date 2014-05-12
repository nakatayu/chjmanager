package com.chj.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.chj.entity.Push;

@Repository
public interface PushManager {
	
	public Object insertPushInfo(Push push, String tagList); //增加推送信息
	
	public List<HashMap> findPushListInfo(HashMap<String, Object> pushInfo); //推送信息列表显示
	
	public Object findPushListInfoCount(Map<String, Object> pushInfopages);//推送列表分页
	
	public  Object findPushInfo(Push push);//查询显示推送信息
	
	public void updatePushInfo(Map<String, Object> pushInfo); 	// 更新   推送对象基本信息
	
	public void updatePushInfoStatus(Map<String, Object> pushInfostatus); //点击查看  更改状态为审核中..
	
	public void updatePushInfoDeleteFlag(Map<String, Object> deleteFlagStatus);//伪删除  更改	DeleteFlag status 

	public Object findOrganizationName(HashMap map);

	public Push findPushInfoDetail(Long valueOf);

	public Object findPushInfoTagList(Long valueOf);

	public  ArrayList<Object>  findPushPhoneId(Push push);
}
