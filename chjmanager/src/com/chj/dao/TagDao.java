package com.chj.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public class TagDao extends BaseDao{

	
	
	public List<Object> findTagFirstList() {
		Object tags = this.getSqlMapClientTemplate().queryForList("findTagFirstList");
		return (List<Object>) tags;
	}
	
	public List<Object> findTagSecondList(Long tagId) {
		Object tags = this.getSqlMapClientTemplate().queryForList("queryTagSecondList",tagId);
		return (List<Object>) tags;
	}
	
	public List<Object> findTagThirdList(Map<String,Object> mapparam){
		Object tags = this.getSqlMapClientTemplate().queryForList(
				"queryTagThirdList",mapparam); 
		return (List<Object>) tags;
	}

	public Object findTagList(Long tagParentId) {
		Object obj=this.getSqlMapClientTemplate().queryForList("findAddTagList",tagParentId);
		return obj;
	}

	public Object addTheNewTag(HashMap param) {
		Object obj=this.getSqlMapClientTemplate().insert("addTheNewTag",param);
		return obj;
	}

	public Object updateTheTag(HashMap param) {
		Object obj=this.getSqlMapClientTemplate().update("updateTheTag",param);
		return obj;
	}

	public Object deleteTheTag(HashMap param) {
		Object obj=this.getSqlMapClientTemplate().update("deleteTheTag",param);
		return obj;
	}

	public Object deleteFromTheProductTag(Long productId) {
		Object obj=this.getSqlMapClientTemplate().delete("deleteFromTheProductTag",productId);
		return obj;
	}

	public Object addTheNewProductTag(HashMap newProductTag) {
		Object obj=this.getSqlMapClientTemplate().insert("addTheNewProductTag",newProductTag);
		return obj;
	}
}
