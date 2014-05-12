package com.chj.entity;

import java.util.Date;


/**
 * tb_activity
 */

public class Activity implements java.io.Serializable {

	// Fields
	/**
	 * 中文注释: 活动
	 * 约束 : pk
	 * 数据库中字段名 : activity_id
	 * 数据库中类型类型 : bigint
	 * 数据库中类型长度 : 
	 * 注释 : 
	 */
	private Long activityId;
	/**
	 * 中文注释: 
	 * 约束 : fk
	 * 数据库中字段名 : create_user_id
	 * 数据库中类型类型 : bigint
	 * 数据库中类型长度 : 
	 * 注释 : 
	 */
	private Long createUserId;
	/**
	 * 中文注释: 创建时间
	 * 约束 : 
	 * 数据库中字段名 : create_time
	 * 数据库中类型类型 : datetime
	 * 数据库中类型长度 : 
	 * 注释 : 
	 */
	private Date createTime;
	/**
	 * 中文注释: 状态
	 * 约束 : 
	 * 数据库中字段名 : status
	 * 数据库中类型类型 : varchar
	 * 数据库中类型长度 : 2
	 * 注释 : 通过，未通过，结束等
	 */
	private String status;
	/**
	 * 中文注释: 管理员消息
	 * 约束 : 
	 * 数据库中字段名 : admin_message
	 * 数据库中类型类型 : varchar
	 * 数据库中类型长度 : 255
	 * 注释 : 用于管理员驳回消息，
	 */
	private String adminMessage;
	/**
	 * 中文注释: 
	 * 约束 : 
	 * 数据库中字段名 : address
	 * 数据库中类型类型 : varchar
	 * 数据库中类型长度 : 255
	 * 注释 : 
	 */
	private String address;
	/**
	 * 中文注释: 标题
	 * 约束 : 
	 * 数据库中字段名 : activity_title
	 * 数据库中类型类型 : varchar
	 * 数据库中类型长度 : 63
	 * 注释 : 
	 */
	private String activityTitle;
	/**
	 * 中文注释: 内容
	 * 约束 : 
	 * 数据库中字段名 : activity_content
	 * 数据库中类型类型 : varchar
	 * 数据库中类型长度 : 63
	 * 注释 : 
	 */
	private String activityContent;
	/**
	 * 中文注释: 最后一次修改时间
	 * 约束 : 
	 * 数据库中字段名 : last_edit_time
	 * 数据库中类型类型 : date_time
	 * 数据库中类型长度 : 
	 * 注释 : 
	 */
	private Date lastEditTime;
	/**
	 * 中文注释: 是否需要审核
	 * 约束 : 
	 * 数据库中字段名 : join_type
	 * 数据库中类型类型 : varchar
	 * 数据库中类型长度 : 2
	 * 注释 : 
	 */
	private String joinType;
	/**
	 * 中文注释: 活动开始时间
	 * 约束 : 
	 * 数据库中字段名 : begin_time
	 * 数据库中类型类型 : datetime
	 * 数据库中类型长度 : 
	 * 注释 : 
	 */
	private String beginTime;
	/**
	 * 中文注释: 结束时间
	 * 约束 : 
	 * 数据库中字段名 : end_time
	 * 数据库中类型类型 : datetime
	 * 数据库中类型长度 : 
	 * 注释 : 
	 */
	private String endTime;

	// Constructors
	private Date enrollEndTime;
	private Date enrollBeginTime;
  private String summary;
  private Long circleId;
  private String isCheck;
  private Long userMax;
  private String isQrcode;
  private String isMoney;
  private Long browseCount;
  private String updateUserId;
  private String activityImage;
  private Integer deleteFlag;
  private Integer examineResult;
  private String isExtend;
  private Long companyId;
  private String payType;
  private String moneyDetail;
  private Integer moneynum;
  private String lat;
  private String lng;
  private String traffic;//交通推荐
  
	/** default constructor */
	public Activity() {
	}

