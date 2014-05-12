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
import com.chj.entity.CircleTag;
import com.chj.entity.Topic;
import com.chj.service.ActivityManager;
import com.chj.service.CircleManager;
import com.chj.service.TopicManager;

@Service
@Transactional
public class TopicManagerImpl implements TopicManager {
	@Autowired
	TopicDao topicDao;

	@Override
	public Object topicListCount(Map<String, Object> mapparam) {

		return topicDao.topicListCount(mapparam);
	}

	@Override
	public Object findTopicListCount(HashMap<String, Object> topicList) {

		return topicDao.findTopicListCount(topicList);
	}

	/*
	 * @Override public List<Object> findTopicList(HashMap<String, Object>
	 * topicList) { return topicDao.findTopicList(topicList); }
	 * 
	 * @Override public List<Object> findTopicList(Map<String, Object> map) { //
	 * return topicDao.findTopicList(map); }
	 */

	@Override
	public Long seveTopic(Topic top, String tagList, String topicImage,
			String imgChanged) {

		Long saveT = null;
		if (top.getTopicId() != null) {
			saveT = top.getTopicId();
			topicDao.updateTopic(top);
			if (tagList != null && tagList.trim().length() > 0
					&& tagList.split(",").length > 0) {
				topicDao.deleteTopicTags(saveT);
			}
			if (imgChanged != null && imgChanged.equals("1")) {
				topicDao.deleteTopicImages(saveT);
			}
		} else {
			saveT = topicDao.seveTopic(top);
		}

		String[] topT = tagList.split(",");
		if (tagList != null && tagList.trim().length() > 0) {
			for (int i = 0; i < topT.length; i++) {
				if (topT[i].trim().length() > 0) {
					HashMap<String, Object> htag = new HashMap<String, Object>();
					htag.put("topic_id", saveT);
					htag.put("tag_id", topT[i]);
					htag.put("create_time", (new Date()));
					htag.put("delete_flag", 1);
					Long saveTopTag = topicDao.saveTopic(htag);
				}

			}
		}
		/**
		 * 保存图片
		 */
		if (topicImage != null && topicImage.trim().length() > 0) {
			String[] topImges = topicImage.split("####");
			for (int i = 0; i < topImges.length; i++) {
				if (topImges[i].trim().length() > 0) {
					HashMap<String, Object> saveImge = new HashMap<String, Object>();
					saveImge.put("topic_id", saveT);
					saveImge.put("file_path", topImges[i]);
					saveImge.put("create_time", (new Date()));
					saveImge.put("delete_flag", "1");
					Long saveImges = topicDao.seveTopicImge(saveImge);
				}

			}
		}
		return (long) 1;
	}

	@Override
	public void selectedTopic(List<Long> idList) {

		topicDao.selectedTopic(idList);
	}

	@Override
	public Long updateTopic(Topic top, String saveTTag, String topImge) {

		topicDao.updateCirleInfo(top);
		String[] sttag = saveTTag.split(",");
		if (saveTTag != null && saveTTag.trim().length() > 0
				&& !saveTTag.equals("")) {
			topicDao.delTopicTag(top.getTopicId());
			for (int i = 0; i < sttag.length; i++) {
				HashMap<String, Object> htag = new HashMap<String, Object>();
				htag.put("topic_id", top.getTopicId());
				htag.put("tag_id", sttag[i]);
				htag.put("create_time", (new Date()));
				htag.put("delete_flag", 1);
				Long saveTopTag = topicDao.saveTopic(htag);
			}
			/**
			 * 保存图片
			 */
			if (topImge != null && topImge.trim().length() > 0
					&& !topImge.equals("")) {
				topicDao.delTopicImge(top.getTopicId());

				String[] topImges = topImge.split(",");
				for (int i = 0; i < topImges.length; i++) {
					HashMap<String, Object> saveImge = new HashMap<String, Object>();
					saveImge.put("topic_id", top.getTopicId());
					saveImge.put("file_path", topImges[i]);
					saveImge.put("create_time", (new Date()));
					saveImge.put("delete_flag", "1");
					Long saveImges = topicDao.seveTopicImge(saveImge);
				}
			}
		}
		return (long) 1;
	}

	@Override
	public Object findTopicC(Object circleId) {

		return topicDao.findTopicC(circleId);
	}

	@Override
	public Object findTopicCp(Object ccc) {

		return topicDao.findTopicCp(ccc);
	}

	@Override
	public Long updateTstatus(Topic toc) {

		return topicDao.updateTstatus(toc);
	}

