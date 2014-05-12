package com.chj.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.chj.dao.BaseDao;
import com.chj.entity.Topic;

@Repository
public class TopicDao extends BaseDao {

	public Object topicListCount(Map<String, Object> mapparam) {

		Object delcp;
		if (mapparam.get("userId") != null) {
			delcp = this.getSqlMapClientTemplate().queryForObject(
					"queryTopicCount", mapparam);
		} else {
			delcp = this.getSqlMapClientTemplate().queryForObject(
					"queryCTopicCount", mapparam);
		}

		return delcp;

	}

	public Object findTopicListCount(HashMap<String, Object> topicList) {

		Object topiccount = this.getSqlMapClientTemplate().queryForObject(
				"findTopicList", topicList);
		return topiccount;
	}

	// 话题列表

	/*
	 * public List<Object> findTopicList(HashMap<String, Object> topicList) {
	 * 
	 * Object topiclist; if(topicList.get("userId")!=null){ topiclist =
	 * this.getSqlMapClientTemplate().queryForList( "findTopicList", topicList);
	 * }else{ topiclist = this.getSqlMapClientTemplate().queryForList(
	 * "findCTopicList", topicList); }
	 * 
	 * return (List)topiclist; }
	 * 
	 * // 话题列表 public List<Object> findTopicList(Map<String, Object> map) { //
	 * Object topicList = this.getSqlMapClientTemplate().queryForList(
	 * "findTopicList",map); return (List) topicList; }
	 */

	public Long seveTopic(Topic top) {

		Object serl = (Long) this.getSqlMapClientTemplate().insert("instTopic",
				top);
		return (Long) serl;
	}

	// 话题 删除

	public void selectedTopic(List<Long> idList) {

		if (idList != null && idList.size() != 0) {
			for (int i = 0; i < idList.size(); i++) {
				Map map = new HashMap();
				map.put("topicId", idList.get(i));
				map.put("delete_flag", 2);
				this.getSqlMapClientTemplate().update("deleteTopic", map);
				this.getSqlMapClientTemplate().update("updateTopicTag", map);
				this.getSqlMapClientTemplate().update("updateTopicImge", map);
			}
		}
	}

	public Long updateCirleInfo(Topic top) {

		Long update = (long) this.getSqlMapClientTemplate().update(
				"updateCirleInfo", top);
		return update;
	}

	public Object findTopicC(Object circleId) {

		Object ftc = this.getSqlMapClientTemplate().queryForObject(
				"findTopicC", circleId);
		return ftc;
	}

	public Object findTopicCp(Object ccc) {

		Object top = this.getSqlMapClientTemplate().queryForObject(
				"findTopicCp", ccc);
		return top;
	}

	public void delTopicTag(Long topicId) {

		Object delTop = this.getSqlMapClientTemplate().delete("delTopicTag",
				topicId);
	}

	public Long saveTopic(HashMap<String, Object> htag) {

		Long saveTp = (Long) this.getSqlMapClientTemplate().insert("saveTopic",
				htag);
		return saveTp;
	}

	public Long updateTstatus(Topic toc) {

		Long update = (long) this.getSqlMapClientTemplate().update(
				"updateTstatus", toc);
		return update;
	}

	public List<Long> findTCid(Long userId) {

		HashMap<String, Object> um = new HashMap<String, Object>();
		um.put("userId", userId);
		um.put("delete_flag", 1);
		Object tcid = this.getSqlMapClientTemplate().queryForList(
				"findCirceId", um);
		return (List<Long>) tcid;
	}

	public Long seveTopicImge(HashMap<String, Object> saveImge) {

		Object sts = this.getSqlMapClientTemplate().insert("seveTopicImge",
				saveImge);
		return (Long) sts;
	}

	public void delTopicImge(Long topicId) {

		Object sts = this.getSqlMapClientTemplate().delete("delTopicImge",
				topicId);
	}

	public int updateNoTopInfo(Topic toc) {

		Object obj = this.getSqlMapClientTemplate().update("updateNoTopInfo",
				toc);
		return (Integer) obj;
	}

	public Object updateTop(String topicId) {

		Object updat = this.getSqlMapClientTemplate().queryForObject(
				"updateTop", topicId);
		return updat;
	}

	public List<Map> updateTopListTag(String topicId) {

		Object listmap = this.getSqlMapClientTemplate().queryForList(
				"updateTopListTag", topicId);
		return (List<Map>) listmap;
	}

	public Object findZhengTopicList(HashMap<String, Object> topicList) {

		return this.getSqlMapClientTemplate().queryForList(
				"findZhengTopicList", topicList);
	}

	public Object findZhengTopicListCount(HashMap<String, Object> topicList) {

		return this.getSqlMapClientTemplate().queryForObject(
				"findZhengTopicListCount", topicList);
	}

	public Object findTopicCompany(Object object) {
		HashMap map = new HashMap();
		map.put("companyId", object);
		return this.getSqlMapClientTemplate().queryForObject(
				"findCompanyOffull", map);// 来自company.xml

	}

	public Object findTopicUserInfo(String userId) {

		return this.getSqlMapClientTemplate().queryForObject("findTheUsername",
				Long.valueOf(userId));
	}

	public Object updateTopicStatus(HashMap map) {

		return this.getSqlMapClientTemplate().update("updateTopicStatus", map);
	}

	public Object updateTopicEXcetes(HashMap map) {

		return this.getSqlMapClientTemplate().update("updateTopicEXcetes", map);
	}

	public void updateTopic(Topic top) {

		this.getSqlMapClientTemplate().update("updateTopic", top);
	}

	public void deleteTopicTags(Long saveT) {

		this.getSqlMapClientTemplate().delete("deleteTopicTags", saveT);
	}

	public void deleteTopicImages(Long saveT) {

		this.getSqlMapClientTemplate().update("deleteTopicImages", saveT);
	}

	public Object findTopicDetail(String topicId) {
		return this.getSqlMapClientTemplate().queryForObject("findTopicDetail",
				Long.valueOf(topicId));
	}

	public Object findTopicImageList(String topicId) {
		return this.getSqlMapClientTemplate().queryForList(
				"findTopicImageList", Long.valueOf(topicId));
	}

	public Object findTopicTagList(String topicId) {
		return this.getSqlMapClientTemplate().queryForList(
				"selectTopicTagList", Long.valueOf(topicId));
	}

	public Object findTopicCommentList(HashMap<String, Object> toomlst) {

		return this.getSqlMapClientTemplate().queryForList(
				"findTopicCommentList", toomlst);
	}

	public Object findTopicCommentListCount(HashMap<String, Object> toomlst) {

		return this.getSqlMapClientTemplate().queryForObject(
				"findTopicCistCount", toomlst);
	}

	public Object updatCommentDelete(HashMap map) {

		return this.getSqlMapClientTemplate().update("updatCommentDelete", map);
	}

	public Object updaTopiclistTop(HashMap map) {

		return this.getSqlMapClientTemplate().update("updaTopiclistTop", map);
	}

	public Integer queryNumberOfStr(HashMap map) {
		Integer i = (Integer) this.getSqlMapClientTemplate().queryForObject(
				"queryNumberOfStr", map);
		return i;
	}
	
	//开发区后台  删除话题
	public void deleteTopic(List<Long> idList) {
		if (idList != null && idList.size() != 0) {
			for (int i = 0; i < idList.size(); i++) {
				Map map = new HashMap();
				map.put("topicId", idList.get(i));
				this.getSqlMapClientTemplate().update("deleteTopic1",map);
			}
		}
	}
}