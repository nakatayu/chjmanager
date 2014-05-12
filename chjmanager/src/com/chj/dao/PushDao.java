package com.chj.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.chj.entity.Advertisement;
import com.chj.entity.Push;


@Repository
public class PushDao extends BaseDao{
	
	//增加推送对象信息 
		public Object insertPushInfo(Push push, String tagList) {
			// TODO Auto-generated method stub
			Long pushInfo = (Long) this.getSqlMapClientTemplate().insert(
					"insertPushInfo", push);
			for(String tagId: tagList.split(",")){
				if(tagId.trim().length()>0){
					HashMap map = new HashMap();
					map.put("tagId", Long.valueOf(tagId));
					map.put("pushId", pushInfo);
					this.getSqlMapClientTemplate().insert(
							"insertPushInfoTag", map);
				}
			}
			return pushInfo;
		}
	//推送信息列表显示	
		public List<HashMap> findPushListInfo(HashMap<String, Object> pushInfo){
			// TODO Auto-generated method stub
			List<HashMap>  p = this.getSqlMapClientTemplate().queryForList(
					"findPushListInfo", pushInfo);
			return (List)p;
		}
	//推送列表分页
		public Object findPushListInfoCount(Map<String, Object> pushInfopages){
			// TODO Auto-generated method stub
			Object p = this.getSqlMapClientTemplate().queryForObject(
					"findPushListInfoCount", pushInfopages);
			return p;
		}
	//查询推送对象基本信息 
		public  Object findPushInfo(Push push) {
			Object pushInfo = this.getSqlMapClientTemplate().queryForObject("findPushInfo",push);
				return pushInfo;
			}
	// 更新   推送对象基本信息
		public void updatePushInfo(Map<String, Object> pushInfo){
			this.getSqlMapClientTemplate().update("updatePushInfo", pushInfo);				
		}	
	//点击查看  更改状态为审核中..	
		public void updatePushInfoStatus(Map<String, Object> pushInfostatus){
			String ids[]= pushInfostatus.get("pushId").toString().split(",");
			for(String pushId:ids){
				HashMap map =new HashMap();
				map.put("pushId", Long.valueOf(pushId));
				map.put("status",pushInfostatus.get("status"));
				map.put("checkContent", pushInfostatus.get("checkContent"));
				this.getSqlMapClientTemplate().update("updatePushInfoStatus", map);	
			}
						
		}	
	//伪删除  更改	DeleteFlag status 
		public void updatePushInfoDeleteFlag(Map<String, Object> deleteFlagParam){
	 List<Long> ids = 	(List<Long>) deleteFlagParam.get("pushId");
			if (ids != null && ids.size() != 0) {
				for (int i = 0; i < ids.size(); i++) {
					Map map = new HashMap();
					map.put("pushId", ids.get(i));
					map.put("deleteFlag", 2);
					this.getSqlMapClientTemplate().update("updatePushInfoDeleteFlag", map);
				}
			}
		}
		/**
		 * 获取组织架构
		 * @param map
		 * @return
		 */
		
		public Object findOrganizationName(HashMap map) {
			return this.getSqlMapClientTemplate().queryForObject("findOrganizationName", map);
		}
		public Push findPushInfoDetail(Long pushId) {
			// TODO Auto-generated method stub
			return (Push) this.getSqlMapClientTemplate().queryForObject("findPushInfoDetail", pushId);
		}
		public Object findPushInfoTagList(Long pushId) {
			// TODO Auto-generated method stub
			return this.getSqlMapClientTemplate().queryForList("findPushInfoTagList", pushId);
		}
		public ArrayList<Object> findPushPhoneId(Push push) {
			// TODO Auto-generated method stub
			//select phone_id  from tb_user t where phone_type=1 and sex=1 and birth_date >1908
			//and exists(select r.tag_id from tb_user_tag r where exists(select * from tb_push_tag rr where rr.tag_id=r.tag_id))

			return (ArrayList<Object>) this.getSqlMapClientTemplate().queryForList("findPushPhoneId", push);
		}
}
