package com.chj.service;

import com.chj.entity.SetHotAmount;

public interface SetHotAmountManager {
	void updateSetHotAmount(SetHotAmount setHotAmount);//设置热门数量
	public SetHotAmount findHotSet();//查询 
}
