package com.chj.action;

import java.util.ArrayList;
import java.util.Date;
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

import com.chj.common.Commonparam;
import com.chj.entity.Company;
import com.chj.entity.CompanyTag;
import com.chj.entity.Personnel;
import com.chj.entity.Shoptag;
import com.chj.service.CompanyInfoManagerManager;
import com.json.BaseBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.eavic.framework.web.BaseAction;

@Namespace("/")
@Results({ @Result(name = BaseAction.NONE, location = "companyinfomanagerAction.action", type = "redirect") })
public class CompanyinfomanagerAction extends ActionSupport {
	private static final long serialVersionUID = 7655056122242830524L;
	@Autowired
	CompanyInfoManagerManager companyInfoManagerManager;

	private Integer size, page;
	private String name;
	private Long companyId;
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
	private Integer type;
	private Integer status;
	private Integer examineResult;
	private Integer top;
	
	/**
	 * 开发区 企业查询 list
	 */
	public void findCompanyListInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> parm = new HashMap<String, Object>();
			parm.put("status", status);
			parm.put("top", top);
			parm.put("name", name);
			parm.put("size", size);
			parm.put("startIndex", (page - 1) * size);
			List<Company> company = (List<Company>) companyInfoManagerManager
					.findCompanyList(parm);
			if (company.size() > 0) {
				bean.setStatus(200);
				bean.setRows(company);
				bean.setTotal(companyInfoManagerManager
						.findCompanyListCount(parm));
			} else {
				bean.setMsg("没有数据!");
			}

		} catch (Exception e) {
			bean.setStatus(400);
			System.out.println(e.getLocalizedMessage());

		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 开发区 企业信息 逻辑删除
	 */
	public void deleteCompanyListInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			String companyId = request.getParameter("selectedCompanyId");
			if (companyId != null && companyId != "") {
				String[] idStr = companyId.split(",");
				List<Long> idList = new ArrayList<Long>();
				for (int i = 0; i < idStr.length; i++) {
					idList.add(Long.parseLong(idStr[i]));// 企业ID
				}
				companyInfoManagerManager.deleteCompanyListInfo(idList);
				bean.setStatus(200);
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
	 * 开发区 查询企业信息
	 */
	public void findCompanyInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		try {
			Company companyInfo = companyInfoManagerManager
					.findCompanyInfo(companyId);// 企业基本信息
			List<Map> companyTag = companyInfoManagerManager
					.findCompanyTag(companyId);// 企业标签
			request.setAttribute("companyTag", companyTag);
			request.setAttribute("company", companyInfo);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("type为空！");
		}
		request.getRequestDispatcher(
				"pages/manager/comapnyInfoManagerUpdateCompay.jsp").forward(
				request, response);
	}

	/**
	 * 开发区 更新企业信息
	 */
	public void updateCompanyInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		String thirdCategoryTags = request.getParameter("tagid");// 已选标签的值
		BaseBean bean = new BaseBean();
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
			// 基本信息
			Company company = new Company();
			company.setCompanyId(companyId);
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
			//company.setType(); // 企业
			company.setStatus(2);// 1是创建申请2是修改申请3关闭申请 默认2
			company.setExamineResult(3);// 1 审核通过2审核不通过3未审核4关闭 默认3

			companyInfoManagerManager.updateCompanyInfo(company, stList);
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
	 * 开发区 创建企业
	 */
	public void newCompany() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String thirdCategoryTags = request.getParameter("tagid");// 已选标签的值
		BaseBean bean = new BaseBean();
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

			Company company = new Company();
			company.setName(name);
			company.setOperateScope(operateScope);
			company.setEmail(email);
			company.setLinkman(linkman);
			company.setLinkmanTel(linkmanTel);
			company.setAddress(address);
			company.setCompanyInfo(Commonparam.clearStr(companyInfo));
			company.setCompanyURL(companyURL);
			company.setRegistDate(registDate);
			company.setCompanyType(companyType);
			company.setLogo(logo);
			company.setDeleteFlag(1);
			company.setStarScore(starScore);// 企业星级数
			company.setType(3); // type：//企业
			company.setStatus(1); // status： 1是创建申请2是修改申请3关闭申请 默认为1
			company.setExamineResult(3); // examine_result：1 审核通过2审核不通过3未审核 默认为3

			Long companyInfo = companyInfoManagerManager.newCompany(company,
					stList);
			bean.setStatus(200);
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 开发区 企业类型 下拉框
	 */
	public void findCompanyType() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			List<Object> list = companyInfoManagerManager.findCompanyType();
			bean.setStatus(200);
			bean.setRows(list);
		} catch (Exception e) {
			e.printStackTrace();
			bean.setMsg(e.getLocalizedMessage());
		}

		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 开发区 企业审核通过
	 */
	public void companyAuditPass() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			String companyId = request.getParameter("selectedCompanyId");
			if (companyId != null && companyId != "") {
				String[] idStr = companyId.split(",");
				List<Long> idList = new ArrayList<Long>();
				for (int i = 0; i < idStr.length; i++) {
					idList.add(Long.parseLong(idStr[i]));// 企业ID
				}
				companyInfoManagerManager.companyAuditPass(idList);
				bean.setStatus(200);
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
	 * 开发区 企业审核不通过
	 */
	public void companyAuditNoPass() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			String companyId = request.getParameter("selectedCompanyId");
			if (companyId != null && companyId != "") {
				String[] idStr = companyId.split(",");
				List<Long> idList = new ArrayList<Long>();
				for (int i = 0; i < idStr.length; i++) {
					idList.add(Long.parseLong(idStr[i]));// 企业ID
				}
				companyInfoManagerManager.companyAuditNoPass(idList);
				bean.setStatus(200);
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
	 * 开发区 企业关闭
	 */
	public void closeCompany() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			String companyId = request.getParameter("selectedCompanyId");
			if (companyId != null && companyId != "") {
				String[] idStr = companyId.split(",");
				List<Long> idList = new ArrayList<Long>();
				for (int i = 0; i < idStr.length; i++) {
					idList.add(Long.parseLong(idStr[i]));// 企业ID
				}
				companyInfoManagerManager.closeCompany(idList);
				bean.setStatus(200);
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
	 * 开发区 企业星级数修改
	 */
	private String starScore;

	public void updateCompanyStar() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			HashMap map = new HashMap();
			if (companyId != null) {
				map.put("companyId", companyId);
			}
			if (starScore != null) {
				map.put("starScore", starScore);
			}
			companyInfoManagerManager.updateCompanyStar(map);
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
	 * 开发区后台 企业审核 关闭 或者 开启
	 */
	public void companyCloseOrOpen() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			HashMap map = new HashMap();
			if (companyId != null && status != null && examineResult != null) {
				map.put("companyId", companyId);
				map.put("status", status);
				map.put("examineResult", examineResult);
				companyInfoManagerManager.companyCloseOrOpen(map);
				bean.setStatus(200);
			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
			e.printStackTrace();
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public String getStarScore() {
		return starScore;
	}

	public void setStarScore(String starScore) {
		this.starScore = starScore;
	}

	public Integer getExamineResult() {
		return examineResult;
	}

	public void setExamineResult(Integer examineResult) {
		this.examineResult = examineResult;
	}

	public Integer getType() {
		return type;
	}

	public Integer getStatus() {
		return status;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public void setStatus(Integer status) {
		this.status = status;
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

	public Long getCompanyShopId() {
		return companyShopId;
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

	public void setCompanyShopId(Long companyShopId) {
		this.companyShopId = companyShopId;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public Integer getSize() {
		return size;
	}

	public Integer getPage() {
		return page;
	}

	public String getName() {
		return name;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getTop() {
		return top;
	}

	public void setTop(Integer top) {
		this.top = top;
	}

}
