package com.chj.entity;

import java.util.Date;
import java.util.List;

/**
 * 对应数据库表：tb_product_attribute
 */

public class ProductAttribute  implements java.io.Serializable {


    // Fields    

     private Long productAttributeId;
     private String name;
     private String type;
     private Date createDate;
     
     private List<ProductAttributeValue> values;

    // Constructors

    /** default constructor */
    public ProductAttribute() {
    }

    
    /** full constructor */
    public ProductAttribute(String name, String type, Date createDate) {
        this.name = name;
        this.type = type;
        this.createDate = createDate;
    }

   
    // Property accessors

    public Long getProductAttributeId() {
        return this.productAttributeId;
    }
    
    public void setProductAttributeId(Long productAttributeId) {
        this.productAttributeId = productAttributeId;
    }

    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return this.type;
    }
    
    public void setType(String type) {
        this.type = type;
    }

    public Date getCreateDate() {
        return this.createDate;
    }
    
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

	public List<ProductAttributeValue> getValues() {
		return values;
	}

	public void setValues(List<ProductAttributeValue> values) {
		this.values = values;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((createDate == null) ? 0 : createDate.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime
				* result
				+ ((productAttributeId == null) ? 0 : productAttributeId
						.hashCode());
		result = prime * result + ((type == null) ? 0 : type.hashCode());
		result = prime * result + ((values == null) ? 0 : values.hashCode());
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ProductAttribute other = (ProductAttribute) obj;
		if (createDate == null) {
			if (other.createDate != null)
				return false;
		} else if (!createDate.equals(other.createDate))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (productAttributeId == null) {
			if (other.productAttributeId != null)
				return false;
		} else if (!productAttributeId.equals(other.productAttributeId))
			return false;
		if (type == null) {
			if (other.type != null)
				return false;
		} else if (!type.equals(other.type))
			return false;
		if (values == null) {
			if (other.values != null)
				return false;
		} else if (!values.equals(other.values))
			return false;
		return true;
	}
   








}