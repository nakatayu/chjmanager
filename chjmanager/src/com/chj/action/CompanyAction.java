package com.chj.action;

import java.io.IOException;
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

import com.chj.common.Commonparam;
import com.chj.entity.Company;
import com.chj.entity.CompanyShopCategory;
import com.chj.entity.CompanyTag;
import com.chj.entity.JsonDateValueProcessor;
import com.chj.entity.PayType;
import com.chj.entity.Personnel;
import com.chj.entity.Shop;
import com.chj.entity.Shoptag;
import com.chj.entity.User;
import com.chj.service.CompanyInfoManagerManager;
import com.chj.service.CompanyManager;
import com.chj.service.UserManager;
import com.json.BaseBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.eavic.framework.web.BaseAction;

@Namespace("/")
@Results({ @Result(name = BaseAction.NONE, location = "companyAction.action", type = "redirect"), })
public class CompanyAction extends ActionSupport {
	private static final long serialVersionUID = 7655056122242830524L;
	@Autowired
	CompanyManager companyManager;

	@Autowired
	UserManager userManager;

	@Autowired
	CompanyInfoManagerManager companyInfoManagerManager;

	private Long companyId;
	private String name;
	private Integer type;
	private String address;
	private String email;
	private Date registDate;
	private String logo;
	private String companyType;
	private String linkman;
	private String linkmanTel;
	private String operateScope;
	private String companyInfo;
	private String companyURL;
	private Long companyShopId;
	private Long companyShopCategoryId;
	private Integer size, page;

