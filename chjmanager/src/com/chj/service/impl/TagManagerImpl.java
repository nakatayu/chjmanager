package com.chj.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chj.dao.TagDao;
import com.chj.service.TagManager;



@Service
@Transactional
public class TagManagerImpl implements TagManager{

	@Autowired
	TagDao  tagDao;
/**
 * 标签一级分类
 * */
	
	@Override
	public List<Object> findTagFirstList() {
		return tagDao.findTagFirstList();
	}
	
	@Override
	public List<Object> findTagSecondList(Long tagId) {
		return tagDao.findTagSecondList(tagId);
	}

	@Override
	public List<Object> findTagThirdList(Map<String,Object>  mapparam) {
		// TODO Auto-generated method stub
		return tagDao.findTagThirdList(mapparam);
	}

	@Override
	public Object findTagList(Long tagParentId) {
		return tagDao.findTagList(tagParentId);
	}

	@Override
	public Object addTheNewTag(HashMap param) {
		return tagDao.addTheNewTag(param);
	}

	@Override
	public Object updateTheTag(HashMap param) {
		
		return tagDao.updateTheTag(param);
	}

	@Override
	public Object deleteTheTag(HashMap param) {
		return tagDao.deleteTheTag(param);
	}
	
}
