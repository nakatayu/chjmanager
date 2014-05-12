package com.chj.action;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
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
import com.chj.entity.Activity;
import com.chj.entity.Company;
import com.chj.entity.JsonDateValueProcessor;
import com.chj.entity.Personnel;
import com.chj.entity.Shop;
import com.chj.entity.Shoparea;
import com.chj.entity.Shoptag;
import com.chj.entity.User;
import com.chj.service.ActivityManager;
import com.chj.service.AreaManager;
import com.chj.service.CircleManager;
import com.chj.service.ShopManager;
import com.chj.service.UserManager;
import com.chj.utils.StaticConstant;
import com.json.BaseBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Namespace("/")
@Results({ @Result(name = BaseAction.NONE, location = "activityAction.action", type = "redirect"), })
public class ActivityAction extends ActionSupport {
	private static final long serialVersionUID = 7655056122242830524L;

	@Autowired
	ActivityManager activityManager;
	private Integer size, page;
	private String name;
	private Long createUserId;
	private String title;
	private String address;
	private String summary;
	private String content;
	private String endTime, beginTime;
	private String deliverOk, deliverOk1, deliverOk2;
	private String userMax;
	private String activityId;
	private String ast;
	private File upfile;
	private String upfileFileName;
	private String Imge;
	private String adminMessage;
	private String examineResult;

	// 活动列表

	public void findActivityList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		Personnel user = (Personnel) request.getSession().getAttribute("user");

		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> activityList = new HashMap<String, Object>();

