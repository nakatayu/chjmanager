package com.chj.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
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
import com.chj.entity.Circle;
import com.chj.entity.Company;
import com.chj.entity.JsonDateValueProcessor;
import com.chj.entity.Personnel;
import com.chj.entity.Shop;
import com.chj.entity.Shoparea;
import com.chj.entity.Shoptag;
import com.chj.entity.Topic;
import com.chj.entity.User;
import com.chj.entity.PayType;
import com.chj.service.AreaManager;
import com.chj.service.CompanyInfoManagerManager;
import com.chj.service.CompanyManager;
import com.chj.service.ShopManager;
import com.chj.service.UserManager;
import com.json.BaseBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Namespace("/")
@Results({ @Result(name = BaseAction.NONE, location = "shopAction.action", type = "redirect"), })
public class ShopAction extends ActionSupport {
	private static final long serialVersionUID = 7655056122242830524L;

	@Autowired
	ShopManager shopManager;
	@Autowired
	AreaManager areaManager;
	@Autowired
	CompanyManager companyManager;
	@Autowired
	CompanyInfoManagerManager companyInfoManagerManager;

	private Integer size, page, status;
	private Long shopNumber;
	private String name;
	private String email;
	private String address;
	private Long companyId;
	private Date registTime;
	private String logo;
	private String location;
	private Long categoryId;
	private Integer consumptionPer;// 人均消费
	private Integer orderField;
	private Integer sendTime;
	private Integer sendPrice;
	private String payType;
	private Long areaFirstId;
	private Long areaSecondId;
	private String deliverOk;
	private String terminalOk;
	private String linkman;
	private String linkmanTel;
	private String businessBeginHours;
	private String businessEndHours;
	private Long starScore;// 星级评分
	private String content;// 内容
	private String workTime;// 营业时间
	private Long deliverMoney;// 外送费
	private Long categoryTag;
	private Long tagId;
	private Long areaId;
	private String serviceTime;
	private String info;
	private String CircleAbstract;
	private String checkbox;
	private String payTypeName;
	private Long payTypeId;
	private String shopType;
	private String lat, lng;

	/**
	 * 店鋪保存信息
	 */
	public void insertShopInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		String thirdCategoryTags = request.getParameter("thirdCategoryTag");// 已选标签的值
		String areaName = request.getParameter("hiddenAreaName");// 园区名称的值

		// 标签
		String[] tags = thirdCategoryTags.split(",");
		List<Shoptag> stList = new ArrayList<Shoptag>();
		Shoptag st = null;
		if (tags[0].length() != 0 && tags.length != 0) {
			for (int i = 0; i < tags.length; i++) {
				st = new Shoptag();
				st.setTagId(Long.parseLong(tags[i]));
				stList.add(st);
			}
		}

		// 配送范围
		String[] garden = areaName.split(",");
		List<Shoparea> gardenname = new ArrayList<Shoparea>();
		Shoparea sa = null;
		if (garden[0].length() != 0 && garden.length != 0) {
			for (int j = 0; j < garden.length; j++) {
				sa = new Shoparea();
				sa.setAreaId(Long.parseLong(garden[j]));
				gardenname.add(sa);
			}
		}

