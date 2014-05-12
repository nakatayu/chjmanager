package com.chj.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.poi.hssf.record.HideObjRecord;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import cn.eavic.framework.web.BaseAction;

import com.chj.common.Commonparam;
import com.chj.entity.JsonDateValueProcessor;
import com.chj.entity.Personnel;
import com.chj.entity.Product;
import com.chj.entity.ProductAttribute;
import com.chj.entity.Producttag;
import com.chj.service.ProductManager;
import com.chj.service.ShopManager;
import com.json.BaseBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Namespace("/")
@Results({ @Result(name = BaseAction.NONE, location = "productAction.action", type = "redirect"), })
public class ProductAction extends ActionSupport {
	private static final long serialVersionUID = 7655056122242830524L;

	@Autowired
	ProductManager productManager;
	@Autowired
	ShopManager shopManager;

	private Integer size, page;
	private Long productCategoryId;
	private String name;
	private String brand;
	private String factory;
	private String place;
	private String feature;
	private String summary;
	private String createTime;
	private Long createUserId;
	private String content;
	private Long lastEditUserId;
	private Long companyId;
	private Integer shareCount;
	private Integer starScore;
	private String logo;

	private Long productNumber;
	private String startTime;
	private String endTime;
	private String invoice;
	private String afterRepair;
	private String timeType;

	private Object isCollection;// 中间查询值
	private Integer sellCount;// 中间查询值
	private Integer stock;// 中间查询值
	private Object tagList;// 中间查询值
	private Object sku;// 中间查询值,当前sku
	private Object image;// 中间查询值
	private Long companyShopProductId;
	private String shopImage;
	private String allSkuList;// 商品所有sku,json
	private List<ProductAttribute> allAttrList;// 商品所有属性
	private List<String> imgList;// 详情图片列表

	private Long productId;
	private String price;
	private String oldPrice;

	private String foreignName;
	private String hiddenImage;// 产品图片,####分隔符

	/**
	 * 修改商品的价格
	 * 
	 * @throws Exception
	 */

	public void updateProductSkuPrice() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		try {
			productManager.updateProductSkuPrice(skuId, price, oldPrice);
			bean.setStatus(200);

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
			e.printStackTrace();
		}

		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 新增商品，商品添加保存
	 */
	public void insertProductInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		String thirdCategoryTags = request.getParameter("thirdCategoryTag");// 已选标签的值
		Personnel user = (Personnel) request.getSession().getAttribute("user");

		// 已选标签
		List<Producttag> stList = null;
		if (thirdCategoryTags != null) {
			String[] tags = thirdCategoryTags.split(",");
			stList = new ArrayList<Producttag>();
			Producttag st = null;
			if (tags[0].length() != 0 && tags.length != 0) {
				for (int i = 0; i < tags.length; i++) {
					st = new Producttag();
					st.setTagId(Long.parseLong(tags[i]));
					stList.add(st);
				}
			}
		}

		// 口味
		String flavorsIds = request.getParameter("flavorsIds");
		List<Long> fList = new ArrayList<Long>();
		if (flavorsIds != null && flavorsIds.trim().length() > 0) {
			String[] flavors = flavorsIds.split(",");
			for (int i = 0; i < flavors.length; i++) {
				fList.add(Long.parseLong(flavors[i].toString()));
			}
		}

		// 商品属性SKU
		String attrHidden = request.getParameter("attrHidden");
		// {"颜色":"白,黄","尺寸":"大,小"}
		String attrListHidden = request.getParameter("attrListHidden");

