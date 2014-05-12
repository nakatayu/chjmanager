package com.chj.entity;

import java.util.Date;


public class CompanyShopCategory  implements java.io.Serializable {


    // Fields    

     private Long companyShopCategoryId;
     private String name;
     private Integer type;
     private Integer deleteFlag;

    // Constructors

  


	/** default constructor */
    public CompanyShopCategory() {
    }

    
    /** full constructor */


   
    // Property accessors

 
    
   
	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}


	public Integer getDeleteFlag() {
		return deleteFlag;
	}


	public Long getCompanyShopCategoryId() {
		return companyShopCategoryId;
	}


	public void setCompanyShopCategoryId(Long companyShopCategoryId) {
		this.companyShopCategoryId = companyShopCategoryId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public Integer getType() {
		return type;
	}


	public void setType(Integer type) {
		this.type = type;
	}







}