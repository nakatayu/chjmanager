package com.chj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.chj.entity.Circle;
import com.chj.entity.PayType;
import com.chj.entity.Shop;
import com.chj.entity.Shoparea;
import com.chj.entity.Shoptag;


public interface ShopManager {
	public Long insertShopInfo(Shop shop,List<Shoptag> stList,//店铺保存
			                   List<Shoparea> gardenname);
	public List<HashMap> findShopList(HashMap<String, Object> shopList);//店铺列表
	
	public List<HashMap> findShopEnterIntoShopList(HashMap<String, Object> shopList);//店铺权限进入     店铺列表
	public Long findShopEnterIntoShopListCountPage(Map<String, Object> countPage);//店铺权限进入   列表分页 
	public List<Object> findShopStairDistributionArea();//新增店铺里面配送范围  一级配送范围地址parent_id=0
	public List<Object> findShopSecondLevelDistributionArea(Map<String,Object>  parm);//新增店铺里面配送范围  parent_id=一级配送范围地址area_id	
	
	public List<Object> findShopList(Map<String, Object> map);//店铺列表
	
	public void deleteShopInfo(List list);//删除店铺信息

	public Object findShopInfo(Long shopId);//查找店铺基本信息

	public List<Map> findShopArea(Long abc);//查找服务范围，园区名称

	public List<Map> findShopTag(Long shopId);//查找已选标签
	
	public Object shopListCount(Map<String, Object> mapparam);//店铺分页 列表上的分页
	
	public void updateShopInfoSave(Shop shop,List<Shoptag> stList,//店铺更新保存
            List<Shoparea> gardenname);
	
	public Integer generateShopCode(Long companyId);//自动生成店铺编号
	public List<Object> findShopType();//店铺类型
	public List<Map<String, Object>> distributionArea(Map<String, Object> parm);//店铺下配送范围
	public List<Object> findCompanyShopInfo(Long companyId);//企业下店铺信息
	public void updateShopExamineResult(HashMap<String,Object> mapparm);//开发区店铺列表更改状态
	public String checkDeliverOk(HashMap<String, Object> parm);//企业后台  判断是否是外送

	public Long seveCircle(Circle cle);
	public void selectedCirle(List<Long> idList);
	public Object addShopUserManagerInfo(String account, String pawd);
	
	public List<Object> findPaytypeList(HashMap<String, Object> paytypeList);//支付方式列表
	public List<Object> findPaytypeList(Map<String, Object> map);//支付方式列表
	public Long sevePaytype(PayType pay);
	public PayType findPaytypeInfo(Long payTypeId);
	public void updatePaytypeInfo(PayType payType);//支付
	public void deletePaytypeInfo(List list);//删除支付列表
	public void openPaytypeInfo(List list);//开启支付列表
	
	public void closeShopStatus(HashMap mapparm);//店铺申请 关闭审核
	public Long findShopStatus(HashMap mapparm);//查看是否是关闭状态
	public void openOrCloseShop(HashMap mapparm);//关闭或者开启 店铺
	
	public Integer updDeliverOk(HashMap<String, Object> map);
	
	public String companyShopWebExtend(String shopIdlist, String columnFilName,
			Integer filValue, Integer filnum);
	
	public Object shopWebStatus();
	
	public void shopUpdWebStatus(HashMap map);
}
