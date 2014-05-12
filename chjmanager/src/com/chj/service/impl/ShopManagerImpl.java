package com.chj.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chj.dao.ShopDao;
import com.chj.dao.UserDao;
import com.chj.entity.Circle;
import com.chj.entity.Company;
import com.chj.entity.PayType;
import com.chj.entity.Shop;
import com.chj.entity.Shoparea;
import com.chj.entity.Shoptag;
import com.chj.service.ShopManager;

@Service
@Transactional
public class ShopManagerImpl implements ShopManager {
	@Autowired
	ShopDao shopDao;
	@Autowired
	UserDao userDao;

	// 开发区 店铺保存
	@Override
	public Long insertShopInfo(Shop shop, List<Shoptag> stList,
			List<Shoparea> gardenname) {
		return shopDao.insertShopInfo(shop, stList, gardenname);
	}

	@Override
	public List<Object> findShopList(Map<String, Object> map) {
		return shopDao.findShopList(map);

	}

	public List<HashMap> findShopList(HashMap<String, Object> shopList) {

		return shopDao.findShopList(shopList);
	}

	// 店铺分页 列表上的分页
	@Override
	public Object shopListCount(Map<String, Object> mapparam) {
		
		return shopDao.shopListCount(mapparam);
	}

	// 删除店铺信息
	@Override
	public void deleteShopInfo(List list) {
		
		shopDao.deleteShopInfo(list);
	}

	// 店铺权限进入 店铺列表
	@Override
	public List<HashMap> findShopEnterIntoShopList(
			HashMap<String, Object> shopList) {
		return shopDao.findShopEnterIntoShopList(shopList);
	}

	// 店铺权限进入 列表分页
	@Override
	public Long findShopEnterIntoShopListCountPage(Map<String, Object> countPage) {
		return shopDao.findShopEnterIntoShopListCountPage(countPage);
	}

	@Override
	public List<Map> findShopArea(Long shopId) {
		
		return shopDao.findShopArea(shopId);
	}

	@Override
	public List<Map> findShopTag(Long shopId) {
		
		return shopDao.findShopTag(shopId);
	}

	@Override
	public Object findShopInfo(Long shopId) {
		
		return shopDao.findShopInfo(shopId);
	}

	/*
	 * @Override public Object findShopListCount(HashMap<String, Object>
	 * shopList) {  return
	 * shopDao.findShopListCount(shopList); }
	 */

	@Override
	public void updateShopInfoSave(Shop shop, List<Shoptag> stList,// 店铺更新保存
			List<Shoparea> gardenname) {
		
		shopDao.updateShopInfoSave(shop, stList, gardenname);
	}

	// 生成店铺编号
	@Override
	public Integer generateShopCode(Long companyId) {
		
		return shopDao.generateShopCode(companyId);
	}

	// 店铺类型
	@Override
	public List<Object> findShopType() {
		
		return (List<Object>) shopDao.findShopType();
	}

	@Override
	public Long seveCircle(Circle cle) {
		
		return shopDao.seveCircle(cle);
	}

	@Override
	public void selectedCirle(List<Long> idList) {
		
		shopDao.selectedCirle(idList);
	}

	@Override
	public Object addShopUserManagerInfo(String account, String pawd) {

		return userDao.addShopUserManagerInfo(account, pawd);
	}

	@Override
	public List<Object> findPaytypeList(HashMap<String, Object> paytypeList) {
		
		return shopDao.findPaytypeList(paytypeList);
	}

	@Override
	public List<Object> findPaytypeList(Map<String, Object> map) {
		
		return shopDao.findPaytypeList(map);
	}

	@Override
	public Long sevePaytype(PayType pay) {
		
		return shopDao.sevePaytype(pay);
	}

	// 开发区后台 支付方式
	@Override
	public PayType findPaytypeInfo(Long payTypeId) {
		
		return shopDao.findPaytypeInfo(payTypeId);
	}

	@Override
	public void updatePaytypeInfo(PayType payType) {
		
		shopDao.updatePaytypeInfo(payType);
	}

	// 开发区后台 支付方式删除
	@Override
	public void deletePaytypeInfo(List list) {
		shopDao.deletePaytypeInfo(list);
	}
	// 开发区后台 支付方式开启
	@Override
	public void openPaytypeInfo(List list) {
		shopDao.openPaytypeInfo(list);
	}
//店铺下配送范围
	@Override
	public List<Map<String, Object>> distributionArea(Map<String, Object> parm) {
		
		return shopDao.distributionArea(parm);
	}
//新增店铺里面配送范围  一级配送范围地址=0
	@Override
	public List<Object> findShopStairDistributionArea() {
		
		return  shopDao.findShopStairDistributionArea();
	}
//新增店铺里面配送范围   parent_id=一级配送范围地址area_id
	@Override
	public List<Object> findShopSecondLevelDistributionArea(Map<String,Object>  parm) {
		
		return shopDao.findShopSecondLevelDistributionArea(parm);
	}
//企业下店铺信息
	@Override
	public List<Object> findCompanyShopInfo(Long companyId) {
		
		return shopDao.findCompanyShopInfo(companyId);
	}
//开发区店铺列表更改状态
	@Override
	public void updateShopExamineResult(HashMap<String, Object> mapparm) {
		
		shopDao.updateShopExamineResult(mapparm);
	}
//企业后台  判断是否是外送
	@Override
	public String checkDeliverOk(HashMap<String, Object> parm) {
		
		return(String)shopDao.checkDeliverOk(parm);
	}
//店铺申请  关闭审核
	@Override
	public void closeShopStatus(HashMap mapparm) {
		
		shopDao.closeShopStatus(mapparm);
	}
	//查看是否是关闭状态
	@Override
	public Long findShopStatus(HashMap mapparm) {
		
		return (Long)shopDao.findShopStatus(mapparm);
	}
	//关闭或者开启 店铺
	@Override
	public void openOrCloseShop(HashMap mapparm) {
		
		shopDao.openOrCloseShop(mapparm);
	}

	@Override
	public Integer updDeliverOk(HashMap<String, Object> map) {
		
		return shopDao.updDeliverOk(map);		
	}

	@Override
	public String companyShopWebExtend(String shopIdlist, String columnFilName,
			Integer filValue, Integer filnum) {
		String[] shopIds = shopIdlist.split(",");
		String msg = null;
		if (shopIds.length > 0) {
			HashMap<String, Object> map1 = new HashMap<String, Object>();
			map1.put("filValue", filValue);
			map1.put("filName", columnFilName);
			
			if (filnum > 0) {
				Integer i = shopDao.queryNumberShop(map1);
				if (i + shopIds.length > filnum) {
					msg = "已有" + i + "个设置，总设置个数大于限定值！";
				}
			}
			if (msg == null) {
				for (String shopId : shopIds) {
					map1.put("shopId", shopId);
					shopDao.updShopRelation(map1);
				}
			}
		} else {
			msg = "数据错误";
		}
		return msg;
	}

	@Override
	public Object shopWebStatus() {
		
		return shopDao.shopWebStatus();
	}

	@Override
	public void shopUpdWebStatus(HashMap map) {		
		
		shopDao.shopUpdWebStatus(map);
	}	
	
}
