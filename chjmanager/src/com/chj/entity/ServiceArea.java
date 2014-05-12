package com.chj.entity;

public class ServiceArea implements java.io.Serializable {
	private Long serviceAreaId;
	private Long areaId;
	private Integer deleteFlag;
	private Long serviceId;
	// Constructors

	/** default constructor */
	public ServiceArea() {
	}

	/** full constructor */
	public ServiceArea(Long serviceAreaId, Long areaId, Integer deleteFlag,Long serviceId) {
		this.serviceAreaId = serviceAreaId;
		this.areaId = areaId;
		this.deleteFlag = deleteFlag;
		this.serviceId=serviceId;
	}
 
	public Long getServiceId() {
		return serviceId;
	}

	public void setServiceId(Long serviceId) {
		this.serviceId = serviceId;
	}

	public Long getServiceAreaId() {
		return serviceAreaId;
	}

	public Long getAreaId() {
		return areaId;
	}

	public Integer getDeleteFlag() {
		return deleteFlag;
	}

	public void setServiceAreaId(Long serviceAreaId) {
		this.serviceAreaId = serviceAreaId;
	}

	public void setAreaId(Long areaId) {
		this.areaId = areaId;
	}

	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

}
