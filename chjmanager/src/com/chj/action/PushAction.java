package com.chj.action;

import java.util.ArrayList;
import java.util.Date;
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

import com.chj.common.Commonparam;
import com.chj.common.PushAndroidThread;
import com.chj.common.PushIphoneThread;
import com.chj.common.PushWinphoneThread;
import com.chj.entity.Advertisement;
import com.chj.entity.JsonDateValueProcessor;
import com.chj.entity.Personnel;
import com.chj.entity.Push;
import com.chj.entity.User;
import com.chj.service.PushManager;
import com.json.BaseBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.eavic.framework.web.BaseAction;

@Namespace("/")
@Results({ @Result(name = BaseAction.NONE, location = "pushAction.action", type = "redirect") })
public class PushAction extends ActionSupport {
	private static final long serialVersionUID = 7655056122242830524L;

	@Autowired
	PushManager pushManager;

	private Integer size, page;
	private Long pushId;
	private String content; // 推送内容
	private String manner; // 推送方式
	private Date applyTime; // 申请时间
	private Long qty; // 数量
	private String status; // 状态
	private String sex; // 性别
	private String age; // 年龄
	private String opinion; // 审核意见
	private Long companyId; // 企业ID
	private String relevanceType;
	/**
	 * 关联类型
	 * 
	 * 购买过本店铺的人 1 关注过本店铺的人 2 圈友 3
	 */
	private int deleteFlag; // 伪删除 状态

	private String tagList;

