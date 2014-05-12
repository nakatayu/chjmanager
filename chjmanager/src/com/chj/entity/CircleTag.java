package com.chj.entity;

import java.util.Date;

public class CircleTag  implements java.io.Serializable {


    // Fields    

     private Long circleTagId;
     private Long circleId;
     private Long tagId;
     private String status;
     private Date addTime;
     private Integer  deleteFlag;


    // Constructors

    /** default constructor */
    public CircleTag() {
    }

    
    /** full constructor */
    public CircleTag(Long circleId, Long tagId, String status, Date addTime,Integer deleteFlag) {
        this.circleId = circleId;
        this.tagId = tagId;
        this.status = status;
        this.addTime = addTime;
        this.deleteFlag=deleteFlag;
    }

   
    // Property accessors

    public Long getCircleTagId() {
        return this.circleTagId;
    }
    
    public void setCircleTagId(Long circleTagId) {
        this.circleTagId = circleTagId;
    }

    public Long getCircleId() {
        return this.circleId;
    }
    
    public void setCircleId(Long circleId) {
        this.circleId = circleId;
    }

    public Long getTagId() {
        return this.tagId;
    }
    
    public void setTagId(Long tagId) {
        this.tagId = tagId;
    }

    public String getStatus() {
        return this.status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }

    public Date getAddTime() {
        return this.addTime;
    }
    
    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }


	public Integer getDeleteFlag() {
		return deleteFlag;
	}


	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}
   








}