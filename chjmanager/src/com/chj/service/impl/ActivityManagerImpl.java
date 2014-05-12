package com.chj.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chj.dao.ActivityDao;
import com.chj.dao.CircleDao;
import com.chj.dao.TopicDao;
import com.chj.entity.Activity;
import com.chj.service.ActivityManager;
import com.chj.service.CircleManager;

@Service
@Transactional
public class ActivityManagerImpl implements ActivityManager {
	@Autowired
	ActivityDao activityDao;
	@Autowired
	TopicDao topicDao;

	@Override
	public Object ActivityListCount(Map<String, Object> mapparam) {

		return activityDao.ActivityListCount(mapparam);
	}

	@Override
	public Object findActivityListCount(HashMap<String, Object> activityList) {

		return activityDao.findActivityListCount(activityList);
	}

	@Override
	public List<Object> findActivityList(HashMap<String, Object> activityList) {

		return activityDao.findActivityList(activityList);
	}

	@Override
	public List<Object> findActivityList(Map<String, Object> map) {

		return activityDao.findActivityList(map);
	}

	@Override
	public void selectedActivity(List<Long> idList) {

		activityDao.selectedActivity(idList);
	}

	@Override
	public List<Long> findCirceId(Long userId) {

		return activityDao.findCirceId(userId);
	}

	@Override
	public Long insertActivityInfo(Activity acty, String actTag) {

		Long actId = null;
		if (acty.getActivityId() != null) {
			actId = acty.getActivityId();
			activityDao.updateActivity(acty);
			if (actTag != null && actTag.trim().length() > 0) {
				activityDao.deleteActivityTags(actId);
			}
		} else {
			actId = activityDao.insertActivityInfo(acty);
		}
		if (actTag != null && actTag.trim().length() > 0) {
			for (String tagId : actTag.split(",")) {
				if (tagId.trim().length() > 0) {
					HashMap<String, Object> hmTag = new HashMap<String, Object>();
					hmTag.put("tag_id", tagId);
					hmTag.put("activity_id", actId);
					hmTag.put("create_time", (new Date()));
					hmTag.put("delete_flag", 1);
					Long actTags = activityDao.insertActivityTag(hmTag);
				}

			}
		}

		return actId;
	}

	@Override
	public Long updateActivityInfo(Activity avty, String avtyTag) {

		activityDao.updateActivityInfo(avty);
		if (avtyTag != null && avtyTag.trim().length() > 0
				&& !avtyTag.equals("")) {
			Long del = (Long) activityDao.delActivityTag(avty.getActivityId());
			String[] ag = avtyTag.split(",");
			for (int i = 0; i < ag.length; i++) {
				HashMap<String, Object> hmTag = new HashMap<String, Object>();
				hmTag.put("tag_id", ag[i]);
				hmTag.put("activity_id", avty.getActivityId());
				hmTag.put("create_time", (new Date()));
				hmTag.put("delete_flag", 1);
				Long actTags = activityDao.insertActivityTag(hmTag);
			}
		}
		return (long) 1;
	}

	@Override
	public Object findCName(Object circleId) {

		return activityDao.findCName(circleId);
	}

	@Override
	public Object findACount(Object activityId) {

		return activityDao.findACount(activityId);
	}

	@Override
	public Object findACountYS(HashMap<String, Object> acy) {

		return activityDao.findACountYS(acy);
	}

	@Override
	public Long updateAstatus(Activity acty) {

		return activityDao.updateAstatus(acty);
	}

	@Override
	public List<Object> findActivityUserList(HashMap<String, Object> huser) {

		return activityDao.findActivityUserList(huser);
	}

	@Override
	public Object findActivityUserListCount(HashMap<String, Object> huser) {

		return activityDao.findActivityUserListCount(huser);
	}

	@Override
	public Object findActivityUserPhone(Object UerId) {

		return activityDao.findActivityUserPhone(UerId);
	}

	@Override
	public Object findActivityUserRealname(Object UerId) {

		return activityDao.findActivityUserRealname(UerId);
	}

