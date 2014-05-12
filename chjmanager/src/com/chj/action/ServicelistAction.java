package com.chj.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.chj.common.Commonparam;
import com.chj.entity.Advertisement;
import com.chj.entity.Circle;
import com.chj.entity.Company;
import com.chj.entity.JsonDateValueProcessor;
import com.chj.entity.Personnel;
import com.chj.entity.Service;
import com.chj.entity.ServiceArea;
import com.chj.entity.ServiceTag;
import com.chj.entity.Servicelist;
import com.chj.entity.Shop;
import com.chj.entity.Shoparea;
import com.chj.entity.Shoptag;
import com.chj.entity.Topic;
import com.chj.entity.User;
import com.chj.service.ActivityManager;
import com.chj.service.AreaManager;
import com.chj.service.CircleManager;
import com.chj.service.ServicelistManager;
import com.chj.service.ShopManager;
import com.chj.service.TopicManager;
import com.chj.service.UserManager;
import com.chj.utils.StaticConstant;
import com.json.BaseBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Namespace("/")
@Results({ @Result(name = BaseAction.NONE, location = "servicelistAction.action", type = "redirect"), })
public class ServicelistAction extends ActionSupport {
	private static final long serialVersionUID = 7655056122242830524L;

	@Autowired
	ServicelistManager servicelistManager;

	@Autowired
	UserManager userManager;
	private String status;
	private Integer size, page;
	private String name;
	private Long userId;
	private String info;
	private String checkbox;
	private String summary;
	private Date releaseTime;
	private String title;
	private String serviceType;
	private String content;
	private Long serviceId;
	private String image;
	private String phone;
	private Integer top;
	private Date startTime;
	private Date endTime;
	private Integer serviceStatus;
	private Integer serviceTypeList;
	private String serviceKeyWord;
	private Integer examineResult;

	/**
	 * //开发区 session type=1 所有的都列出来，未删除del=1 //企业 和店铺 星巴克 星巴克 是一样 session
	 * companyId company_id=companyId 未删除del=1
	 * */
	// 共享漕河泾 列表
	public void findServiceList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> serviceList = new HashMap<String, Object>();

			serviceList.put("size", size);
			serviceList.put("startIndex", (page - 1) * size);
			serviceList.put("top", top == null ? 0 : top);// 关键字 string
			serviceList.put("serviceStatus", serviceStatus);// 状态 int
			serviceList.put("serviceTypeList", serviceTypeList);// 栏目 int
			serviceList.put("serviceKeyWord", serviceKeyWord);// 关键字 string
			serviceList.put("name", name);// 企业名称
			if (personnel.getType() != 1) {
				serviceList.put("companyId", personnel.getCompanyId());// 企业ID
			}