		List<Map<String, Object>> attrSkuList = new ArrayList<Map<String, Object>>();
		if (attrHidden != null && attrHidden.trim().length() > 0) {
			String[] attr1 = attrHidden.split("#");
			for (int i = 0; i < attr1.length; i++) {
				String att = attr1[i];
				String[] attr2 = att.split("@");
				Map<String, Object> attMap = new HashMap<String, Object>();
				attMap.put("attriBute", attr2[0]);// 杯型:中杯,颜色:白
				attMap.put("price", attr2[1]);
				attMap.put("oldPrice", attr2[2]);
				attrSkuList.add(attMap);
			}
		}
		try {
			Product product = new Product();
			product.setCompanyId(user.getCompanyId());
			product.setProductCategoryId(productCategoryId);
			product.setName(name);
			product.setBrand(brand);
			product.setFactory(factory);
			product.setPlace(place);
			
			product.setFeature(Commonparam.clearStr(feature));
			product.setSummary(Commonparam.clearStr(summary));
			product.setCreateTime(new Date());
			product.setCreateUserId(user.getId());
			product.setContent(Commonparam.clearStr(content));
			product.setShareCount(0);
			product.setStarScore(1);
			product.setForeignName(foreignName);

			if (startTime != null && startTime.trim().length() > 0) {
				product.setStartTime(Commonparam.String2ShortDate(startTime));// yyyy-MM-dd
			}
			if (endTime != null && endTime.trim().length() > 0) {
				product.setEndTime(Commonparam.String2ShortDate(endTime));// yyyy-MM-dd
			}

			product.setInvoice(invoice);
			product.setAfterRepair(afterRepair);
			product.setTimeType(timeType);
			product.setProductNumber(productNumber);

			Map<String, Object> m = new HashMap();
			m.put("filePathArray", hiddenImage);

			Long productId = productManager.insertProductInfo(product, stList,
					m, fList, attrSkuList, attrListHidden);
			if (user.getType() == 2 || user.getType() == 3) {
				request.getRequestDispatcher("pages/company/ProductList.jsp")
						.forward(request, response);
			} else if (user.getType() == 4 || user.getType() == 5) {
				request.getRequestDispatcher("pages/starbucks/ProductList.jsp")
						.forward(request, response);
			}
		} catch (Exception e) {
			response.sendRedirect("common/500.jsp");			
		}
	}

	public void updProductApp() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			String flavorsIds = request.getParameter("flavorsIds");
			List<Long> fList = new ArrayList<Long>();
			if (flavorsIds != null && flavorsIds.trim().length() > 0) {
				String[] flavors = flavorsIds.split(",");
				for (int i = 0; i < flavors.length; i++) {
					fList.add(Long.parseLong(flavors[i].toString()));
				}
			}
			productManager.updProductApp(productId, fList);
			bean.setStatus(200);
		} catch (Exception e) {
			bean.setRows(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	String companyName;

	/**
	 * 开发区 企业进入商品列表
	 * */
	public void findProductList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();

		try {
			HashMap<String, Object> productList = new HashMap<String, Object>();
			productList.put("name", name);
			productList.put("size", size);
			productList.put("startIndex", (page - 1) * size);
			productList.put("companyName", companyName);
			if (personnel.getType() == 1) {
				productList.put("companyId", companyId);
			} else {
				productList.put("companyId", personnel.getCompanyId());
			}
			List<HashMap> list = productManager.findProductList(productList);
			if (list.size() > 0) {
				bean.setStatus(200);
				bean.setRows(list);
				bean.setTotal(productManager.productPageCount(productList));
			} else {
				bean.setMsg("沒有数据!");
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 开发区权限 店铺进入商品列表
	 * **/
	private Long companyShopId;
	private Integer extend;

	public void findShopProductList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		if (personnel.getType() == 1) {
			try {
				HashMap<String, Object> productList = new HashMap<String, Object>();
				productList.put("name", name);
				productList.put("size", size);
				productList.put("companyName", companyName);
				productList.put("extend", extend);
				productList.put("companyShopId", companyShopId);
				productList.put("startIndex", (page - 1) * size);
				List<Object> list = productManager
						.findShopProductList(productList);
				if (list.size() > 0) {
					bean.setStatus(200);
					bean.setRows(list);
					bean.setTotal(productManager
							.findShopProductListCount(productList));
				} else {
					bean.setMsg("没有数据!");
				}
			} catch (Exception e) {
				bean.setMsg(e.getLocalizedMessage());
			}
			String json = JSONObject.fromObject(bean).toString();
			response.getOutputStream().write(json.getBytes("UTF-8"));
		}
	}

	// 自动生成商品编号
	public void generateProductCode() throws UnsupportedEncodingException,
			IOException {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		try {			
			Integer productCode = productManager.generateProductCode(user
					.getCompanyId());			
			productCode=productCode+1;
			DecimalFormat df=new DecimalFormat("0000000");
			String shCode=user.getCompanyId()+df.format(productCode);		
			bean.setStatus(200);
			bean.setRows(shCode);			
		} catch (Exception e) {
			e.printStackTrace();
		}

		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	// 商品删除
	public void deleteProductInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		String del = request.getParameter("selectedProductId");
		String[] idStr = del.split(",");
		List<Long> idList = new ArrayList<Long>();
		for (int i = 0; i < idStr.length; i++) {
			if (idStr[i].trim().length() > 0) {
				idList.add(Long.parseLong(idStr[i]));
			}

		}
		BaseBean bean = new BaseBean();
		try {
			productManager.deleteProductInfo(user, idList);
			bean.setStatus(200);

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 更新商品信息 页面，也是查看的商品详情的界面
	 * 
	 */
	public void updateProductInfo() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		String returnpage = "";
		try {
			if (personnel.getType() == 1) {
				returnpage = "/pages/manager/companyInfoManagerUpdateProduct.jsp";
			} else {
				returnpage = "/pages/company/UpdateProductMaintain.jsp";
			}

			List<Map> shopTag = productManager.findProductTag(productId);
			Object productInfo = productManager.findProductInfo(productId);
			request.setAttribute("productInfo", productInfo);
			request.setAttribute("shopTag", shopTag);
			request.getRequestDispatcher(returnpage).forward(request, response);
		} catch (Exception e) {
			response.getWriter().print(e.getLocalizedMessage());
		}

	}

	// 所属店铺
	public void findProductBelongShop() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		try {
			Map<String, Object> belongShop = new HashMap();
			belongShop.put("companyId", user.getCompanyId());
			Object productInfo = productManager
					.findProductBelongShop(belongShop);
			request.setAttribute("productInfo", productInfo);

			bean.setStatus(200);
			bean.setRows(productInfo);
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	// 商品（口味） 附加属性查找
	public void CustomizeFlavors() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		try {
			Map<String, Object> flavors = new HashMap<String, Object>();
			if(user.getType()==1){
				flavors.put("companyId", companyId);
			}else{
				flavors.put("companyId", user.getCompanyId());
			}			
			flavors.put("productId", productId==null?0:productId);
			Object productInfo = productManager.CustomizeFlavors(flavors);
			bean.setStatus(200);
			bean.setRows(productInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}

		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	String categoryId, productTagId;

	/**
	 * 商品修改
	 * 
	 * @throws Exception
	 */
	public void updateTheProduct() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");

		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> product = new HashMap<String, Object>();
			product.put("productId", productId);
			product.put("name", name);
			product.put("brand", brand);
			product.put("factory", factory);
			product.put("place", place);
			product.put("feature", Commonparam.clearStr(feature.trim()));
			product.put("content", Commonparam.clearStr(content.trim()));
			product.put("summary", Commonparam.clearStr(summary.trim()));
			product.put("invoice", invoice);
			product.put("afterRepair", afterRepair);
			product.put("categoryId", categoryId);
			product.put("userId", personnel.getId());

			productManager.updateTheProductInfo(product);
			String[] tag = null;
			if (productTagId.length() > 1) {
				tag = productTagId.split(",");
			}
			productManager.addTheNewTags(productId, tag);
			bean.setStatus(200);
		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 商品属性查询 Attribute/image
	 * 
	 * @throws Exception
	 */
	public void moreUpdateAttribute() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);

		BaseBean bean = new BaseBean();
		try {
			HashMap map = new HashMap();
			List<HashMap> imglist = (List<HashMap>) productManager
					.findProductImages(productId);
			List<HashMap> productSku = (List<HashMap>) productManager
					.findProductSkus(productId);
			List<HashMap> productAttributes = (List<HashMap>) productManager
					.findproductAttributes(productId);

			map.put("imglist", imglist);
			map.put("proSku", productSku);
			map.put("proAttr", productAttributes);

			bean.setRows(map);
			bean.setStatus(200);

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	File uploadFile;

	String uploadFileFileName;

	public void uploadProductImage() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();

		String path = "";
		long max = 1024 * 150;
		if (this.uploadFile != null) {
			int length = 0;
			try {
				FileInputStream fis = new FileInputStream(uploadFile);
				try {
					length = fis.available();
				} catch (IOException e1) {
					e1.printStackTrace();
				}
			} catch (FileNotFoundException e2) {
				e2.printStackTrace();
			}
			if (max >= length) {
				
				String newfilename = Commonparam.makeNewFileName(uploadFileFileName);
				String targetFolder=Commonparam.productFolder+Commonparam.makeYearMonth(new Date());
				String absolute = Commonparam.getKeyValue("imageStorePath")+targetFolder;
				
				Commonparam.makeFile(uploadFile, absolute, newfilename);
				
				bean.setStatus(200);
				bean.setRows(targetFolder+newfilename);
			} else {
				bean.setStatus(400);
				bean.setMsg("图片大小150K内!");
			}

		} else {
			bean.setStatus(400);
			bean.setMsg("请选择图片!");
		}

		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	String imgpath;

	/**
	 * 修改商品图片
	 * 
	 * @throws Exception
	 */
	public void addTheProductImages() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			if (productId == null && "".equals(productId)) {
				bean.setMsg("商品不存在！");
				bean.setStatus(400);
			} else {

				productManager.updateTheProductImages(productId, imgpath);
				bean.setStatus(200);
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));

	}

	String attribute, attributeValue;

	/**
	 * 添加商品属性名称、值
	 * 
	 * @throws Exception
	 */
	public void addTheProductAttribute() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap attrBate = (HashMap) productManager.addTheNewAttribute(
					productId, attribute, attributeValue);
			bean.setRows(attrBate);
			bean.setStatus(200);
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));

	}

	String proAValue, skuKind;

	/**
	 * 商品Sku添加
	 * 
	 * @throws Exception
	 */
	public void addTheProductSku() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			HashMap parm = new HashMap();
			Integer i=productManager.findSKUnumber(productId);			
			DecimalFormat df=new DecimalFormat("000");
			String shCode=productId+df.format(i+1);
			parm.put("skuNo", shCode);
			parm.put("productId", productId);
			parm.put("skuKind", skuKind);
			parm.put("price", Float.valueOf(price));
			parm.put("oldPrice", Float.valueOf(oldPrice));

			Long sid = (Long) productManager.addTheProductSku(proAValue, parm);
			if (sid > 0) {
				bean.setStatus(200);
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	Long attributeId;

	/**
	 * 修改product_attribute状态
	 * 
	 * @throws Exception
	 */
	public void updateTheAttrType() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			Integer a = (Integer) productManager.updateTheAttrType(attributeId);
			if (a > 0) {
				bean.setStatus(200);
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	private Long skuId;

	/**
	 * 修改sku状态
	 * 
	 * @throws Exception
	 */
	public void updateTheSkuType() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {
			Integer a = (Integer) productManager.updateTheSkuType(skuId);
			if (a > 0) {
				bean.setStatus(200);
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	String fontTime, backTime, likeName;

	public void findProductCommenst() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		try {

			HashMap<String, Object> prodCommlst = new HashMap<String, Object>();
			prodCommlst.put("size", size);
			prodCommlst.put("startIndex", (page - 1) * size);
			prodCommlst.put("fontTime", fontTime);
			prodCommlst.put("backTime", backTime);
			prodCommlst.put("likeName", likeName);
			prodCommlst.put("productId", productId);

			List<?> list = (List<?>) productManager
					.findProductCommenst(prodCommlst);
			if (list.size() > 0) {
				bean.setRows(list);
				bean.setStatus(200);
				bean.setTotal(productManager
						.findProductCommenstCount(prodCommlst));
			} else {
				bean.setMsg("没有数据！");
			}
		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.sql.Timestamp.class,
				new JsonDateValueProcessor("yyyy-MM-dd HH:mm:ss"));

		String json = JSONObject.fromObject(bean, jsonConfig).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	String produCommId;

	public void updtProductCommentl() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		try {
			if (user != null) {
				productManager.updtProductCommentl(productId, produCommId);
				bean.setStatus(200);
			}

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.sql.Timestamp.class,
				new JsonDateValueProcessor("yyyy-MM-dd HH:mm:ss"));

		String json = JSONObject.fromObject(bean, jsonConfig).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 首页推荐商品
	 */
	Integer filName, filValue, filnum,type;
	String shopProductId;

	public void companyShopProductWebExtend() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		try {
			if (user != null) {
				String functionType=null;
				if(type!=null){
					functionType=Commonparam.SHOPPRODUCT_FUNCTION_TYPE[type];
				}
				
				String s = productManager.companyShopProductWebExtend(shopProductId,
						Commonparam.SHOPPRODUCT_COLUMNS[filName], filValue, filnum,functionType);
				if (s == null) {
					bean.setStatus(200);
				} else {
					bean.setMsg(s);
				}
			}		
		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}

		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public Integer getExtend() {
		return extend;
	}

	public void setExtend(Integer extend) {
		this.extend = extend;
	}

	public Integer getFilName() {
		return filName;
	}

	public void setFilName(Integer filName) {
		this.filName = filName;
	}

	public Integer getFilValue() {
		return filValue;
	}

	public void setFilValue(Integer filValue) {
		this.filValue = filValue;
	}

	public Integer getFilnum() {
		return filnum;
	}

	public void setFilnum(Integer filnum) {
		this.filnum = filnum;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getShopProductId() {
		return shopProductId;
	}

	public void setShopProductId(String shopProductId) {
		this.shopProductId = shopProductId;
	}

	public String getFontTime() {
		return fontTime;
	}

	public void setFontTime(String fontTime) {
		this.fontTime = fontTime;
	}

	public String getBackTime() {
		return backTime;
	}

	public void setBackTime(String backTime) {
		this.backTime = backTime;
	}

	public String getLikeName() {
		return likeName;
	}

	public void setLikeName(String likeName) {
		this.likeName = likeName;
	}

	public String getProduCommId() {
		return produCommId;
	}

	public void setProduCommId(String produCommId) {
		this.produCommId = produCommId;
	}

	public String getProAValue() {
		return proAValue;
	}

	public void setProAValue(String proAValue) {
		this.proAValue = proAValue;
	}

	public String getSkuKind() {
		return skuKind;
	}

	public void setSkuKind(String skuKind) {
		this.skuKind = skuKind;
	}

	public String getPrice() {
		return price;
	}

	public String getOldPrice() {
		return oldPrice;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public void setOldPrice(String oldPrice) {
		this.oldPrice = oldPrice;
	}

	public Long getProductNumber() {
		return productNumber;
	}

	public void setProductNumber(Long productNumber) {
		this.productNumber = productNumber;
	}

	public String getStartTime() {
		return startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public String getInvoice() {
		return invoice;
	}

	public String getAfterRepair() {
		return afterRepair;
	}

	public String getTimeType() {
		return timeType;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public void setInvoice(String invoice) {
		this.invoice = invoice;
	}

	public void setAfterRepair(String afterRepair) {
		this.afterRepair = afterRepair;
	}

	public void setTimeType(String timeType) {
		this.timeType = timeType;
	}

	public Integer getSize() {
		return size;
	}

	public Integer getPage() {
		return page;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public String getForeignName() {
		return foreignName;
	}

	public void setForeignName(String foreignName) {
		this.foreignName = foreignName;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Long getProductId() {
		return productId;
	}

	public void setProductId(Long productId) {
		this.productId = productId;
	}

	public Long getProductCategoryId() {
		return productCategoryId;
	}

	public void setProductCategoryId(Long productCategoryId) {
		this.productCategoryId = productCategoryId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getFactory() {
		return factory;
	}

	public void setFactory(String factory) {
		this.factory = factory;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getFeature() {
		return feature;
	}

	public void setFeature(String feature) {
		this.feature = feature;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public Long getCreateUserId() {
		return createUserId;
	}

	public void setCreateUserId(Long createUserId) {
		this.createUserId = createUserId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Long getLastEditUserId() {
		return lastEditUserId;
	}

	public void setLastEditUserId(Long lastEditUserId) {
		this.lastEditUserId = lastEditUserId;
	}

	public Integer getShareCount() {
		return shareCount;
	}

	public void setShareCount(Integer shareCount) {
		this.shareCount = shareCount;
	}

	public Integer getStarScore() {
		return starScore;
	}

	public void setStarScore(Integer starScore) {
		this.starScore = starScore;
	}

	public Object getIsCollection() {
		return isCollection;
	}

	public void setIsCollection(Object isCollection) {
		this.isCollection = isCollection;
	}

	public Integer getSellCount() {
		return sellCount;
	}

	public void setSellCount(Integer sellCount) {
		this.sellCount = sellCount;
	}

	public Integer getStock() {
		return stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public Object getTagList() {
		return tagList;
	}

	public void setTagList(Object tagList) {
		this.tagList = tagList;
	}

	public Object getSku() {
		return sku;
	}

	public void setSku(Object sku) {
		this.sku = sku;
	}

	public Object getImage() {
		return image;
	}

	public void setImage(Object image) {
		this.image = image;
	}

	public Long getCompanyId() {
		return companyId;
	}

	public void setCompanyId(Long companyId) {
		this.companyId = companyId;
	}

	public Long getCompanyShopProductId() {
		return companyShopProductId;
	}

	public void setCompanyShopProductId(Long companyShopProductId) {
		this.companyShopProductId = companyShopProductId;
	}

	public List<String> getImgList() {
		return imgList;
	}

	public void setImgList(List<String> imgList) {
		this.imgList = imgList;
	}

	public String getShopImage() {
		return shopImage;
	}

	public void setShopImage(String shopImage) {
		this.shopImage = shopImage;
	}

	public List<ProductAttribute> getAllAttrList() {
		return allAttrList;
	}

	public void setAllAttrList(List<ProductAttribute> allAttrList) {
		this.allAttrList = allAttrList;
	}

	public String getAllSkuList() {
		return allSkuList;
	}

	public void setAllSkuList(String allSkuList) {
		this.allSkuList = allSkuList;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getHiddenImage() {
		return hiddenImage;
	}

	public void setHiddenImage(String hiddenImage) {
		this.hiddenImage = hiddenImage;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getProductTagId() {
		return productTagId;
	}

	public void setProductTagId(String productTagId) {
		this.productTagId = productTagId;
	}

	public File getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(File uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getUploadFileFileName() {
		return uploadFileFileName;
	}

	public void setUploadFileFileName(String uploadFileFileName) {
		this.uploadFileFileName = uploadFileFileName;
	}

	public String getImgpath() {
		return imgpath;
	}

	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}

	public String getAttribute() {
		return attribute;
	}

	public void setAttribute(String attribute) {
		this.attribute = attribute;
	}

	public String getAttributeValue() {
		return attributeValue;
	}

	public void setAttributeValue(String attributeValue) {
		this.attributeValue = attributeValue;
	}

	public Long getAttributeId() {
		return attributeId;
	}

	public void setAttributeId(Long attributeId) {
		this.attributeId = attributeId;
	}

	public Long getSkuId() {
		return skuId;
	}

	public void setSkuId(Long skuId) {
		this.skuId = skuId;
	}

	public Long getCompanyShopId() {
		return companyShopId;
	}

	public void setCompanyShopId(Long companyShopId) {
		this.companyShopId = companyShopId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

}
