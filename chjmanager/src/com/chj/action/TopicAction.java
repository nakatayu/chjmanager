package com.chj.action;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
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
import com.chj.entity.Circle;
import com.chj.entity.Company;
import com.chj.entity.JsonDateValueProcessor;
import com.chj.entity.Personnel;
import com.chj.entity.Shop;
import com.chj.entity.Shoparea;
import com.chj.entity.Shoptag;
import com.chj.entity.Topic;
import com.chj.entity.User;
import com.chj.service.ActivityManager;
import com.chj.service.AreaManager;
import com.chj.service.CircleManager;
import com.chj.service.CompanyManager;
import com.chj.service.ShopManager;
import com.chj.service.TopicManager;
import com.chj.service.UserManager;
import com.chj.utils.StaticConstant;
import com.json.BaseBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Namespace("/")
@Results({ @Result(name = BaseAction.NONE, location = "topicAction.action", type = "redirect"), })
public class TopicAction extends ActionSupport {
	private static final long serialVersionUID = 7655056122242830524L;

	@Autowired
	TopicManager topicManager;
	@Autowired
	CompanyManager companyManager;

	private Integer size, page;
	private String name;
	private Long userId;
	private String info;
	private String checkbox;
	private String summary;
	private String TopicAbstract;
	private String topicName;
	private String topicViews;
	private String topicId;
	private String TopStatus;
	private File upfile;
	private String upfileFileName;
	private String examineResult;

	public void topicCreateOfUser() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		Personnel person = (Personnel) request.getSession()
				.getAttribute("user");

		BaseBean bean = new BaseBean();
		try {
			if (person.getType() == 1) {
				List list = (List) companyManager.findCompanyOffull(null);
				bean.setRows(list);
			} else {
				HashMap map = new HashMap();
				map.put("companyId", person.getCompanyId());
				List list = (List) companyManager.findCompanyOffull(map);
				bean.setRows(list);
			}
			bean.setTotal(person.getType());
			bean.setStatus(200);
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
			e.printStackTrace();
		}
		/*
		 * JsonConfig jsonConfig = new JsonConfig();
		 * jsonConfig.registerJsonValueProcessor(java.sql.Timestamp.class , new
		 * JsonDateValueProcessor("yyyy-MM-dd HH:mm:ss"));
		 */
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	String companyId, topicStatus,top, fontTime, backTime, likeName, selfRole;

	public void findTopicList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		Personnel user = (Personnel) request.getSession().getAttribute("user");

