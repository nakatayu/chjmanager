package com.chj.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

//import org.apache.naming.java.javaURLContextFactory;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import cn.eavic.framework.web.BaseAction;

import com.chj.entity.JsonDateValueProcessor;
import com.chj.entity.Personnel;
import com.chj.entity.ServiceArea;
import com.chj.entity.ServiceTag;
import com.chj.entity.Servicelist;
import com.chj.service.CompanyInfoManagerManager;
import com.chj.service.PersonnelManager;
import com.chj.service.ShopManager;
import com.chj.utils.MD5Util;
import com.json.BaseBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Namespace("/")
@Results({ @Result(name = BaseAction.NONE, location = "userAction.action", type = "redirect") })
public class PersonnelAction extends ActionSupport {
	/**
	 * 管理员的账号表
	 */
	private static final long serialVersionUID = 7655056122242830524L;

	@Autowired
	PersonnelManager personnelManager;
	@Autowired
	CompanyInfoManagerManager companyInfoManagerManager;
	@Autowired
	ShopManager shopManager;

	private Long companyId;
	private Long companyShopId;
	private Long size;
	private Long id;
	private Long personnelId;
	private String name;
	private String userName; // 账号
	private String pwd; // 密码
	private String gender;
	private String email;
	private String phone;
	private Date createdDate;
	private Date endTime;
	private String status;
	private Integer deleteFlag;
	private Integer type;// 判断状态 1是开发区，2是企业，3是店铺
	private Long organizationalID;
	private String cardNo;

	/**
	 * 查询管理人员的列表，需要传一个企业ID过来
	 * */