	// 增加推送对象基本信息
	public void insertPushInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		Personnel user = (Personnel) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		try {
			Push push = new Push();
			push.setRoleId(user.getOrganizationalID());
			push.setContent(content);
			push.setManner(manner);
			push.setApplyTime(new Date());
			push.setQty(qty);
			push.setStatus(status);// 默认0 未审核
			push.setAge(age);
			push.setSex(sex);
			push.setRelevanceType(relevanceType);
			push.setPersonnelId(user.getId());
			push.setPersonnelType(user.getType());
			
			Object pushinfo = pushManager.insertPushInfo(push, tagList);
			bean.setStatus(200);
		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
			e.printStackTrace();
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));

	}

	// 推送信息列表显示
	public void findPushListInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> pushListInfo = new HashMap<String, Object>();
			pushListInfo.put("size", size);
			if (user.getType().intValue() != 1)
				pushListInfo
						.put("organizationalid", user.getOrganizationalID());
			pushListInfo.put("startIndex", (page - 1) * size);
			List<HashMap> pushInfo = pushManager.findPushListInfo(pushListInfo);
			for (HashMap map : pushInfo) {
				if (map.get("type") != null) {
					HashMap param = new HashMap();
					if (map.get("type").toString().equals("1")) {
						map.put("organizationName", "漕河泾开发区");
					} else if (map.get("type").toString().equals("2")) {
						param.put("table", "tb_company");
						param.put("fieldRt", "name");
						param.put("fieldCondition", "company_id");
						param.put("fieldParam", Long.valueOf(map.get(
								"OrganizationalId").toString()));
						map.put("organizationName",
								pushManager.findOrganizationName(param));
					} else if (map.get("type").toString().equals("5")
							|| map.get("type").toString().equals("3")) {
						param.put("table", "tb_company_shop");
						param.put("fieldRt", "name");
						param.put("fieldConditi on", "company_shop_id");
						param.put("fieldParam", Long.valueOf(map.get(
								"OrganizationalId").toString()));
						map.put("organizationName",
								pushManager.findOrganizationName(param));
					} else if (map.get("type").toString().equals("4")) {
						map.put("organizationName", "星巴克企业");
					}

				} else
					map.put("organizationName", "");
			}
			bean.setStatus(200);
			bean.setRows(pushInfo);
			bean.setTotal(pushManager.findPushListInfoCount(pushListInfo));
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
			e.printStackTrace();
		}
		// datetime格式转换
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.sql.Timestamp.class,
				new JsonDateValueProcessor("yyyy-MM-dd HH:mm:ss"));
		String json = JSONObject.fromObject(bean, jsonConfig).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	// 查询推送对象基本信息
	public void findPushInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		BaseBean bean = new BaseBean();
		try {
			String pushId = request.getParameter("pushId");
			Push push = new Push();
			push.setPushId(Long.parseLong(pushId));
			Object pushs = pushManager.findPushInfo(push);
			request.setAttribute("pushInfo", pushs);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("修改失败");
		}
		request.getRequestDispatcher("/pages/company/PushInfoUpdate.jsp")
				.forward(request, response);
	}

	// 修改更新 推送对象基本信息
	public void updatePushInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> pushInfo = new HashMap<String, Object>();
			pushInfo.put("pushId", pushId);
			pushInfo.put("content", content);
			pushInfo.put("sex", sex);
			pushInfo.put("age", age);
			pushInfo.put("manner", manner);
			pushInfo.put("opinion", opinion);
			pushInfo.put("relevanceType", relevanceType);

			pushManager.updatePushInfo(pushInfo);
			bean.setStatus(200);
		} catch (Exception e) {
			e.printStackTrace();
			bean.setMsg(e.getLocalizedMessage());
		}
		response.sendRedirect("pages/company/PushList.jsp");
	}

	// 点击查看 更改状态为审核中..
	private String pushIds, checkContent, pushType;
	//phoneType   1:iphone  2:android 3:winphone
	public void updatePushInfoStatus() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> pushInfoStatus = new HashMap<String, Object>();
			pushInfoStatus.put("pushId", pushIds);
			pushInfoStatus.put("status", status);// 状态 //1 审核中 2 审核未通过 3 审核通过
													// 0未审核 默认是0
			pushInfoStatus.put("checkContent", checkContent);
			pushManager.updatePushInfoStatus(pushInfoStatus);
			if (status.equals("3")) {// 推送
				Push push = pushManager.findPushInfoDetail(Long.valueOf(pushIds)); 
			
				push.initFlag();
				if (pushType.equals("1") || pushType.equals("-1")) {//短信推送

				} else if (pushType.equals("2") || pushType.equals("-1")) {//App推送
					push.setPhoneType(1);
					push.setField("phone_id");
					ArrayList<Object> tokenList = pushManager.findPushPhoneId(push);
					String p12Path = request.getSession().getServletContext()
							.getRealPath(Commonparam.p12Path);
					PushIphoneThread pushThread = new PushIphoneThread(p12Path, tokenList,
							push.getContent());
					pushThread.start();
					
					push.setPhoneType(3);
					push.setField("phone_id");
					ArrayList<Object> uriList = pushManager.findPushPhoneId(push);
					PushWinphoneThread pushThreadWinphone = new PushWinphoneThread(uriList,"推送消息",push.getContent());
					pushThreadWinphone.start();
					
					push.setPhoneType(2);
					push.setField("phone_id");
					ArrayList<Object> aliansList = pushManager.findPushPhoneId(push);
					PushAndroidThread pushAndroidThread = new PushAndroidThread(aliansList,"推送消息",
							push.getContent());
					pushAndroidThread.start();
					
					
					
				}
			}
			bean.setStatus(200);
		} catch (Exception e) {
			e.printStackTrace();
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	// 伪删除 更改 DeleteFlag status
	public void updatePushInfoDeleteFlag() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String del = request.getParameter("selectpushId");
		String[] idStr = del.split(",");
		List<Long> idList = new ArrayList<Long>();
		for (int i = 0; i < idStr.length; i++) {
			idList.add(Long.parseLong(idStr[i]));
		}
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> deleteFlagStatus = new HashMap<String, Object>();
			deleteFlagStatus.put("pushId", idList);
			pushManager.updatePushInfoDeleteFlag(deleteFlagStatus);
			bean.setStatus(200);
		} catch (Exception e) {
			e.printStackTrace();
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 推送详情
	 * 
	 * @throws Exception
	 */
	public void pushInfoDetail() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		try {
			Personnel user = (Personnel) request.getSession().getAttribute(
					"user");
			Push push = pushManager.findPushInfoDetail(Long.valueOf(pushId));
			request.setAttribute("push", push);
			request.setAttribute("tagList",
					pushManager.findPushInfoTagList(Long.valueOf(pushId)));
			if (user.getType().intValue() == 1) {
				HashMap<String, Object> pushInfoStatus = new HashMap<String, Object>();
				pushInfoStatus.put("pushId", pushId);
				pushInfoStatus.put("status", 1);// 状态 //1 审核中 2 审核未通过 3 审核通过
												// 0未审核 默认是0
				pushManager.updatePushInfoStatus(pushInfoStatus);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("pages/company/PushInfoLook.jsp").forward(
				request, response);
	}

	public int getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(int deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public Long getPushId() {
		return pushId;
	}

	public String getContent() {
		return content;
	}

	public String getManner() {
		return manner;
	}

	public Date getApplyTime() {
		return applyTime;
	}

	public Long getQty() {
		return qty;
	}

	public String getStatus() {
		return status;
	}

	public String getSex() {
		return sex;
	}

	public String getAge() {
		return age;
	}

	public String getOpinion() {
		return opinion;
	}

	public void setPushId(Long pushId) {
		this.pushId = pushId;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setManner(String manner) {
		this.manner = manner;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}

	public void setQty(Long qty) {
		this.qty = qty;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public void setOpinion(String opinion) {
		this.opinion = opinion;
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

	public String getTagList() {
		return tagList;
	}

	public String getPushIds() {
		return pushIds;
	}

	public void setPushIds(String pushIds) {
		this.pushIds = pushIds;
	}

	public void setTagList(String tagList) {
		this.tagList = tagList;
	}

	public Integer getPage() {
		return page;
	}

	public String getCheckContent() {
		return checkContent;
	}

	public void setCheckContent(String checkContent) {
		this.checkContent = checkContent;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public String getRelevanceType() {
		return relevanceType;
	}

	public void setRelevanceType(String relevanceType) {
		this.relevanceType = relevanceType;
	}

	public String getPushType() {
		return pushType;
	}

	public void setPushType(String pushType) {
		this.pushType = pushType;
	}
}
