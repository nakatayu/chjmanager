package com.chj.action;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.chj.entity.Area;
import com.chj.service.ActivityManager;
import com.chj.service.LocationManage;
import com.json.BaseBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import cn.eavic.framework.web.BaseAction;

@Namespace("/")
@Results({ @Result(name = BaseAction.NONE, location = "", type = "redirect"), })
public class LocationmanageAction extends ActionSupport {
	private static final long serialVersionUID = 7655056122242830524L;

	@Autowired
	LocationManage locationManage;
	private Integer size, page;
	private String LoctionManageIds;
	private String areaId, name;

	/**
	 * 查询一级位置管理列表
	 */
	public void findLocationManageList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		HashMap<String, Object> manage = new HashMap<String, Object>();
		manage.put("size", size);
		manage.put("startIndex", (page - 1) * size);
		List<Object> lm = locationManage.findLocationManageList(manage);
		bean.setStatus(200);
		bean.setRows(lm);
		bean.setTotal(locationManage.findLocationManageCount());
		String josn = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(josn.getBytes("UTF-8"));
	}

	/**
	 * 删除位置管理
	 * 
	 * @return
	 */
	public void delLocationmanage() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		Long dellm = locationManage.delLocationmanage(LoctionManageIds);
		if (dellm > 0) {
			bean.setStatus(200);
			bean.setMsg("删除成功");
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 查询位置管理子集列表
	 * 
	 * @return
	 */
	public void findLocationManageSubsetList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		HashMap<String, Object> sublm = new HashMap<String, Object>();
		sublm.put("parentId", name);
		sublm.put("size", size);
		sublm.put("startIndex", (page - 1) * size);
		List<Object> subloc = locationManage
				.findLocationManageSubsetList(sublm);
		if (subloc.size() > 0) {
			bean.setStatus(200);
			bean.setRows(subloc);
			bean.setTotal(locationManage
					.findLocationManageSubsetListCount(sublm));
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}
	
	/**
	 * 添加父节点位置
	 * 
	 * @return
	 */

	public void addPLocationManageList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		Area area = new Area();
		area.setAreaName(locationName);
		area.setDeleteFlag(1);
		area.setParentId((long) 0);
		Long savelm = locationManage.addPLocationManageList(area);
		if (savelm != null) {
			bean.setStatus(200);
			bean.setMsg("添加成功");
		}else{
			bean.setStatus(400);
			bean.setMsg("失败");
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}


	/**
	 * 添加子节点位置
	 * 
	 * @return
	 */
	private String locationName, locationAdderss;
	private String lat, lng;

	public void addLocationManageList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		Area area = new Area();
	//	String pname = locationManage.addLocationManage(areaId);
		area.setAreaName(locationName);
		area.setDeleteFlag(1);
		area.setDetailedAddress(locationAdderss);
		area.setLat(Double.parseDouble(lat));
		area.setLng(Double.parseDouble(lng));
			area.setParentId(Long.parseLong(areaId));
		Long savelm = locationManage.addLocationManageList(area);
		if (savelm != null) {
			bean.setStatus(200);
			bean.setMsg("添加成功");
		}else{
			bean.setStatus(400);
			bean.setMsg("添加失败");
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 显示二级位置详情
	 */
	private String areaid;
	public void LocationManageList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			String areaid = request.getParameter("area_id");
			Object area = locationManage.LocationManageList(areaid);
			request.setAttribute("area", area);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("修改失败");
		}
		request.getRequestDispatcher("/pages/manager/updateSubsetLocationManage.jsp").forward(request, response);
	}
	
	/**
	 * 显示一级位置详情
	 */
	
	public void PLocationManageList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			String areaid = request.getParameter("area_id");
			Object area = locationManage.LocationManageList(areaid);
			request.setAttribute("area", area);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("修改失败");
		}
		request.getRequestDispatcher("/pages/manager/updateLocationManage.jsp").forward(request, response);
	}

	/***
	 * 修改位置
	 * @throws Exception
	 */

	public void updateLoactionManageInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		Area area = new Area();
		
			area.setAreaId(Long.parseLong(areaId));
			area.setAreaName(locationName);
			if(lat !=null && lat.trim().length()>0){
				area.setLat(Double.parseDouble(lat));
			}else{
				area.setLat(0.0);
			}
			if(lng !=null && lng.trim().length()>0){
				area.setLng(Double.parseDouble(lng));
			}else{
				area.setLng(0.0);
			}
			if(locationAdderss!=null&&!locationAdderss.equals("")){
				area.setDetailedAddress(locationAdderss);
			}else{
				area.setDetailedAddress("");
				
			}
		int upar = locationManage.updateLoactionManageInfo(area);
		if(upar>0){
			bean.setStatus(200);
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public String getLoctionManageIds() {
		return LoctionManageIds;
	}

	public void setLoctionManageIds(String loctionManageIds) {
		LoctionManageIds = loctionManageIds;
	}

	public String getAreaId() {
		return areaId;
	}

	public void setAreaId(String areaId) {
		this.areaId = areaId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	public String getLocationAdderss() {
		return locationAdderss;
	}

	public void setLocationAdderss(String locationAdderss) {
		this.locationAdderss = locationAdderss;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String getAreaid() {
		return areaid;
	}

	public void setAreaid(String areaid) {
		this.areaid = areaid;
	}

}
