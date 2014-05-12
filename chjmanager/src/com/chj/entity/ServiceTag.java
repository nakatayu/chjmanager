package com.chj.entity;


import java.io.Serializable;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: Richard
 * Date: 13-10-25
 * Time: 下午2:59
 * To change this template use File | Settings | File Templates.
 */
public class ServiceTag implements Serializable {
	public Long serviceTagId;
	public Long serviceId;
	public Long tagId;
	public Date addTime;
	public String status;

	public Long getServiceTagId() {
		return serviceTagId;
	}

	public void setServiceTagId(Long serviceTagId) {
		this.serviceTagId = serviceTagId;
	}

	public Long getServiceId() {
		return serviceId;
	}

	public void setServiceId(Long serviceId) {
		this.serviceId = serviceId;
	}

	public Long getTagId() {
		return tagId;
	}

	public void setTagId(Long tagId) {
		this.tagId = tagId;
	}


	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getAddTime() {
		return addTime;
	}

	public void setAddTime(Date addTime) {
		this.addTime = addTime;
	}
	
} 