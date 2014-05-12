package com.chj.entity;

import java.util.Date;

/**
 * 对应数据库表：tb_tag
 */

public class CompanyTag implements java.io.Serializable {

	/**
	 * Fields
	 */
	private Long tagId;
	private String tagName;
	private String createAccount;
	private Date createDate;
	private Long clickCount;
	private Long parentId;
	private Long companyId;
	private Integer deleteFlag;
	private Date addTime;
	
	
	public CompanyTag(){
		
		super();
		
	}
	

	/**
	 * full constructor
	 */
	public CompanyTag(Long tagId, String tagName, String createAccount,
			Date createDate, Long clickCount, Long parentId,Long companyId, Integer deleteFlag, Date addTime) {
		super();
		this.tagId = tagId;
		this.tagName = tagName;
		this.createAccount = createAccount;
		this.createDate = createDate;
		this.clickCount = clickCount;
		this.parentId = parentId;
		this.companyId=companyId;
		this.deleteFlag=deleteFlag;
		this.addTime=addTime;
	}



	public Date getAddTime() {
		return addTime;
	}


	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}


	public Integer getDeleteFlag() {
		return deleteFlag;
	}


	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}


	public Long getCompanyId() {
		return companyId;
	}


	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}


	public long getTagId() {
		return tagId;
	}

	public void setTagId(long tagId) {
		this.tagId = tagId;
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public String getCreateAccount() {
		return createAccount;
	}

	public void setCreateAccount(String createAccount) {
		this.createAccount = createAccount;
	}


	public long getClickCount() {
		return clickCount;
	}

	public void setClickCount(long clickCount) {
		this.clickCount = clickCount;
	}

	public long getParentId() {
		return parentId;
	}

	public void setParentId(long parentId) {
		this.parentId = parentId;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setTagId(Long tagId) {
		this.tagId = tagId;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public void setClickCount(Long clickCount) {
		this.clickCount = clickCount;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	

}
