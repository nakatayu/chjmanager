package com.chj.action;

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

import com.chj.service.TagManager;
import com.json.BaseBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.eavic.framework.web.BaseAction;

@Namespace("/")
@Results({ @Result(name = BaseAction.NONE, location = "tagAction.action", type = "redirect") })
public class TagAction extends ActionSupport {

	private static final long serialVersionUID = 7655056122242830524L;

	@Autowired
	TagManager tagManager;

	private String tagId;// 普通变量
	
	// 标签 一级分类
	public void findTagFirstList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			List<Object> list = tagManager.findTagFirstList();
			bean.setStatus(200);
			bean.setRows(list);
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}

		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	// 标签 二级分类
	public void findTagSecondList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			List<Object> list = tagManager.findTagSecondList(Long.valueOf(tagId));
			bean.setStatus(200);
			bean.setRows(list);
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}

		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	// 标签名称
	public void findTagThirdList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("tagId", tagId);
			List<Object> list = tagManager.findTagThirdList(map);
			bean.setStatus(200);
			bean.setRows(list);
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public String getTagId() {
		return tagId;
	}

	public void setTagId(String tagId) {
		this.tagId = tagId;
	}

	Long tagParentId;

	/**
	 * 标签查询
	 */
	public void findTagList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			List<HashMap> taglist = (List<HashMap>) tagManager
					.findTagList(tagParentId);

			bean.setRows(taglist);
			bean.setStatus(200);

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	String tagName, fthod;

	/**
	 * 标签新增、修改、删除 fthod:1新增，2修改，3删除
	 * 
	 * @throws Exception
	 */
	public void updateTheTagList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap param = new HashMap();
			param.put("tagId", tagId);
			param.put("tagName", tagName);

			Long id = 0L;

			if ("1".equals(fthod)) {
				id = (Long) tagManager.addTheNewTag(param);
			} else if ("2".equals(fthod)) {
				id = Long.parseLong(tagManager.updateTheTag(param).toString());
			} else if ("3".equals(fthod)) {
				id = Long.parseLong(tagManager.deleteTheTag(param).toString());
			}
			if (id > 0) {
				bean.setStatus(200);
			}

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public String getFthod() {
		return fthod;
	}

	public void setFthod(String fthod) {
		this.fthod = fthod;
	}

	public Long getTagParentId() {
		return tagParentId;
	}

	public void setTagParentId(Long tagParentId) {
		this.tagParentId = tagParentId;
	}

}
