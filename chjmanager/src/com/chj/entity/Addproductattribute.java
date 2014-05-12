package com.chj.entity;

import java.util.List;

/**
 *  tb_append  附加属性
 */
public class Addproductattribute {
	
		private Long appendId;
		private String name;
		private Float price;
		private Long parentId;
		private Long companyId;
		private String needCount;
		private String isCkeckbox;
		
		private List<Object> child;//id,name
		
		public Long getAppendId() {
			return appendId;
		}
		public String getName() {
			return name;
		}
		public Float getPrice() {
			return price;
		}
		public Long getParentId() {
			return parentId;
		}
		public Long getCompanyId() {
			return companyId;
		}
		public String getNeedCount() {
			return needCount;
		}
		public String getIsCkeckbox() {
			return isCkeckbox;
		}
		public void setAppendId(Long appendId) {
			this.appendId = appendId;
		}
		public void setName(String name) {
			this.name = name;
		}
		public void setPrice(Float price) {
			this.price = price;
		}
		public void setParentId(Long parentId) {
			this.parentId = parentId;
		}
		public void setCompanyId(Long companyId) {
			this.companyId = companyId;
		}
		public void setNeedCount(String needCount) {
			this.needCount = needCount;
		}
		public void setIsCkeckbox(String isCkeckbox) {
			this.isCkeckbox = isCkeckbox;
		}
		public List<Object> getChild() {
			return child;
		}
		public void setChild(List<Object> child) {
			this.child = child;
		}
		
}
