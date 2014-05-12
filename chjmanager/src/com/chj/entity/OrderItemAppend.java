package com.chj.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.HashMap;

public class OrderItemAppend implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8365334745032151961L;
	private Long orderItemId;
	private String qty;
	private String total;
	private String price;
	
	private HashMap appendInfo;//name,isCheckbox
	private String parentName;
	
	public Long getOrderItemId() {
		return orderItemId;
	}
	public void setOrderItemId(Long orderItemId) {
		this.orderItemId = orderItemId;
	}
	public String getQty() {
		return qty;
	}
	public void setQty(String qty) {
		this.qty = qty;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getParentName() {
		return parentName;
	}
	public void setParentName(String parentName) {
		this.parentName = parentName;
	}
	public HashMap getAppendInfo() {
		return appendInfo;
	}
	public void setAppendInfo(HashMap appendInfo) {
		this.appendInfo = appendInfo;
	}
	
	
}
