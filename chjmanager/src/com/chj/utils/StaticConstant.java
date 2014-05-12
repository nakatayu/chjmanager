package com.chj.utils;

public class StaticConstant {
	public static final String Role_Common="U";//普通用户(手机和web)
	
	public static final String Role_Manager="M1";//开发区管理员
	public static final String Role_Operator="M2";//开发区操作员
	
	public static final String Role_Company_Manager="C1";//企业管理员
	public static final String Role_Company_Operator="C2";//企业操作员
	
	public static final String Role_order_false="订单未付款"; //1    订单未付款
	public static final String Role_order_true="订单已付款";  //2    订单已付款
	/**
	 * 订单状态 : 1未处理2已接受3拒绝4配送中5交易完成6已取消
	 */
	public static final String Role_order_one="未处理"; 
	public static final String Role_order_two="已接受";  
	public static final String Role_order_three="拒绝"; 
	public static final String Role_order_four="配送中";  
	public static final String Role_order_five="交易完成";
	public static final String Role_order_six="已取消";

	/**
	 * 活动类型 1订票  2普通
	 */
	public static final int[] ACTIVITY_TYPE = new int[] { 1, 2};
	/** 
	 * 活动状态  1创建待审核2修改申请3申请关闭
	 */
	public static final int[] ACTIVITY_STATUS = new int[] { 1,2,3};
	/**
	 * 1 审核通过2审核不通过3待审核
	 */
	public static final int[] EXAMINE_RESULT = new int[] { 1,2,3};
	/**  活动用户
	 *   1待审核2未通过3通过4退出5踢出
	 */
	public static final String[] ACTIVITY_USER_STATUS = new String[] {"1","2","3","4","5"};
	
	/**
	 *  话题状态:1创建待审核2修改申请
	 */
	public static final int[] TOPIC_STATUS = new int[] { 1, 2};
}
