package com.chj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.chj.entity.Service;
import com.chj.entity.ServiceArea;
import com.chj.entity.ServiceTag;
import com.chj.entity.Servicelist;
import com.chj.entity.Shop;
import com.chj.entity.Shoparea;
import com.chj.entity.Shoptag;

public interface ServicelistManager {
	
	public Long seveServicelist(Servicelist serviceList,
			List<ServiceTag> serviceTag, List<ServiceArea> serviceArea);// 企业后台
																		// 共享漕河泾保存信息

	public List<Map> findServiceTag(Long serviceId);// 查找标签

	public List<Map> findServiceArea(Long serviceId);// 查找配送范围

	public void updateServiceInfo(Servicelist serviceList,
			List<ServiceTag> serviceTag, List<ServiceArea> serviceArea);// 更新服务信息

	public void selectedServicelist(List list);

	public Object findServiceInfo(Servicelist servicelist);

	public void updateServiceStatus(HashMap<String, Object> parm);// 更改状态

	public void serviceInfoCloseOrOpen(HashMap<String, Object> mapparm);// 开发区后台
																		// 共享漕河泾关闭和开启信息审核

	// 开发区获取列表和数量
	public List<Object> findChjServiceList(HashMap<String, Object> serviceList);// 共享漕河泾列表

	public Object serviceChjCount(HashMap<String, Object> serviceList);

	// 企业获取列表和数量的

	public List<Object> findCompanyServiceList(
			HashMap<String, Object> serviceList);// 共享漕河泾列表

	public Object serviceCompanyCount(HashMap<String, Object> serviceList);

	public Long findServiceStatua(HashMap<String, Object> mapparm);// 查看当前状态

	public String updServiceRelation(String serviceIds, String columns,
			Integer filValue, Integer filnum, Integer type);

}
