package com.chj.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.chj.service.AreaManager;
import com.chj.service.TagManager;
import com.json.BaseBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.eavic.framework.web.BaseAction;

@Namespace("/")
@Results({ @Result(name = BaseAction.NONE, location = "areaAction.action", type = "redirect") })
public class AreaAction extends ActionSupport{
	
	private static final long serialVersionUID = 7655056122242830524L;

	@Autowired
	AreaManager  areaManager;
	
	 /**
	  * 获取配送范围一级
	  */
     public void findArea() throws Exception {
 		HttpServletResponse response = (HttpServletResponse) ActionContext
 				.getContext().get(ServletActionContext.HTTP_RESPONSE);
 		HttpServletRequest request = (HttpServletRequest) ActionContext
 				.getContext().get(ServletActionContext.HTTP_REQUEST);
 		BaseBean bean = new BaseBean();
 		List<HashMap> firstAreaList ;
 		Map obj = new HashMap();
 		try{
 			firstAreaList = areaManager.findArea();
 			bean.setRows(firstAreaList);
 			bean.setStatus(200);
 		}
 		catch(Exception e){
 			e.printStackTrace();
 			bean.setMsg(e.getLocalizedMessage());
 		}
 		
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
     }
     
     /**
	  * 服务范围  二级  
	  */
     public void findSecondArea () throws Exception {
 		HttpServletResponse response = (HttpServletResponse) ActionContext
 				.getContext().get(ServletActionContext.HTTP_RESPONSE);
 		HttpServletRequest request = (HttpServletRequest) ActionContext
 				.getContext().get(ServletActionContext.HTTP_REQUEST);
 		BaseBean bean = new BaseBean();
 		Long areaId = Long.valueOf(request.getParameter("areaId"));
 		try{
  			List<HashMap> secondAreaList = areaManager.findSecondArea(areaId);
 			bean.setStatus(200);
 			bean.setRows(secondAreaList);
 		}
 		catch(Exception e){
 			e.printStackTrace();
 			bean.setMsg(e.getLocalizedMessage());
 		}
 		
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
     }
//     
//     /**
//	  * 地址下拉框 
//	  */
//     public void findDetailedAddress() throws Exception {
//  		HttpServletResponse response = (HttpServletResponse) ActionContext
//  				.getContext().get(ServletActionContext.HTTP_RESPONSE);
//  		HttpServletRequest request = (HttpServletRequest) ActionContext
//  				.getContext().get(ServletActionContext.HTTP_REQUEST);
//  		BaseBean bean = new BaseBean();
//  		try{
//  			List<Object> list = areaManager.findDetailedAddress();
//  			
//  			bean.setStatus(200);
//  			bean.setRows(list);
//  		}
//  		catch(Exception e){
//  			e.printStackTrace();
//  			bean.setMsg(e.getLocalizedMessage());
//  		}
//  		
// 		String json = JSONObject.fromObject(bean).toString();
// 		response.getOutputStream().write(json.getBytes("UTF-8"));
//      }
//     
//     public void findShopSecondArea () throws Exception {
//  		HttpServletResponse response = (HttpServletResponse) ActionContext
//  				.getContext().get(ServletActionContext.HTTP_RESPONSE);
//  		HttpServletRequest request = (HttpServletRequest) ActionContext
//  				.getContext().get(ServletActionContext.HTTP_REQUEST);
//  		BaseBean bean = new BaseBean();
//  		String areaId = request.getParameter("areaId");
//  		String shopId = request.getParameter("shopId");
//  		try{
//   			Map obj = new HashMap();
//   			obj.put("areaId", areaId);
//   			obj.put("shopId", shopId);
//  			List<Object> list = areaManager.findSecondArea(obj);
//  			
//  			List<Object> secondArea = areaManager.findShopThirdArea(obj);
//  			
//  			bean.setTotal(secondArea);
//  			
//  			bean.setStatus(200);
//  			bean.setRows(list);
//  		}
//  		catch(Exception e){
//  			e.printStackTrace();
//  			bean.setMsg(e.getLocalizedMessage());
//  		}
//  		
// 		String json = JSONObject.fromObject(bean).toString();
// 		response.getOutputStream().write(json.getBytes("UTF-8"));
//      }
//   
}