	public void findPersonnelList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		BaseBean baseBean = new BaseBean();
		try {
			// 1是开发区，2是企业，3是店铺，4是星巴克总部 ,5是星巴克店铺
			if (user.getType() != 1) {
				companyId=user.getCompanyId();
			} 
			baseBean.setThemeCount(companyInfoManagerManager
					.findCompanyInfo(companyId));
			
			HashMap<String, Object> parm = new HashMap<String, Object>();				
			parm.put("companyId", companyId);
			parm.put("name", name);
			parm.put("size", size);
			parm.put("startIndex", (page - 1) * size);
			List<Personnel> users = personnelManager.findPersonnelList(parm);
			if (users.size() > 0) {
				baseBean.setTotal(personnelManager.findPersonnelListCount(parm));
				baseBean.setStatus(200);
				baseBean.setRows(users);
			} else {
				baseBean.setMsg("没有数据!");
			}
		} catch (Exception e) {
			baseBean.setStatus(400);
			baseBean.setMsg(e.getLocalizedMessage());			
		}
		// datetime格式转换
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class,
				new JsonDateValueProcessor("yyyy-MM-dd HH:mm:ss"));
		String json = JSONObject.fromObject(baseBean, jsonConfig).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 开发区后台 系统维护下面人员维护
	 */
	public void findManagerPersonnelList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		BaseBean baseBean = new BaseBean();
		try {

			HashMap<String, Object> parm = new HashMap<String, Object>();
			parm.put("type", user.getType());
			parm.put("name", name);
			parm.put("size", size);
			parm.put("startIndex", (page - 1) * size);
			List<Personnel> users = personnelManager.findPersonnelList(parm);
			if (users.size() > 0) {
				baseBean.setTotal(personnelManager.findPersonnelListCount(parm));
				baseBean.setStatus(200);
				baseBean.setRows(users);
			} else {
				baseBean.setMsg("没有数据!");
			}

		} catch (Exception e) {
			baseBean.setStatus(400);
			baseBean.setMsg(e.getLocalizedMessage());
			e.printStackTrace();
		}
		// datetime格式转换
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class,
				new JsonDateValueProcessor("yyyy-MM-dd HH:mm:ss"));
		String json = JSONObject.fromObject(baseBean, jsonConfig).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 查询管理人员的详细信息
	 * */

	public void findUserInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean baseBean = new BaseBean();
		try {
			Personnel personnelInfo = new Personnel();
			personnelInfo = personnelManager.findpersonnelInfo(personnelId);
			baseBean.setStatus(200);
			baseBean.setRows(personnelInfo);
		} catch (Exception e) {
			baseBean.setStatus(400);
			baseBean.setMsg(e.getLocalizedMessage());
		}
		// datetime格式转换
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.util.Date.class,
				new JsonDateValueProcessor("yyyy-MM-dd HH:mm:ss"));
		String json = JSONObject.fromObject(baseBean, jsonConfig).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));

	}

	/**
	 * 创建管理人员的账号
	 */
	public void newPersonnelInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> parm = new HashMap<String, Object>();

			parm.put("deleteFlag", 1);
			parm.put("name", name);
			parm.put("userName", userName);
			parm.put("pwd", MD5Util.digest(pwd));
			parm.put("email", email);
			parm.put("phone", phone);
			parm.put("type", type);
			if (personnel.getType() != 1) {
				if (type == 3) {// 店铺类型
					parm.put("companyId", personnel.getCompanyId());
					parm.put("organizationalID", organizationalID);
				} else if (type == 2) {// 企业类型
					parm.put("companyId", personnel.getCompanyId());
					parm.put("organizationalID", personnel.getCompanyId());
				} else if (type == 4) {// 辛巴克企业
					parm.put("companyId", personnel.getCompanyId());
					parm.put("organizationalID", personnel.getCompanyId());
				} else if (type == 5) {// 辛巴克店铺
					parm.put("companyId", personnel.getCompanyId());
					parm.put("organizationalID", organizationalID);
				}
			} else if (personnel.getType() == 1) {// 开发区
				if (type == 3) {// 店铺类型
					parm.put("companyId", companyId);
					parm.put("organizationalID", organizationalID);
				} else if (type == 2) {// 企业类型
					parm.put("companyId", companyId);
					parm.put("organizationalID", companyId);
				} else if (type == 4) {// 辛巴克企业
					parm.put("companyId", companyId);
					parm.put("organizationalID", companyId);
				} else if (type == 5) {// 辛巴克店铺
					parm.put("companyId", companyId);
					parm.put("organizationalID", organizationalID);
				}else if(type == 1){
					parm.put("companyId", companyId);
					parm.put("organizationalID", companyId);
				}
			}
			parm.put("status", 1);
			parm.put("gender", gender);
			parm.put("createdDate", new Date());
			parm.put("endTime", new Date());
			parm.put("cardNo", cardNo);
			Long id = personnelManager.newPersonnelInfo(parm);
			bean.setStatus(200);
		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 删除管理人员的账号
	 */
	public void delPersonnelInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String personnelId = request.getParameter("selectedUserId");
		String[] idStr = personnelId.split(",");
		List<Long> idList = new ArrayList<Long>();
		for (int i = 0; i < idStr.length; i++) {
			idList.add(Long.parseLong(idStr[i]));
		}
		BaseBean bean = new BaseBean();
		try {
			personnelManager.delPersonnelInfo(idList);
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
	 * 查询管理人员信息
	 */
	public void findPersonnelInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		if (personnel.getType() != 1) {
			try {
				String personnelId = request.getParameter("personnelId");
				Personnel personnelInfo = personnelManager
						.findPersonnelInfo(Long.parseLong(personnelId));
				request.setAttribute("personnel", personnelInfo);
				request.setAttribute("companyShopInfo", shopManager
						.findCompanyShopInfo(personnel.getCompanyId()));
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("修改失败");
			}
			request.getRequestDispatcher(
					"/pages/company/CompanyManagerUpdateAccountInfo.jsp")
					.forward(request, response);
		} else if (personnel.getType() == 1) {// 开发区
			try {
				String personnelId = request.getParameter("personnelId");
				Personnel personnelInfo = personnelManager
						.findPersonnelInfo(Long.parseLong(personnelId));
				request.setAttribute("personnel", personnelInfo);
				request.setAttribute("companyShopInfo",
						shopManager.findCompanyShopInfo(companyId));
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getRequestDispatcher(
					"/pages/manager/comapnyInfoManagerUpdatePersonnelInfo.jsp")
					.forward(request, response);
		}
	}

	/**
	 * 企业/开发区企业修改 修改管理人员信息
	 */
	public void updatePersonnelInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> parm = new HashMap<String, Object>();
			parm.put("id", personnelId);
			parm.put("deleteFlag", 1);
			parm.put("name", name);
			parm.put("userName", userName);
			parm.put("pwd", MD5Util.digest(pwd));
			parm.put("email", email);
			parm.put("phone", phone);
			parm.put("type", type);
			if (personnel.getType() != 1) {
				if (type == 3) {// 店铺类型
					parm.put("companyId", personnel.getCompanyId());
					parm.put("organizationalID", organizationalID);
				} else if (type == 2) {// 企业类型
					parm.put("companyId", personnel.getCompanyId());
					parm.put("organizationalID", personnel.getCompanyId());
				} else if (type == 4) {// 辛巴克企业
					parm.put("companyId", personnel.getCompanyId());
					parm.put("organizationalID", personnel.getCompanyId());
				} else if (type == 5) {// 辛巴克店铺
					parm.put("companyId", personnel.getCompanyId());
					parm.put("organizationalID", organizationalID);
				}
			} else if (personnel.getType() == 1) {// 开发区企业修改
				if (type == 3) {// 店铺类型
					parm.put("companyId", companyId);
					parm.put("organizationalID", organizationalID);
				} else if (type == 2) {// 企业类型
					parm.put("companyId", companyId);
					parm.put("organizationalID", companyId);
				} else if (type == 4) {// 辛巴克企业
					parm.put("companyId", companyId);
					parm.put("organizationalID", companyId);
				} else if (type == 5) {// 辛巴克店铺
					parm.put("companyId", companyId);
					parm.put("organizationalID", organizationalID);
				}
			}
			parm.put("status", 1);
			parm.put("gender", gender);
			parm.put("createdDate", new Date());
			parm.put("endTime", new Date());
			parm.put("cardNo", cardNo);
			personnelManager.updatePersonnelInfo(parm);
			bean.setStatus(200);
		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 开发区 创建管理人员的账号
	 */
	public void newManagerPersonnelInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> parm = new HashMap<String, Object>();

			parm.put("deleteFlag", 1);
			parm.put("name", name);
			parm.put("userName", userName);
			parm.put("pwd", MD5Util.digest(pwd));
			parm.put("email", email);
			parm.put("phone", phone);
			parm.put("type", 1);
			parm.put("companyId", personnel.getCompanyId());
			parm.put("organizationalID", personnel.getCompanyId());
			parm.put("status", 1);
			parm.put("gender", gender);
			parm.put("createdDate", new Date());
			parm.put("endTime", new Date());
			parm.put("cardNo", cardNo);
			Long id = personnelManager.newPersonnelInfo(parm);
			bean.setStatus(200);
		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 开发区 查询管理人员信息
	 */
	public void findManagerPersonnelInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			String personnelId = request.getParameter("personnelId");
			Personnel personnelInfo = personnelManager.findPersonnelInfo(Long
					.parseLong(personnelId));
			request.setAttribute("personnel", personnelInfo);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("修改失败");
		}
		request.getRequestDispatcher(
				"/pages/manager/comapnyInfoManagerUpdatePersonnelManagerInfo.jsp")
				.forward(request, response);
	}

	/**
	 * 开发区 修改管理人员信息
	 */
	public void updateManagerPersonnelInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> parm = new HashMap<String, Object>();
			parm.put("id", personnelId);
			parm.put("deleteFlag", 1);
			parm.put("name", name);
			parm.put("userName", userName);
			parm.put("pwd", MD5Util.digest(pwd));
			parm.put("email", email);
			parm.put("phone", phone);
			parm.put("companyId", personnel.getCompanyId());
			parm.put("organizationalID", personnel.getOrganizationalID());
			parm.put("type", personnel.getType());
			parm.put("status", 1);
			parm.put("gender", gender);
			parm.put("createdDate", new Date());
			parm.put("endTime", new Date());
			parm.put("cardNo", cardNo);
			personnelManager.updatePersonnelInfo(parm);
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
	 * 开发区 查看账号名是否
	 */
	public void checkName() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> parm = new HashMap<String, Object>();
			parm.put("name", name);
			if (name != null && name.trim().length() > 0) {
				Long checkName = personnelManager.checkName(parm);
				if (checkName == 0) {
					bean.setStatus(200);
				} else {
					bean.setStatus(400);
				}
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
	 * 开发区设置用户权限
	 * @throws Exception
	 */
	public void seltRoleOfPersonnel() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		String retpage = "pages/login.jsp";
		//type 0表示是开发区类型  1表示是企业或店铺  3开发区设置企业权限
		if(type==0){
			retpage = "pages/manager/ManagerManagerRole.jsp";
		}else if(type==1){
			retpage = "pages/company/CompanyManagerRole.jsp";
		}else if(type==3){
			type=1;
			retpage = "pages/manager/ManagerCompanyRole.jsp";
		}
		
		if(personnel!=null){ 			
			Object actionlist = personnelManager.selectRoleOfPersonnel(
					type, personnelId, personnel.getId());
			request.setAttribute("action", actionlist);

			Object rolelist = personnelManager.selRolePernelMger(type,personnelId,
					personnel.getId());
			request.setAttribute("role", rolelist);
			System.out.println(JSONArray.fromObject(rolelist));
			request.setAttribute("personnelId", personnelId);			
		}
		request.getRequestDispatcher(retpage).forward(request, response);
	}

	String role, actions;
	/**
	 * 修改用户角色,权限
	 * @throws Exception
	 */
	public void updRolePersonnel() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			if (personnel == null) {
				bean.setMsg("请登录!");
				bean.setStatus(400);
			} else {
				personnelManager.updRolePersonnel(personnelId, role, actions);
				bean.setStatus(200);
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}
	
	/**
	 * 角色设置
	 * @throws Exception
	 */
	public void seltRolesAction() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		String retpage = "pages/login.jsp";
		//type 0表示是开发区类型  1表示是企业或店铺  		
		if(personnel!=null){ 
			retpage = "pages/manager/ManagerRole.jsp";
			
			Object actionlist = personnelManager.selectRoleAction(type);
			request.setAttribute("action", actionlist);
			
			Object rolelist = personnelManager.selectActionRole(type);
			request.setAttribute("role", rolelist);
			
			request.setAttribute("type", type);
		}
		request.getRequestDispatcher(retpage).forward(request, response);
	} 

	/**
	 * 添加角色
	 * @throws Exception
	 */
	public void addnewRolePersonnel() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			if (personnel == null) {
				bean.setMsg("请登录!");
				bean.setStatus(400);
			} else {
				Boolean b=true;
				//type 0表示是开发区类型  1表示是企业或店铺  
				if(personnel.getType()==1&&type==1){
					b=false;
				}
				personnelManager.addnewRolePersonnel(personnel.getId(), name,
						actions,type,b);
				bean.setStatus(200);
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}
	
	Integer roleID;
	/**
	 * 修改角色
	 * @throws Exception
	 */
	public void updRolePenel() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			if (personnel == null) {
				bean.setMsg("请登录!");
				bean.setStatus(400);
			} else {
				personnelManager.updRolePenel(roleID,actions,name);
				bean.setStatus(200);
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public void checkPersonnelName() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
		
			Integer num= personnelManager.checkPersonnelName(name);
			bean.setRows(num);
			bean.setStatus(200);
		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public Integer getRoleID() {
		return roleID;
	}

	public void setRoleID(Integer roleID) {
		this.roleID = roleID;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getActions() {
		return actions;
	}

	public void setActions(String actions) {
		this.actions = actions;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public Long getCompanyShopId() {
		return companyShopId;
	}

	public void setCompanyShopId(Long companyShopId) {
		this.companyShopId = companyShopId;
	}

	public Long getSize() {
		return size;
	}

	public void setSize(Long size) {
		this.size = size;
	}

	public Long getPage() {
		return page;
	}

	public void setPage(Long page) {
		this.page = page;
	}

	private Long page;

	public Long getPersonnelId() {
		return personnelId;
	}

	public void setPersonnelId(Long personnelId) {
		this.personnelId = personnelId;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public String getUserName() {
		return userName;
	}

	public String getPwd() {
		return pwd;
	}

	public String getGender() {
		return gender;
	}

	public String getEmail() {
		return email;
	}

	public String getPhone() {
		return phone;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public Date getEndTime() {
		return endTime;
	}

	public String getStatus() {
		return status;
	}

	public Integer getDeleteFlag() {
		return deleteFlag;
	}

	public Integer getType() {
		return type;
	}

	public Long getOrganizationalID() {
		return organizationalID;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public void setOrganizationalID(Long organizationalID) {
		this.organizationalID = organizationalID;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

}
