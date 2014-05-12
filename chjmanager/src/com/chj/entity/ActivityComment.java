package com.chj.entity;

import java.util.Date;

/**
 * tb_activity_comment
 */

public class ActivityComment implements java.io.Serializable {

	// Fields

	private Long activityCommentId;
	private Long userId;
	private Date commentTime;
	private Long reportCommentId;
	private String content;
	private Long activityId;

	// Constructors

	/** default constructor */
	public ActivityComment() {
	}

	/** minimal constructor */
	public ActivityComment(Long activityId) {
		this.activityId = activityId;
	}

	/** full constructor */
	public ActivityComment(Long userId, Date commentTime,
			Long reportCommentId, String content, Long activityId) {
		this.userId = userId;
		this.commentTime = commentTime;
		this.reportCommentId = reportCommentId;
		this.content = content;
		this.activityId = activityId;
	}

	// Property accessors

	public Long getActivityCommentId() {
		return this.activityCommentId;
	}

	public void setActivityCommentId(Long activityCommentId) {
		this.activityCommentId = activityCommentId;
	}

	public Long getUserId() {
		return this.userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Date getCommentTime() {
		return this.commentTime;
	}

	public void setCommentTime(Date commentTime) {
		this.commentTime = commentTime;
	}

	public Long getReportCommentId() {
		return this.reportCommentId;
	}

	public void setReportCommentId(Long reportCommentId) {
		this.reportCommentId = reportCommentId;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Long getActivityId() {
		return this.activityId;
	}

	public void setActivityId(Long activityId) {
		this.activityId = activityId;
	}

}