package com.chj.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.chj.dao.BaseDao;
import com.chj.entity.Activity;

@Repository
public class ActivityDao extends BaseDao {

	public Object ActivityListCount(Map<String, Object> mapparam) {

		Object delcp;
		if (mapparam.get("createUserId") != null) {
			delcp = this.getSqlMapClientTemplate().queryForObject(
					"queryActivityCount", mapparam);
		} else {
			delcp = this.getSqlMapClientTemplate().queryForObject(
					"queryCActivityCount", mapparam);
		}
		return delcp;

	}

	public Object findActivityListCount(HashMap<String, Object> activityList) {

		Object activitycount = this.getSqlMapClientTemplate().queryForObject(
				"findActivityList", activityList);
		return activitycount;
	}

	// 活动列表

	public List<Object> findActivityList(HashMap<String, Object> activityList) {

		Object activitylist;
		if (activityList.get("createUserId") != null) {
			activitylist = this.getSqlMapClientTemplate().queryForList(
					"findActivityList", activityList);
		} else {
			activitylist = this.getSqlMapClientTemplate().queryForList(
					"findCActivityList", activityList);
		}

		return (List) activitylist;
	}

	// 活动列表

	public List<Object> findActivityList(Map<String, Object> map) {

		Object activityList = this.getSqlMapClientTemplate().queryForList(
				"findActivityList", map);
		return (List) activityList;
	}

	// 活动删除

	public void selectedActivity(List<Long> idList) {
		if (idList != null && idList.size() != 0) {
			for (int i = 0; i < idList.size(); i++) {
				Map map = new HashMap();
				map.put("activityId", idList.get(i));
				map.put("delete_flag", 2);
				this.getSqlMapClientTemplate().update("deleteActivity", map);
				this.getSqlMapClientTemplate().update("deleteActivityTag", map);
			}
		}
	}

	public List<Long> findCirceId(Long userId) {

		HashMap<String, Object> um = new HashMap<String, Object>();
		um.put("userId", userId);
		um.put("delete_flag", 1);
		List<Long> CirceId = (List<Long>) this.getSqlMapClientTemplate()
				.queryForList("findCirceId", um);
		return CirceId;
	}

	public Long insertActivityTag(HashMap<String, Object> hmTag) {

		Long ins = (Long) this.getSqlMapClientTemplate().insert(
				"insertActivityTag", hmTag);
		return ins;
	}

	public Long insertActivityInfo(Activity acty) {

		Long lin = (Long) this.getSqlMapClientTemplate().insert(
				"insertActivityInfo", acty);
		return lin;
	}

	public Object delActivityTag(Long activityId) {

		Long delAtag = (long) this.getSqlMapClientTemplate().delete(
				"delActivityTag", activityId);
		return delAtag;
	}

	public void updateActivityInfo(Activity avty) {

		this.getSqlMapClientTemplate().update("updateActivityInfo", avty);

	}

	public Object findCName(Object circleId) {

		String Cname = (String) this.getSqlMapClientTemplate().queryForObject(
				"findCName", circleId);
		return Cname;
	}

	public Object findACount(Object activityId) {

		Object ac = this.getSqlMapClientTemplate().queryForObject("findACount",
				activityId);
		return ac;
	}

	public Object findACountYS(HashMap<String, Object> acy) {

		Object obj = this.getSqlMapClientTemplate().queryForObject(
				"findACountYS", acy);
		return obj;
	}

	public Long updateAstatus(Activity acty) {
		Long upd = (long) this.getSqlMapClientTemplate().update(
				"updateAstatus", acty);
		return upd;
	}

	public List<Object> findActivityUserList(HashMap<String, Object> huser) {

		Object list = this.getSqlMapClientTemplate().queryForList(
				"findActivityUserList", huser);
		return (List<Object>) list;
	}

	public Object findActivityUserListCount(HashMap<String, Object> huser) {

		Object aucont = this.getSqlMapClientTemplate().queryForObject(
				"findActivityUserListCount", huser);
		return aucont;
	}

	public Object findActivityUserPhone(Object uerId) {

		Object phone = this.getSqlMapClientTemplate().queryForObject(
				"findActivityUserPhone", uerId);
		return phone;
	}

	public Object findActivityUserRealname(Object uerId) {

		Object realname = this.getSqlMapClientTemplate().queryForObject(
				"findActivityUserRealname", uerId);
		return realname;
	}

