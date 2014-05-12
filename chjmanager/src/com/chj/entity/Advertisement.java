package com.chj.entity;
/**
 * 对应数据库表： tb_advertisement_picture
 */
public class Advertisement implements java.io.Serializable {
	
	private Long advertisementId;
	private String pictureAddress;
	private	int style;
	private String linkAddress;
	private String pictureTitle;
 
	

	public String getPictureTitle() {
		return pictureTitle;
	}
	public int getStyle() {
		return style;
	}
	public void setStyle(int style) {
		this.style = style;
	}
	public void setPictureTitle(String pictureTitle) {
		this.pictureTitle = pictureTitle;
	}
	public Long getAdvertisementId() {
		return advertisementId;
	}
	public String getPictureAddress() {
		return pictureAddress;
	}
 
	public String getLinkAddress() {
		return linkAddress;
	}
	public void setAdvertisementId(Long advertisementId) {
		this.advertisementId = advertisementId;
	}
	public void setPictureAddress(String pictureAddress) {
		this.pictureAddress = pictureAddress;
	}
 
	public void setLinkAddress(String linkAddress) {
		this.linkAddress = linkAddress;
	}
	
	
}