	/** full constructor */
	public Activity(Long createUserId, Date createTime, String status,
			String adminMessage, String address, String activityTitle,
			String activityContent, Date lastEditTime, String joinType,
			String beginTime, String endTime,String summary,Long circleId,
			String isCheck,Long userMax,String isQrcode,String isMoney,
			Long browseCount, String updateUserId,Integer deleteFlag,
			 Integer examineResult,String isExtend) {
		this.createUserId = createUserId;
		this.createTime = createTime;
		this.status = status;
		this.adminMessage = adminMessage;
		this.address = address;
		this.activityTitle = activityTitle;
		this.activityContent = activityContent;
		this.lastEditTime = lastEditTime;
		this.joinType = joinType;//上线下线
		this.beginTime = beginTime;
		this.endTime = endTime;
		this.summary=summary;
		this.circleId=circleId;
		this.isCheck=isCheck;//是否验证
		this.userMax=userMax;
		this.isQrcode=isQrcode;//是否生产二维码
		this.isMoney=isMoney;
		this.browseCount=browseCount;
		this.updateUserId=updateUserId;
		this.deleteFlag=deleteFlag;
		this.examineResult=examineResult;
		this.isExtend=isExtend;
	}

	// Property accessors

	public Long getActivityId() {
		return this.activityId;
	}

	public void setActivityId(Long activityId) {
		this.activityId = activityId;
	}

	public Long getCreateUserId() {
		return this.createUserId;
	}

	public void setCreateUserId(Long createUserId) {
		this.createUserId = createUserId;
	}

	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getAdminMessage() {
		return this.adminMessage;
	}

	public void setAdminMessage(String adminMessage) {
		this.adminMessage = adminMessage;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getActivityTitle() {
		return this.activityTitle;
	}

	public void setActivityTitle(String activityTitle) {
		this.activityTitle = activityTitle;
	}

	public String getActivityContent() {
		return this.activityContent;
	}

	public void setActivityContent(String activityContent) {
		this.activityContent = activityContent;
	}

	public Date getLastEditTime() {
		return this.lastEditTime;
	}

	public void setLastEditTime(Date lastEditTime) {
		this.lastEditTime = lastEditTime;
	}

	public String getJoinType() {
		return this.joinType;
	}

	public void setJoinType(String joinType) {
		this.joinType = joinType;
	}

	public String getBeginTime() {
		return this.beginTime;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	public String getEndTime() {
		return this.endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public Long getCircleId() {
		return circleId;
	}

	public void setCircleId(Long circleId) {
		this.circleId = circleId;
	}

	public String getIsCheck() {
		return isCheck;
	}

	public void setIsCheck(String isCheck) {
		this.isCheck = isCheck;
	}

	public Long getUserMax() {
		return userMax;
	}

	public void setUserMax(Long userMax) {
		this.userMax = userMax;
	}

	public String getIsQrcode() {
		return isQrcode;
	}

	public void setIsQrcode(String isQrcode) {
		this.isQrcode = isQrcode;
	}

	public String getIsMoney() {
		return isMoney;
	}

	public void setIsMoney(String isMoney) {
		this.isMoney = isMoney;
	}

	public Long getBrowseCount() {
		return browseCount;
	}

	public void setBrowseCount(Long browseCount) {
		this.browseCount = browseCount;
	}

	public String getUpdateUserId() {
		return updateUserId;
	}

	public void setUpdateUserId(String updateUserId) {
		this.updateUserId = updateUserId;
	}

	public String getActivityImage() {
		return activityImage;
	}

	public void setActivityImage(String activityImage) {
		this.activityImage = activityImage;
	}

	public Integer getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public Integer getExamineResult() {
		return examineResult;
	}

	public void setExamineResult(Integer examineResult) {
		this.examineResult = examineResult;
	}

	public String getIsExtend() {
		return isExtend;
	}

	public void setIsExtend(String isExtend) {
		this.isExtend = isExtend;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public String getMoneyDetail() {
		return moneyDetail;
	}

	public void setMoneyDetail(String moneyDetail) {
		this.moneyDetail = moneyDetail;
	}

	public Integer getMoneynum() {
		return moneynum;
	}

	public void setMoneynum(Integer moneynum) {
		this.moneynum = moneynum;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getTraffic() {
		return traffic;
	}

	public void setTraffic(String traffic) {
		this.traffic = traffic;
	}

	public Date getEnrollEndTime() {
		return enrollEndTime;
	}

	public void setEnrollEndTime(Date enrollEndTime) {
		this.enrollEndTime = enrollEndTime;
	}

	public Date getEnrollBeginTime() {
		return enrollBeginTime;
	}

	public void setEnrollBeginTime(Date enrollBeginTime) {
		this.enrollBeginTime = enrollBeginTime;
	}

}