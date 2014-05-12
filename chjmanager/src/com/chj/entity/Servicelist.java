package com.chj.entity;

import java.util.Date;


public class Servicelist  implements java.io.Serializable {


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
     private String summary;// 摘要
	 private String serviceType;
     private Date releaseTime;
     private Date startTime;
     private Date endTime;
     private String pushType;
     private String pushContent;
     private String status;
     private String image;
     private String phone;
     private Integer examineResult;
    // Constructors

  


	/** default constructor */
    public Servicelist() {
    }

    
    /** full constructor */
    public Servicelist(String title, String content, Long seeCount, String star, Double lon, Double lat, 
    		Long userId, String type, Long companyId,Integer examineResult) {
        this.title = title;
        this.content = content;
        this.seeCount = seeCount;
        this.star = star;
        this.lon = lon;
        this.lat = lat;
        this.userId = userId;
        this.type = type;
        this.companyId = companyId;
        this.examineResult = examineResult;
    }

   
    // Property accessors
    
    public Long getServiceId() {
        return this.serviceId;
    }
    
    public Integer getExamineResult() {
		return examineResult;
	}


	public void setExamineResult(Integer examineResult) {
		this.examineResult = examineResult;
	}


	public String getServiceType() {
		return serviceType;
	}


	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
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
    public Date getReleaseTime() {
		return releaseTime;
	}


	public void setReleaseTime(Date releaseTime) {
		this.releaseTime = releaseTime;
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


	public void setSummary(String summary) {
		this.summary = summary;
	}


	public String getSummary() {
		return summary;
	}
   

	  public Date getStartTime() {
			return startTime;
		}


		public void setStartTime(Date startTime) {
			this.startTime = startTime;
		}


		public Date getEndTime() {
			return endTime;
		}


		public void setEndTime(Date endTime) {
			this.endTime = endTime;
		}


		public String getPushType() {
			return pushType;
		}


		public void setPushType(String pushType) {
			this.pushType = pushType;
		}


		public String getPushContent() {
			return pushContent;
		}


		public void setPushContent(String pushContent) {
			this.pushContent = pushContent;
		}


		public String getImage() {
			return image;
		}


		public void setImage(String image) {
			this.image = image;
		}


		public String getPhone() {
			return phone;
		}


		public void setPhone(String phone) {
			this.phone = phone;
		}


		public void setStatus(String status) {
			this.status = status;
		}


		public String getStatus() {
			return status;
		}







}