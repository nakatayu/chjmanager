package com.chj.dao;

import org.springframework.stereotype.Repository;

import com.chj.entity.SetHotAmount;

@Repository
public class SetHotAmountDao  extends BaseDao {
	/**
	 * 設置熱門數量
	 */
	 public void  updateSetHotAmount(SetHotAmount setHotAmount){
			this.getSqlMapClientTemplate().update("updateHotSet",setHotAmount);
		}
	public SetHotAmount findHotSet() {
		return (SetHotAmount)this.getSqlMapClientTemplate().queryForObject("findHotSet");
	}
	 
}
