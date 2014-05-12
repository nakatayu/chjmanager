package com.chj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.chj.entity.Activity;

public interface ActivityManager {

	public Object ActivityListCount(Map<String, Object> mapparam);

	public Object findActivityListCount(HashMap<String, Object> activityList);

	public List<Object> findActivityList(HashMap<String, Object> activityList);// 活动列表

	public List<Object> findActivityList(Map<String, Object> map);// 活动列表

	public void selectedActivity(List<Long> idList);

	public List<Long> findCirceId(Long userId);

	public Long insertActivityInfo(Activity acty, String actTag);

	public Long updateActivityInfo(Activity avty, String avtyTag);

	public Object findCName(Object circleId);

	public Object findACount(Object activityId);

	public Object findACountYS(HashMap<String, Object> acy);

	public Long updateAstatus(Activity acty);

	public List<Object> findActivityUserList(HashMap<String, Object> huser);

	public Object findActivityUserListCount(HashMap<String, Object> huser);

	public Object findActivityUserPhone(Object UerId);

	public Object findActivityUserRealname(Object UerId);

	public int updateRejectStatus(Activity act);

	public Object findActivity(long ActivityId);

	public List<Map> findActivityTagList(String activityId);

	public Object findTag(Object tagId);

	public Object findActivityAndUserList(HashMap<String, Object> map);

	public Object findActivityAndUserListCount(HashMap<String, Object> map);

	public Object updateActivityExamine(String activityId, String examineResult);

	public HashMap findActivityDetail(String activityId);

	public Object findActivityOfUserList(HashMap map);

	public Object findActivityOfUserListCount(HashMap map);

	public String updatetbUserAStatus(String userId, String activityId,
			String status);

	public String updateActivityUserflag(String userId, String activityId,
			String status);

	public Object findActivCommentList(HashMap<String, Object> mmenlst);

	public Object findActivityCommentListCount(HashMap<String, Object> mmenlst);

	public Object updtActivCommlet(String activCommId, String activityId);

	public Object selectedActivityPicture(String activityId);

	public Object chechThePicture(HashMap map);

	public Object findActPhotCommltList(HashMap<String, Object> activComlst);

	public Object findActPhotCommltListCount(HashMap<String, Object> activComlst);

	public Object updActPhoCommels(String activCommId, String activityPhotoId);

	public String updaActivityLtop(String activityId, String filName,
			Integer filValue, Integer filnum);
	
}
