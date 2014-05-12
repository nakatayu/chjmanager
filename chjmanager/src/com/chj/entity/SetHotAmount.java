package com.chj.entity;

import java.util.Date;

/**
 * tb_hot_set  设置热门数量
 */
public class SetHotAmount implements java.io.Serializable {
   private Long hotSetNum;
   private Integer productNum;
   private Integer promotionNum;
   private Integer postNum;
   private Integer activityNum;
   private Integer circleNum;
   private Date updateTime;
   
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public Long getHotSetNum() {
		return hotSetNum;
	}
	public Integer getProductNum() {
		return productNum;
	}
	public Integer getPromotionNum() {
		return promotionNum;
	}
	public Integer getPostNum() {
		return postNum;
	}
	public Integer getActivityNum() {
		return activityNum;
	}
	public Integer getCircleNum() {
		return circleNum;
	}
	public void setHotSetNum(Long hotSetNum) {
		this.hotSetNum = hotSetNum;
	}
	public void setProductNum(Integer productNum) {
		this.productNum = productNum;
	}
	public void setPromotionNum(Integer promotionNum) {
		this.promotionNum = promotionNum;
	}
	public void setPostNum(Integer postNum) {
		this.postNum = postNum;
	}
	public void setActivityNum(Integer activityNum) {
		this.activityNum = activityNum;
	}
	public void setCircleNum(Integer circleNum) {
		this.circleNum = circleNum;
	}
   
   
}
