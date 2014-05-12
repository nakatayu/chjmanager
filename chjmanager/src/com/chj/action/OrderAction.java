package com.chj.action;

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

import com.chj.entity.Company;
import com.chj.entity.JsonDateValueProcessor;
import com.chj.entity.JsonTimestampProcessor;
import com.chj.entity.Order;
import com.chj.entity.OrderItem;
import com.chj.entity.OrderItemAppend;
import com.chj.entity.Personnel;
import com.chj.entity.User;
import com.chj.service.OrderManager;
import com.chj.utils.StaticConstant;
import com.json.BaseBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.eavic.framework.web.BaseAction;

@Namespace("/")
@Results({ @Result(name = BaseAction.NONE, location = "orderAction.action", type = "redirect") })
public class OrderAction extends ActionSupport{
	private static final long serialVersionUID = 7655056122242830524L;
	
	
	@Autowired
	OrderManager orderManager;
	
	private Integer size, page;
	private Long orderId;
	private String flowNo;
	private String payType;
	private Long userId;
	private Date orderTime;
	private String status;
	private Number money;
	private Long shopId;
	private String name;
	private String address;
	private String phone;
	private String sendType;
	private Number sendCost;
	private Number serviceCost;
	private Number total;
	private Date sendDate;
	private String info;
	private String payStatus;
	private String invoiceType;
	private String invoiceTitle;
	private String invoiceClass;
	
	
		//订单列表显示
		private Long companyShopId;
		public void  findOrderList () throws Exception {
			HttpServletResponse response = (HttpServletResponse) ActionContext
					.getContext().get(ServletActionContext.HTTP_RESPONSE);
			HttpServletRequest request = (HttpServletRequest) ActionContext
					.getContext().get(ServletActionContext.HTTP_REQUEST);
			Personnel personnel = (Personnel)request.getSession().getAttribute("user");
			String status = request.getParameter("status");//获取订单状态
			BaseBean bean = new BaseBean();
			try {	
				HashMap<String, Object> orderList = new HashMap<String, Object>();
				if(status != null  && status.trim().length()>0){
					if(status.equals("-1")){
						orderList.put("Unfinish",status);
					}else 
						orderList.put("status",status);
				}
					orderList.put("name", name);
					orderList.put("size", size);
				if(personnel.getType()==3 || personnel.getType()==5){//1开发区 2企业 3店铺 4辛巴克企业 5辛巴克店铺
					orderList.put("companyShopId",personnel.getOrganizationalID());
				}else if(personnel.getType()==1){//开发区
					orderList.put("companyShopId",companyShopId);
				}else if(personnel.getType()==2 || personnel.getType()==4){//企业
					orderList.put("companyId",personnel.getCompanyId());
				}
					orderList.put("startIndex", (page - 1) * size); 
					List<Object>  orderListInfo = orderManager.findOrderList(orderList);
					if(orderListInfo.size()>0){
						bean.setStatus(200);
						bean.setRows(orderListInfo);
						bean.setTotal(orderManager.findOrderListCountPages(orderList));
					}else{
						bean.setMsg("没有数据!");
					}
					
		} catch (Exception e) {
			System.out.println("type为空");
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
			e.printStackTrace();
		}
			//datetime格式转换
			 JsonConfig jsonConfig = new JsonConfig();
			 jsonConfig.registerJsonValueProcessor(java.util.Date.class , new
			 JsonDateValueProcessor("yyyy-MM-dd HH:mm:ss"));
			String json = JSONObject.fromObject(bean,jsonConfig).toString();
			response.getOutputStream().write(json.getBytes("UTF-8"));
	}	
	
