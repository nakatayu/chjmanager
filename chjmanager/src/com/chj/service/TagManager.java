package com.chj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface TagManager {
	
	//标签一级分类
	public List<Object> findTagFirstList(); 
	
	public List<Object> findTagSecondList(Long tagId); 
	
	public List<Object> findTagThirdList(Map<String,Object>  mapparam);
	
	public Object findTagList(Long tagParentId);
	
	public Object addTheNewTag(HashMap param);
	
	public Object updateTheTag(HashMap param);

	public Object deleteTheTag(HashMap param);
}
