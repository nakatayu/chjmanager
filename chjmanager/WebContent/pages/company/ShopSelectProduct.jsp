<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/checklogin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>服务供应商维护</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${ctx}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${ctx}/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="${ctx}/css/uniform.css" />
<link rel="stylesheet" href="${ctx}/css/select2.css" />
<link rel="stylesheet" href="${ctx}/css/matrix-style.css" />
<link rel="stylesheet" href="${ctx}/css/matrix-media.css" />
<link href="${ctx}/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800'
	rel='stylesheet' type='text/css'>
</head>
<body>

	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>



	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="${ctx}/pages/index.jsp" title="主页" class="tip-bottom"><i
					class="icon-home"></i> 主页</a> <a
					href="${ctx}/pages/company/ShopList.jsp" title="店铺设置"
					class="tip-bottom"><i class="icon icon-signal"></i> 店铺设置</a> <a
					href="#" class="current">店铺(商品SKU选择)</a>

			</div>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="widget-box" style="margin-bottom: 0px;">
					<div class="widget-title">
						<span class="icon"><i class="icon-th"></i></span>
						<h5>商品列表</h5>
					</div>

					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<td width="200px">商品名称</td>
								<td>是否促销</td>
								<td>商品SKU</td>
								<td>商品价格</td>
								<td width="450px">商品默认库存</td>
							</tr>
						</thead>
						<tbody id="table_content">

							<c:forEach items="${productShops }" var="productShop">
								<c:set var="productName" value="${productShop.productName }"></c:set>
								<c:forEach items="${productShop.sku }" var="skuMap"
									varStatus="skuNum">
									<tr>
										<c:if test="${skuNum.index==0 }">
											<td rowspan=${productShop.skuCount }><label
												class="control-label"> <input type="checkbox" id=""
													name="" value="${productShop.productId}" />
													${productShop.productName}
											</label></td>
										</c:if>
										<td><label class="control-label"> <input
												type="checkbox" id="" name="" value="${skuMap.skuId }" />
												${skuMap.skuName }
										</label></td>
										<td>
											<div class="control-group">
												<div class="controls">
													<input id="" type="text" name="" style="width: 250px;" />
												</div>
											</div>
										</td>
										<td>

											<div class="control-group">
												<div class="controls">
													<input type="radio" id="deliverOk" name="${skuMap.skuId }"
														value="T" style="margin-left: 0px" />推广 <input
														type="radio" id="deliverOk" name="${skuMap.skuId }"
														value="F" style="margin-left: 0px" />促销
												</div>
											</div>
										</td>
									</tr>
								</c:forEach>
							</c:forEach>
						</tbody>
					</table>

					<div class="widget-title"
						style="height: 40px; border: 1px solid #ccc; padding-bottom: 4px; padding-left: 20px;">

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
							<ul id="ul-page">

							</ul>
						</div>
						<div class="pagination alternate"
							style="margin-left: 0px; margin-top: 8px; float: left;">
							<button class="btn btn-warning" onclick="saveProduct()">保&nbsp;&nbsp;&nbsp;&nbsp;存</button>
						</div>
					</div>

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
	<script src="${ctx}/js/myself/json2.js"></script>