	public int updateRejectStatus(Activity act) {

		Object upd = this.getSqlMapClientTemplate().update(
				"updateRejectStatus", act);
		return (Integer) upd;
	}

	public Object findActivity(long activityId) {

		Object activity = this.getSqlMapClientTemplate().queryForObject(
				"findActivity", activityId);
		return activity;
	}

	public List<Map> findActivityTagList(String activityId) {

		Object listat = this.getSqlMapClientTemplate().queryForList(
				"findActivityTagList", activityId);
		return (List<Map>) listat;
	}

	public Object findTag(Object tagId) {

		return null;
	}

	public void saveActivityUser(HashMap<String, Object> acUser) {

		this.getSqlMapClientTemplate().insert("saveActivityUser", acUser);

	}

	public Object findActivityAndUserList(HashMap<String, Object> map) {

		return this.getSqlMapClientTemplate().queryForList("findActiUserList",
				map);
	}

	public Object findActivityAndUserListCount(HashMap<String, Object> map) {

		return this.getSqlMapClientTemplate().queryForList(
				"findActiUserListCount", map);
	}

	public Integer updateActivityExamine(HashMap map) {

		return this.getSqlMapClientTemplate().update("updateActiExamine", map);
	}

	public void updateActivity(Activity acty) {

		this.getSqlMapClientTemplate().update("updateActivityInfo", acty);
	}

	public void deleteActivityTags(Long actId) {

		this.getSqlMapClientTemplate().delete("deleteActivityTags", actId);
	}

	public HashMap findActivityDetail(String activityId) {

		return (HashMap) this.getSqlMapClientTemplate().queryForObject(
				"findActivityDetail", activityId);
	}

	public Object findActivityOfUserList(HashMap map) {

		return this.getSqlMapClientTemplate().queryForList(
				"finfindActiOfUserList", map);
	}

	public Object findActivityOfUserListCount(HashMap map) {

		return this.getSqlMapClientTemplate().queryForObject(
				"finfindActiOfUserListCount", map);
	}

	public Object updatetbUserAStatus(HashMap map) {

		return this.getSqlMapClientTemplate().update("updatetbUserStatus", map);
	}

	public Object updateActivityUserflag(HashMap map) {

		return this.getSqlMapClientTemplate().update("updActUserflag", map);
	}

	public Object findactivityUserInfo(String userId) {
		// activity.xml
		return this.getSqlMapClientTemplate().queryForObject(
				"findactivityUserInfo", Long.valueOf(userId));
	}

	public HashMap findCountOfCredentials(HashMap map) {
		return (HashMap) this.getSqlMapClientTemplate().queryForObject(
				"findCredentials", map);
	}

	public Object findActivCommentList(HashMap<String, Object> omlst) {

		return this.getSqlMapClientTemplate().queryForList("findActivmmenlst",
				omlst);
	}

	public Object findActivityCommentListCount(HashMap<String, Object> omlst) {

		return this.getSqlMapClientTemplate().queryForObject(
				"findActivmmenlstCount", omlst);
	}

	public Object updtActivCommlet(HashMap map) {

		return this.getSqlMapClientTemplate().update("updtActivCommlet", map);
	}

	public List<HashMap> selectedActivityPicture(String activityId) {

		return this.getSqlMapClientTemplate().queryForList("selectActivPict",
				activityId);
	}

	public List<HashMap> chechThePicture(HashMap map) {

		return this.getSqlMapClientTemplate().queryForList("chechThePicture",
				map);
	}

	public Object findActPhotCommltList(HashMap<String, Object> actlst) {
		
		return this.getSqlMapClientTemplate().queryForList("ActPhotCommlt",
				actlst);
	}

	public Object findActPhotCommltCount(HashMap map) {
		 
		return this.getSqlMapClientTemplate().queryForObject(
				"ActPhotCommltCount", map);
	}

	public Object updActPhoCommels(HashMap map) {

		return this.getSqlMapClientTemplate().update("updActPhoCommels", map);
	}

	public Integer queryNumberOffilName(HashMap<String, Object> map) {
		
		return (Integer) this.getSqlMapClientTemplate().queryForObject(
				"queryNumberOffilName", map);
	}

	public Object updaActivityLtop(HashMap<String, Object> map) {
		
		return this.getSqlMapClientTemplate().update("updaActivityLtop", map);
	}

	public Object findActivityPictureListCount(String activityId) {
		
		return this.getSqlMapClientTemplate().queryForObject(
				"selectActivPictCount", activityId);
	}

}