	@Override
	public int updateRejectStatus(Activity act) {

		return activityDao.updateRejectStatus(act);
	}

	@Override
	public Object findActivity(long ActivityId) {

		return activityDao.findActivity(ActivityId);
	}

	@Override
	public List<Map> findActivityTagList(String activityId) {

		return activityDao.findActivityTagList(activityId);
	}

	@Override
	public Object findTag(Object tagId) {

		return activityDao.findTag(tagId);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public Object findActivityAndUserList(HashMap<String, Object> map) {
		List<HashMap> list = (List<HashMap>) activityDao
				.findActivityAndUserList(map);
		if (list.size() > 0) {
			for (HashMap activity : list) {
				if (activity.get("company_id") != null) {
					activity.put("user", topicDao.findTopicCompany(activity
							.get("company_id").toString()));
				} else if (activity.get("create_user_id") != null) {
					activity.put(
							"user",
							topicDao.findTopicUserInfo(activity.get(
									"create_user_id").toString()));
				}
				activity.put("addUserCount",
						activityDao.findACount(activity.get("activity_id")));
				HashMap maps = new HashMap();
				maps.put("activityId", activity.get("activity_id"));
				activity.put("acommCount",
						activityDao.findActivityCommentListCount(maps));
				activity.put("pictCount", activityDao
						.findActivityPictureListCount(activity
								.get("activity_id").toString()));
			}
		}
		return list;
	}

	@Override
	public Object findActivityAndUserListCount(HashMap<String, Object> map) {

		return activityDao.findActivityAndUserListCount(map);
	}

	@Override
	public Object updateActivityExamine(String activityId, String examineResult) {
		String[] circle = activityId.split(",");
		if (circle.length > 0) {
			for (String str : circle) {
				HashMap map = new HashMap();
				map.put("examine", examineResult);
				map.put("activityId", str);
				Integer i = activityDao.updateActivityExamine(map);
			}
		}
		return null;
	}

	@Override
	public HashMap findActivityDetail(String activityId) {

		return activityDao.findActivityDetail(activityId);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public Object findActivityOfUserList(HashMap map1) {
		List<HashMap> list = (List<HashMap>) activityDao
				.findActivityOfUserList(map1);
		for (HashMap actiUser : list) {
			actiUser.put("user", activityDao.findactivityUserInfo(actiUser.get(
					"user_id").toString()));
			actiUser.put("checkCard", "F");
			HashMap map = new HashMap();
			map.put("userId", actiUser.get("user_id"));
			map.put("activityId", map1.get("activityId"));
			map.put("type", 2);
			map.put("doType", 2);
			HashMap hash = activityDao.findCountOfCredentials(map);
			if (hash != null && hash.size() > 0) {
				actiUser.put("checkCard", "T");
			}
		}
		return list;
	}

	@Override
	public Object findActivityOfUserListCount(HashMap map) {

		return activityDao.findActivityOfUserListCount(map);
	}

	@Override
	public String updatetbUserAStatus(String userId, String activityId,
			String status) {
		String[] userIds = userId.split(",");
		if (userIds.length > 0) {
			for (String str : userIds) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("userId", str);
				map.put("activityId", activityId);
				map.put("status", Integer.parseInt(status));
				activityDao.updatetbUserAStatus(map);
			}
		}
		return "";
	}

	@Override
	public String updateActivityUserflag(String userId, String activityId,
			String status) {
		String[] userIds = userId.split(",");
		if (userIds.length > 0) {
			for (String str : userIds) {
				HashMap map = new HashMap();
				map.put("userId", str);
				map.put("activityId", activityId);
				map.put("status", Integer.parseInt(status));
				activityDao.updateActivityUserflag(map);
			}
		}
		return "";
	}

	@SuppressWarnings("unchecked")
	@Override
	public Object findActivCommentList(HashMap<String, Object> activComlst) {
		List<HashMap<?, ?>> comlist = (List<HashMap<?, ?>>) activityDao
				.findActivCommentList(activComlst);
		if (comlist.size() > 0) {
			for (HashMap circle : comlist) {
				String usId = circle.get("user_id").toString();
				circle.put("user", topicDao.findTopicUserInfo(usId));
				HashMap map = new HashMap();
				map.put("toUserId", usId);
				map.put("activityId", activComlst.get("activityId"));
				circle.put("comCount",
						activityDao.findActivityCommentListCount(map));
				if (circle.get("to_user_id") != null) {
					String useId = circle.get("to_user_id").toString();
					circle.put("touser", topicDao.findTopicUserInfo(useId));
				}
			}
		}
		return comlist;
	}

	@Override
	public Object findActivityCommentListCount(
			HashMap<String, Object> activComlst) {

		return activityDao.findActivityCommentListCount(activComlst);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public Object updtActivCommlet(String activCommId, String activityId) {
		String[] comId = activCommId.split(",");
		if (comId.length > 0) {
			for (String str : comId) {
				HashMap map = new HashMap();
				map.put("comId", str);
				map.put("activityId", activityId);
				activityDao.updtActivCommlet(map);
			}
		}
		return null;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public Object selectedActivityPicture(String activityId) {
		List<HashMap> listMap = activityDao.selectedActivityPicture(activityId);
		for (HashMap map : listMap) {
			String userId = map.get("upload_user_id").toString();
			map.put("touser", topicDao.findTopicUserInfo(userId));
		}
		return listMap;
	}

	@Override
	public Object chechThePicture(HashMap map1) {
		List<HashMap> listMap = activityDao.chechThePicture(map1);
		for (HashMap map : listMap) {
			String userId = map.get("upload_user_id").toString();
			map.put("touser", topicDao.findTopicUserInfo(userId));
		}
		return listMap;
	}

	@Override
	public Object findActPhotCommltList(HashMap<String, Object> activComlst) {
		List<HashMap<?, ?>> comlist = (List<HashMap<?, ?>>) activityDao
				.findActPhotCommltList(activComlst);
		if (comlist.size() > 0) {
			for (HashMap circle : comlist) {
				String usId = circle.get("user_id").toString();
				circle.put("user", topicDao.findTopicUserInfo(usId));
				HashMap map = new HashMap();
				map.put("toUserId", usId);
				map.put("activityPhotoId", activComlst.get("activityPhotoId"));
				circle.put("comCount", activityDao.findActPhotCommltCount(map));
				if (circle.get("to_user_id") != null) {
					String useId = circle.get("to_user_id").toString();
					circle.put("touser", topicDao.findTopicUserInfo(useId));
				}
			}
		}
		return comlist;
	}

	@Override
	public Object findActPhotCommltListCount(HashMap<String, Object> activComlst) {

		return activityDao.findActPhotCommltCount(activComlst);
	}

	@Override
	public Object updActPhoCommels(String activCommId, String activityPhotoId) {
		String[] comId = activCommId.split(",");
		if (comId.length > 0) {
			for (String str : comId) {
				HashMap map = new HashMap();
				map.put("comId", str);
				map.put("activityPhotoId", activityPhotoId);
				activityDao.updActPhoCommels(map);
			}
		}
		return null;
	}

	@Override
	public String updaActivityLtop(String activityId, String filName,
			Integer filValue, Integer filnum) {
		String[] activId = activityId.split(",");
		String msg = null;
		if (activId.length > 0) {
			if (filnum > 0) {
				HashMap<String, Object> map1 = new HashMap<String, Object>();
				map1.put("filValue", filValue);
				map1.put("filName", filName);

				Integer i = activityDao.queryNumberOffilName(map1);

				if (i + activId.length > filnum) {
					msg = "已有" + i + "个设置，总设置个数大于限定值！";
				}
			}
			if (msg == null) {
				for (String actId : activId) {
					HashMap<String, Object> map = new HashMap<String, Object>();
					map.put("filValue", filValue);
					map.put("activityId", actId);
					map.put("filName", filName);
					activityDao.updaActivityLtop(map);
				}
			}
		} else {
			msg = "数据错误";
		}
		return msg;
	}

}