			List<Object> list = servicelistManager
					.findChjServiceList(serviceList);
			if (list.size() > 0) {
				bean.setTotal(servicelistManager.serviceChjCount(serviceList));
				bean.setStatus(200);
				bean.setRows(list);
			} else {
				bean.setMsg("没有数据!");
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.sql.Timestamp.class,
				new JsonDateValueProcessor("yyyy-MM-dd HH:mm:ss"));
		String json = JSONObject.fromObject(bean, jsonConfig).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	// 共享漕河泾状态更改
	public void updateServiceStatus() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> serviceStatus = new HashMap<String, Object>();
			if (serviceId != null && examineResult != null) {
				serviceStatus.put("serviceId", serviceId);
				serviceStatus.put("examineResult", examineResult);// 1审核通过2审核不通过3未审核
																	// 4关闭
				servicelistManager.updateServiceStatus(serviceStatus);
				bean.setStatus(200);
			} else {
				bean.setStatus(400);
			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
			e.printStackTrace();
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 删除 共享漕河泾
	 * 
	 * @throws Exception
	 */
	public void deleteSerList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		String serivceId = request.getParameter("serivceId");
		String[] idStr = serivceId.split(",");
		List<Long> idList = new ArrayList<Long>();
		for (int i = 0; i < idStr.length; i++) {
			idList.add(Long.parseLong(idStr[i]));
		}
		BaseBean bean = new BaseBean();
		try {
			servicelistManager.selectedServicelist(idList);
			bean.setStatus(200);

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
			e.printStackTrace();
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));

	}

	/**
	 * 保存服务信息
	 * 
	 * @return
	 */
	public void seveServicelist() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			String thirdCategoryTags = request.getParameter("thirdCategoryTag");// 已选标签的值
			String areaName = request.getParameter("hiddenAreaName");// 园区名称的值

			// 标签
			String[] tags = thirdCategoryTags.split(",");
			List<ServiceTag> stList = new ArrayList<ServiceTag>();
			ServiceTag st = null;
			if (tags[0].length() != 0 && tags.length != 0) {
				for (int i = 0; i < tags.length; i++) {
					st = new ServiceTag();
					st.setTagId(Long.parseLong(tags[i]));
					stList.add(st);
				}
			}

			// 配送范围
			String[] garden = areaName.split(",");
			List<ServiceArea> gardenname = new ArrayList<ServiceArea>();
			ServiceArea sa = null;
			if (garden[0].length() != 0 && garden.length != 0) {
				for (int j = 0; j < garden.length; j++) {
					sa = new ServiceArea();
					sa.setAreaId(Long.parseLong(garden[j]));
					gardenname.add(sa);
				}
			}
			// 基本信息
			Servicelist serviceInfo = new Servicelist();
			serviceInfo.setCompanyId(personnel.getCompanyId());
			serviceInfo.setTitle(title);
			serviceInfo.setServiceType(serviceType);
			serviceInfo.setContent(Commonparam.clearStr(content));
			serviceInfo.setSummary(summary);
			serviceInfo.setPhone(phone);
			serviceInfo.setImage(image);
			serviceInfo.setReleaseTime(new Date());
			serviceInfo.setStatus("1");// 1创建待审核2修改申请3关闭申请
			serviceInfo.setExamineResult(3);// 1 审核通过2审核不通过3未审核4关闭
			if(personnel.getType()==1){
				serviceInfo.setExamineResult(1);// 1 审核通过2审核不通过3未审核4关闭	
			}

			Long serv = servicelistManager.seveServicelist(serviceInfo, stList,
					gardenname);
			if (serv != null) {
				bean.setStatus(200);
			} else {
				bean.setStatus(400);
			}
		} catch (Exception e) {
			bean.setStatus(400);
			e.printStackTrace();
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));

	}

	// 查找共享漕河泾

	public void findServiceInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		//if (personnel.getType() != 1) {
			try {
				String serviceId = request.getParameter("serviceId");
				Servicelist servicelist = new Servicelist();
				servicelist.setServiceId(Long.parseLong(serviceId));

				Object se = servicelistManager.findServiceInfo(servicelist);
				List<Map> s = servicelistManager.findServiceTag((Long
						.parseLong(serviceId)));
				List<Map> ar = servicelistManager.findServiceArea(Long
						.parseLong(serviceId));

				request.setAttribute("serviceInfo", se);
				request.setAttribute("serviceArea", ar);
				request.setAttribute("serviceTag", s);
			} catch (Exception e) {				
			}
			request.getRequestDispatcher("/pages/company/ServiceinfoUpdate.jsp")
					.forward(request, response);		
	}

	// 更新信息

	public void updateServiceInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();

		try {
			String thirdCategoryTags = request.getParameter("thirdCategoryTag");// 已选标签的值
			String areaName = request.getParameter("hiddenAreaName");// 园区名称的值

			// 标签
			String[] tags = thirdCategoryTags.split(",");
			List<ServiceTag> stList = new ArrayList<ServiceTag>();
			ServiceTag st = null;
			if (tags[0].length() != 0 && tags.length != 0) {
				for (int i = 0; i < tags.length; i++) {
					st = new ServiceTag();
					st.setTagId(Long.parseLong(tags[i]));
					stList.add(st);
				}
			}

			// 配送范围
			String[] garden = areaName.split(",");
			List<ServiceArea> gardenname = new ArrayList<ServiceArea>();
			ServiceArea sa = null;
			if (garden[0].length() != 0 && garden.length != 0) {
				for (int j = 0; j < garden.length; j++) {
					sa = new ServiceArea();
					sa.setAreaId(Long.parseLong(garden[j]));
					gardenname.add(sa);
				}
			}
			// 基本信息
			Servicelist serviceInfo = new Servicelist();
			if (personnel.getType() == 2) {// 企业后台
				serviceInfo.setCompanyId(personnel.getOrganizationalID());
			} else if (personnel.getType() == 1) {// 开发区
				serviceInfo.setCompanyId(personnel.getCompanyId());
			}
			serviceInfo.setTitle(title);
			serviceInfo.setServiceType(serviceType);
			serviceInfo.setContent(Commonparam.clearStr(content));
			serviceInfo.setPhone(phone);
			serviceInfo.setImage(image);
			serviceInfo.setSummary(summary);
			serviceInfo.setReleaseTime(new Date());
			serviceInfo.setServiceId(serviceId);
			serviceInfo.setStatus("2");// 1创建待审核2修改申请3关闭申请
			serviceInfo.setExamineResult(3);// 1 审核通过2审核不通过3未审核4关闭
			if(personnel.getType()==1){
				serviceInfo.setExamineResult(1);// 1 审核通过2审核不通过3未审核4关闭	
			}
			
			servicelistManager.updateServiceInfo(serviceInfo, stList,
					gardenname);
			bean.setStatus(200);
		} catch (Exception e) {
			bean.setStatus(400);
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	// 开发区后台 共享漕河泾审核状态 关闭或开启
	public void serviceInfoCloseOrOpen() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> serviceStatus = new HashMap<String, Object>();
			if (serviceId != null && examineResult != null && status != null) {
				serviceStatus.put("serviceId", serviceId);
				serviceStatus.put("status", status);// 1创建待审核2修改申请3关闭申请
				serviceStatus.put("examineResult", examineResult);// 1审核通过2审核不通过3未审核
																	// 4关闭
				servicelistManager.serviceInfoCloseOrOpen(serviceStatus);
				bean.setStatus(200);
			} else {
				bean.setStatus(400);
			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
			e.printStackTrace();
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 共享漕河泾 申请关闭
	 */
	public void applyCloseServiceListInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			if (serviceId != null && personnel != null) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("serviceId", serviceId);
				Long serviceStatua = servicelistManager.findServiceStatua(map);
				if (serviceStatua != Long.valueOf(serviceStatus)) {
					map.put("status", serviceStatus);// 1是创建申请2是修改申请3关闭申请//4开启申请
					map.put("examineResult", 3);// 1 审核通过2审核不通过3未审核4关闭
					servicelistManager.serviceInfoCloseOrOpen(map);
					bean.setStatus(200);
				} else {
					bean.setStatus(500);// 重复
				}
			}
		} catch (Exception e) {
			bean.setRows(400);
			bean.setMsg(e.getLocalizedMessage());
			e.printStackTrace();
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	Integer filName, filValue, filnum, type;
	String serviceIds;

	public void updServiceRelation() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		try {
			if (user != null && user.getType() == 1) {
				String s = (String) servicelistManager.updServiceRelation(
						serviceIds, Commonparam.SERVICE_COLUMNS[filName],
						filValue, filnum, type);
				if (s == null) {
					bean.setStatus(200);
				} else {
					bean.setMsg(s);
				}
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public Integer getTop() {
		return top;
	}

	public void setTop(Integer top) {
		this.top = top;
	}

	public Integer getFilName() {
		return filName;
	}

	public void setFilName(Integer filName) {
		this.filName = filName;
	}

	public Integer getFilValue() {
		return filValue;
	}

	public void setFilValue(Integer filValue) {
		this.filValue = filValue;
	}

	public Integer getFilnum() {
		return filnum;
	}

	public void setFilnum(Integer filnum) {
		this.filnum = filnum;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getServiceIds() {
		return serviceIds;
	}

	public void setServiceIds(String serviceIds) {
		this.serviceIds = serviceIds;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getServiceType() {
		return serviceType;
	}

	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getCheckbox() {
		return checkbox;
	}

	public void setCheckbox(String checkbox) {
		this.checkbox = checkbox;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setReleaseTime(Date releaseTime) {
		this.releaseTime = releaseTime;
	}

	public Date getReleaseTime() {
		return releaseTime;
	}

	public void setServiceId(Long serviceId) {
		this.serviceId = serviceId;
	}

	public Long getServiceId() {
		return serviceId;
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

	public Integer getServiceStatus() {
		return serviceStatus;
	}

	public void setServiceStatus(Integer serviceStatus) {
		this.serviceStatus = serviceStatus;
	}

	public Integer getServiceTypeList() {
		return serviceTypeList;
	}

	public void setServiceTypeList(Integer serviceTypeList) {
		this.serviceTypeList = serviceTypeList;
	}

	public String getServiceKeyWord() {
		return serviceKeyWord;
	}

	public void setServiceKeyWord(String serviceKeyWord) {
		this.serviceKeyWord = serviceKeyWord;
	}

	public Integer getExamineResult() {
		return examineResult;
	}

	public void setExamineResult(Integer examineResult) {
		this.examineResult = examineResult;
	}

}
