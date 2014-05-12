package com.chj.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.chj.dao.BaseDao;
import com.chj.entity.Circle;
import com.chj.entity.Company;
import com.chj.entity.CompanyShop;
import com.chj.entity.Shop;
import com.chj.entity.Shoparea;
import com.chj.entity.Shoptag;
import com.chj.entity.User;
import com.chj.entity.PayType;

@Repository
public class ShopDao extends BaseDao {

	// 店铺保存 Shop.xml
	public Long insertShopInfo(Shop shop, List<Shoptag> stList,
			List<Shoparea> gardenname) {
		Long companyinfo = (Long) this.getSqlMapClientTemplate().insert(
				"saveShopInfo", shop);
		insertShopTag(companyinfo, stList);
		insertShopArea(companyinfo, gardenname);
		return companyinfo;
	}

	// 保存标签的关联表 已选标签 Shoptag.xml
	public void insertShopTag(Long shopId, List<Shoptag> stList) {
		if (stList != null && stList.size() != 0) {
			for (int i = 0; i < stList.size(); i++) {
				Shoptag shoptag = stList.get(i);
				shoptag.setCompanyShopId(shopId);
				this.getSqlMapClientTemplate().insert("saveShopTag", shoptag);
			}
		}
	}

	// 保存关联表 服务范围 Shoparea.xml
	public void insertShopArea(Long shopId, List<Shoparea> gardenname) {
		if (gardenname != null && gardenname.size() != 0) {
			for (int i = 0; i < gardenname.size(); i++) {
				Shoparea shoparea = gardenname.get(i);
				shoparea.setCompanyShopId(shopId);
				this.getSqlMapClientTemplate().insert("saveShopArea", shoparea);
			}
		}
	}

	// 店铺列表
	public List<Object> findShopList(Map<String, Object> map) {
		Object shoplist = this.getSqlMapClientTemplate().queryForList(
				"findShopList", map);
		return (List) shoplist;
	}

	// 删除店铺信息
	public void deleteShopInfo(List list) {
		if (list != null && list.size() != 0) {
			for (int i = 0; i < list.size(); i++) {
				Long shopId = Long.parseLong(list.get(i).toString());
				updateTheShopProduct(shopId);// 删除店铺产品信息
				deleteShopTag(shopId); // 删除已选标签
				deleteShopArea(shopId); // 删除已选范围
				this.getSqlMapClientTemplate().update("updateTheShop", shopId);// 删除店铺信息
			}
		}
	}

	// ShopProduct.xml //删除店铺产品信息
	public Object updateTheShopProduct(Long shopId) {
		this.getSqlMapClientTemplate().update("updateShopProduct", shopId);
		return 1;
	}

	// 店铺列表
	public List<HashMap> findShopList(HashMap<String, Object> shopList) {
		List list = this.getSqlMapClientTemplate().queryForList("findShopList",
				shopList);
		return list;
	}

	// 店铺权限进入 店铺列表
	public List<HashMap> findShopEnterIntoShopList(
			HashMap<String, Object> shopList) {
		List<HashMap> shoplist = this.getSqlMapClientTemplate().queryForList(
				"findShopEnterIntoShopList", shopList);
		return shoplist;
	}

	// 店铺权限进入 列表分页
	public Long findShopEnterIntoShopListCountPage(Map<String, Object> countPage) {
		Long count = (Long) this.getSqlMapClientTemplate().queryForObject(
				"findShopEnterIntoShopListCountPage", countPage);
		return count;
	}

	// 删除已选标签 Shoptag.xml
	public void deleteShopTag(long shopId) {
		Map map = new HashMap();
		map.put("shopId", shopId);
		this.getSqlMapClientTemplate().update("updateShopTag", map);
	}

	// 删除服务范围，园区名称 Shoparea.xml
	public void deleteShopArea(long shopId) {
		Map map = new HashMap();
		map.put("shopId", shopId);
		this.getSqlMapClientTemplate().update("updateShopArea", map);
	}

