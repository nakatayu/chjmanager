package com.chj.entity;

import java.io.Serializable;
import javax.persistence.*;

import cn.eavic.framework.entity.BaseEntity;


/**
 * 安卓windowphone推送实体类
 * The persistent class for the user database table.
 * 
 */
public class PushAndroidWinphone  implements Serializable {
	
    
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long userId;
    private String content;
    private Integer type;  //0:安卓1:winphone
	public PushAndroidWinphone() {
    
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	

}