		try {
			// 基本信息
			Shop shop = new Shop();
			shop.setCompanyId(personnel.getCompanyId()); // 企业ID
			shop.setShopNumber(shopNumber); // 店铺编号
			shop.setName(name); // 店铺名称
			shop.setAddress(address); // 店铺地址
			shop.setDeliverOk(deliverOk);// 是否支持外送
			if (deliverOk != null && deliverOk.equals("T")) {
				if (terminalOk != null && terminalOk.trim().length() > 0)
					shop.setTerminalOk(terminalOk);// 是否支持终端接收订单
				else
					shop.setTerminalOk("F");
			} else {
				if (terminalOk != null && terminalOk.trim().length() > 0)
					shop.setTerminalOk(terminalOk);// 是否支持终端接收订单
				else
					shop.setTerminalOk("F");
			}

			shop.setLinkmanTel(linkmanTel);// 联系人电话
			shop.setLinkman(linkman);// 联系人
			if (sendPrice != null)
				shop.setSendPrice(sendPrice); // 起送价
			else
				shop.setSendPrice(0);
			if (deliverMoney != null)
				shop.setDeliverMoney(deliverMoney);// 外送费
			else
				shop.setDeliverMoney(0L);
			if (sendTime != null)
				shop.setSendTime(sendTime);// 送达时间
			else
				shop.setSendTime(-1);
			shop.setPayType(payType);// 支付方式
			shop.setContent(Commonparam.clearStr(content));// 店铺介绍

			if (lat != null && lat.trim().length() > 0) {
				shop.setLat(lat);// 纬度
			}
			if (lng != null && lng.trim().length() > 0) {
				shop.setLng(lng);// 经度
			}

			shop.setLogo(logo);// 店铺logo
			shop.setWorkTime(workTime);// 工作时间
			shop.setServiceTime(serviceTime);// 外送服务时间
			shop.setConsumptionPer(consumptionPer);// 人均消费
			shop.setRegistTime(new Date());// 注册时间
			shop.setShopType(shopType);// 店铺类型
			shop.setCategoryId(categoryId);// 店铺类型的ID
			shop.setAreaFirstId(areaFirstId);// 一级地址
			shop.setAreaSecondId(areaSecondId);// 二级地址
			shop.setExamineResult(3);// 店铺审核状态
			shop.setStatus(1);// 1是创建申请2是修改申请3关闭申请
			Long shopid = shopManager.insertShopInfo(shop, stList, gardenname);
			if (shopid != null) {
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

	// 店铺列表
	private Integer top;
	private String companyName;

	public void findShopList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		HashMap<String, Object> shopList = new HashMap<String, Object>();
		try {

			shopList.put("size", size);
			shopList.put("startIndex", (page - 1) * size);
			shopList.put("name", name);
			shopList.put("companyName", companyName);
			shopList.put("status", status);
			shopList.put("top", top);
			if (personnel.getType() == 1) {
				shopList.put("companyId", companyId);
			} else {
				shopList.put("companyId", personnel.getCompanyId());
				if (personnel.getType() == 3 || personnel.getType() == 5) {
					shopList.put("companyShopId",
							personnel.getOrganizationalID());
				}
			}
			List<HashMap> list = shopManager.findShopList(shopList);

			if (list.size() > 0) {
				bean.setStatus(200);
				bean.setRows(list);
				bean.setTotal(shopManager.shopListCount(shopList));
			} else {
				bean.setMsg("没有数据!");
			}
			// 企业ID

			/*
			 * if (personnel.getType() == 3 || personnel.getType() == 5) { //
			 * 店铺权限 shopList.put("status", status); shopList.put("size", size);
			 * shopList.put("companyShopId", personnel.getOrganizationalID());
			 * shopList.put("startIndex", (page - 1) * size); List<HashMap> list
			 * = shopManager .findShopEnterIntoShopList(shopList); for (HashMap
			 * map : list) { map.put("companyName",
			 * companyManager.findcompanyName(map
			 * .get("company_id").toString())); } bean.setStatus(200);
			 * bean.setRows(list); // 店铺列表上的分页 bean.setTotal(shopManager
			 * .findShopEnterIntoShopListCountPage(shopList));
			 * 
			 * } else if (personnel.getType() == 2 || personnel.getType() == 4)
			 * { // 企业权限 shopList.put("status", status); shopList.put("name",
			 * name); shopList.put("size", size); shopList.put("companyId",
			 * personnel.getOrganizationalID()); shopList.put("startIndex",
			 * (page - 1) * size); List<HashMap> list =
			 * shopManager.findShopList(shopList); for (HashMap map : list) {
			 * map.put("companyName", companyManager.findcompanyName(map
			 * .get("company_id").toString())); } if (list.size() > 0) {
			 * bean.setStatus(200); bean.setRows(list);
			 * bean.setTotal(shopManager.shopListCount(shopList)); } else {
			 * bean.setMsg("没有数据!"); } } else if (personnel.getType() == 1) { //
			 * 开发区 查找企业下面所有店铺信息 list shopList.put("status", status);
			 * shopList.put("name", name); shopList.put("size", size);
			 * shopList.put("companyId", companyInfoManagerId);// 企业ID
			 * shopList.put("startIndex", (page - 1) * size); List<HashMap> list
			 * = shopManager.findShopList(shopList); for (HashMap map : list) {
			 * map.put("companyName", companyManager.findcompanyName(map
			 * .get("company_id").toString())); } if (list.size() > 0) {
			 * bean.setStatus(200); bean.setRows(list);
			 * bean.setTotal(shopManager.shopListCount(shopList)); } else {
			 * bean.setMsg("没有数据!"); } }
			 */
		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	// 删除店铺信息
	public void deleteShopInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		String del = request.getParameter("selectedShopIds");
		String[] idStr = del.split(",");
		List<Long> idList = new ArrayList<Long>();
		for (int i = 0; i < idStr.length; i++) {
			idList.add(Long.parseLong(idStr[i]));
		}
		BaseBean bean = new BaseBean();
		try {
			shopManager.deleteShopInfo(idList);
			bean.setStatus(200);
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
			e.printStackTrace();
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	// 查找店铺信息 已选标签和服务范围，园区名称
	public void updateShopInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		String returnpage = "/pages/company/updateShopInfo.jsp";
		try {

			Long shopId = 0l;
			if (personnel.getType() == 1) {
				returnpage = "/pages/manager/companyInfoManagerUpdateShop.jsp";
			}
			String Id = request.getParameter("companyShopId");

			if (personnel.getType() == 3 || personnel.getType() == 5) {
				shopId = personnel.getOrganizationalID();
			} else {
				shopId = Long.parseLong(Id);
			}

			List<Map> shopArea = shopManager.findShopArea(shopId);
			List<Map> shopTag = shopManager.findShopTag(shopId);
			List<Object> areaList = areaManager.findDetailedAddress();
			Object shopInfo = shopManager.findShopInfo(shopId);

			System.out.println(JSONObject.fromObject(shopInfo));
			request.setAttribute("shopTypeList", shopManager.findShopType());
			request.setAttribute("shop", shopInfo);
			request.setAttribute("shopArea", shopArea);
			request.setAttribute("shopTag", shopTag);
			request.setAttribute("areaList", areaList);

		} catch (Exception e) {
			returnpage = "/pages/login.jsp";
		}
		request.getRequestDispatcher(returnpage).forward(request, response);
	}

	// 更新信息
	public void updateShopInfoSave() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			String thirdCategoryTags = request.getParameter("thirdCategoryTag");// 已选标签的值
			String areaName = request.getParameter("hiddenAreaName");// 园区名称的值

			// 标签
			String[] tags = thirdCategoryTags.split(",");
			List<Shoptag> stList = new ArrayList<Shoptag>();
			Shoptag st = null;
			if (tags[0].length() != 0 && tags.length != 0) {
				for (int i = 0; i < tags.length; i++) {
					st = new Shoptag();
					st.setTagId(Long.parseLong(tags[i]));
					stList.add(st);
				}
			}

			// 配送范围
			List<Shoparea> gardenname = new ArrayList<Shoparea>();
			if (areaName != null) {
				String[] garden = areaName.split(",");
				Shoparea sa = null;
				if (garden[0].length() != 0 && garden.length != 0) {
					for (int j = 0; j < garden.length; j++) {
						sa = new Shoparea();
						sa.setAreaId(Long.parseLong(garden[j]));
						gardenname.add(sa);
					}
				}
			}

			// 基本信息
			Shop shop = new Shop();
			shop.setCompanyId(personnel.getCompanyId()); // 企业ID
			shop.setShopNumber(shopNumber); // 店铺编号
			shop.setName(name); // 店铺名称
			shop.setAddress(address); // 店铺地址
			shop.setDeliverOk(deliverOk);// 是否支持外送

			if (deliverOk != null && deliverOk.equals("T")) {
				if (terminalOk != null && terminalOk.trim().length() > 0)
					shop.setTerminalOk(terminalOk);// 是否支持终端接收订单
				else
					shop.setTerminalOk("F");
			} else {
				if (terminalOk != null && terminalOk.trim().length() > 0)
					shop.setTerminalOk(terminalOk);// 是否支持终端接收订单
				else
					shop.setTerminalOk("F");
			}

			shop.setLinkmanTel(linkmanTel);// 联系人电话
			shop.setLinkman(linkman);// 联系人
			if (sendPrice != null)
				shop.setSendPrice(sendPrice); // 起送价
			else
				shop.setSendPrice(0);
			if (deliverMoney != null)
				shop.setDeliverMoney(deliverMoney);// 外送费
			else
				shop.setDeliverMoney(0L);
			if (sendTime != null)
				shop.setSendTime(sendTime);// 送达时间
			else
				shop.setSendTime(-1);
			shop.setPayType(payType);// 支付方式
			shop.setContent(Commonparam.clearStr(content));// 店铺介绍
			if (lat != null && lat.trim().length() > 0) {
				shop.setLat(lat);// 纬度
			}
			if (lng != null && lng.trim().length() > 0) {
				shop.setLng(lng);// 经度
			}
			shop.setLogo(logo);// 店铺logo
			shop.setWorkTime(workTime);// 工作时间
			if (serviceTime != null)
				shop.setServiceTime(serviceTime);// 外送服务时间
			shop.setConsumptionPer(consumptionPer);// 人均消费
			shop.setRegistTime(new Date());// 注册时间
			shop.setShopType(shopType);// 店铺类型
			shop.setCategoryId(categoryId); // 店铺类型的ID
			shop.setAreaFirstId(areaFirstId);// 一级地址
			shop.setAreaSecondId(areaSecondId);// 二级地址
			shop.setCompanyShopId(companyShopId);
			shop.setExamineResult(3);// 店铺审核状态
			shop.setStatus(2);// 1是创建申请2是修改申请3关闭申请
			shopManager.updateShopInfoSave(shop, stList, gardenname);

			bean.setStatus(200);
			bean.setMsg("修改成功！");
		} catch (Exception e) {
			bean.setStatus(400);
			e.printStackTrace();
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	// 自动生成店铺编号
	public void generateShopCode() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		Long comId = 0l;
		try {
			if (personnel.getType() == 1 && companyId != null) {
				comId = companyId;
			} else {
				comId = personnel.getCompanyId();
			}
			Integer shopCode = shopManager.generateShopCode(comId);			
			shopCode=shopCode+1;
			DecimalFormat df=new DecimalFormat("0000");
			String shCode=comId+df.format(shopCode);		
			bean.setStatus(200);
			bean.setRows(shCode);
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 企业后台 新增店铺里面配送范围 一级配送范围地址=0
	 */
	public void findShopStairDistributionArea() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			List<Object> list = shopManager.findShopStairDistributionArea();
			bean.setStatus(200);
			bean.setRows(list);
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 企业后台 新增店铺里面配送范围 二级配送范围地址=一级配送范围地址的areaId
	 */
	public void findShopSecondLevelDistributionArea() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("areaId", areaId);
			List<Object> list = shopManager
					.findShopSecondLevelDistributionArea(map);
			bean.setStatus(200);
			bean.setRows(list);
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 企业 查找店铺配送范围
	 */
	public void distributionArea() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			Map<String, Object> area = new HashMap();
			area.put("companyId", personnel.getOrganizationalID());

			Object productInfo = shopManager.distributionArea(area);
			request.setAttribute("productInfo", productInfo);
			bean.setStatus(200);
			bean.setRows(productInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	// 店铺类型
	public void findShopType() throws UnsupportedEncodingException, IOException {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			/*
			 * if(personnel.getType()!=2||personnel.getType()!=4){
			 * HashMap<String, Object> map = new HashMap<String, Object>();
			 * map.put("shopId",personnel.getOrganizationalID()); String
			 * deliverOk = shopManager.checkDeliverOk(map); }else
			 * if(personnel.getType()==2||personnel.getType()==4){
			 * HashMap<String, Object> map = new HashMap<String, Object>();
			 * map.put("shopId",companyShopId); String deliverOk =
			 * shopManager.checkDeliverOk(map); }
			 */
			List<Object> list = shopManager.findShopType();
			bean.setStatus(200);
			bean.setRows(list);
			// bean.setTotal(deliverOk);
		} catch (Exception e) {
			e.printStackTrace();
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	// 支付方式 开发区
	public void findPaytypeList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> paytypeList = new HashMap<String, Object>();

			paytypeList.put("payTypeName", payTypeName);
			// topicList.put("delete_flag", "1");
			List<Object> list = shopManager.findPaytypeList(paytypeList);
			bean.setStatus(200);
			bean.setRows(list);
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
	 * 保存支付方式开发区
	 * 
	 * @return
	 */
	public void sevePaytype() throws IOException {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();

		try {

			PayType pay = new PayType();
			pay.setPayTypeName(payTypeName);
			Long payty = shopManager.sevePaytype(pay);

			if (payty == null) {
				bean.setStatus(400);
				bean.setMsg("添加失败");
			} else {
				bean.setStatus(200);
				bean.setMsg("添加成功");
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 开发区 查询支付方式
	 */
	public void findPaytypeInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			PayType PaytypeInfo = shopManager.findPaytypeInfo(payTypeId);
			request.setAttribute("PayType", PaytypeInfo);
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("type为空！");
		}
		request.getRequestDispatcher("pages/manager/Paytypeinfo.jsp").forward(
				request, response);
	}

	/**
	 * 开发区 更新支付方式
	 */
	public void updatePaytypeInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		BaseBean bean = new BaseBean();
		try {
			PayType PayType = new PayType();
			PayType.setPayTypeId(payTypeId);
			PayType.setPayTypeName(payTypeName);
			shopManager.updatePaytypeInfo(PayType);
			bean.setStatus(200);
		} catch (Exception e) {
			request.setAttribute("flag", false);
			System.out.println(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 开发区 删除支付类型
	 */
	public void deletePaytypeInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		String del = request.getParameter("selectedShopId");
		String[] idStr = del.split(",");
		List<Long> idList = new ArrayList<Long>();
		for (int i = 0; i < idStr.length; i++) {
			idList.add(Long.parseLong(idStr[i]));
		}
		BaseBean bean = new BaseBean();
		try {
			shopManager.deletePaytypeInfo(idList);
			bean.setStatus(200);
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
			e.printStackTrace();
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 开发区 开启支付类型
	 */
	public void openPaytypeInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		String del = request.getParameter("selectedShopId");
		String[] idStr = del.split(",");
		List<Long> idList = new ArrayList<Long>();
		for (int i = 0; i < idStr.length; i++) {
			idList.add(Long.parseLong(idStr[i]));
		}
		BaseBean bean = new BaseBean();
		try {
			shopManager.openPaytypeInfo(idList);
			bean.setStatus(200);
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
			e.printStackTrace();
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}
	
	public void shopWebStatus() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);		
		BaseBean bean = new BaseBean();
		try {
			Object list=shopManager.shopWebStatus();
			bean.setRows(list);
			bean.setStatus(200);
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}
	
	private String code,codeValue;
	public void shopUpdWebStatus() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);		
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, String> map=new HashMap<String, String>();
			map.put("code", code);
			map.put("codeValue", codeValue);
			shopManager.shopUpdWebStatus(map);
			bean.setStatus(200);
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 企业下店铺
	 */
	public void findCompanyShopInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			if (personnel.getType() != 1) {
				int type = personnel.getType();
				List<Object> shopInfo = shopManager
						.findCompanyShopInfo(personnel.getCompanyId());
				bean.setStatus(200);
				bean.setRows(shopInfo);
				bean.setTotal(type);
			} else if (personnel.getType() == 1) {// 开发区
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("type", 4);
				Long company = (Long) companyInfoManagerManager
						.findxinbake(map);// 判断是否是辛巴克
				if (company.equals(companyId)) {
					List<Object> shopInfo = shopManager
							.findCompanyShopInfo(companyId);
					bean.setStatus(200);
					bean.setRows(shopInfo);
					bean.setTotal(4);
				} else {
					List<Object> shopInfo = shopManager
							.findCompanyShopInfo(companyId);
					bean.setStatus(200);
					bean.setRows(shopInfo);
				}
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
			e.printStackTrace();
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 开发区 更改开发区店铺列表的审核状态
	 */
	private Long companyShopId;
	private Integer examineResult;

	public void updateShopExamineResult() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();
			if (companyShopId != null) {
				map.put("companyShopId", companyShopId);
				map.put("examineResult", examineResult);// 审核状态值
				shopManager.updateShopExamineResult(map);
				bean.setStatus(200);
			}
		} catch (Exception e) {
			bean.setRows(400);
			bean.setMsg(e.getLocalizedMessage());
			e.printStackTrace();
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 开发区 开启或者关闭店铺
	 */
	public void openOrCloseShop() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();
			if (companyShopId != null) {
				map.put("companyShopId", companyShopId);
				Long thisShopStatus = shopManager.findShopStatus(map);
				if (status == 1 && thisShopStatus != 1) {
					map.put("status", status);
					map.put("examineResult", examineResult);// 审核状态值
					shopManager.openOrCloseShop(map);
					bean.setStatus(200);
				} else if (status == 3 && thisShopStatus != 3) {
					map.put("status", status);
					map.put("examineResult", examineResult);// 审核状态值
					shopManager.openOrCloseShop(map);
					bean.setStatus(200);
				} else {
					bean.setStatus(500);
				}
			}
		} catch (Exception e) {
			bean.setRows(400);
			bean.setMsg(e.getLocalizedMessage());
			e.printStackTrace();
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 店铺申请 关闭审核
	 */
	public void closeShopStatus() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();
			if (companyShopId != null && personnel != null) {
				map.put("companyShopId", companyShopId);
				Long status = shopManager.findShopStatus(map);
				if (status != payTypeId) {// payTypeId： 4代表申请开启店铺，3代表申请关闭店铺
					map.put("status", payTypeId);// 1是创建申请2是修改申请3关闭申请4开启申请
					map.put("examineResult", 3);// 1 审核通过2审核不通过3未审核4关闭
					shopManager.closeShopStatus(map);
					bean.setStatus(200);
				} else {
					bean.setStatus(500);
				}
			}

		} catch (Exception e) {
			bean.setRows(400);
			bean.setMsg(e.getLocalizedMessage());
			e.printStackTrace();
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public void deliverOk() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();
			if (deliverOk.trim().length() == 2) {
				if (deliverOk.charAt(1) == 'Z') {
					map.put("newdeliverOk", String.valueOf(deliverOk.charAt(0)));
				}

			} else if (deliverOk.trim().length() == 1) {
				map.put("newdeliverOk", deliverOk + "Z");
			}
			map.put("companyShopId", companyShopId);
			map.put("deliverOk", deliverOk);

			Integer i=shopManager.updDeliverOk(map);
			if(i==1){
				bean.setStatus(200);
			}else{
				bean.setMsg("数据错误！");
			}			
		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 首页推荐
	 */
	Integer filName, filValue, filnum;
	String shopIdlist;

	public void companyShopWebExtend() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		try {
			if (user != null) {

				String s = shopManager.companyShopWebExtend(shopIdlist,
						Commonparam.SHOP_COLUMNS[filName], filValue, filnum);
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

	public String getShopIdlist() {
		return shopIdlist;
	}

	public void setShopIdlist(String shopIdlist) {
		this.shopIdlist = shopIdlist;
	}

	public Integer getTop() {
		return top;
	}

	public void setTop(Integer top) {
		this.top = top;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public Integer getExamineResult() {
		return examineResult;
	}

	public void setExamineResult(Integer examineResult) {
		this.examineResult = examineResult;
	}

	public Long getCompanyShopId() {
		return companyShopId;
	}

	public void setCompanyShopId(Long companyShopId) {
		this.companyShopId = companyShopId;
	}

	public String getShopType() {
		return shopType;
	}

	public void setShopType(String shopType) {
		this.shopType = shopType;
	}

	public Long getPayTypeId() {
		return payTypeId;
	}

	public void setPayTypeId(Long payTypeId) {
		this.payTypeId = payTypeId;
	}

	public String getPayTypeName() {
		return payTypeName;
	}

	public void setPayTypeName(String payTypeName) {
		this.payTypeName = payTypeName;
	}

	public String getServiceTime() {
		return serviceTime;
	}

	public void setServiceTime(String serviceTime) {
		this.serviceTime = serviceTime;
	}

	public Long getAreaId() {
		return areaId;
	}

	public void setAreaId(Long areaId) {
		this.areaId = areaId;
	}

	public Long getShopNumber() {
		return shopNumber;
	}

	public void setShopNumber(Long shopNumber) {
		this.shopNumber = shopNumber;
	}

	public Long getCategoryTag() {
		return categoryTag;
	}

	public void setCategoryTag(Long categoryTag) {
		this.categoryTag = categoryTag;
	}

	public Long getTagId() {
		return tagId;
	}

	public void setTagId(Long tagId) {
		this.tagId = tagId;
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

	public String getName() {
		return name;
	}

	public String getEmail() {
		return email;
	}

	public String getAddress() {
		return address;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public Date getRegistTime() {
		return registTime;
	}

	public String getLogo() {
		return logo;
	}

	public String getLocation() {
		return location;
	}

	public Integer getConsumptionPer() {
		return consumptionPer;
	}

	public Integer getOrderField() {
		return orderField;
	}

	public Integer getSendTime() {
		return sendTime;
	}

	public Integer getSendPrice() {
		return sendPrice;
	}

	public String getPayType() {
		return payType;
	}

	public Long getAreaFirstId() {
		return areaFirstId;
	}

	public Long getAreaSecondId() {
		return areaSecondId;
	}

	public String getDeliverOk() {
		return deliverOk;
	}

	public String getTerminalOk() {
		return terminalOk;
	}

	public String getLinkman() {
		return linkman;
	}

	public String getLinkmanTel() {
		return linkmanTel;
	}

	public Long getStarScore() {
		return starScore;
	}

	public String getContent() {
		return content;
	}

	public String getWorkTime() {
		return workTime;
	}

	public Long getDeliverMoney() {
		return deliverMoney;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public void setRegistTime(Date registTime) {
		this.registTime = registTime;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public void setConsumptionPer(Integer consumptionPer) {
		this.consumptionPer = consumptionPer;
	}

	public void setOrderField(Integer orderField) {
		this.orderField = orderField;
	}

	public void setSendTime(Integer sendTime) {
		this.sendTime = sendTime;
	}

	public void setSendPrice(Integer sendPrice) {
		this.sendPrice = sendPrice;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public void setAreaFirstId(Long areaFirstId) {
		this.areaFirstId = areaFirstId;
	}

	public void setAreaSecondId(Long areaSecondId) {
		this.areaSecondId = areaSecondId;
	}

	public void setDeliverOk(String deliverOk) {
		this.deliverOk = deliverOk;
	}

	public void setTerminalOk(String terminalOk) {
		this.terminalOk = terminalOk;
	}

	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}

	public void setLinkmanTel(String linkmanTel) {
		this.linkmanTel = linkmanTel;
	}

	public void setStarScore(Long starScore) {
		this.starScore = starScore;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setWorkTime(String workTime) {
		this.workTime = workTime;
	}

	public void setDeliverMoney(Long deliverMoney) {
		this.deliverMoney = deliverMoney;
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

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public String getBusinessBeginHours() {
		return businessBeginHours;
	}

	public String getBusinessEndHours() {
		return businessEndHours;
	}

	public void setBusinessBeginHours(String businessBeginHours) {
		this.businessBeginHours = businessBeginHours;
	}

	public void setBusinessEndHours(String businessEndHours) {
		this.businessEndHours = businessEndHours;
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

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCodeValue() {
		return codeValue;
	}

	public void setCodeValue(String codeValue) {
		this.codeValue = codeValue;
	}

}