	// 查找店铺信息
	public Object findShopInfo(Long shopId) {

		Object info = this.getSqlMapClientTemplate().queryForObject(
				"findShopInfo", shopId);
		return info;
	}

	// 查找已选标签
	public List<Map> findShopTag(Long shopId) {

		List<Map> info = this.getSqlMapClientTemplate().queryForList(
				"findShopTag", shopId);
		return info;

	}

	// 查找服务范围，园林名称
	public List<Map> findShopArea(Long shopId) {

		List<Map> info = this.getSqlMapClientTemplate().queryForList(
				"findShopArea", shopId);
		return info;
	}

	// 店铺分页 列表上的分页
	public Object shopListCount(Map<String, Object> mapparam) {// list分页

		Object delcp = this.getSqlMapClientTemplate().queryForObject(
				"queryShopCount", mapparam);
		return delcp;

	}

	// 店铺更新保存
	public void updateShopInfoSave(Shop shop, List<Shoptag> stList,// 店铺更新保存
			List<Shoparea> gardenname) {
		Map m = new HashMap();
		m.put("companyShopId", shop.getCompanyShopId());
		if (stList != null && stList.size() != 0) {
			// 删除店铺标签
			this.getSqlMapClientTemplate().delete("deleteShopTag", m);
			// 添加店铺标签
			for (int i = 0; i < stList.size(); i++) {
				Shoptag st = stList.get(i);
				st.setCompanyShopId(shop.getCompanyShopId());// 店铺ID
				this.getSqlMapClientTemplate().insert("saveShopTag", st);
			}
		}
		if (gardenname != null && gardenname.size() != 0) {
			// 删除配送范围
			this.getSqlMapClientTemplate().delete("deleteShopArea", m);
			// 添加配送范围
			for (int i = 0; i < gardenname.size(); i++) {
				Shoparea sa = gardenname.get(i);
				sa.setCompanyShopId(shop.getCompanyShopId());// 店铺ID
				this.getSqlMapClientTemplate().insert("saveShopArea", sa);
			}
		}
		// 更新店铺信息
		this.getSqlMapClientTemplate().update("updateShopInfo", shop);

	}

	// 自动生成店铺编号
	public Integer generateShopCode(long companyId) {
		Integer shopCode = (Integer) this.getSqlMapClientTemplate()
				.queryForObject("generateShopCode", companyId);
		return shopCode;
	}

	// 店铺类型 Productshopcategory.xml
	public List<Object> findShopType() {
		Object shopType = this.getSqlMapClientTemplate().queryForList(
				"findShopType");
		return (List<Object>) shopType;
	}

	// 店铺下配送范围 Area.xml
	public List<Map<String, Object>> distributionArea(Map<String, Object> parm) {
		List<Map<String, Object>> parma = this.getSqlMapClientTemplate()
				.queryForList("findDistributionArea", parm);
		return parma;
	}

	// 新增店铺里面配送范围 一级配送范围地址=0 Area.xml
	public List<Object> findShopStairDistributionArea() {
		Object area = this.getSqlMapClientTemplate().queryForList(
				"findShopStairDistributionArea");
		return (List<Object>) area;
	};

	// 新增店铺里面配送范围 parent_id=一级配送范围地址area_id Area.xml
	public List<Object> findShopSecondLevelDistributionArea(
			Map<String, Object> parm) {
		Object area = this.getSqlMapClientTemplate().queryForList(
				"findShopSecondLevelDistributionArea", parm);
		return (List<Object>) area;
	}

	public Long seveCircle(Circle cle) {

		Long serl = (Long) this.getSqlMapClientTemplate().insert("instCircle",
				cle);
		return serl;
	}

	public void selectedCirle(List<Long> idList) {

		if (idList != null && idList.size() != 0) {
			for (int i = 0; i < idList.size(); i++) {
				Map map = new HashMap();
				map.put("circleId", idList.get(i));
				this.getSqlMapClientTemplate().delete("deleteCircle", map);
			}
		}
	}

	// 支付方式 开发区

