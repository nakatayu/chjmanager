package com.chj.dao;

import java.util.HashMap;

import org.springframework.stereotype.Repository;

import com.chj.dao.BaseDao;

@Repository
public class CompanyShopDao extends BaseDao{
	
	public Integer insertShopInfo(Object  shopinfo) {
	// TODO Auto-generated method stub
	int id = (Integer) this.getSqlMapClientTemplate().insert(
			"queryShopInfo", shopinfo);
	return (Integer)id;
}

}
