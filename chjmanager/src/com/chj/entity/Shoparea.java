package com.chj.entity;

import java.util.Date;

/**
 * 对应数据库：tb_company_shop_area
 */
public class Shoparea implements java.io.Serializable {
	
	private static final long serialVersionUID = -2461749752726404917L;
	 /**
	   *  Fields 
	   */ 
	    private Long companyShopAreaId;
		private Long areaId;
		private Long companyShopId;
		   
		public Long getAreaId() {
			return areaId;
		}

		public Long getCompanyShopId() {
			return companyShopId;
		}

		public void setAreaId(Long areaId) {
			this.areaId = areaId;
		}

		public void setCompanyShopId(Long companyShopId) {
			this.companyShopId = companyShopId;
		}

		
	public Long getCompanyShopAreaId() {
		return companyShopAreaId;
	}

	public void setCompanyShopAreaId(Long companyShopAreaId) {
		this.companyShopAreaId = companyShopAreaId;
	}

	

	
	

}
