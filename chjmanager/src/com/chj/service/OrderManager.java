package com.chj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.chj.entity.Company;
import com.chj.entity.Order;
import com.chj.entity.OrderItem;
import com.chj.entity.OrderItemAppend;

public interface OrderManager {
	public List<Object> findOrderList (HashMap<String, Object> orderlist);//企业权限进入 订单列表
	
	public List<Object> findShopOrderList (HashMap<String, Object> orderlist);//店铺权限进入 订单列表 
	public Object findShopOrderListCount(Map<String, Object> countpages);//店铺权限进入	订单列表分页
	
	public Object findOrderListCountPages(Map<String, Object> countpages);//订单列表分页
	
	public Object updateOrderPayStatus(Map<String, Object> orderpaystatus,Map<String, Object> payStatusAfter);//修改订单付款状态
	
	public Object updateOrderStatus(Map<String, Object> orderstatus,Map<String, Object> statusAfter);//修改订单状态
	
	public Object findOrderInfo(Long orderId);//订单详情 信息查询
	
	public List<OrderItem> findOrderInfoProductInventory(HashMap<String, Object> orderId);//订单信息下商品信息里面的  商品清单
	
	public Object findProductInventoryCountPages(Map<String, Object> countpages);// 商品清单分页

	public List<OrderItemAppend> findOrderAppendItem(Long orderItemId);//商品清单的属性查询
	
	public Object findOrderStatusAccept(HashMap<String, Object> statusAccept);//查看订单是否是接收
	
	public Long findCheckStatus(HashMap<String,Object> parm);//点击订单状态接收时 查看数据库当前状态是否为   5已完成 6已取消
}
