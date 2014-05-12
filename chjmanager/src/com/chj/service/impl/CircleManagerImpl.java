package com.chj.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chj.common.Commonparam;
import com.chj.dao.CircleDao;
import com.chj.dao.TopicDao;
import com.chj.entity.Circle;
import com.chj.entity.CircleTag;
import com.chj.service.CircleManager;

@Service
@Transactional
public class CircleManagerImpl implements CircleManager {
	@Autowired
	CircleDao circleDao;
	@Autowired
	TopicDao topicDao;

	@Override
	public Object circleListCount(HashMap<String, Object> circleList) {

		return circleDao.circleListCount(circleList);
	}

	@Override
	public Object findCircleListCount(HashMap<String, Object> circleList) {

		return circleDao.findCircleListCount(circleList);
	}

	@Override
	public List<Object> findCircleList(Map<String, Object> map) {

		return circleDao.findCircleList(map);
	}

	@Override
	public void selectedCirle(List<Long> idList) {

		circleDao.selectedCirle(idList);
	}

	@Override
	public Long seveCircle(Circle circle, String circleCardImage,
			String imgChanged) {

		Long circleId = null;
		if (circle.getCircleId() != null) {
			circleId = circle.getCircleId();
			circleDao.updateCircle(circle);
			if (circle.getParam() != null
					&& circle.getParam().trim().length() > 0
					&& circle.getParam().split(",").length > 0) {
				circleDao.deleteCircleTags(circleId);
			}
			if (imgChanged != null && imgChanged.equals("1")) {
				circleDao.deleteCardImages(circleId);
			}
		} else {
			circleId = circleDao.seveCircle(circle);
		}

		if (imgChanged != null && imgChanged.equals("1")) {
			JSONArray array = JSONArray.fromObject(circleCardImage);
			for (int i = 0; i < array.size(); i++) {
				JSONObject obj = array.getJSONObject(i);
				if (obj.getString("path").trim().length() > 0) {
					HashMap<String, Comparable> circletag = new HashMap<String, Comparable>();
					circletag.put("circleId", circleId);
					circletag.put("createTime", new Date());
					circletag.put("cardPath", obj.getString("path"));
					circleDao.insertCircleCardImage(circletag);
				}
			}
		}

		if (circle.getParam() != null && circle.getParam().trim().length() > 0) {
			String[] sct = circle.getParam().split(",");
			List<CircleTag> sctList = new ArrayList<CircleTag>();
			for (int i = 0; i < sct.length; i++) {
				if (sct[i].trim().length() > 0) {
					CircleTag ctag = new CircleTag();
					ctag.setCircleId(circleId);
					ctag.setAddTime(new Date());
					ctag.setTagId(Long.valueOf(sct[i]));
					ctag.setDeleteFlag(1);
					Long criTag = circleDao.saveCTag(ctag);
				}

			}
		}
		return (long) 1;
	}

	@Override
	public Object closeCircle(Circle cir) {

		return circleDao.closeCircle(cir);
	}

	@Override
	public Long updateCirleInfo(Circle circle, String circleTag) {

		circleDao.updateCirleInfo(circle);
		if (circleTag != null && !circleTag.equals("")) {
			circleDao.delTag(circle.getCircleId());
			String[] updatetag = circleTag.split(",");
			for (int i = 0; i < updatetag.length; i++) {
				CircleTag cg = new CircleTag();
				cg.setTagId(Long.valueOf(updatetag[i]));
				cg.setCircleId(circle.getCircleId());
				cg.setAddTime(new Date());
				cg.setDeleteFlag(1);

				Long uptag = circleDao.updateCirleInfoTag(cg);
			}
		}
		return (long) 1;
	}

	@Override
	public Object findUserCount(Object circleId) {

		return circleDao.findUserCount(circleId);
	}

	@Override
	public Object findThemeCount(Object circleId) {

		return circleDao.findThemeCount(circleId);
	}

	@Override
	public int updateBoHuiCircle(Circle cil) {

		return circleDao.updateBoHuiCircle(cil);
	}

	@Override
	public Object updateCle(long parseLong) {

		return circleDao.updateCle(parseLong);
	}

	@Override
	public List<Map> findUpdateCTag(long circleId) {

		return circleDao.findUpdateCTag(circleId);
	}

	@Override
	public Object findCircleUserList(HashMap<String, Object> userC) {

		List<HashMap> list = (List<HashMap>) circleDao
				.findCircleUserList(userC);
		for (HashMap map : list) {
			map.put("user",
					topicDao.findTopicUserInfo(map.get("user_id").toString()));
		}
		return list;
	}

	@Override
	public Object findCircleUserListCount(long circleId) {

		return circleDao.findCircleUserListCount(circleId);
	}