	/**
	 * 企业/店铺/星巴克/星巴克店铺 查询企业信息
	 */
	public void findCompanyInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		String pages="pages/company/CompanyInfo.jsp";
		try {
			if (personnel.getType() != 1) {
				Company companyInfo = companyInfoManagerManager
						.findCompanyInfo(personnel.getCompanyId());// 企业基本信息
				List<Map> companyTag = companyInfoManagerManager
						.findCompanyTag(personnel.getCompanyId());// 企业标签
				request.setAttribute("companyTag", companyTag);
				request.setAttribute("company", companyInfo);

			}
		} catch (Exception e) {
			pages="pages/login.jsp";
		}
		request.getRequestDispatcher(pages).forward(request, response);
	}

	/**
	 * 企业\店铺\星巴克\星巴克店铺 更新企业信息
	 */
	public void updateCompanyInfoSave() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		if (personnel.getType() != 1) {
			String thirdCategoryTags = request.getParameter("tagid");// 已选标签的值
			try {
				// 已选标签
				String[] tags = thirdCategoryTags.split(",");
				List<CompanyTag> stList = new ArrayList<CompanyTag>();
				CompanyTag st = null;
				if (tags[0].length() != 0 && tags.length != 0) {
					for (int i = 0; i < tags.length; i++) {
						st = new CompanyTag();
						st.setTagId(Long.parseLong(tags[i]));
						stList.add(st);
					}
				}
				// 企业基本信息
				Company company = new Company();
				company.setCompanyId(personnel.getCompanyId());
				company.setName(name);
				company.setEmail(email);
				company.setLinkman(linkman);
				company.setLinkmanTel(linkmanTel);
				company.setAddress(address);
				company.setCompanyInfo(Commonparam.clearStr(companyInfo));
				company.setCompanyURL(companyURL);
				company.setRegistDate(registDate);
				company.setCompanyType(companyType);
				company.setOperateScope(operateScope);
				company.setLogo(logo);
				//company.setType(type);
				company.setStatus(2);// 1是创建申请2是修改申请3关闭申请 修改企业默认2
				company.setExamineResult(3);// 1 审核通过2审核不通过3未审核4关闭 等待开发区审核 默认3

				companyInfoManagerManager.updateCompanyInfo(company, stList);
				List<Map> companyTag = companyInfoManagerManager
						.findCompanyTag(personnel.getCompanyId());// 企业标签
				request.setAttribute("companyTag", companyTag);
				request.setAttribute("company", company);
				bean.setStatus(200);

			} catch (Exception e) {
				bean.setMsg(e.getLocalizedMessage());
			}
			String json = JSONObject.fromObject(bean).toString();
			response.getOutputStream().write(json.getBytes("UTF-8"));
		}
	}

	/**
	 * 企业类型 开发区
	 */
	public void findCompanyShopCategoryList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> compayTypeList = new HashMap<String, Object>();

			compayTypeList.put("name", name);
			compayTypeList.put("size", size);
			compayTypeList.put("startIndex", (page - 1) * size);
			List<Object> list = companyManager
					.findCompanyShopCategoryList(compayTypeList);
			if (list.size() > 0) {
				bean.setStatus(200);
				bean.setRows(list);
				bean.setTotal((Long) companyManager.findCompanyTypeListCount());
			} else {
				bean.setMsg("没有数据!");
			}
		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 保存企业类型开发区
	 */
	public void seveCompanyShopCategory() throws IOException {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();

		try {

			CompanyShopCategory companysa = new CompanyShopCategory();

			companysa.setName(name);
			companysa.setType(1);

			Long companysate = companyManager
					.seveCompanyShopCategory(companysa);
			bean.setStatus(200);
		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 开发区 查询企业类型
	 */
	public void findCompanyTypeInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		try {
			CompanyShopCategory CompanyTypeInfo = companyManager
					.findCompanyTypeInfo(companyShopCategoryId);
			request.setAttribute("CompanyShopCategory", CompanyTypeInfo);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("type为空！");
		}
		request.getRequestDispatcher(
				"pages/manager/Companyshopcategoryinfo.jsp").forward(request,
				response);
	}

	/**
	 * 开发区 更新企业类型
	 */
	public void updateCompanyTypeInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		BaseBean bean = new BaseBean();
		try {
			CompanyShopCategory CompanyShopCategory = new CompanyShopCategory();
			CompanyShopCategory.setCompanyShopCategoryId(companyShopCategoryId);
			CompanyShopCategory.setName(name);
			companyManager.updateCompanyTypeInfo(CompanyShopCategory);
			bean.setStatus(200);
		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 开发区 删除企业类型
	 */
	public void deleteCompanyType() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			String companyShopCategoryId = request
					.getParameter("companyTypeId");
			if (companyShopCategoryId != null && companyShopCategoryId != "") {
				String[] idStr = companyShopCategoryId.split(",");
				List<Long> idList = new ArrayList<Long>();
				for (int i = 0; i < idStr.length; i++) {
					idList.add(Long.parseLong(idStr[i]));// 企业ID
				}
				companyManager.deleteCompanyType(idList);
				bean.setStatus(200);
			}
		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/*
	 * 店铺类型list 开发区
	 */

	public void findShopTypeList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> shopTypeList = new HashMap<String, Object>();

			shopTypeList.put("name", name);
			shopTypeList.put("size", size);
			shopTypeList.put("startIndex", (page - 1) * size);
			List<Object> list = companyManager.findShopTypeList(shopTypeList);
			if (list.size() > 0) {
				bean.setStatus(200);
				bean.setRows(list);
				bean.setTotal(companyManager.findShopTypeListCount());
			} else {
				bean.setMsg("没有数据!");
			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 保存 店铺类型 开发区
	 * 
	 * @return
	 */
	public void seveShopType() throws IOException {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			CompanyShopCategory companysca = new CompanyShopCategory();
			companysca.setName(name);
			companysca.setType(2);
			Long companysateg = companyManager.seveShopType(companysca);
			bean.setStatus(200);
		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 开发区 查询店铺类型
	 */
	public void findShopTypeInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			CompanyShopCategory ShopTypeInfo = companyManager
					.findShopTypeInfo(companyShopCategoryId);
			request.setAttribute("CompanyShopCategory", ShopTypeInfo);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("type为空！");
		}
		request.getRequestDispatcher("pages/manager/Shoptypeinfo.jsp").forward(
				request, response);
	}

	/**
	 * 开发区 更新店铺类型
	 */
	public void updateShopTypeInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		BaseBean bean = new BaseBean();
		try {
			CompanyShopCategory CompanyShopCategory = new CompanyShopCategory();
			CompanyShopCategory.setCompanyShopCategoryId(companyShopCategoryId);
			CompanyShopCategory.setName(name);
			companyManager.updateShopTypeInfo(CompanyShopCategory);
			bean.setStatus(200);
		} catch (Exception e) {
			bean.setRows(400);
			e.getLocalizedMessage();
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 首页推荐
	 */
	private Integer filName, filValue, filnum;
	private String companyIdlist;

	public void companyWebExtend() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		try {
			if (user != null) {

				String s = companyManager.companyWebExtend(companyIdlist,
						Commonparam.COMPANY_COLUMNS[filName], filValue, filnum);
				if (s == null) {
					bean.setStatus(200);
				} else {
					bean.setMsg(s);
				}
			}
		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}

		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
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

	public String getCompanyIdlist() {
		return companyIdlist;
	}

	public void setCompanyIdlist(String companyIdlist) {
		this.companyIdlist = companyIdlist;
	}

	public Long getCompanyShopId() {
		return companyShopId;
	}

	public void setCompanyShopId(Long companyShopId) {
		this.companyShopId = companyShopId;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public String getName() {
		return name;
	}

	public String getAddress() {
		return address;
	}

	public String getEmail() {
		return email;
	}

	public Date getRegistDate() {
		return registDate;
	}

	public String getLogo() {
		return logo;
	}

	public String getCompanyType() {
		return companyType;
	}

	public String getLinkman() {
		return linkman;
	}

	public String getLinkmanTel() {
		return linkmanTel;
	}

	public String getOperateScope() {
		return operateScope;
	}

	public String getCompanyInfo() {
		return companyInfo;
	}

	public String getCompanyURL() {
		return companyURL;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public void setCompanyType(String companyType) {
		this.companyType = companyType;
	}

	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}

	public void setLinkmanTel(String linkmanTel) {
		this.linkmanTel = linkmanTel;
	}

	public void setOperateScope(String operateScope) {
		this.operateScope = operateScope;
	}

	public void setCompanyInfo(String companyInfo) {
		this.companyInfo = companyInfo;
	}

	public void setCompanyURL(String companyURL) {
		this.companyURL = companyURL;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getType() {
		return type;
	}

	public void setCompanyShopCategoryId(Long companyShopCategoryId) {
		this.companyShopCategoryId = companyShopCategoryId;
	}

	public Long getCompanyShopCategoryId() {
		return companyShopCategoryId;
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
