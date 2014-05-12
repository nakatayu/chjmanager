package com.chj.entity;
/**
 * tb_product_attribute_value
 * 
 * */
public class ProductAttributeValue  implements java.io.Serializable {


    // Fields    

     private Long productAttributeValueId;
     private Long productAttributeId;
     private String name;


    // Constructors

    /** default constructor */
    public ProductAttributeValue() {
    }

    
    /** full constructor */
    public ProductAttributeValue(Long productArrtibuteId, String name) {
        this.productAttributeId = productArrtibuteId;
        this.name = name;
    }

   
    // Property accessors

    public Long getProductAttributeValueId() {
        return this.productAttributeValueId;
    }
    
    public void setProductAttributeValueId(Long productAttributeValueId) {
        this.productAttributeValueId = productAttributeValueId;
    }

    public Long getProductAttributeId() {
		return productAttributeId;
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


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime
				* result
				+ ((productAttributeId == null) ? 0 : productAttributeId
						.hashCode());
		result = prime
				* result
				+ ((productAttributeValueId == null) ? 0
						: productAttributeValueId.hashCode());
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
		ProductAttributeValue other = (ProductAttributeValue) obj;
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
		if (productAttributeValueId == null) {
			if (other.productAttributeValueId != null)
				return false;
		} else if (!productAttributeValueId
				.equals(other.productAttributeValueId))
			return false;
		return true;
	}




}