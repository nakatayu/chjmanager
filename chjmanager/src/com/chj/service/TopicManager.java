package com.chj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.chj.entity.Topic;




public interface TopicManager {
	

    public Object topicListCount(Map<String, Object> mapparam);
	
	public Object findTopicListCount(HashMap<String, Object> topicList);
	
	
//    public List<Object> findTopicList(HashMap<String, Object> topicList);//话题列表
//	
//	public List<Object> findTopicList(Map<String, Object> map);//话题列表

	public Long seveTopic(Topic top,String tagList, String topicImage,
			String imgChanged);

	public void selectedTopic(List<Long> idList);

	public Long updateTopic(Topic top,String saveTTag,String topImge);

	public Object findTopicC(Object circleId);

	public Object findTopicCp(Object ccc);

	public Long updateTstatus(Topic toc);

	public List<Long> findTCid(Long userId);

	public int updateNoTopInfo(Topic toc);

	public Object updateTop(String topicId);

	public List<Map> updateTopListTag(String topicId);

	public Object findZhengTopicList(HashMap<String, Object> topicList);

	public Object findZhengTopicListCount(HashMap<String, Object> topicList);

	public Object updateTopicStatus(HashMap map);

	public Object updateTopicEXcetes(HashMap map);

	public Object findTopicDetail(String topicId);

	public Object findTopicImageList(String topicId);

	public Object findTopicTagList(String topicId);

	public Object findTopicCommentList(HashMap<String, Object> topCommentlst);

	public Object findTopicCommentListCount(
			HashMap<String, Object> topCommentlst);

	public Object updatCommentDelete(String topicId, String topicCommentId);

	public String updaTopiclistTop(String topicId, String selfRole,
			String filName, Integer filValue, Integer filnum);
	public void deleteTopic(List list);//开发区后台   删除话题
}
