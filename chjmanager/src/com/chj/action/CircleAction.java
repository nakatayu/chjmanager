package com.chj.action;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
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

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import cn.eavic.framework.web.BaseAction;

import com.chj.common.Commonparam;
import com.chj.entity.Circle;
import com.chj.entity.Company;
import com.chj.entity.JsonDateValueProcessor;
import com.chj.entity.Personnel;

import com.chj.entity.User;
import com.chj.service.AreaManager;
import com.chj.service.CircleManager;

import com.chj.service.UserManager;
import com.chj.utils.StaticConstant;
import com.json.BaseBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Namespace("/")
@Results({ @Result(name = BaseAction.NONE, location = "circleAction.action", type = "redirect"), })
public class CircleAction extends ActionSupport {
	private static final long serialVersionUID = 7655056122242830524L;

	@Autowired
	CircleManager circleManager;
	private String circleId;
	private Long userId;
	private Integer size, page;
	private String name;
	private String info;
	private String CircleAbstract;
	private String checkbox;
	private File upfile;
	private String upfileFileName, Imge;
	private String opStatus;
	private String level;
	private String checkbox1;
	private String AdminMessage;

	String companyId, circleStatus, fontTime, backTime, likeName, top;

	// 圈子列表
	public void findCircleList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		Personnel user = (Personnel) request.getSession().getAttribute("user");

		BaseBean bean = new BaseBean();
		try {
			if (user == null) {
			} else {
				HashMap<String, Object> circleList = new HashMap<String, Object>();
				circleList.put("size", size);
				circleList.put("startIndex", (page - 1) * size);
				circleList.put("circleStatus", circleStatus);
				circleList.put("fontTime", fontTime);
				circleList.put("backTime", backTime);
				circleList.put("likeName", likeName);
				circleList.put("top", top);
				if (user.getType() != 1) {
					circleList.put("companyId", user.getCompanyId());
				} else {
					circleList.put("companyId", companyId);
				}

				List list = (List) circleManager
						.findallelCircleList(circleList);
				if (list.size() > 0) {
					bean.setRows(list);
					bean.setStatus(200);
					bean.setTotal(circleManager
							.findallelCircleListCount(circleList));
				} else {
					bean.setMsg("没有数据！");
				}
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
			e.printStackTrace();
		}
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.sql.Timestamp.class,
				new JsonDateValueProcessor("yyyy-MM-dd HH:mm:ss"));

		String json = JSONObject.fromObject(bean, jsonConfig).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 添加/修改圈子跳转
	 */
	public void insertCirclePage() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		String page = "pages/manager/addCircleInfo.jsp";
		if (circleId != null) {
			Circle circle = (Circle) circleManager.findCircleDetail(circleId);
			request.setAttribute("circle", circle);
			List<String> cardImage = circleManager.findCircleUserCardImage(Long
					.valueOf(circleId));
			request.setAttribute("cardImage", cardImage);
			request.setAttribute("tagList",
					circleManager.findCircleTagList(circleId));

		}
		if (circleId != null)
			request.setAttribute("circleId", circleId);
		request.setAttribute("levelList",
				JSONArray.fromObject(circleManager.findCircleLevelList()));
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * 保存圈子
	 * 
	 * @return
	 */
	private String title, content, circleImage, isCheck, tagList;
	private String cardImage, circleCardImage, summary, imgChanged;

