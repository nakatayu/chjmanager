package com.chj.action;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.chj.entity.SetHotAmount;
import com.json.BaseBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.eavic.framework.web.BaseAction;

@Namespace("/")
@Results({ @Result(name = BaseAction.NONE, location = "sethotamountAction.action", type = "redirect") })
public class SethotamountAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private com.chj.service.SetHotAmountManager setHotAmountManager;
	
	   private Integer productNum;
	   private Integer promotionNum;
	   private Integer postNum;
	   private Integer activityNum;
	   private Integer circleNum;
	   private Long hotSetNum;
	   private Date updateTime;
	   
		

	/**
	 * 设置热门数量
	 */
	public void updateSetHotAmount() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			SetHotAmount setHotAmount = new SetHotAmount();
			setHotAmount.setActivityNum(activityNum);
			setHotAmount.setCircleNum(circleNum);
			setHotAmount.setPostNum(postNum);
			setHotAmount.setProductNum(productNum);
			setHotAmount.setPromotionNum(promotionNum);
			setHotAmount.setHotSetNum(hotSetNum);
			setHotAmount.setUpdateTime(new Date());
			
			setHotAmountManager.updateSetHotAmount(setHotAmount);
			bean.setStatus(200);
		}catch (Exception e) {
			bean.setStatus(400);
			e.printStackTrace();
		} 
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}
	
	
	/**
	 * 设置热门数量
	 */
	public void findHotSet() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		try {
			SetHotAmount s = setHotAmountManager.findHotSet();
			request.setAttribute("setHotAmount",s);
		}catch (Exception e) {
			e.printStackTrace();
		} 
		/**
		 * 页面重定向
		 */
		request.getRequestDispatcher("pages/manager/SetHotAmount.jsp").forward(request, response);
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
	public Integer getProductNum() {
		return productNum;
	}


	public Integer getPromotionNum() {
		return promotionNum;
	}


	public Integer getPostNum() {
		return postNum;
	}


	public Integer getActivityNum() {
		return activityNum;
	}


	public Integer getCircleNum() {
		return circleNum;
	}


	public void setProductNum(Integer productNum) {
		this.productNum = productNum;
	}


	public void setPromotionNum(Integer promotionNum) {
		this.promotionNum = promotionNum;
	}


	public void setPostNum(Integer postNum) {
		this.postNum = postNum;
	}


	public void setActivityNum(Integer activityNum) {
		this.activityNum = activityNum;
	}


	public void setCircleNum(Integer circleNum) {
		this.circleNum = circleNum;
	}
	public Long getHotSetNum() {
		return hotSetNum;
	}

	public void setHotSetNum(Long hotSetNum) {
		this.hotSetNum = hotSetNum;
	}

}
