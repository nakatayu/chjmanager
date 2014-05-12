package com.chj.entity;

/**
 * 对应数据库表： tb_area
 */
public class Area implements java.io.Serializable {

	/**
	 * Fields
	 */
	private Long areaId;
	private String areaName;
	private Long parentId;
	private String detailedAddress;
	private Double lat;
	private Double lng;
	private Integer deleteFlag;

	/**
	 * full constructor
	 */
	public Area() {
	}

	public Area(Long areaId, String areaName, Long parentId, String areaBelong,
			Double lng, Double lat, Integer deleteFlag, String detailedAddress) {
		this.areaId = areaId;
		this.areaName = areaName;
		this.parentId = parentId;
		this.detailedAddress = detailedAddress;
		this.lat = lat;
		this.lng = lng;
		this.deleteFlag = deleteFlag;
	}

	public Double getLat() {
		return lat;
	}

	public Double getLng() {
		return lng;
	}

	public void setLat(Double lat) {
		this.lat = lat;
	}

	public void setLng(Double lng) {
		this.lng = lng;
	}

	public String getDetailedAddress() {
		return detailedAddress;
	}

	public void setDetailedAddress(String detailedAddress) {
		this.detailedAddress = detailedAddress;
	}

	public Long getAreaId() {
		return areaId;
	}

	public String getAreaName() {
		return areaName;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setAreaId(Long areaId) {
		this.areaId = areaId;
	}

	public void setAreaName(String areaName) {
		this.areaName = areaName;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public Integer getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

}
