package com.json;

public class BaseBean {

	private int status;
	private String msg;
	private Object rows;
	private Object total;
	private Object userCount;
	private Object themeCount;
	
	public void setStatus(int status) {
		this.status = status;
	}
	public int getStatus() {
		return status;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getMsg() {
		return msg;
	}
	public Object getRows() {
		return rows;
	}
	public void setRows(Object rows) {
		this.rows = rows;
	}
	public Object getTotal() {
		return total;
	}
	public void setTotal(Object total) {
		this.total = total;
	}
	public Object getUserCount() {
		return userCount;
	}
	public void setUserCount(Object userCount) {
		this.userCount = userCount;
	}
	public Object getThemeCount() {
		return themeCount;
	}
	public void setThemeCount(Object themeCount) {
		this.themeCount = themeCount;
	}


}
