package com.chj.entity;

/**
 * Tb_Activity_Tag
 */

public class ActivityTag implements java.io.Serializable {

	// Fields
	/**
	 * 中文注释 : 主键
	 * 约束 : pk
	 * 数据库中字段名 : activity_tag_id
	 * 数据库中类型类型 : bigint
	 * 数据库中类型长度 : 
	 * 注释 : 
	 */
	private Long activityTagId;
	/**
	 * 中文注释 : 活动相片
	 * 约束 : pk
	 * 数据库中字段名 : activity_photo_id
	 * 数据库中类型类型 : bigint
	 * 数据库中类型长度 : 
	 * 注释 : 
	 */
	private Long tagId;
	/**
	 * 中文注释 : 活动相片
	 * 约束 : pk
	 * 数据库中字段名 : activity_photo_id
	 * 数据库中类型类型 : bigint
	 * 数据库中类型长度 : 
	 * 注释 : 
	 */
	private Long activityId;

	// Constructors

	/** default constructor */
	public ActivityTag() {
	}

	/** full constructor */
	public ActivityTag(Long tagId, Long activityId) {
		this.tagId = tagId;
		this.activityId = activityId;
	}

	// Property accessors

	public Long getActivityTagId() {
		return this.activityTagId;
	}

	public void setActivityTagId(Long activityTagId) {
		this.activityTagId = activityTagId;
	}

	public Long getTagId() {
		return this.tagId;
	}

	public void setTagId(Long tagId) {
		this.tagId = tagId;
	}

	public Long getActivityId() {
		return this.activityId;
	}

	public void setActivityId(Long activityId) {
		this.activityId = activityId;
	}

}