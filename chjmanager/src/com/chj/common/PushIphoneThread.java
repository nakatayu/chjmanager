package com.chj.common;

import java.util.ArrayList;
import java.util.List;

public class PushIphoneThread extends Thread {
    private String p12Path;
    private List<Object> deviceTokens;
    private String content;
    
	public PushIphoneThread(String p12Path, List<Object> deviceTokens, String content){
		this.p12Path =  p12Path;
		this.deviceTokens = deviceTokens;
		this.content = content;
	}
	@Override
	public void run() {
		// TODO Auto-generated method stub
		super.run();
		PushUtils.push2More(p12Path, deviceTokens, content);
		
	}

	
}
