package com.chj.entity;

import java.util.Date;



public class CirclePhotoComment  implements java.io.Serializable {


    // Fields    

     private Long circlePhotoCommentId;
     private Long circlePhotoId;
     private Long userId;
     private String content;
     private Date commentTime;


    // Constructors

    /** default constructor */
    public CirclePhotoComment() {
    }

    
    /** full constructor */
    public CirclePhotoComment(Long circlePhotoId, Long userId, String content, Date commentTime) {
        this.circlePhotoId = circlePhotoId;
        this.userId = userId;
        this.content = content;
        this.commentTime = commentTime;
    }

   
    // Property accessors

    public Long getCirclePhotoCommentId() {
        return this.circlePhotoCommentId;
    }
    
    public void setCirclePhotoCommentId(Long circlePhotoCommentId) {
        this.circlePhotoCommentId = circlePhotoCommentId;
    }

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

    public String getContent() {
        return this.content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }

    public Date getCommentTime() {
        return this.commentTime;
    }
    
    public void setCommentTime(Date commentTime) {
        this.commentTime = commentTime;
    }
   








}