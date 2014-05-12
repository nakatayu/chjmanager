package com.chj.entity;


public class Service  implements java.io.Serializable {


    // Fields    

     private Long serviceId;
     private String title;
     private String content;
     private Long seeCount;
     private String star;
     private Double lon;
     private Double lat;
     private Long userId;
     private String type;
     private Long companyId;
     private Integer deleteFlag;
  
     
    // Constructors

    /** default constructor */
    public Service() {
    }

    
    /** full constructor */
    public Service(String title, String content, Long seeCount, String star, Double lon, Double lat, Long userId, 
    		String type, Long companyId,Integer deleteFlag) {
        this.title = title;
        this.content = content;
        this.seeCount = seeCount;
        this.star = star;
        this.lon = lon;
        this.lat = lat;
        this.userId = userId;
        this.type = type;
        this.companyId = companyId;
        this.deleteFlag=deleteFlag;
    }

   
    // Property accessors

    public Long getServiceId() {
        return this.serviceId;
    }
    
    public Integer getDeleteFlag() {
		return deleteFlag;
	}


	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}


	public void setServiceId(Long serviceId) {
        this.serviceId = serviceId;
    }

    public String getTitle() {
        return this.title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return this.content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }

    public Long getSeeCount() {
        return this.seeCount;
    }
    
    public void setSeeCount(Long seeCount) {
        this.seeCount = seeCount;
    }

    public String getStar() {
        return this.star;
    }
    
    public void setStar(String star) {
        this.star = star;
    }

    public Double getLon() {
        return this.lon;
    }
    
    public void setLon(Double lon) {
        this.lon = lon;
    }

    public Double getLat() {
        return this.lat;
    }
    
    public void setLat(Double lat) {
        this.lat = lat;
    }

    public Long getUserId() {
        return this.userId;
    }
    
    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getType() {
        return this.type;
    }
    
    public void setType(String type) {
        this.type = type;
    }

    public Long getCompanyId() {
        return this.companyId;
    }
    
    public void setCompanyId(Long companyId) {
        this.companyId = companyId;
    }


	

}