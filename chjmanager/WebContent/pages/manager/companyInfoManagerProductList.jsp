<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>企业列表</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${ctx}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx}/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${ctx}/css/uniform.css" />
<link rel="stylesheet" href="${ctx}/css/select2.css" />
<link rel="stylesheet" href="${ctx}/css/matrix-style.css" />
<link rel="stylesheet" href="${ctx}/css/matrix-media.css" />
<link rel="stylesheet" href="${ctx}/css/bootstrap-wysihtml5.css" />
<link href="${ctx}/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${ctx}/css/pager.css" />
</head>
<body>

	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>

	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="../index.jsp" title="主页" class="tip-bottom"><i
					class="icon-home"></i> 主页</a>
				<c:if test="${param.companyId!=0}">
					<c:if test="${empty param.companyShopId}">
						<a onclick="window.history.go(-1)" class="current"
							href="javascript:void(0)"> <i class=" icon-fire"></i>企业列表
						</a>
						<a href="#" class="current">商品列表</a>
					</c:if>
					<c:if test="${not empty param.companyShopId}">
						<a onclick="window.history.go(-1)" class="current"
							href="javascript:void(0)"> <i class=" icon-fire"></i>店铺列表
						</a>
						<a href="#" class="current">商品列表</a>
					</c:if>
				</c:if>
				<c:if test="${param.companyId==0}">
					<c:if test="${empty param.companyShopId}">
						<a href="#" class="current">所有企业下商品列表</a>
					</c:if>
					<c:if test="${param.companyShopId==0}">
						<a href="#" class="current">所有店铺下商品列表</a>
					</c:if>
				</c:if>
			</div>
		</div>

		<div style="padding: 10px 0 0 20px;">
			<table style="width: 100%; font-size: 14px; font-weight: bold;">
				<tr>
					<c:if test="${not empty param.companyShopId}">
						<td width="120px"><input type="checkbox" value="1"
							id="extend" />推荐或置顶</td>
					</c:if>

					<c:if test="${param.companyId==0}">
						<td width="40px">企业:</td>
						<td width="100px"><input
							style="margin-top: 8px; width: 150px;" type="text"
							id="companyName" placeholder="企业名称"></td>
					</c:if>

					<td width="40px">商品:</td>
					<td width="100px"><input
						style="margin-top: 8px; width: 150px;" type="text"
						id="productName" placeholder="商品名称"></td>
					<td><input style="font-size: 20px; cursor: pointer;"
						type="button" value="查询" class="btn btn-success"
						onclick="loadData(1)"></td>
				</tr>
			</table>
		</div>

		<div class="row-fluid"
			style="padding-left: 20px; background-color: #FFF; padding-bottom: 10px;">
			<div class="span12">
				<div class="widget-box" style="margin-right: 40px;">
					<table class="table table-bordered table-striped with-check"
						style="margin: 0px; float: right; border: 1px solid #ccc;">
						<thead>
							<tr>
								<th style="width: 20px;"><input type="checkbox" /></th>
								<th style="width: 100px">商品名称</th>
								<th style="width: 150px">所属公司</th>
								<c:if test="${empty param.companyShopId}">
									<th style="width: 100px;">商品产地</th>
									<th style="width: 150px;">商品厂商</th>
									<th>商品描述</th>
									<th style="width: 80px;">商品评论</th>
								</c:if>
								<c:if test="${not empty param.companyShopId}">
									<th style="width: 150px">店铺名称</th>

									<th style="width: 50px">web首<br />页置顶
									</th>
									<th style="width: 40px">推广/<br />促销
									</th>
									<th style="width: 40px">web推<br />广推荐
									</th>
									<th style="width: 40px">web促<br />销推荐
									</th>
									<th style="width: 40px">web分<br />类推荐
									</th>
									<th style="width: 40px">手机首<br />页推荐
									</th>
									<th style="width: 40px">手机便<br />捷推荐
									</th>
								</c:if>
							</tr>
						</thead>
						<tbody id="table_content">
						</tbody>
					</table>
					<div class="widget-title"
						style="height: 50px; border: 1px solid #ccc; float: right; width: 100%;">
						<c:if test="${empty param.companyShopId}">
							<div class="btn-group" style="margin-top: 6px; float: left;">
								<button class="btn btn-warning" style="margin: 0 5px;"
									onclick="delShopProduct()">删&nbsp;&nbsp;除</button>
							</div>
						</c:if>
						<div class="btn-group" style="margin-top: 6px; float: right;">
							<button class="btn" id="pagesize">10</button>
							<button data-toggle="dropdown" class="btn dropdown-toggle">
								<span class="caret" style="height: 6px;"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a href="javascript:void(0)" onclick="loadData(1,10)">10</a></li>
								<li class="divider"></li>
								<li><a href="javascript:void(0)" onclick="loadData(1,20)">20</a></li>
								<li class="divider"></li>
								<li><a href="javascript:void(0)" onclick="loadData(1,50)">50</a></li>
								<li class="divider"></li>
								<li><a href="javascript:void(0)" onclick="loadData(1,100)">100</a></li>
							</ul>
						</div>
						<div class="pagination alternate"
							style="margin-left: 30px; margin-top: 8px; float: right;">
							<div id="pager"></div>
						</div>

					</div>
					<c:if test="${not empty param.companyShopId}">
						<div class="widget-title"
							style="border: 1px solid #ccc; float: right; width: 100%; height: auto;">
							<div class="btn-group" style="float: left;">
								<button class="btn btn-warning" style="margin:5px;"
									onclick="delShopProduct()">删&nbsp;&nbsp;除</button>
								<button class="btn btn-warning" style="margin: 5px;"
									onclick="webFirstExtend(2,1,24)">web置顶</button>
								<button class="btn btn-warning" style="margin: 5px;"
									onclick="webFirstExtend(2,0,0)">取消置顶</button>
								<button class="btn btn-warning" style="margin: 5px;"
									onclick="webFirstExtend(3,1,4)">web推广</button>
								<button class="btn btn-warning" style="margin: 5px;"
									onclick="webFirstExtend(3,0,0)">取消推广</button>
								<button class="btn btn-warning" style="margin: 5px;"
									onclick="webFirstExtend(10,1,4)">web促销</button>
								<button class="btn btn-warning" style="margin: 5px;"
									onclick="webFirstExtend(10,0,0)">取消促销</button>
								<button class="btn btn-warning" style="margin: 5px;"
									onclick="webFirstExtend(4,1,4)">web分类</button>
								<button class="btn btn-warning" style="margin: 5px;"
									onclick="webFirstExtend(4,0,0)">取消分类</button><br />
								<button class="btn btn-warning" style="margin: 5px;"
									onclick="webFirstExtend(0,1,3)">手机首页</button>
								<button class="btn btn-warning" style="margin: 5px;"
									onclick="webFirstExtend(0,0,0)">取消首页</button>
								<button class="btn btn-warning" style="margin: 5px;"
									onclick="webFirstExtend(1,1,3)">手机便捷</button>
								<button class="btn btn-warning" style="margin: 5px;"
									onclick="webFirstExtend(1,0,0)">取消便捷</button>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/common/buttom.jsp"></jsp:include>

	<script src="${ctx}/js/jquery.min.js"></script>
	<script src="${ctx}/js/jquery.ui.custom.js"></script>
	<script src="${ctx}/js/bootstrap.min.js"></script>
	<script src="${ctx}/js/jquery.uniform.js"></script>
	<script src="${ctx}/js/select2.min.js"></script>
	<script src="${ctx}/js/jquery.dataTables.min.js"></script>
	<script src="${ctx}/js/matrix.js"></script>
	<script src="${ctx}/js/matrix.tables.js"></script>
	<script src="${ctx}/js/myself/ajaxupload.js"></script>
	<script src="${ctx}/js/mypage.js"></script>
	<script src="${ctx}/js/jquery.pager.js"></script>
