package com.chj.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.chj.entity.Category;
import com.chj.entity.JsonTimestampProcessor;
import com.chj.entity.Personnel;
import com.chj.entity.Product;
import com.chj.entity.Productshopcategory;
import com.chj.entity.Shop;
import com.chj.entity.Shoptag;
import com.chj.entity.User;
import com.chj.service.ProductshopcategoryManager;
import com.json.BaseBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import cn.eavic.framework.web.BaseAction;

@Namespace("/")
@Results({ @Result(name = BaseAction.NONE, location = "productshopcategoryAction.action", type = "redirect"), })
public class ProductshopcategoryAction extends ActionSupport {

	private static final long serialVersionUID = 7655056122242830524L;

	@Autowired
	ProductshopcategoryManager productshopcategoryManager;

	private Integer size, page;
	private String name;
	private Long parentId;
	private Long shopId;
	private Date creationTime;
	private Long productShopCategoryId;
	private String categoryId;
	private String productCategory;
	private String newCategoryName;

	/**
	 * 修改库存量
	 * 
	 * @throws Exception
	 */
	private String companyShopProductId, stock, functionType,stockDay;

	public void updateCompanyShopProductStock() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("companyShopProductId", companyShopProductId);
			map.put("stock", stock);
			map.put("stockDay", stockDay);
			map.put("functionType", functionType==null?"":functionType);

			productshopcategoryManager.updateCompanyShopProductStock(map);
			bean.setStatus(200);

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}

		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	// 商品分类列表
	public void findProductShopCategoryList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			HashMap<String, Object> categoryList = new HashMap<String, Object>();

			categoryList.put("shopId", shopId);
			List<Object> list = productshopcategoryManager
					.findProductShopCategoryList(categoryList);

			bean.setStatus(200);
			bean.setRows(list);

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
		}
		// datetime格式转换
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(java.sql.Timestamp.class,
				new JsonTimestampProcessor());
		String json = JSONObject.fromObject(bean, jsonConfig).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	// 删除分类
	public void deleteCategory() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			String categoryId = request.getParameter("selectedShopId");
			if (categoryId != null && categoryId != "") {
				String[] idStr = categoryId.split(",");
				List<Long> idList = new ArrayList<Long>();
				for (int i = 0; i < idStr.length; i++) {
					idList.add(Long.parseLong(idStr[i]));// 分类ID
				}
				productshopcategoryManager.deleteCategory(idList);
				bean.setStatus(200);
			}
		} catch (Exception e) {
			System.out.println("删除不成功");
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
			e.printStackTrace();
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));

	}

	// 增加分类
	public void saveProductShopCategory() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			Productshopcategory productshopcategory = new Productshopcategory();
			productshopcategory.setName(newCategoryName);
			productshopcategory.setShopId(shopId);
			Object category = productshopcategoryManager
					.addProductShopCategory(productshopcategory);
			bean.setStatus(200);
		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
			e.printStackTrace();
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	// 更新信息
	private String categoryName;
	private Integer categorynumber;

	public void updateCategory() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			if(personnel!=null){								
				HashMap<String, Object> product = new HashMap<String, Object>();
				product.put("name", categoryName);
				product.put("categoryId", categoryId);
				product.put("shopId", shopId);
				product.put("orderField", categorynumber==null?1:categorynumber);
				productshopcategoryManager.updateCategory(product);
				bean.setStatus(200);				
			}			
		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Integer getCategorynumber() {
		return categorynumber;
	}

	public void setCategorynumber(Integer categorynumber) {
		this.categorynumber = categorynumber;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}

	public String getName() {
		return name;
	}

	public Long getParentId() {
		return parentId;
	}

	public Long getShopId() {
		return shopId;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public void setShopId(Long shopId) {
		this.shopId = shopId;
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

	public void setPage(Integer page) {
		this.page = page;
	}

	public Date getCreationTime() {
		return creationTime;
	}

	public String getCompanyShopProductId() {
		return companyShopProductId;
	}

	public void setCompanyShopProductId(String companyShopProductId) {
		this.companyShopProductId = companyShopProductId;
	}

	public String getStock() {
		return stock;
	}

	public void setStock(String stock) {
		this.stock = stock;
	}

	public void setCreationTime(Date creationTime) {
		this.creationTime = creationTime;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public Long getProductShopCategoryId() {
		return productShopCategoryId;
	}

	public void setProductShopCategoryId(Long productShopCategoryId) {
		this.productShopCategoryId = productShopCategoryId;
	}

	public String getNewCategoryName() {
		return newCategoryName;
	}

	public void setNewCategoryName(String newCategoryName) {
		this.newCategoryName = newCategoryName;
	}

	public String getFunctionType() {
		return functionType;
	}

	public void setFunctionType(String functionType) {
		this.functionType = functionType;
	}

	public String getStockDay() {
		return stockDay;
	}

	public void setStockDay(String stockDay) {
		this.stockDay = stockDay;
	}

}
