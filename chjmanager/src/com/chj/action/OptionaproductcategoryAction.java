package com.chj.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import cn.eavic.framework.web.BaseAction;

import com.chj.entity.Personnel;
import com.chj.entity.ProductShop;
import com.chj.entity.ShopProduct;
import com.chj.entity.ShopProductPart;
import com.chj.entity.User;
import com.chj.service.CompanyManager;
import com.chj.service.OptionalProductCategoryManager;
import com.json.BaseBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Namespace("/")
@Results({ @Result(name = BaseAction.NONE, location = "optionaproductcategoryAction.action", type = "redirect"), })
public class OptionaproductcategoryAction extends ActionSupport {
	private static final long serialVersionUID = 7655056122242830524L;
	@Autowired
	OptionalProductCategoryManager optionalProductCategoryManager;

	@Autowired
	CompanyManager companyManager;

	private Long productShopCategoryId;
	private String name;
	private Long shopId;

	// 商品店铺分类
	public void findOptionalCategory() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			Map<String, Object> optionalShop = new HashMap();
			optionalShop.put("shopId", personnel.getOrganizationalID());
			Object productInfo = optionalProductCategoryManager
					.findOptionalCategory(optionalShop);
			request.setAttribute("productInfo", productInfo);
			bean.setStatus(200);
			bean.setRows(productInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	// 店铺下商品列表
	public void shopProductList() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		try {
			Map<String, Object> categoryPro = new HashMap();
			categoryPro.put("shopId", shopId);
			Object categoryProRes = optionalProductCategoryManager
					.findOptionalCategory(categoryPro);
			request.setAttribute("categoryPro", categoryProRes);
			request.setAttribute("shopId", shopId);
			request.setAttribute("shopName", shopName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/pages/company/ShopOptionalProduct.jsp")
				.forward(request, response);
	}

	/**
	 * 店铺选择商品
	 * 
	 * @throws Exception
	 */
	private String shopName, shopCategoryId, shopCategoryName;

	public void shopSelectProduct() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");

		try {
			request.setAttribute("shopId", shopId);
			request.setAttribute("shopName", shopName);
			request.setAttribute("shopCategoryId", shopCategoryId);
			request.setAttribute("shopCategoryName", shopCategoryName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getRequestDispatcher("/pages/company/ShopSelectProduct.jsp")
				.forward(request, response);
	}

	/**
	 * 店铺待选商品列表
	 * 
	 * @throws Exception
	 */
	private Integer size, page;

	public void findShopUnselectProduct() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel personnel = (Personnel) request.getSession().getAttribute(
				"user");
		BaseBean bean = new BaseBean();
		try {
			if (personnel == null) {
				bean.setStatus(400);
				bean.setMsg("请登录!");
			} else {
				Map<String, Object> param = new HashMap();
				param.put("shopId", shopId);
				// param.put("shopId", personnel.getOrganizationalID());
				param.put("companyId", personnel.getCompanyId());
				// Long companyId = companyManager.findCompanyId(shopId);
				// param.put("companyId",companyId);
				param.put("size", size);
				param.put("startIndex", (page - 1) * size);
				List<ShopProductPart> shopProductList = optionalProductCategoryManager
						.findShopUnselectProduct(param);
				for (ShopProductPart part : shopProductList) {
					part.setSkuList(optionalProductCategoryManager
							.selectShopProductSkuList(shopId,
									part.getProductId()));
				}
				bean.setStatus(200);
				bean.setRows(shopProductList);
				bean.setTotal(optionalProductCategoryManager
						.findShopUnselectProductCount(param));
			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setRows(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 店铺已选商品列表
	 * 
	 * @throws Exception
	 */
	private String categoryId;

	public void findShopSelectedProduct() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");

		BaseBean bean = new BaseBean();
		try {
			if (user == null) {
				bean.setStatus(400);
				bean.setMsg("请登录!");
			} else {
				Map<String, Object> param = new HashMap();
				param.put("companyShopId", shopId);
				param.put("shopProCategoryId", categoryId);
				param.put("companyId", user.getCompanyId());
				param.put("size", size);
				param.put("startIndex", (page - 1) * size);
				List<ShopProduct> shopProductList = optionalProductCategoryManager
						.findShopSelectedProduct(param);
				bean.setStatus(200);
				bean.setRows(shopProductList);
				bean.setTotal(optionalProductCategoryManager
						.findShopSelectedProductCount(param));
			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 店铺添加商品
	 * 
	 * @throws Exception
	 */
	private String data;

	public void addCompanyShopProduct() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");

		BaseBean bean = new BaseBean();
		try {
			if (user == null) {
				bean.setStatus(400);
				bean.setMsg("请登录!");
			} else {
				optionalProductCategoryManager.addCompanyShopProduct(data);
				bean.setStatus(200);
				bean.setMsg("添加成功!");
			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	/**
	 * 删除店铺下商品
	 * 
	 * @throws Exception
	 */
	private String ids;

	public void deleteShopSelectedProduct() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		Personnel user = (Personnel) request.getSession().getAttribute("user");

		BaseBean bean = new BaseBean();
		try {
			if (user == null) {
				bean.setStatus(400);
				bean.setMsg("请登录!");
			} else {
				optionalProductCategoryManager.deleteShopSelectedProduct(ids,
						shopId);
				bean.setStatus(200);
				bean.setMsg("删除成功!");
			}

		} catch (Exception e) {
			bean.setStatus(400);
			bean.setMsg(e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public Long getProductShopCategoryId() {
		return productShopCategoryId;
	}

	public String getName() {
		return name;
	}

	public Long getShopId() {
		return shopId;
	}

	public void setProductShopCategoryId(Long productShopCategoryId) {
		this.productShopCategoryId = productShopCategoryId;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	public String getShopCategoryId() {
		return shopCategoryId;
	}

	public void setShopCategoryId(String shopCategoryId) {
		this.shopCategoryId = shopCategoryId;
	}

	public String getShopCategoryName() {
		return shopCategoryName;
	}

	public Integer getSize() {
		return size;
	}

	public void setSize(Integer size) {
		this.size = size;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public void setShopCategoryName(String shopCategoryName) {
		this.shopCategoryName = shopCategoryName;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setShopId(Long shopId) {
		this.shopId = shopId;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

}
