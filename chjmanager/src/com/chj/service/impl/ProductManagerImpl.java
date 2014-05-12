package com.chj.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hslf.model.Picture;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chj.dao.ProductDao;
import com.chj.dao.ShopDao;
import com.chj.dao.TagDao;
import com.chj.dao.TopicDao;
import com.chj.entity.Personnel;
import com.chj.entity.Product;
import com.chj.entity.Producttag;
import com.chj.entity.Shoparea;
import com.chj.entity.Shoptag;
import com.chj.service.ProductManager;

@Service
@Transactional
public class ProductManagerImpl implements ProductManager {

	@Autowired
	ProductDao productDao;

	@Autowired
	TagDao tagDao;
	
	@Autowired
	TopicDao topicDao;

	// 商品列表
	@Override
	public List<HashMap> findProductList(HashMap<String, Object> productList) {
		return productDao.findProductList(productList);
	}

	// 商品分页
	@Override
	public Object productPageCount(Map<String, Object> mapparam) {
		
		return productDao.productPageCount(mapparam);
	}

	// 商品保存
	@Override
	public Long insertProductInfo(Product product, List<Producttag> stList,
			Map<String, Object> pic, List<Long> flavors,
			List<Map<String, Object>> attrSkuList, String attrListHidden) {
		
		return productDao.insertProductInfo(product, stList, pic, flavors,
				attrSkuList, attrListHidden);
	}

	// 商品删除
	@Override
	public void deleteProductInfo(Personnel user,List list) {
		
		productDao.deleteProductInfo(user,list);
	}

	// 商品基本信息查询
	@Override
	public Object findProductInfo(Long productId) {
		return productDao.findProductInfo(productId);
	}

	// 商品图片查询
	@Override
	public Object findPictureInfo(Long productId) {
		
		return productDao.findPictureInfo(productId);
	}

	// 所属店铺
	@Override
	public List<Map<String, Object>> findProductBelongShop(
			Map<String, Object> BelongShop) {
		
		return productDao.findProductBelongShop(BelongShop);
	}

	// 生成商品编号
	public Integer generateProductCode(long companyId) {
		return productDao.generateProductCode(companyId);
	}

	// 口味选择 (附加属性)
	@Override
	public List<Map<String, Object>> CustomizeFlavors(
			Map<String, Object> flavors) {
		
		return productDao.CustomizeFlavors(flavors);
	}

	// 查找已选标签
	@Override
	public List<Map> findProductTag(Long product) {
		return productDao.findProductTag(product);
	}

	// 商品修改
	@Override
	public Object updateTheProductInfo(HashMap product) {
		return productDao.updateTheProductInfo(product);
	}

	// 商品标签修改
	@Override
	public Object addTheNewTags(Long productId, String[] tag) {
		Integer i = (Integer) tagDao.deleteFromTheProductTag(productId);
		if (tag.length > 0) {
			for (String tagId : tag) {
				HashMap newProductTag = new HashMap();
				newProductTag.put("productId", productId);
				newProductTag.put("tagId", Long.valueOf(tagId));
				tagDao.addTheNewProductTag(newProductTag);
			}
		}
		return null;
	}

	@Override
	public Object findProductImages(Long productId) {
		return productDao.findProductImages(productId);
	}

	@Override
	public Object findProductSkus(Long productId) {
		return productDao.findProductSkus(productId);
	}

	@Override
	public Object findproductAttributes(Long productId) {

		List<HashMap> productAttr = (List<HashMap>) productDao
				.findproductAttributes(productId);
		for (HashMap attr : productAttr) {
			Long productAttrId = Long.valueOf(attr.get("product_attribute_id")
					.toString());
			List<HashMap> attrValue = (List<HashMap>) productDao
					.findproductAttributeValues(productAttrId);

			attr.put("attrVal", attrValue);
		}
		return productAttr;
	}

	@Override
	public Object updateTheProductImages(Long productId, String imgpath) {

		Integer sum = (Integer) productDao.deleteTheProductImages(productId);
		if (imgpath.length() > 0) {
			String[] imagepath = imgpath.split(",");
			if (imagepath.length > 0) {
				for (String path : imagepath) {
					HashMap map = new HashMap();
					map.put("productId", productId);
					if (path.trim().length() > 0) {
						map.put("filePath", path);
						productDao.insertNewProductImages(map);
					}
				}
			}
		}
		return null;
	}

