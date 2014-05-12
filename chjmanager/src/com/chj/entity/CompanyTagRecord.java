package com.chj.entity;

import java.util.Date;

/**
 * 对应数据库表：tb_company_tag
 */

public class CompanyTagRecord implements java.io.Serializable {

	/**
	 * Fields
	 */
	private Long companyTagId;
	private Long companyId;
	private Long tagId;
	private String status;
	private Date addTime;

	public CompanyTagRecord() {

		super();

	}
	
	

	public CompanyTagRecord(Long companyTagId, Long companyId, Long tagId,
			String status, Date addTime) {
		super();
		this.companyTagId = companyTagId;
		this.companyId = companyId;
		this.tagId = tagId;
		this.status = status;
		this.addTime = addTime;
	}



	public Long getCompanyTagId() {
		return companyTagId;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public Long getTagId() {
		return tagId;
	}

	public String getStatus() {
		return status;
	}

	public Date getAddTime() {
		return addTime;
	}

	public void setCompanyTagId(Long companyTagId) {
		this.companyTagId = companyTagId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public void setTagId(Long tagId) {
		this.tagId = tagId;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}
	

	
}