	public void saveCircle() throws UnsupportedEncodingException, IOException {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		BaseBean bean = new BaseBean();
		Personnel us = (Personnel) request.getSession().getAttribute("user");
		try {

			Circle circle = new Circle();
			if (circleId != null && circleId.trim().length() > 0) {
				circle.setCircleId(Long.valueOf(circleId));
			}
			circle.setSummary(summary);
			circle.setName(title);
			circle.setLevel(level);
			circle.setCircleContent(Commonparam.clearStr(content));
			circle.setCircleImage(circleImage);
			circle.setCircleViews("0");
			circle.setCreateTime(new Date());
			circle.setCompanyId(us.getCompanyId());
			circle.setType("2");
			circle.setIsCheck(isCheck);
			if (circleId != null && circleId.trim().length() > 0) {
				circle.setStatus("2");
			} else {
				circle.setStatus("1");
			}
			circle.setExamineResult(StaticConstant.EXAMINE_RESULT[2]);
			circle.setParam(tagList);
			Long rt = circleManager.seveCircle(circle, circleCardImage,
					imgChanged);

			if (rt > 0) {
				bean.setStatus(200);
				if (circleId != null && circleId.trim().length() > 0) {
					bean.setMsg("修改成功!");
				} else {
					bean.setMsg("添加成功!");
				}
			} else {
				bean.setStatus(400);
				if (circleId != null && circleId.trim().length() > 0) {
					bean.setMsg("修改失败!");
				} else {
					bean.setMsg("添加失败!");
				}
			}

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 删除圈子
	 * 
	 * @throws Exception
	 */
	public void deleteCirList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		String del = request.getParameter("selectedCirleIds");
		String[] idStr = del.split(",");
		List<Long> idList = new ArrayList<Long>();
		for (int i = 0; i < idStr.length; i++) {
			idList.add(Long.parseLong(idStr[i]));
		}
		BaseBean bean = new BaseBean();
		try {
			circleManager.selectedCirle(idList);
			bean.setStatus(200);

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
			e.printStackTrace();
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 操作圈子
	 * 
	 * @return
	 */
	public void closeCircle() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		Circle cir = new Circle();
		if (opStatus.equals("2")) {
			cir.setStatus(String.valueOf(Commonparam.CIRCLE_STATUS[1]));
			cir.setLevel(level);
		} else if (opStatus.equals("3") || opStatus.equals("5")
				|| opStatus.equals("6")) {
			cir.setStatus(String.valueOf(Commonparam.CIRCLE_STATUS[5]));
			cir.setLevel(level);
		} else if (opStatus.equals("4")) {
			cir.setStatus(String.valueOf(Commonparam.CIRCLE_STATUS[3]));
			cir.setLevel(String.valueOf((Integer.parseInt(level) + 1)));
		} else {
			cir.setStatus(String.valueOf(Commonparam.CIRCLE_STATUS[4]));
			cir.setLevel(level);
		}
		cir.setCircleId(Long.valueOf(circleId));
		Object cc = circleManager.closeCircle(cir);
		if (Integer.parseInt(cc.toString()) > 0) {
			bean.setStatus(200);
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 修改圈子
	 * 
	 * @return
	 */
	private String ccid;

	public void updateCirleInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		User user = (User) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		Circle circle = new Circle();
		circle.setUserId(user.getUserId());
		circle.setCompanyId(user.getCommpanyId());
		circle.setCircleId(Long.valueOf(circleId));
		circle.setName(name);
		if (Imge.equals("")) {
			circle.setCircleImage(ccid);
		} else {
			circle.setCircleImage(Imge);
		}
		circle.setSummary(CircleAbstract);
		if (checkbox == null || checkbox.equals("")) {
			circle.setIsCheck("F");
		} else {
			circle.setIsCheck(checkbox);
		}
		circle.setCircleImage(Imge);
		circle.setCircleContent(Commonparam.clearStr(info));
		String circleTag = request.getParameter("labelValue");

		Long updateInfo = circleManager.updateCirleInfo(circle, circleTag);
		if (updateInfo > 0) {
			bean.setStatus(200);
			bean.setMsg("修改成功");
		} else {
			bean.setStatus(400);
			bean.setMsg("修改失败");
		}
		response.sendRedirect("pages/company/CircleList.jsp");
	}

	/**
	 * 圈子驳回操作
	 * 
	 * @return
	 */
	public void updateBoHuiCircle() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		Circle cil = new Circle();
		cil.setCircleId(Long.valueOf(circleId));
		cil.setAdminMessage(AdminMessage);
		cil.setExamineResult(2);
		int upc = circleManager.updateBoHuiCircle(cil);
		if (upc > 0) {
			bean.setStatus(200);
		} else {
			bean.setStatus(400);
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 圈子修改
	 * 
	 * @return
	 */
	public void updateCle() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String circleId = request.getParameter("circle_id");
		try {
			Object cir = circleManager.updateCle(Long.parseLong(circleId));
			List<Map> updateCTag = circleManager.findUpdateCTag(Long
					.parseLong(circleId));
			request.setAttribute("circle", cir);
			request.setAttribute("ctag", updateCTag);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("修改失败!");
		}
		request.getRequestDispatcher("/pages/company/updateCircleInfo.jsp")
				.forward(request, response);
	}

	String filedDname, filedDValue;

	/**
	 * 圈子人员列表
	 * 
	 * @return
	 */
	public void findCircleUserList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		HashMap<String, Object> userC = new HashMap<String, Object>();
		userC.put("fontTime", fontTime);
		userC.put("backTime", backTime);
		userC.put("filedDname", filedDname);
		userC.put("filedDValue", filedDValue);
		userC.put("circleId", circleId);
		userC.put("size", size);
		userC.put("startIndex", (page - 1) * size);
		try {
			List<Object> userClist = (List<Object>) circleManager
					.findCircleUserList(userC);
			if (userClist != null && userClist.size() > 0) {
				bean.setStatus(200);
				bean.setRows(userClist);
				bean.setTotal(circleManager.findCirUserListCount(userC));
			} else {
				bean.setMsg("无数据！");
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.sql.Timestamp.class,
				new JsonDateValueProcessor("yyyy-MM-dd HH:mm:ss"));
		String josn = JSONObject.fromObject(bean, jsonConfig).toString();
		response.getOutputStream().write(josn.getBytes("UTF-8"));
	}

	/**
	 * 删除圈子用户
	 * 
	 * @return
	 */
	public void delCircleUserInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		HashMap<String, Object> delCU = new HashMap<String, Object>();
		delCU.put("userId", userId);
		delCU.put("circleId", circleId);
		delCU.put("delete_flag", 2);
		try {
			int updateDle = circleManager.delCircleUserInfo(delCU);
			if (updateDle > 0) {
				bean.setStatus(200);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		String josn = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(josn.getBytes("UTF-8"));
	}

	String status;

	/**
	 * 修改申请，升级，关闭状态，对应status字段
	 * 
	 * @throws Exception
	 */
	public void updateCircleStatus() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		try {
			if (user != null) {
				String[] circle = circleId.split(",");
				if (circle.length > 0) {
					for (String str : circle) {
						HashMap map = new HashMap();
						map.put("status", Commonparam.CIRCLE_STATUS[Integer
								.valueOf(status)] - 1);
						map.put("circleId", str);
						if (user.getType() != 1) {
							map.put("companyId", user.getCompanyId());
						}
						Integer i = circleManager.updateCircleStatus(map);
					}
				}
				bean.setStatus(200);
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}

		String josn = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(josn.getBytes("UTF-8"));
	}

	String examine;

	/**
	 * 修改审核状态，对应 examine_result字段
	 * 
	 * @throws Exception
	 */
	public void updateCircleExamine() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		try {
			if (user != null && user.getType() == 1) {
				String[] circle = circleId.split(",");
				if (circle.length > 0) {
					for (String str : circle) {
						HashMap map = new HashMap();
						map.put("examine", Commonparam.EXAMINE_RESULT[Integer
								.valueOf(examine)] - 1);
						map.put("circleId", str);

						Integer i = circleManager.updateCircleExamine(map);
					}
				}
				bean.setStatus(200);
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String josn = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(josn.getBytes("UTF-8"));
	}

	String userIdsa;

	public void updatetUserDStatus() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		try {
			if (user != null) {
				String s = (String) circleManager.updatetbUserDStatus(userIdsa,
						circleId, status);
				if ("".equals(s)) {
					bean.setStatus(200);
				} else {
					bean.setMsg(s);
				}
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String josn = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(josn.getBytes("UTF-8"));
	}

	public void updatetbUserDRoles() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		try {
			if (user != null) {
				String s = (String) circleManager.updatetbUserDRoles(userIdsa,
						circleId, status);
				if ("".equals(s)) {
					bean.setStatus(200);
				} else {
					bean.setMsg(s);
				}
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String josn = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(josn.getBytes("UTF-8"));
	}

	public void updatetbUserDFlag() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		try {
			if (user != null) {
				String s = (String) circleManager.updatetbUserDFlag(userIdsa,
						circleId, status);
				if ("".equals(s)) {
					bean.setStatus(200);
				} else {
					bean.setMsg(s);
				}
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String josn = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(josn.getBytes("UTF-8"));
	}

	Integer filName, filValue, filnum;

	public void updaCircleLstop() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		try {
			if (user != null && user.getType() == 1) {
				String s = circleManager.updaCircleLstop(circleId,
						Commonparam.CIRCLE_COLUMNS[filName], filValue, filnum);

				if (s == null) {
					bean.setStatus(200);
				} else {
					bean.setMsg(s);
				}
			} else {
				bean.setMsg("请登录！");
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public void findCircleLevelt() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		BaseBean bean = new BaseBean();
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		try {
			if (user == null) {
				bean.setMsg("用户没有登录！");
			} else {
				List oj = (List) circleManager.findCircleLevelList();
				if (oj.size() > 0) {
					bean.setStatus(200);
					bean.setRows(oj);
				} else {
					bean.setMsg("没有数据！");
				}
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	Integer levelId, userNum;
	String levelInfo;

	public void findCircleAddLevel() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		try {
			Circle c = (Circle) circleManager.findCircleDetail(circleId);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("objectId", circleId);
			map.put("type", 1);
			map.put("doType", 1);
			HashMap circleApply = (HashMap) circleManager
					.findCircleAddLevel(map);

			if (Integer.parseInt(c.getStatus()) == 3
					&& (3 == c.getExamineResult() || 2 == c.getExamineResult())) {
				bean.setTotal(1);
				bean.setMsg(c.getLevel());
			} else if (Integer.parseInt(c.getStatus()) != 3
					&& 1 == c.getExamineResult()) {
				bean.setTotal(1);
				bean.setMsg(c.getLevel());
			} else {
				bean.setTotal(0);
				bean.setMsg(c.getLevel());
			}
			bean.setRows("");
			if (circleApply != null && circleApply.size() > 0) {
				bean.setRows(circleApply);
			}
			bean.setStatus(200);
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public void updCircleLevel() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		BaseBean bean = new BaseBean();
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		try {
			if (user == null) {
				bean.setMsg("用户没有登录！");
			} else {
				circleManager.updCircleLevel(levelId, userNum, levelInfo);
				bean.setStatus(200);
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public void AddCircleLevel() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		BaseBean bean = new BaseBean();
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		try {
			if (user == null) {
				bean.setMsg("用户没有登录！");
			} else {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("examine",
						Commonparam.EXAMINE_RESULT[Integer.valueOf(examine)] - 1);
				map.put("circleId", circleId);

				if (Integer.valueOf(examine) == 1) {
					Circle c = (Circle) circleManager
							.findCircleDetail(circleId);
					Integer level = Integer.parseInt(c.getLevel()) + 1;
					map.put("level", level);
				}
				circleManager.updateCircleExamine(map);
				bean.setStatus(200);
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public void requestCircleAddLevel() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		try {
			Circle c = (Circle) circleManager.findCircleDetail(circleId);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("objectId", circleId);
			map.put("type", 1);
			map.put("doType", 1);
			map.put("filePath", Imge);
			map.put("reason", content);
			map.put("createTime", new Date());
			circleManager.reqCircleLevel(map);

			HashMap<String, Object> map2 = new HashMap<String, Object>();
			map2.put("status", 3);
			map2.put("circleId", circleId);
			map2.put("companyId", user.getCompanyId());
			
			circleManager.updateCircleStatus(map2);
			bean.setStatus(200);
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public Integer getLevelId() {
		return levelId;
	}

	public void setLevelId(Integer levelId) {
		this.levelId = levelId;
	}

	public Integer getUserNum() {
		return userNum;
	}

	public void setUserNum(Integer userNum) {
		this.userNum = userNum;
	}

	public String getLevelInfo() {
		return levelInfo;
	}

	public void setLevelInfo(String levelInfo) {
		this.levelInfo = levelInfo;
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

	public String getUserIdsa() {
		return userIdsa;
	}

	public void setUserIdsa(String userIdsa) {
		this.userIdsa = userIdsa;
	}

	public String getExamine() {
		return examine;
	}

	public void setExamine(String examine) {
		this.examine = examine;
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

	public void setCircleId(String circleId) {
		this.circleId = circleId;
	}

	public String getCircleId() {
		return circleId;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getCircleAbstract() {
		return CircleAbstract;
	}

	public void setCircleAbstract(String circleAbstract) {
		CircleAbstract = circleAbstract;
	}

	public String getCheckbox() {
		return checkbox;
	}

	public void setCheckbox(String checkbox) {
		this.checkbox = checkbox;
	}

	public File getUpfile() {
		return upfile;
	}

	public void setUpfile(File upfile) {
		this.upfile = upfile;
	}

	public String getUpfileFileName() {
		return upfileFileName;
	}

	public void setUpfileFileName(String upfileFileName) {
		this.upfileFileName = upfileFileName;
	}

	public String getImge() {
		return Imge;
	}

	public void setImge(String imge) {
		Imge = imge;
	}

	public String getOpStatus() {
		return opStatus;
	}

	public void setOpStatus(String opStatus) {
		this.opStatus = opStatus;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getCheckbox1() {
		return checkbox1;
	}

	public void setCheckbox1(String checkbox1) {
		this.checkbox1 = checkbox1;
	}

	public String getAdminMessage() {
		return AdminMessage;
	}

	public void setAdminMessage(String adminMessage) {
		AdminMessage = adminMessage;
	}

	public String getCcid() {
		return ccid;
	}

	public void setCcid(String ccid) {
		this.ccid = ccid;
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getCircleStatus() {
		return circleStatus;
	}

	public void setCircleStatus(String circleStatus) {
		this.circleStatus = circleStatus;
	}

	public String getFontTime() {
		return fontTime;
	}

	public void setFontTime(String fontTime) {
		this.fontTime = fontTime;
	}

	public String getBackTime() {
		return backTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCircleImage() {
		return circleImage;
	}

	public void setCircleImage(String circleImage) {
		this.circleImage = circleImage;
	}

	public String getIsCheck() {
		return isCheck;
	}

	public void setIsCheck(String isCheck) {
		this.isCheck = isCheck;
	}

	public String getTagList() {
		return tagList;
	}

	public void setTagList(String tagList) {
		this.tagList = tagList;
	}

	public String getCardImage() {
		return cardImage;
	}

	public void setCardImage(String cardImage) {
		this.cardImage = cardImage;
	}

	public String getCircleCardImage() {
		return circleCardImage;
	}

	public void setCircleCardImage(String circleCardImage) {
		this.circleCardImage = circleCardImage;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getImgChanged() {
		return imgChanged;
	}

	public void setImgChanged(String imgChanged) {
		this.imgChanged = imgChanged;
	}

	public void setBackTime(String backTime) {
		this.backTime = backTime;
	}

	public String getLikeName() {
		return likeName;
	}

	public void setLikeName(String likeName) {
		this.likeName = likeName;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getFiledDname() {
		return filedDname;
	}

	public void setFiledDname(String filedDname) {
		this.filedDname = filedDname;
	}

	public String getFiledDValue() {
		return filedDValue;
	}

	public void setFiledDValue(String filedDValue) {
		this.filedDValue = filedDValue;
	}

	public String getTop() {
		return top;
	}

	public void setTop(String top) {
		this.top = top;
	}
}
