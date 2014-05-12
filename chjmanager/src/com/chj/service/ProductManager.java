package com.chj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hslf.model.Picture;

import com.chj.entity.Personnel;
import com.chj.entity.Product;
import com.chj.entity.Producttag;
import com.chj.entity.Shop;
import com.chj.entity.Shoparea;
import com.chj.entity.Shoptag;

public interface ProductManager {
	public List<Object> findShopProductList(HashMap<String, Object> productList);//开发区  店铺进入商品列表
	
	public Object findShopProductListCount(Map<String, Object> mapparam);//开发区  店铺进入商品列表分页
	
	public List<HashMap> findProductList(HashMap<String, Object> productList);//商品列表
	
	public Object productPageCount(Map<String, Object> mapparam);//商品分页
	
	public Long insertProductInfo(Product product,List<Producttag> stList,Map<String,Object> pic,List<Long> flavors,List<Map<String,Object>> attrList,String attrListHidden);//商品保存
	
	public void deleteProductInfo(Personnel user, List list);//删除商品信息   
	
	public Object findProductInfo(Long productId);//查找商品基本信息
	
	public Object findPictureInfo(Long productId);//查找商品图片
	
	public List<Map> findProductTag(Long product);//查找已选标签
	
	public List<Map<String, Object>> findProductBelongShop(Map<String, Object> BelongShop);//所属店铺
	
	public Integer generateProductCode(long companyId);//自动生成商品编号
	
	public  List<Map<String, Object>> CustomizeFlavors(Map<String, Object> flavors);//口味选择（附加属性）

	public Object updateTheProductInfo(HashMap product);

	public Object addTheNewTags(Long productId, String[] tag);

	public Object findProductImages(Long productId);

	public Object findProductSkus(Long productId);

	public Object findproductAttributes(Long productId);

	public Object updateTheProductImages(Long productId, String imgpath);

	public Object addTheNewAttribute(Long productId, String attribute,
			String attributeValue);

	public Object addTheProductSku(String proAValue, HashMap parm);

	public Object updateTheAttrType(Long attributeId);

	public Integer updateTheSkuType(Long skuId);

	public void updateProductSkuPrice(Long skuId, String price, String oldPrice);
	
	public Object findProductCommenst(HashMap<String, Object> prodCommlst);
	
	public Object findProductCommenstCount(HashMap<String, Object> prodCommlst);
	
	public Object updtProductCommentl(Long productId, String produCommId);

	/*public Long findWebExtendCount();
	public void companyShopProductWebExtend(Long count,
			String selectedCompanyShopProductId, String type);*/

	public void updProductApp(Long productId, List<Long> fList);

	public String companyShopProductWebExtend(String shopProductId,
			String filCOLUMNSName, Integer filValue, Integer filnum, String functionType);

	public Integer findSKUnumber(Long productId);
	
	
	

}
