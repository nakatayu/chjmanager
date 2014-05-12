package com.chj.entity;

import java.util.Date;

/**
 * 对应数据库表：tb_tag
 */

public class Tag implements java.io.Serializable {

	/**
	 * Fields
	 */
	private Long tagId;
	private String tagName;
	private String createAccount;
	private String createDate;
	private Long clickCount;
	private Long parentId;

	/**
	 * full constructor
	 */
	public Tag(Long tagId, String tagName, String createAccount,
			String createDate, Long clickCount, Long parentId) {
		this.tagId = tagId;
		this.tagName = tagName;
		this.createAccount = createAccount;
		this.createDate = createDate;
		this.clickCount = clickCount;
		this.parentId = parentId;
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

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
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

}
