package com.chj.entity;

import java.util.Date;

import com.chj.common.Commonparam;

/**
 * 
 * 对应 tb_company
 * 
 */
public class Company implements java.io.Serializable {

	private Long companyId;

	private String name;

	private String address;

	private String email;

	private Date registDate;

	private String logo;

	private String companyType;
	
	private String linkman;
	
	private String linkmanTel;
	
	private String operateScope;
	
	private String companyInfo;
	
	private String companyURL;
	
	private Integer orderField;
	
	private Integer deleteFlag;
	private Integer status;
	private Integer type;
	private Integer examineResult;  
	private String  starScore;
	/** default constructor */
	public Company() {
	}
	
	public Company(Long companyId, String name, String address, String email,
			Date registDate, String logo, String companyType, String linkman,
			String linkmanTel, String operateScope, String companyInfo,
			String companyURL, Integer orderField, Integer deleteFlag,
			Integer status, Integer type, Integer examineResult,
			String starScore) {
		super();
		this.companyId = companyId;
		this.name = name;
		this.address = address;
		this.email = email;
		this.registDate = registDate;
		this.logo = logo;
		this.companyType = companyType;
		this.linkman = linkman;
		this.linkmanTel = linkmanTel;
		this.operateScope = operateScope;
		this.companyInfo = companyInfo;
		this.companyURL = companyURL;
		this.orderField = orderField;
		this.deleteFlag = deleteFlag;
		this.status = status;
		this.type = type;
		this.examineResult = examineResult;
		this.starScore = starScore;
	}

	public String getStarScore() {
		return starScore;
	}


	public void setStarScore(String starScore) {
		this.starScore = starScore;
	}


	public Integer getExamineResult() {
		return examineResult;
	}


	public void setExamineResult(Integer examineResult) {
		this.examineResult = examineResult;
	}


	public Integer getStatus() {
		return status;
	}


	public Integer getType() {
		return type;
	}


	public void setStatus(Integer status) {
		this.status = status;
	}


	public void setType(Integer type) {
		this.type = type;
	}


	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRegistDate() {
		
		
		return Commonparam.Date2Str(registDate);
	}

	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getCompanyType() {
		return companyType;
	}

	public void setCompanyType(String companyType) {
		this.companyType = companyType;
	}

	public String getLinkman() {
		return linkman;
	}

	public String getLinkmanTel() {
		return linkmanTel;
	}

	public String getOperateScope() {
		return operateScope;
	}

	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}

	public void setLinkmanTel(String linkmanTel) {
		this.linkmanTel = linkmanTel;
	}

	public void setOperateScope(String operateScope) {
		this.operateScope = operateScope;
	}


	public String getCompanyInfo() {
		return companyInfo;
	}


	public void setCompanyInfo(String companyInfo) {
		this.companyInfo = companyInfo;
	}


	public String getCompanyURL() {
		return companyURL;
	}


	public void setCompanyURL(String companyURL) {
		this.companyURL = companyURL;
	}


	public Integer getDeleteFlag() {
		return deleteFlag;
	}


	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}


	public Integer getOrderField() {
		return orderField;
	}


	public void setOrderField(Integer orderField) {
		this.orderField = orderField;
	}
	

}