</body>
</html>
<script type="text/javascript">
	var companyId = '${param.companyId}';
	var companyShopId = '${param.companyShopId}';

	$(function() {
		loadData(1);
	});

	function loadData(page, size, name) {
		if (size != undefined) {
			pageinfo["size"] = size;
			$('#pagesize').html(size);
		}
		if (page == -1)
			pageinfo["page"]--;
		else if (page == -2)
			pageinfo["page"]++;
		else {
			if (page >= pageinfo["tp"] && pageinfo["tp"] > 0)
				pageinfo["page"] = pageinfo["tp"];
			else
				pageinfo["page"] = page;
		}

		pageinfo["companyId"] = companyId == 0 ? '' : companyId;
		pageinfo["name"] = $.trim($('#productName').val());

		var url = '${ctx}/product!findProductList.action';
		if (companyId == 0) {
			pageinfo["companyName"] = $.trim($('#companyName').val());
		}
		if (companyShopId != null && $.trim(companyShopId) != '') {
			pageinfo["companyShopId"] = companyShopId == 0 ? '' : companyShopId;
			var top = document.getElementById("extend");
			if (top.checked) {
				pageinfo["extend"] = 1;
			} else {
				pageinfo["extend"] = 0;
			}
			url = '${ctx}/product!findShopProductList.action';
		}

		$
				.ajax({
					type : "post",
					url : url,
					dataType : 'json',
					data : pageinfo,
					success : function(msg, status) {
						var array = [];
						if (msg.status == 200) {
							for ( var i = 0; i < msg.rows.length; i++) {
								var data = msg.rows[i];
								array
										.push('<tr><td><input name="productId" type="checkbox" value="'
												+ data["product_id"] + '" ');

								if (companyShopId != null
										&& $.trim(companyShopId) != '') {
									array.push(' shopProductId="'
											+ data["company_shop_product_id"]
											+ '" functType="'
											+ data["function_type"] + '"  ');
								}
								array.push('/></td>');
								array.push('<td>' + data["name"] + '</td>');
								array.push('<td>' + data["company"] + '</td>');

								if (companyShopId == null
										|| $.trim(companyShopId) == '') {
									array
											.push('<td>' + data["place"]
													+ '</td>');
									array.push('<td>' + data["factory"]
											+ '</td>');
									var content = $.trim(data["content"]);
									if (content != '') {
										content = content.replace(
												/<\/?[^>]*>/g, '').replace(
												/\n[\s| | ]*\r/g, '')
												.substring(0, 200)
												+ '...';
									}
									array.push('<td>' + content + '</td>');

									if (data["comCount"] > 0) {
										array
												.push('<td style="text-align:center;"><a href="javascript:void(0)" onclick="queryCommOfProduct('
														+ data["product_id"]
														+ ')">查看评论</a></td>');
									} else {
										array
												.push('<td align="center"></td>');
									}
								} else {

									array.push('<td>' + data["shop"] + '</td>');

									if (data["first_extend"] > 0) {
										array
												.push('<td style="text-align:center;">首页置顶<br /><span style="color:red;">第'
														+ data["first_extend"]
														+ '位<span></td>');
									} else {
										array.push('<td></td>');
									}
									if (data["order_field_function"] > 0) {
										if (data["function_type"] == 'T') {
											array.push('<td>是推广</td>');
											array
													.push('<td style="text-align:center;">web推广<br /><span style="color:red;">第'
															+ data["order_field_function"]
															+ '位<span></td>');
											array.push('<td></td>');
										} else if (data["function_type"] == 'C') {
											array.push('<td>是促销</td>');
											array.push('<td></td>');
											array
													.push('<td style="text-align:center;">web促销<br /><span style="color:red;">第'
															+ data["order_field_function"]
															+ '位<span></td>');
										} else {
											array.push('<td></td>');
											array.push('<td></td>');
											array.push('<td></td>');
										}
									} else {
										if (data["function_type"] == 'T') {
											array.push('<td>是推广</td>');
										} else if (data["function_type"] == 'C') {
											array.push('<td>是促销</td>');
										} else {
											array.push('<td></td>');
										}
										array.push('<td></td>');
										array.push('<td></td>');
									}
									if (data["order_field_category"] > 0) {
										array
												.push('<td style="text-align:center;">分类推荐<br /><span style="color:red;">第'
														+ data["order_field_category"]
														+ '位<span></td>');
									} else {
										array.push('<td></td>');
									}

									if (data["first_phone_extend"] > 0) {
										array
												.push('<td style="text-align:center;">手机首页<br /><span style="color:red;">第'
														+ data["first_phone_extend"]
														+ '位<span></td>');
									} else {
										array.push('<td></td>');
									}

									if (data["relation_phone_extend"] > 0) {
										array
												.push('<td style="text-align:center;">手机便捷<br /><span style="color:red;">第'
														+ data["relation_phone_extend"]
														+ '位<span></td>');
									} else {
										array.push('<td></td>');
									}
								}
								array.push('</tr>');
							}
							$('#table_content').html(array.join(''));
							if (msg.total > pageinfo["size"]) {
								if (msg.total % pageinfo["size"] == 0)
									pageinfo["tp"] = msg.total
											/ pageinfo["size"];
								else
									pageinfo["tp"] = Math.ceil(msg.total
											/ pageinfo["size"]);
								$("#pager").pager({
									pagenumber : pageinfo["page"],
									pagecount : pageinfo["tp"],
									buttonClickCallback : PageClick
								});
							} else {
								$('#pager').html('');
							}
						} else {
							$('#pager').html('');
							if (companyShopId == null
									|| $.trim(companyShopId) == '') {
								$('#table_content').html(
										'<tr><td colspan="7">' + msg.msg
												+ '</td></tr>');
							} else {
								$('#table_content').html(
										'<tr><td colspan="11">' + msg.msg
												+ '</td></tr>');
							}
						}
					}
				});
	}

	function delShopProduct() {
		if ($("#table_content").find("input[type=checkbox]:checked").size() == 0) {
			alert("请选择需要删除的商品记录！");
		} else {
			if (confirm("您确认删除所选商品记录吗？")) {
				var label = "";
				$("#table_content").find("input[type=checkbox]:checked").each(
						function() {
							if (companyShopId == null
									|| $.trim(companyShopId) == '') {
								label = label + $(this).attr("value") + ",";
							} else {
								label = label + $(this).attr("shopProductId")
										+ ",";
							}
						});

				var urli = '';
				var vdata = {};
				if (companyShopId == null || $.trim(companyShopId) == '') {
					vdata["selectedProductId"] = label;
					urli = '${ctx}/product!deleteProductInfo.action';
				} else {
					vdata["ids"] = label;
					vdata["shopId"] = '${param.companyShopId}';
					urli = '${ctx}/optionaproductcategory!deleteShopSelectedProduct.action';
				}

				$.ajax({
					type : "post",
					data : vdata,
					url : urli,
					dataType : 'json',
					success : function(msg, status) {
						if (msg.status == 200) {
							alert("删除成功！");
							window.location.reload();
						} else {
							alert(msg.msg);
						}
					}
				});
			}
		}
	}

	PageClick = function(pageclickednumber) {
		$("#pager").pager({
			pagenumber : pageclickednumber,
			pagecount : pageinfo["tp"],
			buttonClickCallback : PageClick
		});
		loadData(pageclickednumber);
	};

	function queryCommOfProduct(productId) {
		window.location.href = "${ctx}/pages/manager/ProductComment.jsp?productId="
				+ productId;
	}
	function webFirstExtend(filName, filValue, filnum) {
		var str = [];
		var type = '';
		var bool = true;
		$('input[name="productId"]:checked').each(
				function(k, v) {
					if (this.checked) {
						if (k == 0) {
							type = $(this).attr('functType');
						}
						if (filnum > 0) {
							var text = $(this).parent().next().html();
							if (filName == 3
									&& $(this).attr('functType') != 'T') {
								alert(text + '\n不是推广商品，不能推荐！');
								bool = false;
							} else if (filName == 10
									&& $(this).attr('functType') != 'C') {
								alert(text + '\n不是促销商品，不能推荐！');
								bool = false;
							}
						}
						str.push($(this).attr('shopProductId'));
					}
				});
		if (bool == false) {
			return;
		} else if (str.length == 0) {
			alert('请选择对象！');
			return;
		} else if (filnum != 0 && str.length > filnum) {
			alert('设定数量超出' + filnum + '个范围！');
			return;
		}

		if (filnum > 0) {
			filValue = prompt('请输入推荐顺序(范围：1-' + filnum + ')，最多可推荐' + filnum
					+ '个', '1');
			if (filValue == '' || filValue == null) {
				return;
			} else if (isNaN(filValue)) {
				alert('请输入数字！');
				return;
			}
		}

		var setData = {};
		setData["filValue"] = filValue;
		setData["shopProductId"] = str.join(',');
		setData["filName"] = filName == 10 ? 3 : filName;
		setData["filnum"] = filnum;
		if (filName == 3 || filName == 10) {
			type = type == 'T' ? 0 : type == 'C' ? 1 : 2;
			if (type == 2) {
				return;
			}
			setData["type"] = type;
		}

		$.ajax({
			type : "post",
			data : setData,
			url : '${ctx}/product!companyShopProductWebExtend.action',
			dataType : 'json',
			success : function(msg, status) {
				if (msg.status == 200) {
					alert("设置成功！");
					window.location.reload();
				} else {
					alert(msg.msg);
				}
			}
		});
	}
	function productInfo(productId, companyId) {
		location.href = "${ctx}/product!updateProductInfo.action?productId="
				+ productId + "&companyId=" + companyId;
	}
</script>




