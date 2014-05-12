package com.chj.action;

import java.util.ArrayList;
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

import com.chj.entity.Addproductattribute;
import com.chj.entity.Personnel;
import com.chj.entity.ProductAttribute;
import com.chj.entity.Productshopcategory;
import com.chj.entity.User;
import com.chj.service.AddproductattributeManager;
import com.json.BaseBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.eavic.framework.web.BaseAction;


@Namespace("/")
@Results({ @Result(name = BaseAction.NONE, location = "addproductattributeAction.action", type = "redirect") })
public class AddproductattributeAction extends ActionSupport{
	private static final long serialVersionUID = 7655056122242830524L;

	@Autowired
	AddproductattributeManager addproductattributeManager;
	
	

	private Integer size, page;
	private Long appendId;
	private String name;
	private Float price;
	private Long parentId;
	private Long companyId;
	private String needCount;
	private String isCkeckbox;
	
	//增加商品附加属性 
			public void insertProductAttribute() throws Exception {
				HttpServletResponse response = (HttpServletResponse) ActionContext
						.getContext().get(ServletActionContext.HTTP_RESPONSE);
				HttpServletRequest request = (HttpServletRequest) ActionContext
						.getContext().get(ServletActionContext.HTTP_REQUEST);
				Personnel personnel =(Personnel)request.getSession().getAttribute("user");
				BaseBean bean = new BaseBean();
			/**
			 * 星巴克总部 
			 */	
				if(personnel.getType()==4){
					try {
						Addproductattribute addproductattribute = new Addproductattribute();
						addproductattribute.setCompanyId(personnel.getCompanyId());
						addproductattribute.setName(name);
						addproductattribute.setPrice(price);
						addproductattribute.setParentId(parentId);
						if(isCkeckbox!=null)
							addproductattribute.setIsCkeckbox(isCkeckbox);
						Object Pa = addproductattributeManager.insertProductAttribute(addproductattribute);
						bean.setStatus(200);
					} catch (Exception e) {
						bean.setMsg(e.getLocalizedMessage());
						e.printStackTrace();
					}
					String json = JSONObject.fromObject(bean).toString();
					response.getOutputStream().write(json.getBytes("UTF-8"));
					response.sendRedirect("pages/starbucks/CustomizeFlavors.jsp");//重定向
				}
		/**
		 * 开发区
		 */
			else if(personnel.getType()==1){
					try {
						Addproductattribute addproductattribute = new Addproductattribute();
						addproductattribute.setCompanyId(personnel.getCompanyId());
						addproductattribute.setName(name);
						addproductattribute.setPrice(price);
						addproductattribute.setParentId(parentId);
						if(isCkeckbox!=null)
							addproductattribute.setIsCkeckbox(isCkeckbox);
						Object Pa = addproductattributeManager.insertProductAttribute(addproductattribute);
						bean.setStatus(200);
					} catch (Exception e) {
						bean.setMsg(e.getLocalizedMessage());
						e.printStackTrace();
					}
					String json = JSONObject.fromObject(bean).toString();
					response.getOutputStream().write(json.getBytes("UTF-8"));
					response.sendRedirect("pages/manager/compnayInfoManagerProductAttribute.jsp");//重定向
				}
			}
			
			//删除商品属性
			public void deleteProductAttribute() throws Exception {
				HttpServletResponse response = (HttpServletResponse) ActionContext
						.getContext().get(ServletActionContext.HTTP_RESPONSE);
				HttpServletRequest request = (HttpServletRequest) ActionContext
						.getContext().get(ServletActionContext.HTTP_REQUEST);

				String  del = request.getParameter("selectedShopId");
				String[] idStr = del.split(",");
				List<Long> idList = new ArrayList<Long>();
				for(int i=0;i<idStr.length;i++){
					idList.add(Long.parseLong(idStr[i]));
				}
				BaseBean bean = new BaseBean();
				try {
					addproductattributeManager.deleteProductAttribute(idList);
					bean.setStatus(200);
				} catch (Exception e) {
					bean.setMsg(e.getLocalizedMessage());
					e.printStackTrace();
				}
				String json = JSONObject.fromObject(bean).toString();
				response.getOutputStream().write(json.getBytes("UTF-8"));
			}
		
			
	// 商品（口味） 附加属性列表 
	public void findCustomizeFlavors() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel)request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
	/**
	 * 星巴克总部
	 */	
		if(personnel.getType()==4 || personnel.getType()==5){
			try {
				HashMap<String, Object> categoryList = new HashMap<String, Object>();
				categoryList.put("name", name);
				categoryList.put("size", size);
				categoryList.put("companyId",personnel.getCompanyId());
				categoryList.put("startIndex", (page - 1) * size); 
				List<Object>  productInfo = addproductattributeManager.findCustomizeFlavors(categoryList);
				if(productInfo.size()>0){
					bean.setStatus(200);
					bean.setRows(productInfo);
					bean.setTotal(addproductattributeManager.findProductAttributeListCount(categoryList));
				}else{
					bean.setMsg("没有数据!");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			String json = JSONObject.fromObject(bean).toString();
			response.getOutputStream().write(json.getBytes("UTF-8"));
		}
		/**
		 * 开发区
		 */	
		else if(personnel.getType()==1){
				try {
					HashMap<String, Object> categoryList = new HashMap<String, Object>();
					categoryList.put("name", name);
					categoryList.put("size", size);
					categoryList.put("startIndex", (page - 1) * size); 
					List<Object>  productInfo = addproductattributeManager.findCompanyManagerProductAttributeList(categoryList);
					if(productInfo.size()>0){
						bean.setStatus(200);
						bean.setRows(productInfo);
						bean.setTotal(addproductattributeManager.findProductAttributeListCount(categoryList));
					}else{
						bean.setMsg("没有数据!");
					}
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				String json = JSONObject.fromObject(bean).toString();
				response.getOutputStream().write(json.getBytes("UTF-8"));
			}
	}
			
	public Integer getSize() {
		return size;
	}

	public Integer getPage() {
		return page;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Long getAppendId() {
		return appendId;
	}

	public String getName() {
		return name;
	}

	public Float getPrice() {
		return price;
	}

	public Long getParentId() {
		return parentId;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public String getNeedCount() {
		return needCount;
	}

	public String getIsCkeckbox() {
		return isCkeckbox;
	}

	public void setAppendId(Long appendId) {
		this.appendId = appendId;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPrice(Float price) {
		this.price = price;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public void setNeedCount(String needCount) {
		this.needCount = needCount;
	}

	public void setIsCkeckbox(String isCkeckbox) {
		this.isCkeckbox = isCkeckbox;
	}
			
}