	@Override
	public List<Long> findTCid(Long userId) {

		return topicDao.findTCid(userId);
	}

	@Override
	public int updateNoTopInfo(Topic toc) {

		return topicDao.updateNoTopInfo(toc);
	}

	@Override
	public Object updateTop(String topicId) {

		return topicDao.updateTop(topicId);
	}

	@Override
	public List<Map> updateTopListTag(String topicId) {

		return topicDao.updateTopListTag(topicId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Object findZhengTopicList(HashMap<String, Object> topicList) {

		List<HashMap<?, ?>> toplt = (List<HashMap<?, ?>>) topicDao
				.findZhengTopicList(topicList);
		if (toplt.size() > 0) {
			for (HashMap topic : toplt) {
				if (topic.get("company_id") != null) {
					topic.put("user", topicDao.findTopicCompany(topic.get(
							"company_id").toString()));
				} else if (topic.get("user_id") != null) {
					topic.put("user", topicDao.findTopicUserInfo(topic.get(
							"user_id").toString()));
				}
				topic.put("commentCount",
						topicDao.findTopicCp(topic.get("topic_id").toString()));
			}
		}

		return toplt;
	}

	@Override
	public Object findZhengTopicListCount(HashMap<String, Object> topicList) {

		return topicDao.findZhengTopicListCount(topicList);
	}

	@Override
	public Object updateTopicStatus(HashMap map) {

		return topicDao.updateTopicStatus(map);
	}

	@Override
	public Object updateTopicEXcetes(HashMap map) {

		return topicDao.updateTopicEXcetes(map);
	}

	@Override
	public Object findTopicDetail(String topicId) {
		return topicDao.findTopicDetail(topicId);
	}

	@Override
	public Object findTopicImageList(String topicId) {

		return topicDao.findTopicImageList(topicId);
	}

	@Override
	public Object findTopicTagList(String topicId) {

		return topicDao.findTopicTagList(topicId);
	}

	@Override
	public Object findTopicCommentList(HashMap<String, Object> topCommentlst) {
		List<HashMap<?, ?>> comlist = (List<HashMap<?, ?>>) topicDao
				.findTopicCommentList(topCommentlst);
		if (comlist.size() > 0) {
			for (HashMap circle : comlist) {
				String usId = circle.get("user_id").toString();
				circle.put("user", topicDao.findTopicUserInfo(usId));
				HashMap map = new HashMap();
				map.put("toUserId", usId);
				map.put("topicId", topCommentlst.get("topicId"));
				circle.put("comCount", topicDao.findTopicCommentListCount(map));
				if (circle.get("to_user_id") != null) {
					String useId = circle.get("to_user_id").toString();
					circle.put("touser", topicDao.findTopicUserInfo(useId));
				}
			}
		}
		return comlist;
	}

	@Override
	public Object findTopicCommentListCount(HashMap<String, Object> toomlst) {

		return topicDao.findTopicCommentListCount(toomlst);
	}

	@Override
	public Object updatCommentDelete(String topicId, String topicCommentId) {
		String[] comId = topicCommentId.split(",");
		if (comId.length > 0) {
			for (String str : comId) {
				HashMap map = new HashMap();
				map.put("comId",str);
				map.put("topicId", topicId);
				topicDao.updatCommentDelete(map);
			}
		}
		return null;
	}

	@Override
	public String updaTopiclistTop(String topicId, String selfRole,
			String filName, Integer filValue, Integer filnum) {
		String[] topId = topicId.split(",");
		String msg = null;
		if (topId.length > 0) {
			if(filnum>0){
				HashMap<String, Object> map1=new HashMap<String, Object>();
				map1.put("filValue",filValue);
				map1.put("filName", filName);
				map1.put("selfRole", selfRole);
				Integer i=topicDao.queryNumberOfStr(map1);
				if(i+topId.length>filnum){
					msg="已有"+i+"个设置，总设置个数大于限定值！";
				}
			}
			if(msg == null){
				for (String toId : topId) {
					HashMap<String, Object> map = new HashMap<String, Object>();
					map.put("filValue",filValue);
					map.put("topicId", toId);
					map.put("filName", filName);
					topicDao.updaTopiclistTop(map);
				}
			}
		}else{
			msg="数据错误";
		}
		return msg;
	}
	
	//开发区后台   删除话题
	@Override
	public void deleteTopic(List list) {
		// TODO Auto-generated method stub
		topicDao.deleteTopic(list);
	}
	
	
}
