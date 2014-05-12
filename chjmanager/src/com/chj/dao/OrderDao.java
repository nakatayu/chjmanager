package com.chj.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.chj.entity.Company;
import com.chj.entity.Order;
import com.chj.entity.OrderItem;
import com.chj.entity.OrderItemAppend;

@Repository
public class OrderDao extends BaseDao{
	
	//企业权限进入 订单列表   Order.xml
	public List<Object> findOrderList (HashMap<String, Object> orderlist){
		// TODO Auto-generated method stub
		Object order = this.getSqlMapClientTemplate().queryForList(
							"findOrderList", orderlist);
		return (List)order;
	}
	
	//店铺权限进入 订单列表   Order.xml
		public List<Object> findShopOrderList (HashMap<String, Object> orderlist){
			// TODO Auto-generated method stub
			Object order = this.getSqlMapClientTemplate().queryForList(
								"findShopOrderList", orderlist);
			return (List)order;
		}
		
	//店铺权限进入	订单列表分页
		public Object findShopOrderListCount(Map<String, Object> countpages){
			// TODO Auto-generated method stub
			Object ct = this.getSqlMapClientTemplate().queryForObject(
					"findShopOrderListCount", countpages);
			return ct;
		}
		
		
	//订单列表分页
	public Object findOrderListCountPages(Map<String, Object> countpages){
		// TODO Auto-generated method stub
		Object ct = this.getSqlMapClientTemplate().queryForObject(
				"findOrderListCount", countpages);
		return ct;
	}
	
	//订单付款状态更改     order.xml
	public Object updateOrderPayStatus(Map<String,Object> orderpaystatus,Map<String, Object> payStatusAfter){
		Object os = this.getSqlMapClientTemplate().update(
				"updateOrderPayStatus",orderpaystatus);
		return os;
	}//订单付款状态更改后 insert   数据到tb_order_flow    order.xml
	public void insertOrderPayStatusAfter(Map<String,Object> payStatusAfter){
		this.getSqlMapClientTemplate().insert("insertOrderPayStatusAfter", payStatusAfter);
	}
	
	//订单状态更改
		public Object updateOrderStatus(Map<String,Object> orderstatus,Map<String,Object> statusAfter){
			Object ops = this.getSqlMapClientTemplate().update(
					"updateOrderStatus",orderstatus);
			return ops;
		}//订单状态更改后 insert   数据到tb_order_flow
		public void insertOrderStatusAfter(Map<String,Object> statusAfter){
			this.getSqlMapClientTemplate().insert("insertOrderStatusAfter", statusAfter);
		}
	
	//订单详细信息查询
	public Object findOrderInfo(Long orderId) {
		Object orderInfo = this.getSqlMapClientTemplate().queryForObject("findOrderInfo",orderId);
		return orderInfo;
	}
	
	//订单信息下商品信息里面的  商品清单
	public List<OrderItem> findOrderInfoProductInventory(HashMap<String, Object> orderId) {
		List<OrderItem> inventory = this.getSqlMapClientTemplate().queryForList("selectOrderItemList",orderId);
		return inventory;
	}

	//商品清单分页
	public Object findProductInventoryCountPages(Map<String, Object> countpages){
		// TODO Auto-generated method stub
		Object ct = this.getSqlMapClientTemplate().queryForObject(
				"selectOrderItemListCount", countpages);
		return ct;
	}
//取Append 属性
	public List<OrderItemAppend> findOrderAppendItem(Long orderItemId) {
		Object ct = this.getSqlMapClientTemplate().queryForList(
				"findOrderAppendItem", orderItemId);
		return (List<OrderItemAppend>) ct;
	}
	
//查看订单状态是否为接收
	public Object findOrderStatusAccept(HashMap<String, Object> statusAccept) {
		// TODO Auto-generated method stub
		Object sa = this.getSqlMapClientTemplate().queryForObject("findOrderStatusAccept",statusAccept);
		return sa;
	}
//点击订单状态接收时 查看数据库当前状态是否为   5已完成 6已取消
	public Long findCheckStatus(HashMap<String,Object> parm){
		Long now = (Long)this.getSqlMapClientTemplate().queryForObject("findCheckStatus",parm);
		return now ;
	}
}
