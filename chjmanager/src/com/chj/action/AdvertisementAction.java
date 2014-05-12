package com.chj.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import cn.eavic.framework.web.BaseAction;
import java.util.Date;

import com.chj.common.Commonparam;
import com.chj.entity.Advertisement;
import com.chj.entity.JsonDateValueProcessor;
import com.chj.service.AdvertisementManager;
import com.json.BaseBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Namespace("/")
@Results({ @Result(name = BaseAction.NONE, location = "advertisementAction.action", type = "redirect") })
public class AdvertisementAction extends ActionSupport{	
	private static final long serialVersionUID = 7655056122242830524L;

	@Autowired 
	AdvertisementManager advertisementManager;
	
	
	private Long advertisementId;
	private String pictureAddress;
	private	int style;
	private String linkAddress;
	private String pictureTitle;
	private String firstType;
	private String relationType;
	private String productType;
	private String serviceType;
	private	int firstExtend;
	private String pageWeb;
	private String controlName;
	private String pagePosition;
	private Long controlId;


	//app广告图片列表
	public void  findAdvertiSementList () throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> advertiSementInfo = new HashMap<String, Object>();
			List<Object>  advertiSement = advertisementManager.findAdvertiSementList(advertiSementInfo);
			bean.setStatus(200);
			bean.setRows(advertiSement);
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
			e.printStackTrace();
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}	
	
	public void  advertisementList () throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		HashMap<String, Object> tbFirstExtendInfo = new HashMap<String, Object>();
		tbFirstExtendInfo = advertisementManager.tbFirstExtend();
		request.setAttribute("extendInfo", tbFirstExtendInfo);
		request.getRequestDispatcher("pages/manager/AppAdvertisement.jsp").forward(request,response);
		
	}
	/**
	 * 首页推广设置
	 * */
	public void  tbFirstExtend () throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> tbFirstExtendInfo = new HashMap<String, Object>();
			tbFirstExtendInfo = advertisementManager.tbFirstExtend();
			bean.setStatus(200);
			bean.setRows(tbFirstExtendInfo);
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
			e.printStackTrace();
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}	
	
	//保存app首页中显示列表显示
	public void updateAppToFirstExtendInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		 firstType =  request.getParameter("firstType");
  		 relationType = request.getParameter("relationType");
  		 productType = request.getParameter("productType");
  		 serviceType = request.getParameter("serviceType");
		try {
			HashMap<String, Object> updAppExtend = new HashMap<String, Object>();
			updAppExtend.put("firstType",Integer.valueOf(firstType));
			updAppExtend.put("relationType",Integer.valueOf(relationType));
			updAppExtend.put("productType",Integer.valueOf(productType));
			updAppExtend.put("serviceType",Integer.valueOf(serviceType));
			advertisementManager.updateAppToFirstExtendInfo(updAppExtend);
			bean.setStatus(200);
			bean.setMsg("更新成功!");
		} catch (Exception e) {
			e.printStackTrace();
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}	
	
	//广告查询
		public void  saveAdvertiSementList () throws Exception {
			HttpServletResponse response = (HttpServletResponse) ActionContext
					.getContext().get(ServletActionContext.HTTP_RESPONSE);
			HttpServletRequest request = (HttpServletRequest) ActionContext
					.getContext().get(ServletActionContext.HTTP_REQUEST);
			BaseBean bean = new BaseBean();
			try {
				HashMap<String, Object> advertiSementInfo = new HashMap<String, Object>();
				advertiSementInfo.put("style",style);
				List<Object>  advertiSement = advertisementManager.findAdvertiSementList(advertiSementInfo);
				bean.setStatus(200);
				bean.setRows(advertiSement);
			} catch (Exception e) {
				bean.setMsg(e.getLocalizedMessage());
				e.printStackTrace();
			}
			String json = JSONObject.fromObject(bean).toString();
			response.getOutputStream().write(json.getBytes("UTF-8"));
		}	
		
		//删除app广告图片
		public void deleteAdvertiSementInfo() throws Exception {
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
				advertisementManager.deleteAdvertiSementInfo(idList);
				bean.setStatus(200);
			} catch (Exception e) {
				bean.setMsg(e.getLocalizedMessage());
				e.printStackTrace();
			}
			String json = JSONObject.fromObject(bean).toString();
			response.getOutputStream().write(json.getBytes("UTF-8"));
		}
		
		//增加广告
				public void insertAdvertiSementInfo() throws Exception {
					HttpServletResponse response = (HttpServletResponse) ActionContext
							.getContext().get(ServletActionContext.HTTP_RESPONSE);
					HttpServletRequest request = (HttpServletRequest) ActionContext
							.getContext().get(ServletActionContext.HTTP_REQUEST);
					BaseBean bean = new BaseBean();
					try {
						Advertisement advertisement = new Advertisement();
						advertisement.setPictureAddress(pictureAddress);
						advertisement.setStyle(style);
						advertisement.setPictureTitle(pictureTitle);
						advertisement.setLinkAddress(Commonparam.clearStr(linkAddress));
						Object category = advertisementManager.insertAdvertiSementInfo(advertisement);
						bean.setStatus(200);
					} catch (Exception e) {
						bean.setMsg(e.getLocalizedMessage());
						e.printStackTrace();
					}
					String json = JSONObject.fromObject(bean).toString();
					response.getOutputStream().write(json.getBytes("UTF-8"));
					
				}
				
				// 查找广app广告图片
				public void findAdvertiSementInfo() throws Exception {
					HttpServletResponse response = (HttpServletResponse) ActionContext
							.getContext().get(ServletActionContext.HTTP_RESPONSE);
					HttpServletRequest request = (HttpServletRequest) ActionContext
							.getContext().get(ServletActionContext.HTTP_REQUEST);

					BaseBean bean = new BaseBean();
					try {
						String advertisementId = request.getParameter("advertisementId");
						Advertisement advertisement = new Advertisement();
						advertisement.setAdvertisementId(Long.parseLong(advertisementId));
						Object as = advertisementManager.findAdvertiSementInfo(advertisement);
						request.setAttribute("advertisementInfo", as);
					} catch (Exception e) {
						response.getWriter().print(e.getLocalizedMessage());
					}
					request.getRequestDispatcher("/pages/manager/AppAdvertisementUpdate.jsp").forward(request, response);
				}
				
				//更新app广告图片
				public void updateAdvertiSementInfo() throws Exception {
					HttpServletResponse response = (HttpServletResponse) ActionContext
							.getContext().get(ServletActionContext.HTTP_RESPONSE);
					HttpServletRequest request = (HttpServletRequest) ActionContext
							.getContext().get(ServletActionContext.HTTP_REQUEST);
					BaseBean bean = new BaseBean();
					try {
						HashMap<String, Object> updateAdvertiSement = new HashMap<String, Object>();
						updateAdvertiSement.put("advertisementId",advertisementId);
						updateAdvertiSement.put("style",style);
						updateAdvertiSement.put("pictureAddress",pictureAddress);
						updateAdvertiSement.put("pictureTitle",pictureTitle);
						updateAdvertiSement.put("linkAddress",Commonparam.clearStr(linkAddress));
						advertisementManager.updateAdvertiSementInfo(updateAdvertiSement);
						bean.setStatus(200);
					} catch (Exception e) {
						e.printStackTrace();
						bean.setMsg(e.getLocalizedMessage());
					}
					String json = JSONObject.fromObject(bean).toString();
					response.getOutputStream().write(json.getBytes("UTF-8"));
				}	
				
				
				//web广告图片列表
				public void  findWebAdvertisementList () throws Exception {
					HttpServletResponse response = (HttpServletResponse) ActionContext
							.getContext().get(ServletActionContext.HTTP_RESPONSE);
					HttpServletRequest request = (HttpServletRequest) ActionContext
							.getContext().get(ServletActionContext.HTTP_REQUEST);
					BaseBean bean = new BaseBean();
					try {
						List<Object>  webAdvertisement = advertisementManager.findWebAdvertisementList();
						bean.setStatus(200);
						bean.setRows(webAdvertisement);
					} catch (Exception e) {
						bean.setMsg(e.getLocalizedMessage());
						e.printStackTrace();
					}
					String json = JSONObject.fromObject(bean).toString();
					response.getOutputStream().write(json.getBytes("UTF-8"));
				}	
				
				// 查找广web 广告详细信息
				public void selectWebDetail() throws Exception {
					HttpServletResponse response = (HttpServletResponse) ActionContext
							.getContext().get(ServletActionContext.HTTP_RESPONSE);
					HttpServletRequest request = (HttpServletRequest) ActionContext
							.getContext().get(ServletActionContext.HTTP_REQUEST);

					BaseBean bean = new BaseBean();
					try {
						Long advertisementId = Long.parseLong(request.getParameter("advertisementId"));
						Object as = advertisementManager.selectWebDetail(advertisementId);
						request.setAttribute("advertisementInfo", as);
					} catch (Exception e) {
						e.printStackTrace();
						System.out.println("修改失败");
					}
					request.getRequestDispatcher("/pages/manager/WebAdvertisementUpdate.jsp").forward(request, response);
				}
				
				
				//更新web广告图片
				public void updateWebAdvertisementInfo() throws Exception {
					HttpServletResponse response = (HttpServletResponse) ActionContext
							.getContext().get(ServletActionContext.HTTP_RESPONSE);
					HttpServletRequest request = (HttpServletRequest) ActionContext
							.getContext().get(ServletActionContext.HTTP_REQUEST);
					BaseBean bean = new BaseBean();
					try {
						HashMap<String, Object> updateAdvertiSement = new HashMap<String, Object>();
						if(advertisementId!=null){
							updateAdvertiSement.put("advertisementId",advertisementId);
							updateAdvertiSement.put("pageWeb",pageWeb);
							updateAdvertiSement.put("pagePosition",pagePosition);
							updateAdvertiSement.put("pageName",pageName);						   
							updateAdvertiSement.put("pictureAddress",pictureAddress);
							updateAdvertiSement.put("pictureTitle",pictureTitle);
							updateAdvertiSement.put("linkAddress",linkAddress);
							advertisementManager.updateWebAdvertisementInfo(updateAdvertiSement);
							bean.setStatus(200);
						}
						
					} catch (Exception e) {
						bean.setStatus(400);
						e.printStackTrace();
						bean.setMsg(e.getLocalizedMessage());
					}
					String json = JSONObject.fromObject(bean).toString();
					response.getOutputStream().write(json.getBytes("UTF-8"));
				}	
				
				
				
	      //读取关键词的列表
				private Integer size,page;
				public void  selectControl() throws Exception {
					HttpServletResponse response = (HttpServletResponse) ActionContext
							.getContext().get(ServletActionContext.HTTP_RESPONSE);
					HttpServletRequest request = (HttpServletRequest) ActionContext
							.getContext().get(ServletActionContext.HTTP_REQUEST);
					BaseBean bean = new BaseBean();
					try {
						HashMap mapparm= new HashMap();
						mapparm.put("size", size);
						mapparm.put("startIndex", (page - 1) * size);
						List<Object>  webAdvertisement = advertisementManager.selectControlList(mapparm);
						bean.setStatus(200);
						bean.setRows(webAdvertisement);
						bean.setTotal(advertisementManager.selectControlListPageCount());
					} catch (Exception e) {
						bean.setMsg(e.getLocalizedMessage());
						e.printStackTrace();
					}
					 
					JsonConfig jsonConfig = new JsonConfig();
					jsonConfig.registerJsonValueProcessor(java.sql.Timestamp.class , new
					JsonDateValueProcessor("yyyy-MM-dd HH:mm:ss")); 
					 
					String json = JSONObject.fromObject(bean,jsonConfig).toString();
					response.getOutputStream().write(json.getBytes("UTF-8"));
					
					
				}
				
			//更新关键词的列表
				public void updateControl() throws Exception {
					HttpServletResponse response = (HttpServletResponse) ActionContext
							.getContext().get(ServletActionContext.HTTP_RESPONSE);
					HttpServletRequest request = (HttpServletRequest) ActionContext
							.getContext().get(ServletActionContext.HTTP_REQUEST);
					BaseBean bean = new BaseBean();
					try {
						HashMap<String, Object> updateControl = new HashMap<String, Object>();
						controlName=request.getParameter("addControlName");
						controlId=Long.valueOf(request.getParameter("controlId"));
						updateControl.put("controlId",controlId);
						updateControl.put("controlName",controlName);
						updateControl.put("createTime",new Date());
						advertisementManager.updateControl(updateControl);
						bean.setStatus(200);
					} catch (Exception e) {
						e.printStackTrace();
						bean.setMsg(e.getLocalizedMessage());
					}
					String json = JSONObject.fromObject(bean).toString();
					response.getOutputStream().write(json.getBytes("UTF-8"));
				}


				//增加关键词的列表
				public void addControl() throws Exception {
					HttpServletResponse response = (HttpServletResponse) ActionContext
							.getContext().get(ServletActionContext.HTTP_RESPONSE);
					HttpServletRequest request = (HttpServletRequest) ActionContext
							.getContext().get(ServletActionContext.HTTP_REQUEST);
					BaseBean bean = new BaseBean();
					try {
						HashMap<String, Object> addControlData = new HashMap<String, Object>();
						controlName=request.getParameter("addControlName");
						addControlData.put("controlName",controlName);
						addControlData.put("createTime",new Date());
						Object category = advertisementManager.addControl(addControlData);
						bean.setStatus(200);
					} catch (Exception e) {
						bean.setMsg(e.getLocalizedMessage());
						e.printStackTrace();
					}
					String json = JSONObject.fromObject(bean).toString();
					response.getOutputStream().write(json.getBytes("UTF-8"));
					
				}
				
				
				
			//删除关键词的列表	
				public void deleteControl() throws Exception {
					HttpServletResponse response = (HttpServletResponse) ActionContext
							.getContext().get(ServletActionContext.HTTP_RESPONSE);
					HttpServletRequest request = (HttpServletRequest) ActionContext
							.getContext().get(ServletActionContext.HTTP_REQUEST);

					String  del = request.getParameter("controlId1");
					String[] idStr = del.split(",");
					List<Long> idList = new ArrayList<Long>();
					for(int i=0;i<idStr.length;i++){
						idList.add(Long.parseLong(idStr[i]));
					}
					BaseBean bean = new BaseBean();
					try {
						advertisementManager.deleteControl(idList);
						bean.setStatus(200);
					} catch (Exception e) {
						bean.setMsg(e.getLocalizedMessage());
						e.printStackTrace();
					}
					String json = JSONObject.fromObject(bean).toString();
					response.getOutputStream().write(json.getBytes("UTF-8"));
				}


	



	public String getUpfileFileName() {
		return upfileFileName;
	}

	public void setUpfileFileName(String upfileFileName) {
		this.upfileFileName = upfileFileName;
	}

	private File upfile;
	private String upfileFileName;

	public void importControlfromExcel() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);

		BaseBean bean = new BaseBean();
		try {
			InputStream io = new FileInputStream(upfile);
			int count = advertisementManager.importControlfromExcel(io);
			bean.setStatus(200);
			bean.setMsg("成功导入" + count + "条关键字！");
		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg("导入关键字失败！");
			e.printStackTrace();
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

				
				
	public String getPictureTitle() {
		return pictureTitle;
	}
	public void setPictureTitle(String pictureTitle) {
		this.pictureTitle = pictureTitle;
	}
	public Long getAdvertisementId() {
		return advertisementId;
	}
	public String getPictureAddress() {
		return pictureAddress;
	}
 
	public String getLinkAddress() {
		return linkAddress;
	}
	public void setAdvertisementId(Long advertisementId) {
		this.advertisementId = advertisementId;
	}
	public void setPictureAddress(String pictureAddress) {
		this.pictureAddress = pictureAddress;
	}
 
	public int getStyle() {
		return style;
	}

	public void setStyle(int style) {
		this.style = style;
	}

	public void setLinkAddress(String linkAddress) {
		this.linkAddress = linkAddress;
	}

	public String getFirstType() {
		return firstType;
	}

	public void setFirstType(String firstType) {
		this.firstType = firstType;
	}

	public String getRelationType() {
		return relationType;
	}

	public void setRelationType(String relationType) {
		this.relationType = relationType;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public String getServiceType() {
		return serviceType;
	}

	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}

	public int getFirstExtend() {
		return firstExtend;
	}

	public void setFirstExtend(int firstExtend) {
		this.firstExtend = firstExtend;
	}
	public String getPageWeb() {
		return pageWeb;
	}

	public void setPageWeb(String pageWeb) {
		this.pageWeb = pageWeb;
	}

	public String getPagePosition() {
		return pagePosition;
	}

	public void setPagePosition(String pagePosition) {
		this.pagePosition = pagePosition;
	}

	public String getPageName() {
		return pageName;
	}

	public File getUpfile() {
		return upfile;
	}

	public void setUpfile(File upfile) {
		this.upfile = upfile;
	}

	public void setPageName(String pageName) {
		this.pageName = pageName;
	}

	private String pageName;
	
	
	
public String getControlName() {
		return controlName;
	}

	public void setControlName(String controlName) {
		this.controlName = controlName;
	}

	public Long getControlId() {
		return controlId;
	}

	public void setControlId(Long controlId) {
		this.controlId = controlId;
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

}