</body>
</html>
<script type="text/javascript">
	$(function() {
		//店铺待选商品列表
		loadData(1);

	});

	function loadData(page, size) {
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
		pageinfo["shopId"] = '${shopId}';
		$
				.ajax({
					type : "post",
					url : '${ctx}/optionaproductcategory!findShopUnselectProduct.action',
					dataType : 'json',
					timeout : 10000,
					data : pageinfo,
					success : function(msg, status) {
						if (msg.status == 200) {
							var array = [];
							for ( var i = 0; i < msg.rows.length; i++) {
								var data = msg.rows[i];
								for ( var h = 0; h < data["skuList"].length; h++) {
									var sku = data["skuList"][h];
									var td0 = '';
									if (h == 0) {
										td0 = '<td rowspan='
												+ (data["skuList"].length == 0 ? 1
														: data["skuList"].length)
												+ '>'
												+ '<label>'
												+ '<input type="checkbox"  name="proCheck" value="'+data["productId"]+'" /> '
												+ data["productName"]
												+ ''
												+ '</label> '
												+ '</td>'
												+ '<td rowspan='
												+ (data["skuList"].length == 0 ? 1
														: data["skuList"].length)
												+ '>'
												+ '<input type="radio" checked name="function_'+data["productId"]+'" value=""  style="margin-left:0px"/>无'
												+ '<input type="radio" name="function_'+data["productId"]+'" value="T"  style="margin-left:0px"/>推广'
												+ '<input type="radio" name="function_'+data["productId"]+'" value="C" style="margin-left:0px"/>促销'
												+ '</td>';
									}
									var str = '<tr">'
											+ td0
											+ '<td>'
											+ '<label>'
											+ '	<input type="checkbox"  name="skuCheck_'+data["productId"]+'" value="'+sku["productSkuId"]+'" /> '
											+ sku["skuKind"]
											+ '</label>'
											+ '</td>'
											+ '<td>'
											+ '<label>'
											+ sku["price"]
											+ '</label>'
											+ '</td>'
											+ '<td><input id="stock_'+data["productId"]+'_'+sku["productSkuId"]+'" type="text" style="width: 100px;" value="100" />'
											+ '</td></tr>';
									array.push(str);
								}
							}
							$('#table_content').html(array.join(''));
							array = null;

							var arrayPage = [];
							pageinfo["t"] = msg.total;
							if (msg.total % pageinfo["size"] == 0) {
								pageinfo["tp"] = msg.total / pageinfo["size"];
							} else {
								//向上取值
								pageinfo["tp"] = Math.ceil(msg.total
										/ pageinfo["size"]);
							}

							//如果最大页或当前页是1 上一页变灰不能点
							if (pageinfo["tp"] == 1 || pageinfo["page"] == 1
									|| pageinfo["tp"] == 0) {
								arrayPage
										.push('<li class="disabled"><a href="javascript:void(0)">上页</a></li>');
							} else {
								//变手型 （href="javascript:void(0)"）
								arrayPage
										.push('<li><a href="javascript:void(0)" onclick="loadData(-1)">上页</a></li>');
							}

							for ( var i = 1; i <= pageinfo["tp"]; i++) {
								if (i == pageinfo["page"]) {
									arrayPage
											.push('<li class="active"> <a href="javascript:void(0)" onclick="loadData('
													+ i
													+ ')">'
													+ i
													+ '</a></li>');
								} else {
									arrayPage
											.push('<li> <a href="javascript:void(0)" onclick="loadData('
													+ i
													+ ')">'
													+ i
													+ '</a> </li>');
								}

							}
							if (pageinfo["tp"] == pageinfo["page"]
									|| pageinfo["tp"] == 0) {
								arrayPage
										.push('<li class="disabled"><a href="javascript:void(0)">下页</a></li>');
							} else {
								arrayPage
										.push('<li><a href="javascript:void(0)" onclick="loadData(-2)">下页</a></li>');
							}

							$('#ul-page').html(arrayPage.join(''));
							arrayPage = null;

							$("[name=proCheck]:checkbox").click(
									function() {
										var flag = $(this).attr("checked");
										if (flag == 'checked')
											flag = true;
										else
											flag = false;
										$(
												"[name=skuCheck_"
														+ $(this).val()
														+ "]:checkbox").each(
												function() {
													$(this).attr("checked",
															flag);
												});

									});
						} else {
							alert(msg.msg);
						}
					}
				});

	}

	function saveProduct() {
		var proList = [];

		$.each($("[name=proCheck]:checkbox"), function() {
			var proId = $(this).val();
			var skuList = [];
			$("[name=skuCheck_" + proId + "]:checkbox").each(function() {
				var skuId = $(this).val();
				var flag = $(this).attr("checked");
				if (flag == 'checked') {
					if ($('#stock_' + proId + '_' + skuId).val().length == 0) {
						alert('请输入库存量!');
						return;
					}
					var sku = {};
					sku["skuId"] = skuId;
					sku["stock"] = $('#stock_' + proId + '_' + skuId).val();

					skuList.push(sku);
				}

			});
			if (skuList.length > 0) {
				var pro = {
					productId : proId,
					skuList : skuList,
					shopId : '${shopId}',
					shopCategoryId : '${shopCategoryId}'
				};
				$.each($("[name=function_" + proId + "]:radio"), function() {
					var flag = $(this).attr("checked");
					if (flag == 'checked') {
						pro["functionType"] = $(this).val();
					}
				});
				proList.push(pro);
			}

		});
		if (proList.length > 0) {

			$
					.ajax({
						type : "post",
						url : '${ctx}/optionaproductcategory!addCompanyShopProduct.action',
						dataType : 'json',
						timeout : 10000,
						data : {
							data : JSON.stringify(proList)
						},
						success : function(msg, status) {
							if (msg.status == 200) {
								alert('选择商品成功!');
								loadData(1);
							} else {
								alert(msg.msg);
							}
						}
					});
		} else {
			alert('请选择商品!');
		}

	}
</script>






