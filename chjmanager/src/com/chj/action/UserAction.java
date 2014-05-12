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

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

//import org.apache.naming.java.javaURLContextFactory;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import cn.eavic.framework.web.BaseAction;

import com.chj.common.Commonparam;
import com.chj.common.ProxoolServlet;
import com.chj.entity.Company;
import com.chj.entity.CompanyShop;
import com.chj.entity.CompanyTag;
import com.chj.entity.CompanyTagRecord;
import com.chj.entity.JsonDateValueProcessor;
import com.chj.entity.Personnel;
import com.chj.entity.User;
import com.chj.service.UserManager;
import com.chj.utils.MD5Util;
import com.json.BaseBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Namespace("/")
@Results({ @Result(name = BaseAction.NONE, location = "userAction.action", type = "redirect") })
public class UserAction extends ActionSupport {
	/**
	 *
	 */
	private static final long serialVersionUID = 7655056122242830524L;

	@Autowired
	UserManager userManager;

	private String username, password;
	private String name;

	private String operateScope;
	private String email;
	private String linkman;
	private String linkmanTel;
	private String address;
	private String companyInfo;
	private String companyURL;
	private Date registDate;
	private String companyType;
	private String logo;
	private File upfile;
	private String upfileFileName;
	private Integer size, page;
	private String companyId;
	private Long updateCompanyId;
	private String account;

	private String key;

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public int type;

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	private String role;
	private String realname;
	private String tagId, imgCompany;
	private Long tag, ctag;

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	private Long userId;

	/**
	 * 登陆
	 * 
	 * @throws Exception
	 */
	public void login() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel per = new Personnel();
		password = MD5Util.digest(password);
		per.setPwd(password);
		per.setUserName(username);
		Personnel pero = (Personnel) userManager.login(per);

		BaseBean bean = new BaseBean();

		if (pero != null) {
			HashMap msp = new HashMap();
			msp.put("userId", pero.getId());
			userManager.addUserdaily(msp);
			// 1是开发区，2是企业，3是店铺，4是星巴克总部。5是星巴克店铺
			if (pero.getType() == 3 || pero.getType() == 5) {
				Long companyIdNum = userManager.getCompanyId(pero
						.getOrganizationalID());
				pero.setCompanyId(companyIdNum);

			} else {
				pero.setCompanyId(pero.getOrganizationalID());
			}
			userManager.updateEventualLoginTime(pero.getId());
			request.getSession().setAttribute("user", pero);
			bean.setStatus(200);
		} else {
			bean.setStatus(400);
		}

		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public void loginOut() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		BaseBean bean = new BaseBean();

		request.getSession().setAttribute("user", null);
		bean.setStatus(200);

		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 企业查询
	 * 
	 * @throws Exception
	 */

	public void companyList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();

		HashMap<String, Object> mapparam = new HashMap<String, Object>();
		mapparam.put("name", name);
		mapparam.put("size", size);
		mapparam.put("startIndex", (page - 1) * size + 1);

		List<Company> company = (List<Company>) userManager
				.companyList(mapparam);

		bean.setStatus(200);
		bean.setRows(company);
		bean.setTotal(userManager.companyListCount(mapparam));

		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 上传企业头像
	 * 
	 * @throws Exception
	 */