	//订单付款状态更改
	public void  updateOrderPayStatus() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel)request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
	/**
	 * 改变订单的付款状态 
	 * 付款状态：1未付款  2已付款
	 */		
				try {
					HashMap<String, Object> orderpaystatus = new HashMap<String, Object>();
					orderpaystatus.put("orderId",orderId);
					orderpaystatus.put("payStatus",payStatus);//1未付款  2已付款
					
					//修改后insert数据到tb_order_flow
					HashMap<String, Object> payStatusAfter = new HashMap<String, Object>();
					payStatusAfter.put("statusValue",payStatus.equals("2")?StaticConstant.Role_order_true:StaticConstant.Role_order_false);
					payStatusAfter.put("orderId",orderId);
					payStatusAfter.put("userId", personnel.getId());
					payStatusAfter.put("userName",personnel.getUserName());
					
					Object  ops = orderManager.updateOrderPayStatus(orderpaystatus,payStatusAfter);
					bean.setStatus(200);
					bean.setRows(ops);
				} catch (Exception e) {
					System.out.println("type为空");
					bean.setStatus(400);
					bean.setMsg(e.getLocalizedMessage());
					e.printStackTrace();
				}
					String json = JSONObject.fromObject(bean).toString();
					response.getOutputStream().write(json.getBytes("UTF-8"));	
		}
	
	
	//订单状态更改
		public void  updateOrderStatus() throws Exception {
			HttpServletResponse response = (HttpServletResponse) ActionContext
					.getContext().get(ServletActionContext.HTTP_RESPONSE);
			HttpServletRequest request = (HttpServletRequest) ActionContext
					.getContext().get(ServletActionContext.HTTP_REQUEST);
			Personnel personnel = (Personnel)request.getSession().getAttribute("user");
			BaseBean bean = new BaseBean();
		/**
		 * 改变订单状态 
		 * 订单状态 ：1未处理2已接受3拒绝4配送中5交易完成6已取消
		 */		
				try {
					HashMap<String, Object> orderstatus = new HashMap<String, Object>();
					orderstatus.put("orderId",orderId);
					orderstatus.put("status",status);
					
					//修改后insert数据到tb_order_flow
					HashMap<String, Object> statusAfter = new HashMap<String, Object>();
					if(status.equals("1")){
						status = StaticConstant.Role_order_one;
					}else if(status.equals("2")){
						HashMap<String,Object> statusParm = new HashMap<String,Object>();
						statusParm.put("orderId", orderId);
						Long checkStatus = orderManager.findCheckStatus(statusParm);//查看当前状态是否是5已完成或者6已取消
						if(checkStatus == 5 ){//如果是已完成走下边的代码
							bean.setStatus(500);
							String json = JSONObject.fromObject(bean).toString();
							response.getOutputStream().write(json.getBytes("UTF-8"));
							return;
						}else if(checkStatus == 6 ){//如果是已取消走下边的代码
							bean.setStatus(600);
							String json = JSONObject.fromObject(bean).toString();
							response.getOutputStream().write(json.getBytes("UTF-8"));
							return;
						}else{
							status = StaticConstant.Role_order_two;
						}
					}else if(status.equals("3")){
						status = StaticConstant.Role_order_three;
					}else if(status.equals("6")){//订单已取消
						HashMap<String,Object> checkStatus = new HashMap<String,Object>(); 
						checkStatus.put("orderId",orderId);
						Long statusParm = orderManager.findCheckStatus(checkStatus);//查看当前状态
						if(statusParm == 6 ){//如果是已完成走下边的代码
							bean.setStatus(600);
							String json = JSONObject.fromObject(bean).toString();
							response.getOutputStream().write(json.getBytes("UTF-8"));
							return;
						}else if(statusParm == 5){//判断订单是不是已经处于已取消状态
							bean.setStatus(500);
							String json = JSONObject.fromObject(bean).toString();
							response.getOutputStream().write(json.getBytes("UTF-8"));
							return;
						}else{
							status = StaticConstant.Role_order_six;
						}
					}
					statusAfter.put("statusValue",status);
					statusAfter.put("orderId",orderId);
					statusAfter.put("userId", personnel.getId());
					statusAfter.put("userName",personnel.getUserName());
					
					Object  os = orderManager.updateOrderStatus(orderstatus,statusAfter);
					bean.setStatus(200);
					bean.setRows(os);
				} catch (Exception e) {
					bean.setMsg(e.getLocalizedMessage());
					e.printStackTrace();
				}
				String json = JSONObject.fromObject(bean).toString();
				response.getOutputStream().write(json.getBytes("UTF-8"));
			}
		
		//订单状态  配送前 先接收
			public void  updateOrderStatusAfter() throws Exception {
				HttpServletResponse response = (HttpServletResponse) ActionContext
						.getContext().get(ServletActionContext.HTTP_RESPONSE);
				HttpServletRequest request = (HttpServletRequest) ActionContext
						.getContext().get(ServletActionContext.HTTP_REQUEST);
				Personnel personnel = (Personnel)request.getSession().getAttribute("user");
				BaseBean bean = new BaseBean();
			/**
			 * 订单详细信息
			 * 配送状态之前预先接收该订单
			 * 订单状态 ：1未处理2已接受3拒绝4配送中5交易完成6已取消
			 */	
				try {
					HashMap<String, Object> orderstatus = new HashMap<String, Object>();
					orderstatus.put("orderId",orderId);
					orderstatus.put("status",status);
					//修改后insert数据到tb_order_flow
					HashMap<String, Object> statusAfter = new HashMap<String, Object>();	
					if(status.equals("4")){//订单  接收后才可配送
						HashMap<String, Object> sa = new HashMap<String, Object>();
						sa.put("orderId", orderId);
						Object s = orderManager.findOrderStatusAccept(sa);//查看订单是否为已接收
						if(s.equals("2")){
							status = StaticConstant.Role_order_four;
						}else{
							bean.setStatus(400);
							String json = JSONObject.fromObject(bean).toString();
							response.getOutputStream().write(json.getBytes("UTF-8"));
							return;
						}
					}
					statusAfter.put("statusValue",status);
					statusAfter.put("orderId",orderId);
					statusAfter.put("userId", personnel.getId());
					statusAfter.put("userName",personnel.getUserName());
					
					Object  os = orderManager.updateOrderStatus(orderstatus,statusAfter);
					bean.setStatus(200);
					bean.setRows(os);
			} catch (Exception e) {
				bean.setMsg(e.getLocalizedMessage());
				e.printStackTrace();
			}
				String json = JSONObject.fromObject(bean).toString();
				response.getOutputStream().write(json.getBytes("UTF-8"));
		}
			
	//订单详细信息查询	
	public void findOrderInfo() throws Exception {
			HttpServletResponse response = (HttpServletResponse) ActionContext
					.getContext().get(ServletActionContext.HTTP_RESPONSE);
			HttpServletRequest request = (HttpServletRequest) ActionContext
					.getContext().get(ServletActionContext.HTTP_REQUEST);
			Personnel personnel = (Personnel)request.getSession().getAttribute("user");
			BaseBean bean = new BaseBean();
	/**
	 * 开发区
	 * 点击订单编号 进入订单详情 
	 */		
			if(personnel.getType()==1){
				try{
					String  orderId = request.getParameter("orderId");
					Object orderInfo = orderManager.findOrderInfo(Long.parseLong(orderId));
					request.setAttribute("orderInfo", orderInfo);
				}catch(Exception e){
					e.printStackTrace();
					System.out.println("查询失败");
				}	
				request.getRequestDispatcher("/pages/manager/companyInfoManagerOrderInfo.jsp").forward(request, response);
			}else if(personnel.getType()!=1){
				try{
					String  orderId = request.getParameter("orderId");
					Object orderInfo = orderManager.findOrderInfo(Long.parseLong(orderId));
					request.setAttribute("orderInfo", orderInfo);
				}catch(Exception e){
					e.printStackTrace();
					System.out.println("查询失败");
				}	
				request.getRequestDispatcher("/pages/company/OrderInfo.jsp").forward(request, response);
			}
		
	}
	
	//订单信息下商品信息里面的  商品清单	
		public void findOrderInfoProductInventory() throws Exception {
				HttpServletResponse response = (HttpServletResponse) ActionContext
						.getContext().get(ServletActionContext.HTTP_RESPONSE);
				HttpServletRequest request = (HttpServletRequest) ActionContext
						.getContext().get(ServletActionContext.HTTP_REQUEST);	
				BaseBean bean = new BaseBean();
			try{
				String  orderItemId = request.getParameter("orderItemId");
				String  orderId = request.getParameter("orderId");
				HashMap<String, Object> inventory = new HashMap<String, Object>();
				inventory.put("orderItemId",orderItemId);
				inventory.put("orderId",orderId);
				inventory.put("size", size);
				inventory.put("startIndex", (page - 1) * size); 
				List<OrderItem> orderInfo = orderManager.findOrderInfoProductInventory(inventory);
				for(OrderItem item : orderInfo){
					// 附加属性信息
					List<OrderItemAppend> appendList = (List<OrderItemAppend>) orderManager
							.findOrderAppendItem(item.getOrderItemId());
					if (appendList.size() > 0) {
						HashMap<String, Object> mapComent = new HashMap<String, Object>();
						StringBuffer sb = new StringBuffer("");
						StringBuffer sb1 = new StringBuffer("");
						int count = 0;
						for (OrderItemAppend map1 : appendList) {
							if (map1.getAppendInfo() == null) {
								continue;
							}
							if ("T".equals(map1.getAppendInfo().get(
									"isCheckbox"))) {
								
								if (count % 2 == 0 && count != 0)
									sb.append("<br/>"
											+ map1.getAppendInfo().get(
													"name"));
								else if (count % 2 == 1)
									sb.append("/"
											+ map1.getAppendInfo().get(
													"name"));
								else
									sb.append(map1.getAppendInfo().get(
											"name"));
								count++;
							} else if ("F".equals(map1.getAppendInfo().get(
									"isCheckbox"))) {
								sb1.append(map1.getParentName())
										.append("：")
										.append(map1.getAppendInfo().get(
												"name")).append("<br/>");
							}
						}
						mapComent.put("multiSelDetails", sb.toString());
						mapComent.put("SingleSelDetails", sb1.toString());
						item.setAppendInfo(mapComent);
					} else {
						HashMap<String, Object> mapComent = new HashMap<String, Object>();
						mapComent.put("multiSelDetails", "");
						mapComent.put("SingleSelDetails", "");
						item.setAppendInfo(mapComent);
					}
				}
				
				bean.setStatus(200);
				bean.setRows(orderInfo);
				bean.setTotal(orderManager.findProductInventoryCountPages(inventory));
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("查询失败");
			}	
			String json = JSONObject.fromObject(bean).toString();
			response.getOutputStream().write(json.getBytes("UTF-8"));
		}
		
	
	/**
	 * 订单列表  
	 * 交易完成状态
	 * 交易完成后付款状态改为已付款
	 */
		public void OrderCloseTheDealStatusPayment() throws Exception {
			HttpServletResponse response = (HttpServletResponse) ActionContext
					.getContext().get(ServletActionContext.HTTP_RESPONSE);
			HttpServletRequest request = (HttpServletRequest) ActionContext
					.getContext().get(ServletActionContext.HTTP_REQUEST);
			Personnel personnel = (Personnel) request.getSession().getAttribute("user");
			BaseBean bean = new BaseBean();
		/**
		 * 开发区
		 * 交易完成后付款状态改为已付款
		 */
			if(personnel.getType()==1){//开发区
				try{
					HashMap<String, Object> orderstatus = new HashMap<String, Object>();
					orderstatus.put("orderId",orderId);
					orderstatus.put("status",status);
					
					if(status.equals("5")){
						HashMap<String,Object> checkStatus = new HashMap<String,Object>(); 
						checkStatus.put("orderId",orderId);
						Long statusParm = orderManager.findCheckStatus(checkStatus);//查看当前状态
						if(statusParm == 5 ){//如果是已完成走下边的代码
							bean.setStatus(500);
							String json = JSONObject.fromObject(bean).toString();
							response.getOutputStream().write(json.getBytes("UTF-8"));
							return;
						}else if(statusParm == 6 ){//如果是已取消走下边的代码
							bean.setStatus(600);
							String json = JSONObject.fromObject(bean).toString();
							response.getOutputStream().write(json.getBytes("UTF-8"));
							return;
						}else{
							status = StaticConstant.Role_order_five;
						}
					}	
					HashMap<String, Object> statusAfter = new HashMap<String, Object>();
					statusAfter.put("statusValue",status);
					statusAfter.put("orderId",orderId);
					statusAfter.put("userId", personnel.getId());
					statusAfter.put("userName",personnel.getUserName());
					Object  os = orderManager.updateOrderStatus(orderstatus,statusAfter);
					
					
					HashMap<String, Object> orderpaystatus = new HashMap<String, Object>();
					orderpaystatus.put("orderId",orderId);
					orderpaystatus.put("payStatus",2);//1未付款  2已付款
					//修改后insert数据到tb_order_flow
					HashMap<String, Object> payStatusAfter = new HashMap<String, Object>();
					payStatusAfter.put("statusValue",StaticConstant.Role_order_true);
					payStatusAfter.put("orderId",orderId);
					payStatusAfter.put("userId", personnel.getId());
					payStatusAfter.put("userName",personnel.getName());
					Object  ops = orderManager.updateOrderPayStatus(orderpaystatus,payStatusAfter);
					bean.setStatus(200);
					bean.setRows(os);	
					}catch(Exception e){
						e.printStackTrace();
						System.out.println("查询失败");
					}	
					String json = JSONObject.fromObject(bean).toString();
					response.getOutputStream().write(json.getBytes("UTF-8"));
			}else if(personnel.getType()!=1){//其他登陆
				try{
				HashMap<String, Object> orderstatus = new HashMap<String, Object>();
				orderstatus.put("orderId",orderId);
				orderstatus.put("status",status);
				
				if(status.equals("5")){
					HashMap<String,Object> checkStatus = new HashMap<String,Object>(); 
					checkStatus.put("orderId",orderId);
					Long statusParm = orderManager.findCheckStatus(checkStatus);//查看当前状态
					if(statusParm == 5 ){//如果是已完成走下边的代码
						bean.setStatus(500);
						String json = JSONObject.fromObject(bean).toString();
						response.getOutputStream().write(json.getBytes("UTF-8"));
						return;
					}else if(statusParm == 6 ){//如果是已取消走下边的代码
						bean.setStatus(600);
						String json = JSONObject.fromObject(bean).toString();
						response.getOutputStream().write(json.getBytes("UTF-8"));
						return;
					}else{
						status = StaticConstant.Role_order_five;
					}
				}	
				HashMap<String, Object> statusAfter = new HashMap<String, Object>();
				statusAfter.put("statusValue",status);
				statusAfter.put("orderId",orderId);
				/*statusAfter.put("userId", user.getUserId());
				statusAfter.put("userName",user.getNickName());*/
				statusAfter.put("userId", personnel.getId());
				statusAfter.put("userName",personnel.getUserName());
				Object  os = orderManager.updateOrderStatus(orderstatus,statusAfter);
				
				
				HashMap<String, Object> orderpaystatus = new HashMap<String, Object>();
				orderpaystatus.put("orderId",orderId);
				orderpaystatus.put("payStatus",2);//1未付款  2已付款
				//修改后insert数据到tb_order_flow
				HashMap<String, Object> payStatusAfter = new HashMap<String, Object>();
				payStatusAfter.put("statusValue",StaticConstant.Role_order_true);
				payStatusAfter.put("orderId",orderId);
				/*payStatusAfter.put("userId", user.getUserId());
				payStatusAfter.put("userName",user.getNickName());*/
				payStatusAfter.put("userId", personnel.getId());
				payStatusAfter.put("userName",personnel.getName());
				Object  ops = orderManager.updateOrderPayStatus(orderpaystatus,payStatusAfter);
				bean.setStatus(200);
				bean.setRows(os);	
				}catch(Exception e){
					e.printStackTrace();
					System.out.println("查询失败");
				}	
				String json = JSONObject.fromObject(bean).toString();
				response.getOutputStream().write(json.getBytes("UTF-8"));
			}
		
	}
		
		
	public Long getCompanyShopId() {
			return companyShopId;
	}

	public void setCompanyShopId(Long companyShopId) {
		this.companyShopId = companyShopId;
	}

	
	public Long getOrderId() {
		return orderId;
	}
	public String getFlowNo() {
		return flowNo;
	}
	public String getPayType() {
		return payType;
	}
	public Long getUserId() {
		return userId;
	}
	public Date getOrderTime() {
		return orderTime;
	}
	public String getStatus() {
		return status;
	}
	public Number getMoney() {
		return money;
	}
	public Long getShopId() {
		return shopId;
	}
	public String getName() {
		return name;
	}
	public String getAddress() {
		return address;
	}
	public String getPhone() {
		return phone;
	}
	public String getSendType() {
		return sendType;
	}
	public Number getSendCost() {
		return sendCost;
	}
	public Number getServiceCost() {
		return serviceCost;
	}
	public Number getTotal() {
		return total;
	}
	public Date getSendDate() {
		return sendDate;
	}
	public String getInfo() {
		return info;
	}
	public String getPayStatus() {
		return payStatus;
	}
	public String getInvoiceType() {
		return invoiceType;
	}
	public String getInvoiceTitle() {
		return invoiceTitle;
	}
	public String getInvoiceClass() {
		return invoiceClass;
	}
	
	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
	public void setFlowNo(String flowNo) {
		this.flowNo = flowNo;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setMoney(Number money) {
		this.money = money;
	}
	public void setShopId(Long shopId) {
		this.shopId = shopId;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setSendType(String sendType) {
		this.sendType = sendType;
	}
	public void setSendCost(Number sendCost) {
		this.sendCost = sendCost;
	}
	public void setServiceCost(Number serviceCost) {
		this.serviceCost = serviceCost;
	}
	public void setTotal(Number total) {
		this.total = total;
	}
	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}
	public void setInvoiceType(String invoiceType) {
		this.invoiceType = invoiceType;
	}
	public void setInvoiceTitle(String invoiceTitle) {
		this.invoiceTitle = invoiceTitle;
	}
	public void setInvoiceClass(String invoiceClass) {
		this.invoiceClass = invoiceClass;
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
