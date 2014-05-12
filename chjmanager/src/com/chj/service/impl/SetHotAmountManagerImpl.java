package com.chj.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chj.entity.SetHotAmount;

@Service
@Transactional
public class SetHotAmountManagerImpl implements com.chj.service.SetHotAmountManager{
	@Autowired
	com.chj.dao.SetHotAmountDao setHotAmountDao;
	
	@Override
	public void updateSetHotAmount(SetHotAmount setHotAmount) {
		// TODO Auto-generated method stub
		setHotAmountDao.updateSetHotAmount(setHotAmount);
	}

	@Override
	public SetHotAmount findHotSet() {
		// TODO Auto-generated method stub
		return setHotAmountDao.findHotSet();
	}

}