	@Override
	public int delCircleUserInfo(HashMap<String, Object> delCU) {

		return circleDao.delCircleUserInfo(delCU);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public Object findallelCircleList(HashMap<String, Object> circleList) {

		List<HashMap> circlist = (List<HashMap>) circleDao
				.findallelCircleList(circleList);

		if (circlist.size() > 0) {
			for (HashMap circle : circlist) {
				if (circle.get("company_id") != null) {
					circle.put("user", topicDao.findTopicCompany(circle.get(
							"company_id").toString()));
				} else if (circle.get("user_id") != null) {
					circle.put("user", topicDao.findTopicUserInfo(circle.get(
							"user_id").toString()));
				}
				circle.put("addUserCount",
						circleDao.findUserCount(circle.get("circle_id")));
			}
		}

		return circlist;
	}

	@Override
	public Object findallelCircleListCount(HashMap<String, Object> circleList) {

		return circleDao.findallelCircleListCount(circleList);
	}

	@Override
	public Integer updateCircleStatus(HashMap map) {
		return circleDao.updateCircleStatus(map);
	}

	@Override
	public Integer updateCircleExamine(HashMap map) {

		return circleDao.updateCircleExamine(map);
	}

	@Override
	public Circle findCircleDetail(String circleId) {

		return circleDao.findCircleDetail(circleId);
	}

	@Override
	public Object findCircleTagList(String circleId) {

		return circleDao.findCircleTagList(circleId);
	}

	@Override
	public List<String> findCircleUserCardImage(Long circleId) {

		return circleDao.findCircleUserCardImage(circleId);
	}

	@Override
	public Object findCirUserListCount(HashMap<String, Object> userC) {

		return circleDao.findCirUserListCount(userC);
	}

	@Override
	public Object updatetbUserDStatus(String userId, String circleId,
			String Value) {
		String[] userIds = userId.split(",");
		if (userIds.length > 0) {

			for (String str : userIds) {
				HashMap<String, Comparable> map = new HashMap<String, Comparable>();
				map.put("userId", str);
				map.put("circleId", circleId);
				map.put("status", Integer.parseInt(Value));

				circleDao.updatetbUserDStatus(map);
			}
		}

		return "";
	}

	@Override
	public String updatetbUserDRoles(String userIdsa, String circleId,
			String status) {

		String msg = "";
		String[] userIds = userIdsa.split(",");
		if (userIds.length > 0) {
			HashMap<String, Object> map1 = new HashMap<String, Object>();
			map1.put("circleId", circleId);
			map1.put("size", 4);
			map1.put("startIndex", 0);
			map1.put("filedDname", "circle_role");
			map1.put("filedDValue", "1");
			List<?> list = (List<?>) circleDao.findCircleUserList(map1);
			if (list.size() + userIds.length > 4) {
				msg = "最多可设置4个管理员！";
			} else {
				for (String str : userIds) {
					HashMap<String, Comparable> map = new HashMap<String, Comparable>();
					map.put("userId", str);
					map.put("circleId", circleId);
					map.put("circleRole", Integer.parseInt(status));
					circleDao.updatetbUserDRoles(map);
				}
			}
		}
		return msg;
	}

	@Override
	public String updatetbUserDFlag(String userIdsa, String circleId,
			String status) {
		String[] userIds = userIdsa.split(",");
		if (userIds.length > 0) {
			for (String str : userIds) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("userId", str);
				map.put("circleId", circleId);
				map.put("delete_flag", Integer.parseInt(status));
				circleDao.delCircleUserInfo(map);
			}
		}
		return "";
	}

	@Override
	public Object findCircleLevelList() {
		return circleDao.findCircleLevelList();
	}

	@Override
	public String updaCircleLstop(String circleId, String filName,
			Integer filValue, Integer filnum) {
		String[] circlId = circleId.split(",");
		String msg = null;
		if (circlId.length > 0) {
			if (filnum > 0) {
				HashMap<String, Object> map1 = new HashMap<String, Object>();
				map1.put("filValue", filValue);
				map1.put("filName", filName);
				Integer i = circleDao.queryNumberOfcirclefilName(map1);
				if (i + circlId.length > filnum) {
					msg = "已有" + i + "个设置，总设置个数大于限定值！";
				}
			}
			if (msg == null) {
				for (String circId : circlId) {
					HashMap<String, Object> map = new HashMap<String, Object>();
					map.put("filValue", filValue);
					map.put("circleId", circId);
					map.put("filName", filName);
					circleDao.updaCircleLstop(map);
				}
			}
		} else {
			msg = "数据错误";
		}
		return msg;
	}

	
	@Override
	public void updCircleLevel(Integer levelId, Integer userNum,
			String levelInfo) {
		HashMap<String, Object> map=new HashMap<String, Object>();		
		map.put("userNum", userNum);
		map.put("levelInfo", levelInfo);
		
		if(levelId==null||levelId==0){
			Integer i=circleDao.selCirlelevelMaxId();
			map.put("levelId", i+1);
			circleDao.addnewLevelofCircle(map);
		}else{
			map.put("levelId", levelId);
			circleDao.updcirclelevel(map);
		}		
	}

	@Override
	public Object findCircleAddLevel(HashMap map) {
		
		return circleDao.findCircleAddLevel(map);
	}

	@Override
	public void reqCircleLevel(HashMap<String, Object> map) {		
		
		circleDao.reqCircleLevel(map);
	}

	

}
