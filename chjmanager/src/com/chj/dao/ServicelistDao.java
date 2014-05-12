package com.chj.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.chj.dao.BaseDao;
import com.chj.entity.Service;
import com.chj.entity.ServiceArea;
import com.chj.entity.ServiceTag;
import com.chj.entity.Servicelist;
import com.chj.entity.Shop;
import com.chj.entity.Shoparea;
import com.chj.entity.Shoptag;

@Repository
public class ServicelistDao extends BaseDao {
	/**
	 * 删除 共享漕河泾
	 * 
	 * @throws Exception
	 */
	public void selectedServicelist(List<Long> idList) {
		if (idList != null && idList.size() != 0) {
			for (int i = 0; i < idList.size(); i++) {
				Map map = new HashMap();
				map.put("serviceId", idList.get(i));
				this.getSqlMapClientTemplate().delete("deleteServicelist", map);
			}
		}
	}

	public Object findServiceCount(HashMap<String, Object> serviceList) {
		Object servicecount = this.getSqlMapClientTemplate().queryForObject(
				"findServiceList", serviceList);
		return servicecount;
	}

	/**
	 * 保存服务信息
	 */
	// 企业后台 共享漕河泾保存服务信息
	public Long seveServicelist(Servicelist serviceList,
			List<ServiceTag> serviceTag, List<ServiceArea> serviceArea) {
		Long serviceId = (Long) this.getSqlMapClientTemplate().insert(
				"instServicelist", serviceList);
		insertServiceTag(serviceId, serviceTag);
		insertServiceArea(serviceId, serviceArea);
		return serviceId;
	}

	// 保存标签的关联表 已选标签
	public void insertServiceTag(Long serviceId, List<ServiceTag> serviceTag) {
		if (serviceTag != null && serviceTag.size() != 0) {
			for (int i = 0; i < serviceTag.size(); i++) {
				ServiceTag tag = serviceTag.get(i);
				tag.setServiceId(serviceId);
				this.getSqlMapClientTemplate().insert("addServiceTag", tag);
			}
		}
	}

	// 保存关联表 服务范围
	public void insertServiceArea(Long serviceId, List<ServiceArea> serviceArea) {
		if (serviceArea != null && serviceArea.size() != 0) {
			for (int i = 0; i < serviceArea.size(); i++) {
				ServiceArea area = serviceArea.get(i);
				area.setServiceId(serviceId);
				this.getSqlMapClientTemplate()
						.insert("insertServiceArea", area);
			}
		}
	}

	/*
	 * public Long seveServicelist(Servicelist ser) {
	 *Long serl = (Long)
	 * this.getSqlMapClientTemplate().insert("instServicelist", ser); return
	 * serl; }
	 */

	// 查找共享漕河泾
	public Object findServiceInfo(Servicelist servicelist) {
		
		Object serviceInfo = this.getSqlMapClientTemplate().queryForObject(
				"findServiceInfo", servicelist);
		return serviceInfo;
	}

	// 查找已选标签
	public List<Map> findServiceTag(Long serviceId) {
		
		List<Map> serviceTag = this.getSqlMapClientTemplate().queryForList(
				"findServiceTag", serviceId);
		return serviceTag;
	}

	// 查找配送范围
	public List<Map> findServiceArea(Long serviceId) {
		
		List<Map> serviceArea = this.getSqlMapClientTemplate().queryForList(
				"findServiceArea", serviceId);
		return serviceArea;
	}

	// 更新服务信息
	public void updateServiceInfo(Servicelist serviceList,
			List<ServiceTag> serviceTag, List<ServiceArea> serviceArea) {
		this.getSqlMapClientTemplate().update("updateServiceInfo", serviceList);
		Map m = new HashMap();
		m.put("serviceId", serviceList.getServiceId());
		this.getSqlMapClientTemplate().delete("deleteServiceTag", m);
		if (serviceTag != null && serviceTag.size() != 0) {
			for (int i = 0; i < serviceTag.size(); i++) {
				ServiceTag sTag = serviceTag.get(i);
				sTag.setServiceId(serviceList.getServiceId());
				this.getSqlMapClientTemplate().insert("addServiceTag", sTag);
			}
		}
		this.getSqlMapClientTemplate().delete("deleteServiceArea", m);
		if (serviceArea != null && serviceArea.size() != 0) {
			for (int i = 0; i < serviceArea.size(); i++) {
				ServiceArea area = serviceArea.get(i);
				area.setServiceId(serviceList.getServiceId());
				this.getSqlMapClientTemplate()
						.insert("insertServiceArea", area);
			}
		}
	};

	// 共享漕河泾 状态更改

	public void updateServiceStatus(HashMap<String, Object> parm) {
		
		this.getSqlMapClientTemplate().update("updateServiceStatus", parm);
	}

	public Long seveServiceTag(HashMap<String, Object> stag) {
		
		Long svtag = (Long) this.getSqlMapClientTemplate().insert(
				"seveServiceTag", stag);
		return svtag;
	}

	// 开发区获取列表
	public List<Object> findChjServiceList(HashMap<String, Object> serviceList) {
		List<Object> servicechjlist = this.getSqlMapClientTemplate()
				.queryForList("findChjServiceList", serviceList);
		return servicechjlist;
	}

	// 开发区获取数量
	public Object findChjServiceCount(HashMap<String, Object> serviceList) {
		Object servicechjcount = this.getSqlMapClientTemplate().queryForObject(
				"findChjServiceListCount", serviceList);
		return servicechjcount;
	}

	// 企业获取列表
	public List<Object> findCompanyServiceList(
			HashMap<String, Object> serviceList) {
		List<Object> servicecompanylist = this.getSqlMapClientTemplate()
				.queryForList("findCompanyServiceList", serviceList);
		return servicecompanylist;
	}

	// 企业获取数量
	public Object serviceCompanyCount(HashMap<String, Object> serviceList) {
		Object servicecompanycount = this.getSqlMapClientTemplate()
				.queryForObject("findCompanyServiceListCount", serviceList);
		return servicecompanycount;
	}

	// 开发区后台 共享漕河泾关闭和开启信息审核
	public void serviceInfoCloseOrOpen(HashMap<String, Object> mapparm) {
		this.getSqlMapClientTemplate()
				.update("serviceInfoCloseOrOpen", mapparm);
	}

	// public Object serviceCompanyCount(Map<String, Object> mapparam) {
	// Object delcp = this.getSqlMapClientTemplate().queryForObject(
	// "queryserviceCompanyCount", mapparam);
	// return delcp;

	// }
	public Long findServiceStatua(HashMap<String, Object> mapparm) {
		Long serviceStatus = (Long) this.getSqlMapClientTemplate()
				.queryForObject("findServiceStatua", mapparm);
		return serviceStatus;
	}

	public Integer queryNumService(HashMap<String, Object> map) {

		return (Integer) this.getSqlMapClientTemplate().queryForObject(
				"queryNumService", map);
	}

	public void updServiceRelation(HashMap<String, Object> map) {

		this.getSqlMapClientTemplate().update("updServiceRelation", map);
	}

}