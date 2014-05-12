package com.chj.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.chj.common.Commonparam;

public class Topic implements Serializable {

	private static final long serialVersionUID = 1L;
	/**
	 * 话题编号
	 */
	private Long topicId;
	/**
	 * 话题创建人编号
	 */
	private Long userId;
	/**
	 * 圈子Id
	 */
	private Long circleId;
	
	private Long activityId;
	/**
	 * 话题名称
	 */
	private String topicName;
	/**
	 * 话题创建时间
	 */
	private Date createTime;
	/**
	 * 话题浏览次数
	 */
	private Long topicViews;
	/**
	 * 话题内容
	 */
	private String topicContent;
	private Long companyId;
	private String summary;//摘要
	private Integer deleteFlag;
	/**
	 * 话题状态
	 */
	private String status;
	
	private Long commentCount;
	private List<HashMap> tagList;
	private String adminMessage;
	private Integer examineResult;
	private Integer classics;
	
	public Topic() {
		super();
	}

	public Long getTopicId() {
		return topicId;
	}

	public void setTopicId(Long topicId) {
		this.topicId = topicId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getTopicName() {
		return topicName;
	}

	public void setTopicName(String topicName) {
		this.topicName = topicName;
	}

	public String getCreateTime() {
		if(this.createTime != null)
			return Commonparam.Date2Str(createTime);
					
		return "";
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Long getTopicViews() {
		return topicViews;
	}

	public void setTopicViews(Long topicViews) {
		this.topicViews = topicViews;
	}

	public String getTopicContent() {
		return topicContent;
	}

	public void setTopicContent(String topicContent) {
		this.topicContent = topicContent;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Long getCircleId() {
		return circleId;
	}

	public void setCircleId(Long circleId) {
		this.circleId = circleId;
	}

	public Long getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(Long commentCount) {
		this.commentCount = commentCount;
	}

	public List<HashMap> getTagList() {
		return tagList;
	}

	public void setTagList(List<HashMap> tagList) {
		this.tagList = tagList;
	}

	
	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public Long getActivityId() {
		return activityId;
	}

	public void setActivityId(Long activityId) {
		this.activityId = activityId;
	}

	public int getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(int deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public String getAdminMessage() {
		return adminMessage;
	}

	public void setAdminMessage(String adminMessage) {
		this.adminMessage = adminMessage;
	}

	public int getExamineResult() {
		return examineResult;
	}

	public void setExamineResult(int examineResult) {
		this.examineResult = examineResult;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public Integer getClassics() {
		return classics;
	}

	public void setClassics(Integer classics) {
		this.classics = classics;
	}

}
