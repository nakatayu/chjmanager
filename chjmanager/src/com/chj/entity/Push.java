package com.chj.entity;

import java.util.Date;

/**
 * 推送功能 tb_push
 */
public class Push implements java.io.Serializable {

	private static final long serialVersionUID = -2461749752726404917L;

	private Long pushId;
	private Long roleId;
	private Long personnelId;
	private String content; // 推送内容
	private String manner; // 推送方式
	private Date applyTime; // 申请时间
	private Long qty; // 数量
	private String status; // 状态状态 //1 审核中 2 审核未通过 3 审核通 0未审核 默认是0
	private String sex; // 性别
	private String age; // 年龄
	private String opinion; // 审核意见
	private int deleteFlag; // 伪删除 状态
	private String relevanceType;
	private Integer personnelType;
	/**
	 * 关联类型
	 * 
	 * 购买过本店铺的人 1 关注过本店铺的人 2 圈友 3
	 */
	private String buyFlag;// 1购买过
	private String collectoionFlag;// 1关注过
	private String circleFlag;// 1圈友3
	private Integer phoneType;// 1:iphone  2:android 3:winphone
	private String field;//查询字段
	
	public void initFlag(){
		if(relevanceType!=null && relevanceType.contains("1")){
			setBuyFlag("1");
		}
		else if(relevanceType!=null && relevanceType.contains("2")){
			setCollectoionFlag("1");
		}
		if(relevanceType!=null && relevanceType.contains("3")){
			setCircleFlag("1");
		}
		
	}


	public int getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(int deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public String getRelevanceType() {
		return relevanceType;
	}

	public void setRelevanceType(String relevanceType) {
		this.relevanceType = relevanceType;
	}

	public Date getApplyTime() {
		return applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}

	public Long getPushId() {
		return pushId;
	}

	public String getContent() {
		return content;
	}

	public String getManner() {
		return manner;
	}

	public Long getQty() {
		return qty;
	}

	public String getStatus() {
		return status;
	}

	public String getSex() {
		return sex;
	}

	public String getAge() {
		return age;
	}

	public String getOpinion() {
		return opinion;
	}

	public void setPushId(Long pushId) {
		this.pushId = pushId;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setManner(String manner) {
		this.manner = manner;
	}

	public void setQty(Long qty) {
		this.qty = qty;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public void setOpinion(String opinion) {
		this.opinion = opinion;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public Long getPersonnelId() {
		return personnelId;
	}

	public void setPersonnelId(Long personnelId) {
		this.personnelId = personnelId;
	}

	public Integer getPersonnelType() {
		return personnelType;
	}

	public void setPersonnelType(Integer personnelType) {
		this.personnelType = personnelType;
	}


	public String getCollectoionFlag() {
		return collectoionFlag;
	}


	public void setCollectoionFlag(String collectoionFlag) {
		this.collectoionFlag = collectoionFlag;
	}


	public String getBuyFlag() {
		return buyFlag;
	}


	public void setBuyFlag(String buyFlag) {
		this.buyFlag = buyFlag;
	}


	public String getCircleFlag() {
		return circleFlag;
	}


	public void setCircleFlag(String circleFlag) {
		this.circleFlag = circleFlag;
	}


	public Integer getPhoneType() {
		return phoneType;
	}


	public void setPhoneType(Integer phoneType) {
		this.phoneType = phoneType;
	}


	public String getField() {
		return field;
	}


	public void setField(String field) {
		this.field = field;
	}
}
