package com.chj.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.aop.ThrowsAdvice;
import org.springframework.stereotype.Repository;

import com.chj.dao.BaseDao;
import com.chj.entity.Circle;
import com.chj.entity.CircleTag;

@Repository
public class CircleDao extends BaseDao {

	public Object circleListCount(HashMap<String, Object> circleList) {

		Object delcp;
		if (circleList.get("userId") != null) {
			delcp = this.getSqlMapClientTemplate().queryForObject(
					"queryCircleCount", circleList);
		} else {
			delcp = this.getSqlMapClientTemplate().queryForObject(
					"queryCCircleCount", circleList);
		}
		return delcp;
	}

	public Object findCircleListCount(HashMap<String, Object> circleList) {

		Object circlecount = this.getSqlMapClientTemplate().queryForObject(
				"findCircleList", circleList);
		return circlecount;
	}

	// 圈子列表

	public List<Object> findCircleList(List<Object> slist) {

		Object circlelist = this.getSqlMapClientTemplate().queryForList(
				"findCircleList", slist);
		return (List) circlelist;
	}

	// 圈子列表

	public List<Object> findCircleList(Map<String, Object> map) {

		Object circleList;
		if (map.get("userId") != null) {
			circleList = this.getSqlMapClientTemplate().queryForList(
					"findCircleList", map);
		} else {
			circleList = this.getSqlMapClientTemplate().queryForList(
					"findCCircleList", map);
		}
		return (List) circleList;
	}

	public void selectedCirle(List<Long> idList) {

		if (idList != null && idList.size() != 0) {
			for (int i = 0; i < idList.size(); i++) {
				Map map = new HashMap();
				map.put("circleId", idList.get(i));
				map.put("delete_flag", "2");
				this.getSqlMapClientTemplate().update("deleteCircle", map);
				this.getSqlMapClientTemplate().update("updateCircleTag", map);
			}
		}
	}

	public Long seveCircle(Circle cle) {

		Long serl = (Long) this.getSqlMapClientTemplate().insert("instCircle",
				cle);
		return serl;
	}

	public Long saveCTag(CircleTag ctag) {

		Long criTag = (Long) this.getSqlMapClientTemplate().insert("insetCtag",
				ctag);
		return criTag;
	}

	public Object closeCircle(Circle cir) {

		Object closeCircle = (long) this.getSqlMapClientTemplate().update(
				"updateCricle", cir);
		return closeCircle;
	}

	public Long updateCirleInfo(Circle circle) {

		Long updateCir = (long) this.getSqlMapClientTemplate().update(
				"updateCir", circle);
		return updateCir;
	}

	public Long updateCirleInfoTag(CircleTag cg) {

		Long updateTag = (Long) this.getSqlMapClientTemplate().insert(
				"insetCtag", cg);
		return updateTag;

	}

	public void delTag(Long circleId) {

		this.getSqlMapClientTemplate().delete("delCircleTag", circleId);

	}

	public Object findUserCount(Object circleId) {

		Object userC = this.getSqlMapClientTemplate().queryForObject(
				"findUserCount", circleId);
		return userC;

	}

	public Object findThemeCount(Object circleId) {

		Object themeC = this.getSqlMapClientTemplate().queryForObject(
				"findThemeCount", circleId);
		return themeC;
	}

	public int updateBoHuiCircle(Circle cil) {

		Object upc = this.getSqlMapClientTemplate().update("updateBoHuiCircle",
				cil);
		return (Integer) upc;
	}

	public Object updateCle(long parseLong) {

		Object ud = this.getSqlMapClientTemplate().queryForObject("updateCle",
				parseLong);
		return ud;
	}

	public List<Map> findUpdateCTag(long circleId) {

		Object fm = this.getSqlMapClientTemplate().queryForList(
				"findUpdateCTag", circleId);
		return (List<Map>) fm;
	}

	public void saveCircleUser(HashMap<String, Object> hs) {

		this.getSqlMapClientTemplate().insert("saveCircleUser", hs);
	}

	public Object findCircleUserList(HashMap<String, Object> userC) {

		Object fcul = this.getSqlMapClientTemplate().queryForList(
				"findCircleUserList", userC);
		return fcul;
	}

