package com.chj.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chj.dao.OrderDao;
import com.chj.entity.Company;
import com.chj.entity.Order;
import com.chj.entity.OrderItem;
import com.chj.entity.OrderItemAppend;
import com.chj.service.OrderManager;

@Service
@Transactional
public class OrderManagerImpl implements OrderManager{
	
	@Autowired
	OrderDao orderDao;
	
	//企业权限进入 订单列表 
	@Override
	public List<Object> findOrderList (HashMap<String, Object> orderlist){
		// TODO Auto-generated method stub
		List<Object>  order = orderDao.findOrderList(orderlist);
		return order;
	};
	
	//店铺权限进入 订单列表 
		@Override
		public List<Object> findShopOrderList (HashMap<String, Object> orderlist){
			// TODO Auto-generated method stub
			List<Object>  order = orderDao.findShopOrderList(orderlist);
			return order;
		};
	//店铺权限进入	订单列表分页
		@Override
		public Object findShopOrderListCount(Map<String, Object> countpages){
			// TODO Auto-generated method stub
			return orderDao.findShopOrderListCount(countpages);
		}
	//订单列表分页
	@Override
	public Object findOrderListCountPages(Map<String, Object> countpages){
		// TODO Auto-generated method stub
		return orderDao.findOrderListCountPages(countpages);
	}
	
	//订单付款状态更改
	@Override
	public Object updateOrderPayStatus(Map<String, Object> orderpaystatus,Map<String, Object> payStatusAfter) {
		Object os = orderDao.updateOrderPayStatus(orderpaystatus,payStatusAfter);
		orderDao.insertOrderPayStatusAfter(payStatusAfter);//付款状态更改后 insert   数据到tb_order_flow
		return os;
	};
	
	//订单状态更改
	@Override
	public Object updateOrderStatus(Map<String, Object> orderstatus,Map<String, Object> statusAfter) {
		Object ops = orderDao.updateOrderStatus(orderstatus,statusAfter);
		orderDao.insertOrderStatusAfter(statusAfter);//订单状态更改后 insert   数据到tb_order_flow
		return ops;
	};
	
	//订单详细信息查询
	@Override
	public Object findOrderInfo(Long orderId) {
		// TODO Auto-generated method stub
		return orderDao.findOrderInfo(orderId);
	}
	

	//订单信息下商品信息里面的  商品清单
	@Override
	public List<OrderItem> findOrderInfoProductInventory(HashMap<String, Object> orderId) {
		// TODO Auto-generated method stub
		return orderDao.findOrderInfoProductInventory(orderId);
	}
	
	//订单信息下商品信息里面的  商品清单分页
	public Object findProductInventoryCountPages(Map<String, Object> countpages){
		return orderDao.findProductInventoryCountPages(countpages);
	}

	@Override
	public List<OrderItemAppend> findOrderAppendItem(Long orderItemId) {
		return orderDao.findOrderAppendItem(orderItemId);//取属性
	}
	//查看订单状态是否为接收
	@Override
	public Object findOrderStatusAccept(HashMap<String, Object> statusAccept) {
		// TODO Auto-generated method stub
		Object sa = orderDao.findOrderStatusAccept(statusAccept);
		return sa;
	}
//点击订单状态接收时 查看数据库当前状态是否为   5已完成 6已取消
	@Override
	public Long findCheckStatus(HashMap<String, Object> parm) {
		// TODO Auto-generated method stub
		Long now = orderDao.findCheckStatus(parm);
		return now;
	}
	

	
}