			activityList.put("name", name);
			activityList.put("size", size);
			if (user.getType().equals("1")) {
				activityList.put("createUserId", user.getId());
			}
			activityList.put("startIndex", (page - 1) * size);
			List<Object> list = activityManager.findActivityList(activityList);
			for (Object obj : list) {
				if ((((HashMap) obj).get("circle_id")) != null) {
					((HashMap) obj).put("cname", activityManager
							.findCName(((HashMap) obj).get("circle_id")));
				}
				if ((((HashMap) obj).get("activity_id")) != null) {
					((HashMap) obj).put("aCount", activityManager
							.findACount(((HashMap) obj).get("activity_id")));
				}
				if ((((HashMap) obj).get("activity_id")) != null) {
					HashMap<String, Object> acy = new HashMap<String, Object>();
					acy.put("activity_id", (((HashMap) obj).get("activity_id")));
					acy.put("is_sign_in", "T");
					((HashMap) obj).put("aCountYS",
							activityManager.findACountYS(acy));
				}
			}
			bean.setStatus(200);
			bean.setRows(list);
			bean.setTotal(activityManager.ActivityListCount(activityList));

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
	 * 删除活动
	 * 
	 * @throws Exception
	 */
	public void deleteActList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String del = request.getParameter("selectedActivityIds");
		String[] idStr = del.split(",");
		List<Long> idList = new ArrayList<Long>();
		for (int i = 0; i < idStr.length; i++) {
			idList.add(Long.parseLong(idStr[i]));
		}
		BaseBean bean = new BaseBean();
		try {
			activityManager.selectedActivity(idList);
			bean.setStatus(200);
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
			e.printStackTrace();
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 新增活动
	 */
	private String isMoney, payType, moneyDetail, moneynum;
	private String enrollEndTime, enrollBeginTime, traffic;
	private String isQrcode, activityImage, joinType, isCheck, tagList, lat,
			lng;

	/**
	 * 修改活动的跳转
	 */
	private String id;

	public void insertActivityInfoPage() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		String page = "pages/company/ActivityInfo.jsp";
		id = request.getParameter("id");
		if (id != null && id.trim().length() > 0) {
			HashMap activity = (HashMap) activityManager.findActivityDetail(id);
			request.setAttribute("activity", activity);
			request.setAttribute("tagList",
					activityManager.findActivityTagList(id));
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	public void insertActivityInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		BaseBean bean = new BaseBean();
		try {
			if (user == null) {
				bean.setMsg("请登陆!");
				bean.setStatus(400);
			} else {
				Activity circle = new Activity();
				if (id != null && id.trim().length() > 0) {
					circle.setActivityId(Long.valueOf(id));
				}
				circle.setIsMoney(isMoney);
				if (isMoney.equals("T")) {
					circle.setPayType(payType);
					circle.setMoneyDetail(moneyDetail);
					circle.setMoneynum(Integer.valueOf(moneynum));
				} else {
					circle.setPayType("");
					circle.setMoneyDetail("");
					circle.setMoneynum(0);
				}
				circle.setSummary(Commonparam.clearStr(summary));
				circle.setBeginTime(beginTime);
				if (endTime != null && endTime.trim().length() > 0) {
					circle.setEndTime(endTime);
				}
				circle.setEnrollBeginTime(fmt.parse(enrollBeginTime));
				if (enrollEndTime != null && enrollEndTime.trim().length() > 0) {
					circle.setEnrollEndTime(fmt.parse(enrollEndTime));
				}
				circle.setAddress(address);
				circle.setIsQrcode(isQrcode);
				circle.setActivityTitle(title);
				circle.setActivityContent(Commonparam.clearStr(content));
				circle.setActivityImage(activityImage);
				circle.setCreateTime(new Date());
				circle.setCompanyId(user.getCompanyId());
				circle.setJoinType(joinType);// 普通
				circle.setIsCheck(isCheck);
				circle.setStatus(StaticConstant.ACTIVITY_STATUS[0] + "");
				circle.setExamineResult(StaticConstant.EXAMINE_RESULT[2]);
				circle.setUserMax(Long.valueOf(userMax));
				circle.setBrowseCount(0L);

				if (lat != null && lat.trim().length() > 0) {
					circle.setLat(lat);
				}
				if (lng != null && lng.trim().length() > 0) {
					circle.setLng(lng);
				}

				if (traffic != null && traffic.trim().length() > 0) {
					circle.setTraffic(traffic);
				} else {
					circle.setTraffic("");
				}

				Long rt = activityManager.insertActivityInfo(circle, tagList);
				if (rt > 0) {
					bean.setStatus(200);
					if (activityId != null && activityId.trim().length() > 0) {
						bean.setMsg("修改成功!");
					} else {
						bean.setMsg("添加成功!");
					}
				} else {
					bean.setStatus(400);
					if (activityId != null && activityId.trim().length() > 0) {
						bean.setMsg("修改失败!");
					} else {
						bean.setMsg("添加失败!");
					}
				}

			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 修改活动
	 * 
	 * @throws Exception
	 */
	private String acimg;

	public void updateActivityInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		Activity avty = new Activity();
		avty.setActivityId(Long.valueOf(activityId));
		avty.setUpdateUserId(user.getId().toString());
		avty.setActivityTitle(title);
		avty.setLastEditTime(new Date());
		avty.setAddress(address);
		avty.setSummary(summary);
		avty.setActivityContent(Commonparam.clearStr(content));
		avty.setBeginTime(beginTime);
		avty.setEndTime(endTime);
		if (Imge.equals("") || Imge == null) {
			avty.setActivityImage(acimg);
		} else {
			avty.setActivityImage(Imge);
		}
		if (deliverOk == null || deliverOk.equals("")) {
			avty.setIsCheck("F");
		} else {
			avty.setIsCheck(deliverOk);
		}
		avty.setUserMax(Long.valueOf(userMax));
		if (deliverOk2 == null || deliverOk2.equals("")) {
			avty.setIsQrcode("F");
		} else {
			avty.setIsQrcode(deliverOk2);
		}
		if (deliverOk1 == null || deliverOk1.equals("")) {
			avty.setJoinType("F");
		} else {
			avty.setJoinType(deliverOk1);
		}
		String avtyTag = request.getParameter("labelValue");
		Long updateAT = activityManager.updateActivityInfo(avty, avtyTag);
		if (updateAT > 0) {
			bean.setStatus(200);
			bean.setMsg("更新成功");
		} else {
			bean.setStatus(400);
			bean.setMsg("更新失败");
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 操作活动
	 * 
	 * @return
	 */
	public void updateAstatus() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			Activity acty = new Activity();
			acty.setActivityId(Long.valueOf(activityId));
			if (ast.equals("1")) {
				acty.setStatus(String.valueOf((Commonparam.ACTIVITY_STATUS[1])));
			} else if (ast.equals("3")) {
				acty.setStatus(String.valueOf((Commonparam.ACTIVITY_STATUS[3])));
			} else if (ast.equals("2") || ast.equals("4") || ast.equals("5")) {
				acty.setStatus(String.valueOf((Commonparam.ACTIVITY_STATUS[5])));
			} else {
				int a = Integer.parseInt(ast) - 1;
				acty.setStatus(String
						.valueOf((Commonparam.ACTIVITY_STATUS[Integer
								.parseInt(ast) - 1])));
			}
			Long upActivi = activityManager.updateAstatus(acty);
			if (upActivi > 0) {
				bean.setStatus(200);
				bean.setMsg("更新成功");
			} else {
				bean.setStatus(400);
				bean.setMsg("更新失败");
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 活动参加人数列表
	 * 
	 * @return
	 */
	public void findActivityUserList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> huser = new HashMap<String, Object>();
			huser.put("name", name);
			huser.put("size", size);
			huser.put("activity_id", activityId);
			huser.put("startIndex", (page - 1) * size);
			List<Object> list = activityManager.findActivityUserList(huser);

			for (Object obj : list) {
				if ((((HashMap) obj).get("user_id")) != null) {
					((HashMap) obj).put("phone", activityManager
							.findActivityUserPhone(((HashMap) obj)
									.get("user_id")));
					((HashMap) obj).put("realname", activityManager
							.findActivityUserRealname(((HashMap) obj)
									.get("user_id")));
				}
			}
			bean.setStatus(200);
			bean.setRows(list);
			bean.setTotal(activityManager.findActivityUserListCount(huser));
		} catch (Exception e) {

			e.printStackTrace();
		}

		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.sql.Timestamp.class,
				new JsonDateValueProcessor("yyyy-MM-dd HH:mm:ss"));

		String json = JSONObject.fromObject(bean, jsonConfig).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 上传图片
	 * 
	 * @return
	 */
	public void uploadImage() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		
		String newfilename = Commonparam.makeNewFileName(upfileFileName);
		String targetFolder=Commonparam.activityFolder+Commonparam.makeYearMonth(new Date());
		String absolute = Commonparam.getKeyValue("imageStorePath")+targetFolder;
		
		Commonparam.makeFile(upfile, absolute, newfilename);
		
		bean.setStatus(200);
		bean.setRows(targetFolder+newfilename);

		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 驳回操作
	 * 
	 * @throws Exception
	 */
	public void updateRejectStatus() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			Activity act = new Activity();
			act.setActivityId(Long.valueOf(activityId));
			act.setExamineResult(2);
			act.setAdminMessage(examineResult);
			int upda = activityManager.updateRejectStatus(act);
			if (upda > 0) {
				bean.setStatus(200);
			}
		} catch (Exception e) {

			e.printStackTrace();
		}

		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 修改活动
	 * 
	 * @throws Exception
	 */
	public void findActivity() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		try {
			String ActivityId = request.getParameter("activity_id");
			Object activity = activityManager.findActivity(Long
					.parseLong(ActivityId));
			List<Map> lo = activityManager.findActivityTagList(ActivityId);
			request.setAttribute("activity", activity);
			request.setAttribute("activityTag", lo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/pages/company/updateActivityInfo.jsp")
				.forward(request, response);
	}

	String likeName, actAction, fontTime, backTime, companyId,top;

	public void findActivityAndUserList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		try {
			if (user == null) {
			} else {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("examineResult", examineResult);
				map.put("actAction", actAction);
				map.put("likeName", likeName);
				map.put("fontTime", fontTime);
				map.put("backTime", backTime);
				map.put("top", top);
				map.put("size", size);
				map.put("startIndex", (page - 1) * size);
				if (user.getType() != 1) {
					map.put("companyId", user.getCompanyId());
				} else {
					map.put("companyId", companyId);
				}

				List list = (List) activityManager.findActivityAndUserList(map);
				if (list.size() > 0) {
					bean.setRows(list);
					bean.setStatus(200);
					bean.setTotal(activityManager
							.findActivityAndUserListCount(map));
				} else {
					bean.setMsg("没有数据！");
				}
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

	public void updateActivityExamine() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		try {
			if (user != null && user.getType() == 1) {
				activityManager
						.updateActivityExamine(activityId, examineResult);

				bean.setStatus(200);
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

	String status;

	public void findActivityOfUserList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap map = new HashMap();
			map.put("fontTime", fontTime);
			map.put("backTime", backTime);
			map.put("status", status);
			map.put("activityId", activityId);
			map.put("size", size);
			map.put("startIndex", (page - 1) * size);
			List list = (List) activityManager.findActivityOfUserList(map);
			if (list.size() > 0) {
				bean.setRows(list);
				bean.setStatus(200);
				bean.setTotal(activityManager.findActivityOfUserListCount(map));
			} else {
				bean.setMsg("没有数据！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.sql.Timestamp.class,
				new JsonDateValueProcessor("yyyy-MM-dd HH:mm:ss"));

		String json = JSONObject.fromObject(bean, jsonConfig).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	String userId;

	/**
	 * 审核状态
	 * 
	 * @throws Exception
	 */
	public void updatetUserAStatus() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		try {
			if (user != null) {
				activityManager.updatetbUserAStatus(userId, activityId, status);
				bean.setStatus(200);
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String josn = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(josn.getBytes("UTF-8"));
	}

	public void updateActivityUserflag() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		try {
			if (user != null) {
				activityManager.updateActivityUserflag(userId, activityId,
						status);
				bean.setStatus(200);
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String josn = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(josn.getBytes("UTF-8"));
	}

	public void findActivityCommentList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> activComlst = new HashMap<String, Object>();
			activComlst.put("size", size);
			activComlst.put("startIndex", (page - 1) * size);
			activComlst.put("fontTime", fontTime);
			activComlst.put("backTime", backTime);
			activComlst.put("likeName", likeName);
			activComlst.put("activityId", activityId);

			List<?> list = (List<?>) activityManager
					.findActivCommentList(activComlst);
			if (list.size() > 0) {
				bean.setRows(list);
				bean.setStatus(200);
				bean.setTotal(activityManager
						.findActivityCommentListCount(activComlst));
			} else {
				bean.setMsg("没有数据！");
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

	String activCommId;

	public void updatActivCommentlete() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		try {
			if (user != null) {
				activityManager.updtActivCommlet(activCommId, activityId);

				bean.setStatus(200);
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

	public void selectPictureOfActiv() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		try {
			if (user != null) {

				List obj = (List) activityManager
						.selectedActivityPicture(activityId);
				if (obj != null && obj.size() > 0) {
					bean.setRows(obj);
					bean.setStatus(200);
				} else {
					bean.setMsg("此活动没有图片！");
				}
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

	public void chechThePicture() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		try {
			if (user != null) {
				HashMap map = new HashMap();
				map.put("activityId", activityId);
				map.put("size", size);
				map.put("startIndex", (page - 1) * size);

				List obj = (List) activityManager.chechThePicture(map);
				if (obj != null && obj.size() > 0) {
					bean.setRows(obj);
					bean.setStatus(200);
				} else {
					bean.setMsg("此活动已没有图片！");
				}
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

	String activityPhotoId;

	public void findActPhotCommlt() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> activComlst = new HashMap<String, Object>();
			activComlst.put("size", size);
			activComlst.put("startIndex", (page - 1) * size);
			activComlst.put("fontTime", fontTime);
			activComlst.put("backTime", backTime);
			activComlst.put("likeName", likeName);
			activComlst.put("activityPhotoId", activityPhotoId);

			List<?> list = (List<?>) activityManager
					.findActPhotCommltList(activComlst);
			if (list.size() > 0) {
				bean.setRows(list);
				bean.setStatus(200);
				bean.setTotal(activityManager
						.findActPhotCommltListCount(activComlst));
			} else {
				bean.setMsg("没有数据！");
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

	public void updActPhoCommels() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		try {
			if (user != null) {
				activityManager.updActPhoCommels(activCommId, activityPhotoId);
				bean.setStatus(200);
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	Integer filName, filValue, filnum;

	public void updaActivityLtop() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		try {
			if (user != null && user.getType() == 1) {
				String s = activityManager.updaActivityLtop(activityId,
						Commonparam.ACTIVITY_COLUMNS[filName], filValue,filnum);

				if (s == null) {
					bean.setStatus(200);
				} else {
					bean.setMsg(s);
				}
			}else{
				bean.setMsg("请登录！");
			}
		} catch (Exception e) {
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

	public String getActivCommId() {
		return activCommId;
	}

	public void setActivCommId(String activCommId) {
		this.activCommId = activCommId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getLikeName() {
		return likeName;
	}

	public void setLikeName(String likeName) {
		this.likeName = likeName;
	}

	public String getActAction() {
		return actAction;
	}

	public void setActAction(String actAction) {
		this.actAction = actAction;
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

	public void setBackTime(String backTime) {
		this.backTime = backTime;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIsMoney() {
		return isMoney;
	}

	public void setIsMoney(String isMoney) {
		this.isMoney = isMoney;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public String getMoneyDetail() {
		return moneyDetail;
	}

	public void setMoneyDetail(String moneyDetail) {
		this.moneyDetail = moneyDetail;
	}

	public String getMoneynum() {
		return moneynum;
	}

	public void setMoneynum(String moneynum) {
		this.moneynum = moneynum;
	}

	public String getEnrollEndTime() {
		return enrollEndTime;
	}

	public void setEnrollEndTime(String enrollEndTime) {
		this.enrollEndTime = enrollEndTime;
	}

	public String getEnrollBeginTime() {
		return enrollBeginTime;
	}

	public void setEnrollBeginTime(String enrollBeginTime) {
		this.enrollBeginTime = enrollBeginTime;
	}

	public String getTraffic() {
		return traffic;
	}

	public void setTraffic(String traffic) {
		this.traffic = traffic;
	}

	public String getIsQrcode() {
		return isQrcode;
	}

	public void setIsQrcode(String isQrcode) {
		this.isQrcode = isQrcode;
	}

	public String getActivityImage() {
		return activityImage;
	}

	public void setActivityImage(String activityImage) {
		this.activityImage = activityImage;
	}

	public String getJoinType() {
		return joinType;
	}

	public void setJoinType(String joinType) {
		this.joinType = joinType;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setCreateUserId(Long createUserId) {
		this.createUserId = createUserId;
	}

	public Long getCreateUserId() {
		return createUserId;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	public String getDeliverOk() {
		return deliverOk;
	}

	public void setDeliverOk(String deliverOk) {
		this.deliverOk = deliverOk;
	}

	public String getDeliverOk1() {
		return deliverOk1;
	}

	public void setDeliverOk1(String deliverOk1) {
		this.deliverOk1 = deliverOk1;
	}

	public String getDeliverOk2() {
		return deliverOk2;
	}

	public void setDeliverOk2(String deliverOk2) {
		this.deliverOk2 = deliverOk2;
	}

	public String getUserMax() {
		return userMax;
	}

	public void setUserMax(String userMax) {
		this.userMax = userMax;
	}

	public String getActivityId() {
		return activityId;
	}

	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}

	public String getAst() {
		return ast;
	}

	public void setAst(String ast) {
		this.ast = ast;
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

	public String getAdminMessage() {
		return adminMessage;
	}

	public void setAdminMessage(String adminMessage) {
		this.adminMessage = adminMessage;
	}

	public String getExamineResult() {
		return examineResult;
	}

	public void setExamineResult(String examineResult) {
		this.examineResult = examineResult;
	}

	public String getAcimg() {
		return acimg;
	}

	public void setAcimg(String acimg) {
		this.acimg = acimg;
	}

	public String getActivityPhotoId() {
		return activityPhotoId;
	}

	public void setActivityPhotoId(String activityPhotoId) {
		this.activityPhotoId = activityPhotoId;
	}

	public String getTop() {
		return top;
	}

	public void setTop(String top) {
		this.top = top;
	}
}
