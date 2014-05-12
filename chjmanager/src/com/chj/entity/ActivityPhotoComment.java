package com.chj.entity;

import java.util.Date;

/**
 * tb_activity_photo_comment
 */

public class ActivityPhotoComment implements java.io.Serializable {

	// Fields

	private Long actityPhotoCommentId;
	private Long activityPhotoId;
	private String content;
	private Date commentTime;
	private Long reportPhotoCommentId;
	private Long userId;

	// Constructors

	/** default constructor */
	public ActivityPhotoComment() {
	}

	/** minimal constructor */
	public ActivityPhotoComment(Long activityPhotoId, Long userId) {
		this.activityPhotoId = activityPhotoId;
		this.userId = userId;
	}

	/** full constructor */
	public ActivityPhotoComment(Long activityPhotoId, String content,
			Date commentTime, Long reportPhotoCommentId, Long userId) {
		this.activityPhotoId = activityPhotoId;
		this.content = content;
		this.commentTime = commentTime;
		this.reportPhotoCommentId = reportPhotoCommentId;
		this.userId = userId;
	}

	// Property accessors

	public Long getActityPhotoCommentId() {
		return this.actityPhotoCommentId;
	}

	public void setActityPhotoCommentId(Long actityPhotoCommentId) {
		this.actityPhotoCommentId = actityPhotoCommentId;
	}

	public Long getActivityPhotoId() {
		return this.activityPhotoId;
	}

	public void setActivityPhotoId(Long activityPhotoId) {
		this.activityPhotoId = activityPhotoId;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCommentTime() {
		return this.commentTime;
	}

	public void setCommentTime(Date commentTime) {
		this.commentTime = commentTime;
	}

	public Long getReportPhotoCommentId() {
		return this.reportPhotoCommentId;
	}

	public void setReportPhotoCommentId(Long reportPhotoCommentId) {
		this.reportPhotoCommentId = reportPhotoCommentId;
	}

	public Long getUserId() {
		return this.userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

}