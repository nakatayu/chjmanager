package com.chj.dao;

import java.io.InputStream;
import java.util.*;

import com.chj.utils.ImportExcelByPoi;

import org.springframework.stereotype.Repository;

import com.chj.entity.Advertisement;

@Repository
public class AdvertisementDao extends BaseDao {
	//广告查询
	public List<Object> findAdvertiSementList(HashMap<String, Object> advertisement) {
		List<Object> advertisementInfo = this.getSqlMapClientTemplate().queryForList("findAdvertiSementList", advertisement);
		return advertisementInfo;
	}

	//app首页中显示列表显示的内容是什么模块
	public HashMap<String, Object> tbFirstExtend() {
		Map advertisementInfo = new HashMap();
		advertisementInfo = (Map) this.getSqlMapClientTemplate().queryForObject("advertisementInfo");
		return (HashMap<String, Object>) advertisementInfo;
	}

	//更新app列表中显示的内容
	public void updateAppToFirstExtendInfo(HashMap<String, Object> updateAppToFirstExtend) {
		this.getSqlMapClientTemplate().update("updateAppToFirstExtendInfo", updateAppToFirstExtend);
	}


	//删除广告
	public void deleteAdvertiSementInfo(List list) {
		if (list != null && list.size() != 0) {
			for (int i = 0; i < list.size(); i++) {
				Map map = new HashMap();
				map.put("advertisementId", list.get(i));
				this.getSqlMapClientTemplate().update("deleteAdvertiSementList", map);

			}
		}
	}

	//增加
	public Object insertAdvertiSementInfo(Advertisement advertisement) {
		// TODO Auto-generated method stub
		Object categorys = this.getSqlMapClientTemplate().insert(
				"insertAdvertiSementInfo", advertisement);
		return categorys;
	}

	//查找
	public Object findAdvertiSementInfo(Advertisement advertisement) {
		Object advertisementInfo = this.getSqlMapClientTemplate().queryForObject("findAdvertiSementInfo", advertisement);
		return advertisementInfo;
	}

	// 更新
	public void updateAdvertiSementInfo(Map<String, Object> advertisement) {

		this.getSqlMapClientTemplate().update("updateAdvertiSementInfo", advertisement);
	}

	//查询web广告列表
	public List<Object> findWebAdvertisementList() {
		List<Object> findWebAdvertisementListInfo = this.getSqlMapClientTemplate().queryForList("findWebAdvertisementList");
		return findWebAdvertisementListInfo;
	}

	//查找web广告详情
	public Object findWebAdvertisementInfo(Long advertisement) {
		Object advertisementInfo = this.getSqlMapClientTemplate().queryForObject("findWebAdvertisementInfo", advertisement);
		return advertisementInfo;
	}

	// 更新web广告信息
	public void updateWebAdvertisementInfo(Map<String, Object> advertisement) {

		this.getSqlMapClientTemplate().update("updateWebAdvertisementInfo", advertisement);
	}


	//查询关键词	
	public List<Object> selectControlList(HashMap<String,Object> mapparm) {
		List<Object> selectControlListInfo = (List<Object>)this.getSqlMapClientTemplate().queryForList("selectControlList1",mapparm);
		return selectControlListInfo;
	}

	//读取关键词列表  分页
	public  Long selectControlListPageCount() {
		return (Long)this.getSqlMapClientTemplate().queryForObject("selectControlListPageCount");
	}
			
	//更新 关键词
	public void updateControl(HashMap<String, Object> updateControl) {
		this.getSqlMapClientTemplate().update("updateControl1", updateControl);
	}

	//增加关键词
	public Object addControl(HashMap<String, Object> addControl) {
		Object categorys = this.getSqlMapClientTemplate().insert("addControl1", addControl);
		return categorys;
	}

	//删除关键词
	public void deleteControl(List list) {
		if (list != null && list.size() != 0) {
			for (int i = 0; i < list.size(); i++) {
				Map map = new HashMap();
				map.put("deleteControlId", list.get(i));
				this.getSqlMapClientTemplate().update("deleteControl1", map);

			}
		}
	}


	public int importControlfromExcel(InputStream io) {
		List<String> inputControls = ImportExcelByPoi.importControlsByPoi(io);
		List<String> dbControls = this.getSqlMapClientTemplate().queryForList("selectOpinion");

		Map<String, Integer> map = new HashMap<String, Integer>(inputControls.size() + dbControls.size());
		List<String> diff = new ArrayList<String>();

		List<String> maxList = inputControls;
		List<String> minList = dbControls;
		if (inputControls.size() > dbControls.size()) {
			maxList = inputControls;
			minList = dbControls;
		}

		for (String str : maxList) {
			map.put(str, 1);
		}

		for (String str : minList) {
//			String str=m.keySet().toString();
			Integer i = map.get(str);
			if (i != null) {
				map.put(str, ++i);
				continue;
			}
			map.put(str, 1);
		}

		for (Map.Entry<String, Integer> entry : map.entrySet()) {
			if (entry.getValue() == 1) {
				diff.add(entry.getKey());
			}
		}
		int count = 0;
		Iterator iterator = diff.iterator();
		while (iterator.hasNext()) {
			HashMap<String, Object> addControl = new HashMap<String, Object>();
			addControl.put("controlName", iterator.next());
			addControl.put("createTime", new Date());
			Object categorys = this.getSqlMapClientTemplate().insert("addControl1", addControl);
			count++;
		}
		return count;
	}
}