	public Object findCircleUserListCount(long circleId) {

		Object userC = this.getSqlMapClientTemplate().queryForObject(
				"findUserCount", circleId);
		return userC;
	}

	public int delCircleUserInfo(HashMap<String, Object> delCU) {

		Object dcu = this.getSqlMapClientTemplate().update("delCircleUserInfo",
				delCU);
		return (Integer) dcu;
	}

	public Object findallelCircleList(HashMap<String, Object> circleList) {
		return this.getSqlMapClientTemplate().queryForList("findppCircleList",
				circleList);
	}

	public Object findallelCircleListCount(HashMap<String, Object> circleList) {

		return this.getSqlMapClientTemplate().queryForObject(
				"findppCircleListCount", circleList);
	}

	public Integer updateCircleStatus(HashMap map) {

		return this.getSqlMapClientTemplate().update("updateCircleStatus", map);
	}

	public Integer updateCircleExamine(HashMap map) {

		return this.getSqlMapClientTemplate()
				.update("updateCircleExamine", map);
	}

	// Circle.xml
	public Circle findCircleDetail(String circleId) {
		return (Circle) this.getSqlMapClientTemplate().queryForObject(
				"findCircleDetail", Long.valueOf(circleId));
	}

	// Circle.xml
	public Object findCircleTagList(String circleId) {

		return this.getSqlMapClientTemplate().queryForList("findCircleTagList",
				Long.valueOf(circleId));
	}

	// circle.xml
	public List<String> findCircleUserCardImage(Long circleId) {

		return this.getSqlMapClientTemplate().queryForList(
				"findCircleUserCardImage", circleId);
	}

	// circle.xml
	public void updateCircle(Circle circle) {

		this.getSqlMapClientTemplate().update("updateCircle", circle);
	}

	// circle.xml
	public void deleteCircleTags(Long circleId) {

		this.getSqlMapClientTemplate().delete("deleteCircleTags", circleId);
	}

	// circle.xml
	public void deleteCardImages(Long circleId) {

		this.getSqlMapClientTemplate().update("deleteCardImages", circleId);
	}

	// circle.xml
	public void insertCircleCardImage(HashMap circletag) {

		this.getSqlMapClientTemplate().insert("insertCircleCardImage",
				circletag);
	}

	public Object findCirUserListCount(HashMap<String, Object> userC) {

		return this.getSqlMapClientTemplate().queryForObject(
				"findUserRoleCount", userC);
	}

	public Object updatetbUserDStatus(HashMap map) {
		int t = this.getSqlMapClientTemplate().update("updatetbUserDStatus",
				map);
		return t;
	}

	public void updatetbUserDdeleteFlag(HashMap map) {
		int t = this.getSqlMapClientTemplate().update(
				"updatetbUserDdeleteFlag", map);
	}

	public void updatetbUserDRoles(HashMap map) {
		int t = this.getSqlMapClientTemplate()
				.update("updatetbUserDRoles", map);
	}

	// circle.xml
	public Object findCircleLevelList() {

		return this.getSqlMapClientTemplate().queryForList(
				"findCircleLevelList");
	}

	public Integer queryNumberOfcirclefilName(HashMap<String, Object> map) {

		return (Integer) this.getSqlMapClientTemplate().queryForObject(
				"qryNumOfcirclefilme", map);
	}

	public Object updaCircleLstop(HashMap<String, Object> map) {

		return this.getSqlMapClientTemplate().update("updaCircleLstop", map);
	}

	public Integer selCirlelevelMaxId() {

		return (Integer) this.getSqlMapClientTemplate().queryForObject(
				"selCirlelevelMaxId");
	}

	public void addnewLevelofCircle(HashMap map) {

		this.getSqlMapClientTemplate().insert("addnewLevelCir", map);
	}

	public void updcirclelevel(HashMap map) {

		this.getSqlMapClientTemplate().update("updcirclelevel", map);
	}

	public Object findCircleAddLevel(HashMap map) {

		return this.getSqlMapClientTemplate().queryForObject(
				"findCircleAddLevel", map);
	}

	public void reqCircleLevel(HashMap<String, Object> map) {
		
		this.getSqlMapClientTemplate().insert("reqCircleLevel", map);		
	}

}