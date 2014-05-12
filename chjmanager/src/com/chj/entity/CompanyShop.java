package com.chj.entity;

import java.sql.Timestamp;
import java.util.Date;

/**
 * 对应数据库：tb_company_shop
 */

public class CompanyShop implements java.io.Serializable {

	private static final long serialVersionUID = -2461749752726404917L;

	/**
	 * Fields
	 */
	private Long companyShopId;
	private String name;// 名称
	private String address;// 地址
	private String email;// 邮箱
	private Long companyId;// 公司ID
	private Long shopNumber;
	private Date registTime;// 注册时间
	private String logo;// 商标
	private String location;// 位置
	private Long categoryId;// 分类ID
	private Integer consumptionPer;// 人均消费
	private Integer orderField;// 订货地址
	private Integer sendTime;// 发送时间
	private Integer sendPrice;// 发送价格
	private String payType;// 支付类型
	private Long areaFirstId;// 第一区域ID
	private Long areaSecondId;// 第二区域ID
	private String deliverOk;// 是否外送
	private String terminalOk;// 终端
	private String linkman;// 联系人
	private String linkmanTel;// 联系人电话
	private Integer starScore;// 星级评分
	private String content;// 内容
	private String workTime;// 营业时间
	private Long deliverMoney;// 外送费
	private Long categoryTag;

	/**
	 * full constructor
	 */
	public CompanyShop() {
		super();
	}

	public CompanyShop(Long companyShopId, String name, String address,
			String email, Long companyId, Long shopNumber, Date registTime,
			String logo, String location, Long categoryId,
			Integer consumptionPer, Integer orderField, Integer sendTime,
			Integer sendPrice, String payType, Long areaFirstId,
			Long areaSecondId, String deliverOk, String terminalOk,
			String linkman, String linkmanTel, Integer starScore,
			String content, String workTime, Long deliverMoney, Long categoryTag) {
		super();
		this.companyShopId = companyShopId;
		this.name = name;
		this.address = address;
		this.email = email;
		this.companyId = companyId;
		this.shopNumber = shopNumber;
		this.registTime = registTime;
		this.logo = logo;
		this.location = location;
		this.categoryId = categoryId;
		this.consumptionPer = consumptionPer;
		this.orderField = orderField;
		this.sendTime = sendTime;
		this.sendPrice = sendPrice;
		this.payType = payType;
		this.areaFirstId = areaFirstId;
		this.areaSecondId = areaSecondId;
		this.deliverOk = deliverOk;
		this.terminalOk = terminalOk;
		this.linkman = linkman;
		this.linkmanTel = linkmanTel;
		this.starScore = starScore;
		this.content = content;
		this.workTime = workTime;
		this.deliverMoney = deliverMoney;
		this.categoryTag = categoryTag;
	}

	public Long getCompanyShopId() {
		return companyShopId;
	}

	public String getName() {
		return name;
	}

	public String getAddress() {
		return address;
	}

	public String getEmail() {
		return email;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public Long getShopNumber() {
		return shopNumber;
	}

	public Date getRegistTime() {
		return registTime;
	}

	public String getLogo() {
		return logo;
	}

	public String getLocation() {
		return location;
	}

	public Long getCategoryId() {
		return categoryId;
	}

	public Integer getConsumptionPer() {
		return consumptionPer;
	}

	public Integer getOrderField() {
		return orderField;
	}

	public Integer getSendTime() {
		return sendTime;
	}

	public Integer getSendPrice() {
		return sendPrice;
	}

	public String getPayType() {
		return payType;
	}

	public Long getAreaFirstId() {
		return areaFirstId;
	}

	public Long getAreaSecondId() {
		return areaSecondId;
	}

	public String getDeliverOk() {
		return deliverOk;
	}

	public String getTerminalOk() {
		return terminalOk;
	}

	public String getLinkman() {
		return linkman;
	}

	public String getLinkmanTel() {
		return linkmanTel;
	}

	public Integer getStarScore() {
		return starScore;
	}

	public String getContent() {
		return content;
	}

	public String getWorkTime() {
		return workTime;
	}

	public Long getDeliverMoney() {
		return deliverMoney;
	}

	public Long getCategoryTag() {
		return categoryTag;
	}

	public void setCompanyShopId(Long companyShopId) {
		this.companyShopId = companyShopId;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public void setShopNumber(Long shopNumber) {
		this.shopNumber = shopNumber;
	}

	public void setRegistTime(Date registTime) {
		this.registTime = registTime;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public void setConsumptionPer(Integer consumptionPer) {
		this.consumptionPer = consumptionPer;
	}

	public void setOrderField(Integer orderField) {
		this.orderField = orderField;
	}

	public void setSendTime(Integer sendTime) {
		this.sendTime = sendTime;
	}

	public void setSendPrice(Integer sendPrice) {
		this.sendPrice = sendPrice;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public void setAreaFirstId(Long areaFirstId) {
		this.areaFirstId = areaFirstId;
	}

	public void setAreaSecondId(Long areaSecondId) {
		this.areaSecondId = areaSecondId;
	}

	public void setDeliverOk(String deliverOk) {
		this.deliverOk = deliverOk;
	}

	public void setTerminalOk(String terminalOk) {
		this.terminalOk = terminalOk;
	}

	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}

	public void setLinkmanTel(String linkmanTel) {
		this.linkmanTel = linkmanTel;
	}

	public void setStarScore(Integer starScore) {
		this.starScore = starScore;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setWorkTime(String workTime) {
		this.workTime = workTime;
	}

	public void setDeliverMoney(Long deliverMoney) {
		this.deliverMoney = deliverMoney;
	}

	public void setCategoryTag(Long categoryTag) {
		this.categoryTag = categoryTag;
	}
	
	

}