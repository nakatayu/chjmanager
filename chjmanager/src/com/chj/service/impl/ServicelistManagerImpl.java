package com.chj.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chj.dao.ActivityDao;
import com.chj.dao.CircleDao;
import com.chj.dao.ServicelistDao;
import com.chj.dao.TopicDao;
import com.chj.service.ActivityManager;
import com.chj.service.CircleManager;
import com.chj.service.ServicelistManager;
import com.chj.service.TopicManager;
import com.chj.entity.ServiceArea;
import com.chj.entity.ServiceTag;
import com.chj.entity.Servicelist;

@Service
@Transactional
public class ServicelistManagerImpl implements ServicelistManager {
	@Autowired
	ServicelistDao servicelistDao;

	// 开发区获取列表

	@Override
	public List<Object> findChjServiceList(HashMap<String, Object> serviceList) {
		return servicelistDao.findChjServiceList(serviceList);
	}

	// 开发区获取数量
	@Override
	public Object serviceChjCount(HashMap<String, Object> serviceList) {
		return servicelistDao.findChjServiceCount(serviceList);
	}

	// 企业获取列表
	@Override
	public List<Object> findCompanyServiceList(
			HashMap<String, Object> serviceList) {

		return servicelistDao.findCompanyServiceList(serviceList);
	}

	// 企业获取数量
	@Override
	public Object serviceCompanyCount(HashMap<String, Object> serviceList) {
		return servicelistDao.serviceCompanyCount(serviceList);
	}

	@Override
	public void selectedServicelist(List list) {

		servicelistDao.selectedServicelist(list);
	}

	// 查找服务信息
	@Override
	public Object findServiceInfo(Servicelist servicelist) {

		Object serviceti = servicelistDao.findServiceInfo(servicelist);
		return serviceti;
	}

	// 查找配送范围
	@Override
	public List<Map> findServiceArea(Long serviceId) {

		return servicelistDao.findServiceArea(serviceId);
	}

	// 查找已选标签
	@Override
	public List<Map> findServiceTag(Long service) {

		return servicelistDao.findServiceTag(service);
	}

	// 更改服务信息和标签
	@Override
	public void updateServiceInfo(Servicelist serviceList,
			List<ServiceTag> serviceTag, List<ServiceArea> serviceArea) {

		servicelistDao.updateServiceInfo(serviceList, serviceTag, serviceArea);
	}

	@Override
	public void updateServiceStatus(HashMap<String, Object> parm) {

		servicelistDao.updateServiceStatus(parm);
	}

	/*
	 * @Override public Long seveServicelist(Servicelist ser, String serTag) {
	 * 
	 * servicelistDao.seveServicelist(ser); if (serTag != null &&
	 * serTag.trim().length() > 0 && !serTag.equals("")) { String[] servicetag =
	 * serTag.split(","); for (int i = 0; i < servicetag.length; i++) {
	 * ServiceTag Stag = new ServiceTag(); Stag.setAddTime(new Date());
	 * Stag.setServiceId(ser.getServiceId());
	 * Stag.setTagId(Long.valueOf(servicetag[i])); HashMap<String, Object> Stag
	 * = new HashMap<String, Object>(); Stag.put("serviceId",
	 * ser.getServiceId()); Stag.put("tagId", servicetag[i]);
	 * Stag.put("addTime", (new Date())); Stag.put("status", "1"); Long sstag =
	 * servicelistDao.seveServiceTag(Stag); } } return (long) 1; }
	 */

	// 企业后台 共享漕河泾保存服务信息
	@Override
	public Long seveServicelist(Servicelist serviceList,
			List<ServiceTag> serviceTag, List<ServiceArea> serviceArea) {

		return servicelistDao.seveServicelist(serviceList, serviceTag,
				serviceArea);
	}

	// 开发区后台 共享漕河泾关闭和开启信息审核
	@Override
	public void serviceInfoCloseOrOpen(HashMap<String, Object> mapparm) {

		servicelistDao.serviceInfoCloseOrOpen(mapparm);
	}

	@Override
	public Long findServiceStatua(HashMap<String, Object> mapparm) {

		return (Long) servicelistDao.findServiceStatua(mapparm);
	}

	@Override
	public String updServiceRelation(String serviceIds, String columns,
			Integer filValue, Integer filnum, Integer type) {
		String[] serviceId = serviceIds.split(",");
		String msg = null;
		if (serviceId.length > 0) {
			HashMap<String, Object> map1 = new HashMap<String, Object>();
			map1.put("filValue", filValue);
			map1.put("filName", columns);
			map1.put("type", type==null?0:type);
			
			if (filnum > 0) {
				Integer i = servicelistDao.queryNumService(map1);
				if (i + serviceId.length > filnum) {
					if(type>0){
						msg = "此分类已有" + i + "个设置，总设置个数大于限定值！";
					}else{
						msg = "已有" + i + "个设置，总设置个数大于限定值！";
					}					
				}
			}
			if (msg == null) {
				for (String serverId : serviceId) {
					map1.put("serviceId", serverId);
					servicelistDao.updServiceRelation(map1);
				}
			}
		} else {
			msg = "数据错误!";
		}
		return msg;
	}

}
