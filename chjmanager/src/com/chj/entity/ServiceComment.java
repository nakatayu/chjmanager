package com.chj.entity;

import jxl.write.DateTime;

import java.io.Serializable;

/**
 * Created with IntelliJ IDEA.
 * User: Richard
 * Date: 13-10-25
 * Time: 下午2:59
 * To change this template use File | Settings | File Templates.
 */
public class ServiceComment implements Serializable {
	public Long serviceCommentId;
	public Long serviceId;
	public DateTime commentTime;
	public String star;
	public String content;
	public String userId;


	public Long getServiceCommentId() {
		return serviceCommentId;
	}

	public void setServiceCommentId(Long serviceCommentId) {
		this.serviceCommentId = serviceCommentId;
	}

	public Long getServiceId() {
		return serviceId;
	}

	public void setServiceId(Long serviceId) {
		this.serviceId = serviceId;
	}

	public DateTime getCommentTime() {
		return commentTime;
	}

	public void setCommentTime(DateTime commentTime) {
		this.commentTime = commentTime;
	}

	public String getStar() {
		return star;
	}

	public void setStar(String star) {
		this.star = star;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}
