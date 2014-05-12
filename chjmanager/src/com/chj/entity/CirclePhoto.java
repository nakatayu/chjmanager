package com.chj.entity;

import java.util.Date;


/**
 * TbCirclePhoto entity. @author MyEclipse Persistence Tools
 */

public class CirclePhoto  implements java.io.Serializable {


    // Fields    

     private Long circlePhotoId;
     private Long userId;
     private String fileName;
     private String filePath;
     private Date uploadTime;


    // Constructors

    /** default constructor */
    public CirclePhoto() {
    }

    
    /** full constructor */
    public CirclePhoto(Long userId, String fileName, String filePath, Date uploadTime) {
        this.userId = userId;
        this.fileName = fileName;
        this.filePath = filePath;
        this.uploadTime = uploadTime;
    }

   
    // Property accessors

    public Long getCirclePhotoId() {
        return this.circlePhotoId;
    }
    
    public void setCirclePhotoId(Long circlePhotoId) {
        this.circlePhotoId = circlePhotoId;
    }

    public Long getUserId() {
        return this.userId;
    }
    
    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getFileName() {
        return this.fileName;
    }
    
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFilePath() {
        return this.filePath;
    }
    
    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public Date getUploadTime() {
        return this.uploadTime;
    }
    
    public void setUploadTime(Date uploadTime) {
        this.uploadTime = uploadTime;
    }
   








}