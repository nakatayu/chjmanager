package com.chj.entity;

import java.util.Date;

/**
 * tb_activity_photo
 */

public class ActivityPhoto implements java.io.Serializable {

	// Fields
	/**
	 * 中文注释 : 活动相片
	 * 约束 : pk
	 * 数据库中字段名 : activity_photo_id
	 * 数据库中类型类型 : bigint
	 * 数据库中类型长度 : 
	 * 注释 : 
	 */
	private Long activityPhotoId;
	/**
	 * 中文注释 : 活动ID
	 * 约束 : fk
	 * 数据库中字段名 :activity_id 
	 * 数据库中类型类型 : bigint
	 * 数据库中类型长度 : 
	 * 注释 : 
	 */
	private Long activityId;
	/**
	 * 中文注释: 上传用户ID
	 * 约束 : 
	 * 数据库中字段名 : upload_user_id
	 * 数据库中类型类型 : bigint
	 * 数据库中类型长度 : 
	 * 注释 : 
	 */
	private Long uploadUserId;
	/**
	 * 中文注释: 上传时间
	 * 约束 : 
	 * 数据库中字段名 : upload_time
	 * 数据库中类型类型 : datetime
	 * 数据库中类型长度 : 
	 * 注释 : 
	 */
	private Date uploadTime;
	/**
	 * 中文注释: 文件名
	 * 约束 : 
	 * 数据库中字段名 : file_name
	 * 数据库中类型类型 : varchar
	 * 数据库中类型长度 : 255
	 * 注释 : 
	 */
	private String fileName;
	/**
	 * 中文注释: 文件路径
	 * 约束 : 
	 * 数据库中字段名 : file_path
	 * 数据库中类型类型 : varchar
	 * 数据库中类型长度 : 255
	 * 注释 : 
	 */
	private String filePath;

	// Constructors

	/** default constructor */
	public ActivityPhoto() {
	}

	/** minimal constructor */
	public ActivityPhoto(Long activityId, Long uploadUserId) {
		this.activityId = activityId;
		this.uploadUserId = uploadUserId;
	}

	/** full constructor */
	public ActivityPhoto(Long activityId, Long uploadUserId,
			Date uploadTime, String fileName, String filePath) {
		this.activityId = activityId;
		this.uploadUserId = uploadUserId;
		this.uploadTime = uploadTime;
		this.fileName = fileName;
		this.filePath = filePath;
	}

	// Property accessors

	public Long getActivityPhotoId() {
		return this.activityPhotoId;
	}

	public void setActivityPhotoId(Long activityPhotoId) {
		this.activityPhotoId = activityPhotoId;
	}

	public Long getActivityId() {
		return this.activityId;
	}

	public void setActivityId(Long activityId) {
		this.activityId = activityId;
	}

	public Long getUploadUserId() {
		return this.uploadUserId;
	}

	public void setUploadUserId(Long uploadUserId) {
		this.uploadUserId = uploadUserId;
	}

	public Date getUploadTime() {
		return this.uploadTime;
	}

	public void setUploadTime(Date uploadTime) {
		this.uploadTime = uploadTime;
	}

	public String getFileName() {
		return this.fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return this.filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

}