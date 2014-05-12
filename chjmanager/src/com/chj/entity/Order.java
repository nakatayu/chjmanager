package com.chj.entity;

import java.util.Date;

/**
 * 商品  tb_order
 */
public class Order implements java.io.Serializable {
	
	private static final long serialVersionUID = -2461749752726404917L;
	
	private Long orderId;
	private String flowNo;
	private String payType;
	private Long userId;
	private Date orderTime;
	private String status;
	private String money;
	private Long shopId;
	private String name;
	private String address;
	private String phone;
	private String sendType;
	private String sendCost;
	private String serviceCost;
	private String total;
	private Date sendDate;
	private String info;
	private String payStatus;
	private String invoiceType;
	private String invoiceTitle;
	private String invoiceClass;
	
	private String shopName;
	
	public Long getOrderId() {
		return orderId;
	}
	public String getFlowNo() {
		return flowNo;
	}
	public String getPayType() {
		return payType;
	}
	public Long getUserId() {
		return userId;
	}
	public Date getOrderTime() {
		return orderTime;
	}
	public String getStatus() {
		return status;
	}
	
	public Long getShopId() {
		return shopId;
	}
	public String getName() {
		return name;
	}
	public String getAddress() {
		return address;
	}
	public String getPhone() {
		return phone;
	}
	public String getSendType() {
		return sendType;
	}
	
	public Date getSendDate() {
		return sendDate;
	}
	public String getInfo() {
		return info;
	}
	public String getPayStatus() {
		return payStatus;
	}
	public String getInvoiceType() {
		return invoiceType;
	}
	public String getInvoiceTitle() {
		return invoiceTitle;
	}
	public String getInvoiceClass() {
		return invoiceClass;
	}
	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
	public void setFlowNo(String flowNo) {
		this.flowNo = flowNo;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public void setShopId(Long shopId) {
		this.shopId = shopId;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setSendType(String sendType) {
		this.sendType = sendType;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}
	public void setInvoiceType(String invoiceType) {
		this.invoiceType = invoiceType;
	}
	public void setInvoiceTitle(String invoiceTitle) {
		this.invoiceTitle = invoiceTitle;
	}
	public void setInvoiceClass(String invoiceClass) {
		this.invoiceClass = invoiceClass;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getSendCost() {
		return sendCost;
	}
	public void setSendCost(String sendCost) {
		this.sendCost = sendCost;
	}
	public String getServiceCost() {
		return serviceCost;
	}
	public void setServiceCost(String serviceCost) {
		this.serviceCost = serviceCost;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	
	
	
}