		BaseBean bean = new BaseBean();
		try {
			if (user == null) {
			} else {									
				HashMap<String, Object> topicList = new HashMap<String, Object>();
				topicList.put("size", size);
				topicList.put("startIndex", (page - 1) * size);
				topicList.put("topicStatus", topicStatus);
				topicList.put("fontTime", fontTime);
				topicList.put("backTime", backTime);
				topicList.put("likeName", likeName);				
				
				topicList.put("top", top);

				if ("1".equals(selfRole) && user.getType() == 1) {
					topicList.put("companyId", user.getCompanyId());
					topicList.put("selfRole", selfRole);
					
				} else if (user.getType() != 1) {
					topicList.put("selfRole", 0);					
					if(circleId!=null&&!"".equals(circleId.trim())){
						topicList.put("circleId", Long.valueOf(circleId));
					}else{
						topicList.put("circleId", 0);
						topicList.put("companyId", user.getCompanyId());
					}
				} else {
					topicList.put("selfRole", 0);
					if(circleId!=null&&!"".equals(circleId.trim())){
						topicList.put("circleId", Long.valueOf(circleId));
					}else{
						topicList.put("circleId", 0);
						topicList.put("companyId", companyId);
					}
				}

				List list = (List) topicManager.findZhengTopicList(topicList);
				if (list.size() > 0) {
					bean.setRows(list);
					bean.setStatus(200);
					bean.setTotal(topicManager
							.findZhengTopicListCount(topicList));
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

	/**
	 * 添加/修改话题跳转
	 */
	public void insertTopicPage() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		String page = "pages/manager/addTopicInfo.jsp";
		if (topicId != null) {
			HashMap topic = (HashMap) topicManager.findTopicDetail(topicId);
			request.setAttribute("topic", topic);

			request.setAttribute("topicImageList",
					topicManager.findTopicImageList(topicId));
			request.setAttribute("tagList",
					topicManager.findTopicTagList(topicId));
		}
		request.setAttribute("classic", classic);
		if (circleId != null)
			request.setAttribute("circleId", circleId);

		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * 保存话题
	 * 
	 * @return
	 */
	private String title, classic, content, circleId, tagList, topicImage,
			imgChanged;

	public void saveTopic() throws UnsupportedEncodingException, IOException {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		try {
			Topic circle = new Topic();
			if (topicId != null && topicId.trim().length() > 0) {
				circle.setTopicId(Long.valueOf(topicId));
			}
			circle.setTopicName(title);
			circle.setTopicContent(Commonparam.clearStr(content));
			circle.setSummary(summary);
			circle.setClassics(Integer.valueOf(classic));
			circle.setTopicViews(0L);
			circle.setCreateTime(new Date());
			circle.setCompanyId(user.getCompanyId());
			if (circleId != null && circleId.trim().length() > 0) {
				circle.setCircleId(Long.valueOf(circleId));
				circle.setStatus(StaticConstant.TOPIC_STATUS[0] + "");
				circle.setExamineResult(StaticConstant.EXAMINE_RESULT[0]);
			} else {
				if (topicId != null && topicId.trim().length() > 0) {
					circle.setStatus(StaticConstant.TOPIC_STATUS[1] + "");					
				} else {
					circle.setStatus(StaticConstant.TOPIC_STATUS[0] + "");
				}
				
				if(Integer.valueOf(classic)==1){
					circle.setExamineResult(StaticConstant.EXAMINE_RESULT[0]);
				}else{
					circle.setExamineResult(StaticConstant.EXAMINE_RESULT[2]);
				}
				
			}
			Long rt = topicManager.seveTopic(circle, tagList, topicImage,
					imgChanged);

			if (rt > 0) {
				bean.setStatus(200);
				if (topicId != null && topicId.trim().length() > 0) {
					bean.setMsg("修改成功!");
				} else {
					bean.setMsg("添加成功!");
				}
			} else {
				bean.setStatus(400);
				if (topicId != null && topicId.trim().length() > 0) {
					bean.setMsg("修改失败!");
				} else {
					bean.setMsg("添加失败!");
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
	 * 删除话题
	 * 
	 * @throws Exception
	 */
	public void deleteTopList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		String del = request.getParameter("selectedTopicIds");
		String[] idStr = del.split(",");
		List<Long> idList = new ArrayList<Long>();
		for (int i = 0; i < idStr.length; i++) {
			idList.add(Long.parseLong(idStr[i]));
		}
		BaseBean bean = new BaseBean();
		try {
			topicManager.selectedTopic(idList);
			bean.setStatus(200);

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
			e.printStackTrace();
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 修改话题
	 * 
	 * @return
	 */
	public void updateTopic() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		Topic top = new Topic();
		top.setTopicId(Long.valueOf(topicId));
		top.setTopicName(topicName);
		top.setSummary(TopicAbstract);
		top.setTopicContent(Commonparam.clearStr(info));
		String saveTTag = request.getParameter("labelValue");
		String topImge = request.getParameter("Imge");
		Long updateInfo = topicManager.updateTopic(top, saveTTag, topImge);
		if (updateInfo > 0) {
			bean.setStatus(200);
			bean.setMsg("修改成功!");
		} else {
			bean.setStatus(400);
			bean.setMsg("修改失败!");
		}
		response.sendRedirect("pages/company/TopicList.jsp");
	}

	/**
	 * 修改话题状态
	 * 
	 * @return
	 */
	public void updateTstatus() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			Topic toc = new Topic();
			toc.setTopicId(Long.valueOf(topicId));
			if (TopStatus.equals("1")) {
				toc.setStatus(String.valueOf(Commonparam.TOPIC_STATUS[1]));
			} else if (TopStatus.equals("2")) {
				toc.setStatus(String.valueOf(Commonparam.TOPIC_STATUS[2]));
			} else {
				toc.setStatus(String.valueOf(Commonparam.TOPIC_STATUS[0]));
			}
			Long stop = topicManager.updateTstatus(toc);
			if (stop > 0) {
				bean.setStatus(200);
				bean.setMsg("修改成功");
			} else {
				bean.setStatus(400);
				bean.setMsg("修改失败");
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));

	}

	/**
	 * 驳回
	 */
	public void updateNoTopInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			Topic toc = new Topic();
			toc.setTopicId(Long.valueOf(topicId));
			toc.setAdminMessage(examineResult);
			toc.setExamineResult(2);
			int stop = topicManager.updateNoTopInfo(toc);
			if (stop > 0) {
				bean.setStatus(200);
				bean.setMsg("修改成功");
			} else {
				bean.setStatus(400);
				bean.setMsg("修改失败");
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));

	}

	/**
	 * 通过
	 */
	public void updateNTopInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			Topic toc = new Topic();
			toc.setTopicId(Long.valueOf(topicId));
			toc.setAdminMessage("");
			toc.setExamineResult(1);
			int stop = topicManager.updateNoTopInfo(toc);
			if (stop > 0) {
				bean.setStatus(200);
				bean.setMsg("修改成功");
			} else {
				bean.setStatus(400);
				bean.setMsg("修改失败");
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
		String json = JSONObject.fromObject(bean).toString();
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
		String targetFolder=Commonparam.topicFolder+Commonparam.makeYearMonth(new Date());
		String absolute = Commonparam.getKeyValue("imageStorePath")+targetFolder;
		
		Commonparam.makeFile(upfile, absolute, newfilename);
		
		bean.setStatus(200);
		bean.setRows(targetFolder+newfilename);

		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 上传图片
	 * 
	 * @return
	 */
	public void updateTop() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String topicId = request.getParameter("topic_id");
		try {
			Object topd = topicManager.updateTop(topicId);
			List<Map> listmp = topicManager.updateTopListTag(topicId);
			request.setAttribute("topic", topd);
			request.setAttribute("topicTag", listmp);
		} catch (Exception e) {
			System.out.println("修改失败!");
		}
		request.getRequestDispatcher("/pages/company/TopicInfo.jsp").forward(
				request, response);
	}

	private String status;

	public void updateTopicStatus() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			String[] topid = topicId.split(",");
			if (topid.length > 0) {
				if ("4".equals(status)) {
					for (String str : topid) {
						HashMap map = new HashMap();
						map.put("status", status);
						map.put("topicId", str);
						topicManager.updateTopicEXcetes(map);
					}
				} else {
					for (String str : topid) {
						HashMap map = new HashMap();
						map.put("status", status);
						map.put("topicId", str);
						topicManager.updateTopicStatus(map);
					}
				}
			}
			bean.setStatus(200);
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}

		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public void findTopicCommentList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		try {

			HashMap<String, Object> topCommentlst = new HashMap<String, Object>();
			topCommentlst.put("size", size);
			topCommentlst.put("startIndex", (page - 1) * size);
			topCommentlst.put("fontTime", fontTime);
			topCommentlst.put("backTime", backTime);
			topCommentlst.put("likeName", likeName);
			topCommentlst.put("topicId", topicId);

			List<?> list = (List<?>) topicManager
					.findTopicCommentList(topCommentlst);
			if (list.size() > 0) {
				bean.setRows(list);
				bean.setStatus(200);
				bean.setTotal(topicManager
						.findTopicCommentListCount(topCommentlst));
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

	String topicCommentId;

	public void updatCommentDelete() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		try {
			if (user != null) {

				topicManager.updatCommentDelete(topicId, topicCommentId);
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

	Integer filName, filValue, filnum;

	public void updaTopiclistTop() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		try {
			if (user != null) {
				String s = (String) topicManager.updaTopiclistTop(topicId,selfRole,
						Commonparam.TOPIC_COLUMNS[filName], filValue, filnum);
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

	
/**
 * 开发区后台
 * 删除话题 
 */	
	public void deleteTopic() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String topicId = request.getParameter("topicId");
		String[] idStr = topicId.split(",");
		List<Long> idList = new ArrayList<Long>();
		for (int i = 0; i < idStr.length; i++) {
			idList.add(Long.parseLong(idStr[i]));
		}
		BaseBean bean = new BaseBean();
		try {
			topicManager.deleteTopic(idList);
			bean.setStatus(200);
		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
			e.printStackTrace();
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

	public String getTopicCommentId() {
		return topicCommentId;
	}

	public void setTopicCommentId(String topicCommentId) {
		this.topicCommentId = topicCommentId;
	}

	public String getTopicAbstract() {
		return TopicAbstract;
	}

	public void setTopicAbstract(String topicAbstract) {
		TopicAbstract = topicAbstract;
	}

	public String getTopicViews() {
		return topicViews;
	}

	public void setTopicViews(String topicViews) {
		this.topicViews = topicViews;
	}

	public String getTopicName() {
		return topicName;
	}

	public void setTopicName(String topicName) {
		this.topicName = topicName;
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

	public String getCircleId() {
		return circleId;
	}

	public void setCircleId(String circleId) {
		this.circleId = circleId;
	}

	public String getTagList() {
		return tagList;
	}

	public void setTagList(String tagList) {
		this.tagList = tagList;
	}

	public String getTopicImage() {
		return topicImage;
	}

	public void setTopicImage(String topicImage) {
		this.topicImage = topicImage;
	}

	public String getImgChanged() {
		return imgChanged;
	}

	public void setImgChanged(String imgChanged) {
		this.imgChanged = imgChanged;
	}

	private String json;

	public String getJson() {
		return json;
	}

	public void setJson(String json) {
		this.json = json;
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

	public String getTopicId() {
		return topicId;
	}

	public void setTopicId(String topicId) {
		this.topicId = topicId;
	}

	public String getTopStatus() {
		return TopStatus;
	}

	public void setTopStatus(String topStatus) {
		TopStatus = topStatus;
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

	public String getExamineResult() {
		return examineResult;
	}

	public void setExamineResult(String examineResult) {
		this.examineResult = examineResult;
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getTopicStatus() {
		return topicStatus;
	}

	public void setTopicStatus(String topicStatus) {
		this.topicStatus = topicStatus;
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

	public String getSelfRole() {
		return selfRole;
	}

	public void setSelfRole(String selfRole) {
		this.selfRole = selfRole;
	}

	public String getClassic() {
		return classic;
	}

	public void setClassic(String classic) {
		this.classic = classic;
	}

	public String getTop() {
		return top;
	}

	public void setTop(String top) {
		this.top = top;
	}

}
