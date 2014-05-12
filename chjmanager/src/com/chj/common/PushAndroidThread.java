package com.chj.common;

import java.util.ArrayList;
import java.util.List;

public class PushAndroidThread extends Thread {
    private String title;
    private List<Object> aliansList;
    private String content;
    
	public PushAndroidThread(List<Object> uriList,String  title, String content){
		this.title =  title;
		this.aliansList = uriList;
		this.content = content;
	}
	@Override
	public void run() {
		// TODO Auto-generated method stub
		super.run();
		PushUtils.pushAndroidMsg(aliansList, title, content);
		
	}

	
}
