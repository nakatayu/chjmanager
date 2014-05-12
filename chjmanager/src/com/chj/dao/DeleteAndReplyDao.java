package com.chj.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.poi.hslf.model.Picture;
import org.springframework.stereotype.Repository;

import com.chj.entity.Product;
import com.chj.entity.ProductShop;
import com.chj.entity.Producttag;
import com.chj.entity.Shop;
import com.chj.entity.Shoparea;
import com.chj.entity.Shoptag;
@Repository
public class DeleteAndReplyDao extends BaseDao{
	//商品列表

//	//商品删除  
//		public void deleteProductInfo(List list) {
//			if (list != null && list.size() != 0) 
//			   {
//					this.getSqlMapClientTemplate().update("deleteShopProduct",shopId);
//				}
//	
//}
}