	public void uploadImage() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		BaseBean bean = new BaseBean();
		long max = 1024 * 400;
		if (this.upfile != null) {
			int length = 0;
			try {
				FileInputStream fis = new FileInputStream(upfile);
				try {
					length = fis.available();
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			} catch (FileNotFoundException e2) {
				e2.printStackTrace();
			}
			if (max >= length) {

				String newfilename1 = Commonparam
						.makeNewFileName(this.upfileFileName);

				String targetFolder = Commonparam.otherfolder;
				if (type == 1) {
					targetFolder = Commonparam.headImage;
				} else if (type == 2) {
					targetFolder = Commonparam.companyFolder;
				} else if (type == 3) {
					targetFolder = Commonparam.companyShopFolder;
				} else if (type == 4) {
					targetFolder = Commonparam.circleFolder;
				} else if (type == 5) {
					targetFolder = Commonparam.topicFolder;
				} else if (type == 6) {
					targetFolder = Commonparam.activityFolder;
				} else if (type == 7) {
					targetFolder = Commonparam.productFolder;
				} else if (type == 8) {
					targetFolder = Commonparam.adsFolder;
				} else if (type == 9) {
					targetFolder = Commonparam.cardImage;
				} else if (type == 10) {
					targetFolder = Commonparam.qrcodefolder;
				} else {
					targetFolder = Commonparam.otherfolder;
				}

				String newfilename = Commonparam
						.makeNewFileName(upfileFileName);
				targetFolder = targetFolder
						+ Commonparam.makeYearMonth(new Date());
				String absolute = Commonparam.getKeyValue("imageStorePath")
						+ targetFolder;

				Commonparam.makeFile(upfile, absolute, newfilename);

				bean.setStatus(200);
				bean.setRows(targetFolder + newfilename);
			} else {
				bean.setStatus(400);
				bean.setMsg("图片大小300K内!");
			}

		} else {
			bean.setStatus(400);
			bean.setMsg("请选择图片!");
		}

		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));

	}

	/**
	 * 添加企业信息
	 * 
	 * @throws Exception
	 */

	public void addComPanyInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {

			Company company = new Company();
			company.setName(name);
			company.setOperateScope(operateScope);
			company.setEmail(email);
			company.setLinkman(linkman);
			company.setLinkmanTel(linkmanTel);
			company.setAddress(address);
			company.setCompanyInfo(companyInfo);
			company.setCompanyURL(companyURL);
			company.setRegistDate(new Date());
			company.setCompanyType(companyType);
			company.setLogo(imgCompany);
			company.setDeleteFlag(1);
			String sevatag = request.getParameter("labelValue");
			Long sevecp = userManager.addComPanyInfo(company, sevatag);
			if (sevecp > 0) {
				request.setAttribute("result", "添加成功");

			} else {
				request.setAttribute("result", "添加成功");
			}
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
			request.setAttribute("result", "添加失败");
		}

		request.getRequestDispatcher("pages/manager/addCompany.jsp").forward(
				request, response);
	}

	/**
	 * 删除企业信息
	 * 
	 * @throws Exception
	 */

	public void delCompanyInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {

			Object aa = userManager.delCompanyInfo(companyId);
			if (aa != null) {
				bean.setStatus(200);
			} else {
				bean.setStatus(400);
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());

		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 修改企业信息
	 * 
	 * @throws Exception
	 */
	public void updateCompanyInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			Company company = new Company();
			company.setCompanyId(updateCompanyId);
			company.setName(name);
			company.setOperateScope(operateScope);
			company.setEmail(email);
			company.setLinkman(linkman);
			company.setLinkmanTel(linkmanTel);
			company.setAddress(address);
			company.setCompanyInfo(companyInfo);
			company.setCompanyURL(companyURL);
			company.setRegistDate(new Date());
			company.setCompanyType(companyType);
			company.setLogo(imgCompany);
			String sevatag = request.getParameter("labelValue");
			Object audate = userManager.updateCompanyInfo(company,
					updateCompanyId, sevatag);
			if (Integer.valueOf(audate.toString()) > 0) {
				bean.setStatus(200);
			} else {
				bean.setStatus(400);
			}
		} catch (Exception e) {

			e.printStackTrace();
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
		response.sendRedirect("/pages/manager/companyList.jsp");

	}

	/**
	 * 查询店铺（开发区管理）
	 */

	public void shopList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> shopmap = new HashMap<String, Object>();
			shopmap.put("companyId", companyId);
			shopmap.put("size", size);
			shopmap.put("startIndex", (page - 1) * size);

			List<Object> company = (List<Object>) userManager.shopList(shopmap);

			bean.setStatus(200);
			bean.setRows(company);
			bean.setTotal(userManager.shopListCount(shopmap));
		} catch (Exception e) {

			System.out.println(e);
			e.printStackTrace();
		}

		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));

	}

	/**
	 * 查询店铺（企业）
	 */

	public void shopListc() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		User user = (User) request.getSession().getAttribute("user");

		try {
			HashMap<String, Object> shopmap = new HashMap<String, Object>();
			shopmap.put("companyId", user.getCommpanyId());
			shopmap.put("size", size);
			shopmap.put("startIndex", (page - 1) * size);

			List<Object> company = (List<Object>) userManager.shopList(shopmap);

			bean.setStatus(200);
			bean.setRows(company);
			bean.setTotal(userManager.shopListCount(shopmap));
		} catch (Exception e) {

			System.out.println(e);
			e.printStackTrace();
		}

		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));

	}

	/**
	 * 添加人员信息
	 * 
	 * @return
	 */
	public void addUserInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			User user = new User();
			user.setAccount(account);
			user.setRole(role);
			user.setRealName(realname);
			user.setPhone(phone);
			user.setEmail(email);
			Long userInfo = userManager.addUserInfo(user);
			if (userInfo > -1) {
				bean.setStatus(200);
				bean.setMsg("添加成功");
			}
		} catch (Exception e) {

			e.printStackTrace();
			System.out.println("添加失败");
		}

	}

	/**
	 * 查询服务信息
	 * 
	 * @return
	 */
	public void findServiceInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();

		HashMap<String, Object> sinfo = new HashMap<String, Object>();
		sinfo.put("size", size);
		sinfo.put("startIndex", (page - 1) * size);

		List<Object> serInfo = (List<Object>) userManager
				.findServiceInfo(sinfo);
	}

	/**
	 * 标签分类
	 * 
	 * @throws Exception
	 */
	public void findTagSecondList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			List<Object> list = userManager.findTagSecondList();
			bean.setStatus(200);
			bean.setRows(list);
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
			System.out.println(e);
		}

		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 删除用户
	 */

	public void deleteUserListInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			String userId = request.getParameter("selectedUserId");
			if (userId != null && userId != "") {
				String[] idStr = userId.split(",");
				List<Long> idList = new ArrayList<Long>();
				for (int i = 0; i < idStr.length; i++) {
					idList.add(Long.parseLong(idStr[i]));
				}
				userManager.deleteUserListInfo(idList);
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
	 * 标签名称
	 * 
	 * @throws Exception
	 */

	public void findTagThirdList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("tagId", tagId);
			List<Object> list = userManager.findTagThirdList(map);
			bean.setStatus(200);
			bean.setRows(list);
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 保存企业标签
	 * 
	 * @return
	 */
	public void saveTag() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();

		String sevatag = request.getParameter("txttagid");

		CompanyTagRecord ctg = new CompanyTagRecord();

		String[] tags = sevatag.split(",");
		List<CompanyTagRecord> stList = new ArrayList<CompanyTagRecord>();

		for (int i = 0; i < tags.length; i++) {

			ctg.setTagId(Long.parseLong(tags[i]));
			ctg.setCompanyId(Long.parseLong(companyId));
			ctg.setAddTime(new Date());
			stList.add(ctg);
			Long savetag = userManager.saveTag(ctg);
			if (savetag > -1) {
				bean.setStatus(200);
				bean.setMsg("添加成功");
			} else {
				bean.setStatus(400);
				bean.setMsg("添加失败");
			}

		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));

	}

	public void verifyTheAccount() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		String account = (String) request.getParameter("account");
		try {
			Object o = userManager.verifyTheAccount(account);
			if (o != null) {
				bean.setMsg("账号已存在！");
				bean.setStatus(400);
			} else {
				bean.setStatus(200);
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}

		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * @ Richard
	 */
	public void findUserList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		BaseBean baseBean = new BaseBean();
		try {
			HashMap<String, Object> parm = new HashMap<String, Object>();

			parm.put("keyword", name);
			parm.put("size", size);
			parm.put("startIndex", (page - 1) * size);
			List<User> users = userManager.findUserList(parm);
			baseBean.setStatus(200);
			baseBean.setRows(users);
			baseBean.setTotal(userManager.findUserListCount(parm));
		} catch (Exception e) {
			baseBean.setStatus(400);
			baseBean.setMsg(e.getLocalizedMessage());
		}
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.sql.Timestamp.class,
				new JsonDateValueProcessor("yyyy-MM-dd HH:mm:ss"));

		String json = JSONObject.fromObject(baseBean, jsonConfig).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public void findUserInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean baseBean = new BaseBean();
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		if (personnel.getType() == 1) {
			try {
				HashMap user = userManager.findUserInfo(userId);
				baseBean.setStatus(200);
				baseBean.setRows(user);
			} catch (Exception e) {
				baseBean.setStatus(400);
				baseBean.setMsg(e.getLocalizedMessage());
			}
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.registerJsonValueProcessor(java.sql.Timestamp.class,
					new JsonDateValueProcessor("yyyy-MM-dd HH:mm:ss"));
			String json = JSONObject.fromObject(baseBean, jsonConfig)
					.toString();
			response.getOutputStream().write(json.getBytes("UTF-8"));
		}
	}

	private String nickName;
	private String firstName;
	private String lastName;
	private String realName;
	private String sex;
	private String city;
	private String workAddress;
	private String shandCardNo;
	private String activeValue;
	private String sincerityValue;
	private String registerTime;
	private String phone;
	private String webUrl;
	private String info;
	private String headPicture;

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	private String birthDate;

	public void updateMemberInfo() throws Exception {

		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		// if (personnel.getType() == 1) {
		BaseBean bean = new BaseBean();
		try {
			User user = new User();
			user.setUserId(userId);
			user.setNickName(nickName);
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
			if (birthDate != null) {
				user.setBirthDate(fmt.parse(birthDate));
			} else {
				user.setBirthDate(fmt.parse("0"));
			}
			user.setFirstName(firstName);
			user.setLastName(lastName);
			user.setRealName(realName);
			user.setSex(sex);
			user.setCity(city);
			user.setWorkAddress(workAddress);
			user.setShandCardNo(shandCardNo);
			user.setActiveValue(activeValue);
			user.setSincerityValue(sincerityValue);
			user.setPhone(phone);
			if (webUrl != null) {
				user.setWebUrl(webUrl);
			} else {
				user.setWebUrl("");
			}
			if (email != null) {
				user.setEmail(email);
			} else {
				user.setEmail("");
			}
			user.setInfo(info);
			user.setHeadPicture(headPicture);
			Object result = userManager.updateMemberInfo(user);

			if (Integer.valueOf(result.toString()) > 0) {
				bean.setStatus(200);
			} else {
				bean.setStatus(400);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));

		// }
	}

	String fontTime, backTime, likeName;

	public void finduserDailyList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> uList = new HashMap<String, Object>();

			uList.put("size", size);
			uList.put("startIndex", (page - 1) * size);
			uList.put("fontTime", fontTime);
			uList.put("backTime", backTime);
			uList.put("likeName", likeName);

			List list = userManager.finduserDailyList(uList);

			if (list.size() > 0) {
				bean.setRows(list);
				bean.setStatus(200);
				bean.setTotal(userManager.finduserDailyListCount(uList));
			} else {
				bean.setMsg("没有数据！");
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		JsonConfig config = new JsonConfig();
		config.registerJsonValueProcessor(java.sql.Timestamp.class,
				new JsonDateValueProcessor("yyyy-MM-dd HH:mm:ss"));
		String json = JSONObject.fromObject(bean, config).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	String activityId;

	public void checkMemberCredentials() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		Personnel user = (Personnel) request.getSession().getAttribute("user");
		try {
			if (user == null) {
				response.getWriter().print("用户没有登录！");
			} else {
				HashMap map = new HashMap();
				map.put("userId", userId);
				map.put("activityId", activityId);
				map.put("type", 2);
				map.put("doType", 2);
				HashMap userCard = (HashMap) userManager
						.findCredentialsCredentials(map);
				if (userCard != null) {
					userCard.put("userName",
							userManager.findUserNickNameImage(userId));
					request.setAttribute("userCard", userCard);
				}
				request.getRequestDispatcher("pages/company/cardManager.jsp")
						.forward(request, response);
			}
		} catch (Exception e) {
			response.getWriter().print(e.getLocalizedMessage());
		}
	}

	Integer numCode;

	public void addUserOfCode() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		BaseBean bean = new BaseBean();
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		try {
			if (user == null) {
				response.getWriter().print("用户没有登录！");
			} else {

				userManager.addcodeofuserregirter(name, numCode);
				bean.setStatus(200);
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	String userCode;

	public void findUserCodeInfolt() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		BaseBean bean = new BaseBean();
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		try {
			if (user == null) {
				response.getWriter().print("用户没有登录！");
			} else {
				HashMap map = new HashMap();
				map.put("size", size);
				map.put("startIndex", (page - 1) * size);
				map.put("depart", name);
				map.put("code", userCode);

				List oj = (List) userManager.findUserCodeInfolt(map);
				if (oj.size() > 0) {
					bean.setStatus(200);
					bean.setRows(oj);
					bean.setTotal(userManager.findUserCodeInfoltCount(map));
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

	String codeIdes;

	public void deleteTbCodelst() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		try {
			if (user != null) {
				userManager.deleteTbCodelst(codeIdes);
				bean.setStatus(200);
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String josn = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(josn.getBytes("UTF-8"));
	}

	public void checkfullInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			Object obj = userManager.checkfullInfo();
			bean.setRows(obj);
			bean.setStatus(200);
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String josn = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(josn.getBytes("UTF-8"));
	}

	public void updateShopProductStock() throws Exception {
	
		try {

			userManager.updateShopProductStock();

		} catch (Exception e) {
			e.getLocalizedMessage();
		}
	}

	public Integer getNumCode() {
		return numCode;
	}

	public void setNumCode(Integer numCode) {
		this.numCode = numCode;
	}

	public String getUserCode() {
		return userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getActivityId() {
		return activityId;
	}

	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getWorkAddress() {
		return workAddress;
	}

	public void setWorkAddress(String workAddress) {
		this.workAddress = workAddress;
	}

	public String getShandCardNo() {
		return shandCardNo;
	}

	public void setShandCardNo(String shandCardNo) {
		this.shandCardNo = shandCardNo;
	}

	public String getActiveValue() {
		return activeValue;
	}

	public void setActiveValue(String activeValue) {
		this.activeValue = activeValue;
	}

	public String getSincerityValue() {
		return sincerityValue;
	}

	public void setSincerityValue(String sincerityValue) {
		this.sincerityValue = sincerityValue;
	}

	public String getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(String registerTime) {
		this.registerTime = registerTime;
	}

	public String getWebUrl() {
		return webUrl;
	}

	public void setWebUrl(String webUrl) {
		this.webUrl = webUrl;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getHeadPicture() {
		return headPicture;
	}

	public void setHeadPicture(String headPicture) {
		this.headPicture = headPicture;
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
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

	public void setName(String name) {
		this.name = name;
	}

	public String getOperateScope() {
		return operateScope;
	}

	public String getEmail() {
		return email;
	}

	public String getLinkman() {
		return linkman;
	}

	public String getLinkmanTel() {
		return linkmanTel;
	}

	public String getAddress() {
		return address;
	}

	public String getCompanyInfo() {
		return companyInfo;
	}

	public String getCompanyURL() {
		return companyURL;
	}

	public void setOperateScope(String operateScope) {
		this.operateScope = operateScope;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}

	public void setLinkmanTel(String linkmanTel) {
		this.linkmanTel = linkmanTel;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setCompanyInfo(String companyInfo) {
		this.companyInfo = companyInfo;
	}

	public void setCompanyURL(String companyURL) {
		this.companyURL = companyURL;
	}

	public Date getRegistDate() {
		return registDate;
	}

	public String getCompanyType() {
		return companyType;
	}

	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}

	public void setCompanyType(String companyType) {
		this.companyType = companyType;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public File getUpfile() {
		return upfile;
	}

	public String getUpfileFileName() {
		return upfileFileName;
	}

	public void setUpfile(File upfile) {
		this.upfile = upfile;
	}

	public void setUpfileFileName(String upfileFileName) {
		this.upfileFileName = upfileFileName;
	}

	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public Long getUpdateCompanyId() {
		return updateCompanyId;
	}

	public void setUpdateCompanyId(Long updateCompanyId) {
		this.updateCompanyId = updateCompanyId;
	}

	public String getAccount() {
		return account;
	}

	public String getRole() {
		return role;
	}

	public String getRealname() {
		return realname;
	}

	public String getPhone() {
		return phone;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getTagId() {
		return tagId;
	}

	public void setTagId(String tagId) {
		this.tagId = tagId;
	}

	public Long getTag() {
		return tag;
	}

	public Long getCtag() {
		return ctag;
	}

	public void setTag(Long tag) {
		this.tag = tag;
	}

	public void setCtag(Long ctag) {
		this.ctag = ctag;
	}

	public String getImgCompany() {
		return imgCompany;
	}

	public void setImgCompany(String imgCompany) {
		this.imgCompany = imgCompany;
	}

}
