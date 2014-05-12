package com.chj.entity;

import java.sql.Timestamp;
import java.util.Date;

/**
 * 对应数据库：tb_company_shop
 */

public class Shop implements java.io.Serializable {

	private static final long serialVersionUID = -2461749752726404917L;

	/**
	 * Fields
	 */
	private Long companyShopId;
	private String name;// 名称
	private String address;// 地址
	private String email;// 邮箱
	private Long companyId;// 公司ID
	private Long shopNumber;//店铺编号
	private Date registTime;// 注册时间
	private String logo;// 商标
	private String location;// 位置
	private Long categoryId;// 分类ID
	private String categoryName;// 分类ID
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
	private Long deliverMoney;// 外送费
	private Long categoryTag;
	private String lat;
    private String lng;
	private String serviceTime;
	private Long areaId; //地址标签
	private String workTime;// 营业时间
	private String shopType;//店铺类型
	private Integer examineResult;//店铺审核状态
	private Integer status;//1是创建申请2是修改申请3关闭申请
	/**
	 * full constructor
	 */

	public Shop(Long companyShopId, String name, String email, String address,
			Long companyId, Date registTime, String logo, String location,
			Long categoryId, Integer consumptionPer, Integer orderField,
			Integer sendTime, Integer sendPrice, String payType,
			Long areaFirstId, Long areaSecondId, String deliverOk,
			String terminalOk, String linkman, String linkmanTel,
			Integer starScore, String content, String workTime,
			Long deliverMoney, Long categoryTag,Long shopNumber,String lat,String lng,
			String serviceTime,Long areaId,String shopType,Integer examineResult,Integer status) {
		this.shopNumber = shopNumber;
		this.name = name;
		this.email = email;
		this.address = address;
		this.categoryId = categoryId;
		this.registTime = registTime;
		this.logo = logo;
		this.location = location;
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
		this.linkmanTel = linkmanTel;
		this.starScore = starScore;
		this.content = content;
		this.workTime = workTime;
		this.deliverMoney = deliverMoney;
		this.categoryTag = categoryTag;
		this.lng = lng;
		this.lat = lat;
		this.linkmanTel = linkmanTel;
		this.starScore = starScore;
		this.content = content;
		this.workTime = workTime;
		this.deliverMoney = deliverMoney;
		this.categoryTag = categoryTag;
		this.serviceTime=serviceTime;
		this.workTime=workTime;
		this.areaId=areaId;
		this.shopType=shopType;
		this.examineResult=examineResult;
		this.status=status;
	}
	
	
	public Integer getStatus() {
		return status;
	}


	public void setStatus(Integer status) {
		this.status = status;
	}


	public Integer getExamineResult() {
		return examineResult;
	}

	public void setExamineResult(Integer examineResult) {
		this.examineResult = examineResult;
	}

	public String getShopType() {
		return shopType;
	}

	public void setShopType(String shopType) {
		this.shopType = shopType;
	}

	public Long getAreaId() {
		return areaId;
	}

	public void setAreaId(Long areaId) {
		this.areaId = areaId;
	}
	
	public String getServiceTime() {
		return serviceTime;
	}


	public void setServiceTime(String serviceTime) {
		this.serviceTime = serviceTime;
	}
	public String getLat() {
		return lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public Long getShopNumber() {

		return shopNumber;
	}

	public void setShopNumber(Long shopNumber) {
		this.shopNumber = shopNumber;
	}

	public Long getCompanyShopId() {

		return companyShopId;
	}

	public void setCompanyShopId(Long companyShopId) {
		this.companyShopId = companyShopId;
	}

	public Long getCategoryTag() {
		return categoryTag;
	}

	public void setCategoryTag(Long categoryTag) {
		this.categoryTag = categoryTag;
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

	/**
	 * null constructor
	 */
	public Shop() {
		// TODO Auto-generated constructor stub
	}

	public String getName() {
		return name;
	}

	public String getEmail() {
		return email;
	}

	public String getAddress() {
		return address;
	}

	public Long getCompanyId() {
		return companyId;
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

	public void setEmail(String email) {
		this.email = email;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
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

	public String getCategoryName() {
		return categoryName;
	}


	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

}