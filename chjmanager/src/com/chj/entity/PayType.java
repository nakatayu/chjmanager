package com.chj.entity;

import java.util.Date;


public class PayType  implements java.io.Serializable {


    // Fields    

     private Long payTypeId;
     private String payTypeName;
     private Integer deleteFlag;

    // Constructors

  


	/** default constructor */
    public PayType() {
    }

    
    /** full constructor */


   
    // Property accessors

 
    
   
	

    public Long getPayTypeId() {
		return payTypeId;
	}


	public void setPayTypeId(Long payTypeId) {
		this.payTypeId = payTypeId;
	}


	public String getPayTypeName() {
		return payTypeName;
	}


	public void setPayTypeName(String payTypeName) {
		this.payTypeName = payTypeName;
	}


	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}


	public Integer getDeleteFlag() {
		return deleteFlag;
	}







}