	public List<Object> findPaytypeList(HashMap<String, Object> paytypeList) {

		Object paytypelist = this.getSqlMapClientTemplate().queryForList(
				"findPaytypeList", paytypeList);
		return (List) paytypelist;
	}

	// 支付方式 开发区

	public List<Object> findPaytypeList(Map<String, Object> map) {

		Object paytypelist = this.getSqlMapClientTemplate().queryForList(
				"findPaytypeList", map);
		return (List) paytypelist;
	}

	// 支付方式 保存 开发区

	public Long sevePaytype(PayType pay) {

		Long payl = (Long) this.getSqlMapClientTemplate().insert("instPaytype",
				pay);
		return payl;
	}

	// /**
	// * 开发区
	// * 查询支付方式
	// */
	public PayType findPaytypeInfo(Long payTypeId) {
		return (PayType) this.getSqlMapClientTemplate().queryForObject(
				"findPaytypeInfo", payTypeId);
	}

	public void updatePaytypeInfo(PayType payType) {
		this.getSqlMapClientTemplate().update("updatePaytypeInfo", payType);
	}

	// 删除支付方式shop.xml
	public void deletePaytypeInfo(List list) {
		if (list != null && list.size() != 0) {
			for (int i = 0; i < list.size(); i++) {
				Map map = new HashMap();
				map.put("payTypeId", list.get(i));
				this.getSqlMapClientTemplate().update("deletePaytypeInfoList1",
						map);

			}
		}
	}

	// 企业下店铺信息
	public List<Object> findCompanyShopInfo(Long companyId) {
		List<Object> shop = (List<Object>) this.getSqlMapClientTemplate()
				.queryForList("findCompanyShopInfo", companyId);
		return shop;
	}

	// 开发区店铺列表更改状态
	public void updateShopExamineResult(HashMap<String, Object> mapparm) {
		this.getSqlMapClientTemplate().update("updateShopExamineResult",
				mapparm);
	}

	// 开启支付方式shop.xml
	public void openPaytypeInfo(List list) {
		if (list != null && list.size() != 0) {
			for (int i = 0; i < list.size(); i++) {
				Map map = new HashMap();
				map.put("payTypeId", list.get(i));
				this.getSqlMapClientTemplate().update("openPaytypeInfoList1",
						map);

			}
		}
	}

	// 企业后台 判断是否是外送 Shop.xml
	public String checkDeliverOk(HashMap<String, Object> parm) {
		String deliverOk = (String) this.getSqlMapClientTemplate()
				.queryForObject("checkDeliverOk", parm);
		return deliverOk;
	}

	// 店铺申请 关闭审核 Shop.xml
	public void closeShopStatus(HashMap mapparm) {
		this.getSqlMapClientTemplate().update("closeShopStatus", mapparm);
	}

	// 查看是否是关闭状态
	public Long findShopStatus(HashMap mapparm) {
		Long thisShopStatus = (Long) this.getSqlMapClientTemplate()
				.queryForObject("findShopStatus", mapparm);
		return (Long) thisShopStatus;
	}

	// 关闭或者开启 店铺
	public void openOrCloseShop(HashMap mapparm) {
		this.getSqlMapClientTemplate().update("closeShopStatus", mapparm);
	}

	public Integer updDeliverOk(HashMap<String, Object> map) {
		return this.getSqlMapClientTemplate().update("updDeliverOk", map);
	}

	public Integer queryNumberShop(HashMap<String, Object> map) {
		Integer i = (Integer) this.getSqlMapClientTemplate().queryForObject(
				"queryNumberShop", map);
		return i;
	}

	public void updShopRelation(HashMap<String, Object> map) {
		
		this.getSqlMapClientTemplate().update("updShopRelation", map);
	}

	public Object shopWebStatus() {
		
		return this.getSqlMapClientTemplate().queryForList("shopWebStatus");
	}

	public void shopUpdWebStatus(HashMap map) {
		
		this.getSqlMapClientTemplate().update("shopUpdWebStatus", map);		
	}
}