	@Override
	public Object addTheNewAttribute(Long productId, String attribute,
			String attributeValue) {
		HashMap<String, Object> attrMap = new HashMap<String, Object>();

		attrMap.put("productId", productId);
		attrMap.put("attriBute", attribute);

		Long attrId = productDao.addTheNewAttribute(attrMap);
		attrMap.put("attrId", attrId);

		if (attributeValue.length() > 0) {

			String[] attriButeval = attributeValue.split("#");
			List<HashMap> listVal = new ArrayList<HashMap>();
			if (attriButeval.length > 0) {
				for (String val : attriButeval) {
					HashMap<String, Object> valap = new HashMap<String, Object>();

					valap.put("attrFirstId", attrId);
					valap.put("attributeValue", val);
					Long valId = productDao.addTheNewAttributeValue(valap);
					valap.put("valId", valId);
					listVal.add(valap);
				}
			}
			attrMap.put("listVal", listVal);
		}

		return attrMap;
	}

	@Override
	public Object addTheProductSku(String proAValue, HashMap parm) {
		parm.put("status", "T");
		Long skuId = productDao.addTheProductSku(parm);
		if (proAValue.length() > 1) {
			String[] productAttributeValues = proAValue.split(",");
			if (productAttributeValues.length > 0) {
				for (String val : productAttributeValues) {
					HashMap<String, Long> map = new HashMap<String, Long>();
					map.put("skuId", skuId);
					map.put("attrValueId", Long.valueOf(val));
					productDao.addTheProductAttributeValuesSku(map);
				}
			}
		}
		return skuId;
	}

	@Override
	public Object updateTheAttrType(Long attributeId) {
		Integer a = (Integer) productDao.updateTheAttrType(attributeId);
		return a;
	}

	@Override
	public Integer updateTheSkuType(Long skuId) {
		return productDao.updateTheSkuType(skuId);
	}

	@Override
	public void updateProductSkuPrice(Long skuId, String price, String oldPrice) {
		
		productDao.updateProductSkuPrice(skuId,price,oldPrice);
		
	}
//开发区   店铺进入商品列表
	@Override
	public List<Object> findShopProductList(HashMap<String, Object> productList) {
		
		return productDao.findShopProductList(productList);
	}
//开发区   店铺进入商品列表分页  
	@Override
	public Object findShopProductListCount(Map<String, Object> mapparam) {
		
		return productDao.findShopProductListCount(mapparam);
	}

	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public Object findProductCommenst(HashMap<String, Object> prodCommlst) {
		List<HashMap<?, ?>> comlist = (List<HashMap<?, ?>>) productDao
				.findProductCommenst(prodCommlst);
		if (comlist.size() > 0) {
			for (HashMap circle : comlist) {
				String usId = circle.get("user_id").toString();
				circle.put("user", topicDao.findTopicUserInfo(usId));
			}
		}
		return comlist;
	}

	@Override
	public Object findProductCommenstCount(HashMap<String, Object> prodCommlst) {
		
		return productDao.findProductCommenstCount(prodCommlst);
	}

	@Override
	public Object updtProductCommentl(Long productId, String produCommId) {
		String[] comId = produCommId.split(",");
		if (comId.length > 0) {
			for (String str : comId) {
				HashMap map = new HashMap();
				map.put("comId",str);
				map.put("productId", productId);
				productDao.updtProductCommentl(map);
			}
		}
		return null;
	}

	@Override
	public void updProductApp(Long productId, List<Long> fList) {
		
		productDao.updadelAppend(productId);
		
		productDao.insertAppend(productId, fList);		
	}

	@Override
	public String companyShopProductWebExtend(String shopProductId,
			String filCOLUMNSName, Integer filValue, Integer filnum,
			String functionType) {
		String[] shopProId = shopProductId.split(",");
		String msg = null;
		if (shopProId.length > 0) {
			if(filnum>0){
				HashMap<String, Object> map1=new HashMap<String, Object>();
				map1.put("filValue",filValue);
				map1.put("filName", filCOLUMNSName);
				map1.put("functionType", functionType);
				
				Integer i=productDao.findWebExtendCount(map1);
				if(i+shopProId.length>filnum){
					msg="已有"+i+"个设置，总设置个数大于限定值！";
				}
			}
			if(msg == null){
				for (String shpPoId : shopProId) {
					HashMap<String, Object> map = new HashMap<String, Object>();
					map.put("filValue",filValue);
					map.put("companyShopProductId", shpPoId);
					map.put("filName", filCOLUMNSName);
					map.put("functionType", functionType);
					productDao.companyShopProductWebExtend(map);
				}
			}
		}else{
			msg="数据错误";
		}
		return msg;
		
	}

	@Override
	public Integer findSKUnumber(Long productId) {
		
		return productDao.findSKUnumber(productId);
	}
	
	
	
}
