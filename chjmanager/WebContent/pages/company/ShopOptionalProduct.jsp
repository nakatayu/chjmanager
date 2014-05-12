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
	rel='stylesheet' type='text/css' />
<style type="text/css">
#tagSecond li {
	width: 90%;
	height: 30px;
	padding: 10px 0 0 10px;
	list-style: none;
	border: 1px solid #ccc;
}

#tagSecond li:hover {
	cursor: pointer;
	background: #056698;
	color: #fff;
}

.updateFontColor {
	color: #FF0000;
}
/*  遮罩层 */
.black_overlay {
	display: none;
	position: fixed;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 1001;
	-moz-opacity: 0.8;
	opacity: .80;
	filter: alpha(opacity =             80);
}

.white_content {
	display: none;
	position: fixed;
	top: 20%;
	left: 30%;
	width: 400px;
	height: 300px;
	border: 2px solid lightblue;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}
</style>
</head>
<body>

	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>



	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="../index.jsp" title="主页" class="tip-bottom"><i
					class="icon-home"></i> 主页</a> <a
					href="${ctx}/pages/company/ShopList.jsp" title="店铺列表"
					class="current"><i class=" icon-magic"></i> 店铺列表</a> <a href="#"
					class="current">店铺(商品选择列表)</a>
			</div>
			<div style="margin-left: 10px;">
				<h3>${shopName}</h3>
			</div>
		</div>


		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span3">
					<div class="widget-box">
						<div class="widget-title">
							<span class="icon"> <i class="icon-list"></i>
							</span>
							<h5>选择要添加的商品所属类别</h5>

						</div>

						<div class="widget-content" style="padding-left: 0px;">
							<ul id="tagSecond">
								<c:forEach var="item" items="${categoryPro}" varStatus="index">
									<li value="${item.product_shop_category_id}">${item.name}</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>

				<div class="span9"
					style="float: left; margin-top: 16px; margin-left: 20px;">

					<table class="table table-bordered table-striped">

						<thead>
							<tr>
								<td><input type="checkbox" onclick="dickThis(this)" /></td>
								<td>商品名称</td>
								<td>是否促销</td>
								<td>商品SKU</td>
								<td>商品价格</td>
								<td>现存数量</td>
								<td>默认库存</td>
								<td>操作</td>
							</tr>
						</thead>
						<tbody id="table_content">
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
						<div class="row-fluid">
							<div
								style="width: 250px; float: left; margin-left: 10px; margin-top: 6px;">
								<button class="btn btn-warning" onclick="addShopProduct()">添加商品</button>
								<button class="btn btn-warning" onclick="deleteShopProduct()">删除商品</button>
								<button class="btn btn-info" type="button"
									onclick="sendShopList()">返回</button>
							</div>
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
	<!-- 遮罩层  -->



	<div id="dialog_div" class="white_content"
		style="padding: 30px 0px 0px 50px;">
		<h5>商品库存设置</h5>
		<input type="hidden" id="hiddenShopProductId" />
		<div style="font-size: 16px;">
			<div style="float: left; width: 100%;">
				<span style="width: 30%;">商品现存数量：</span> <input type="text"
					id="txtStock" style="width: 150px;"
					onkeyup="value=value.replace(/[^\d\.]/g,'')" />
			</div>

			<div style="float: left; width: 100%;">
				<span style="width: 30%;">默认库存：</span> <input type="text"
					id="txtStockDay" style="width: 150px;"
					onkeyup="value=value.replace(/[^\d\.]/g,'')" />
			</div>

			<div style="float: left; width: 100%;">
				<span style="width: 30%; float: left;">是否进行促销：</span>
				<div id="radioDivId" style="width: 60%; float: left;">

					<input type="radio" name="functionType" value=""
						style="margin-left: 0px" />无 <input type="radio"
						name="functionType" value="T" style="margin-left: 10px" />推广 <input
						type="radio" name="functionType" value="C"
						style="margin-left: 10px" />促销
				</div>
			</div>
			<div style="float: left; width: 100%;">
				<a class="btn btn-warning" style="margin: 20px 20px;"
					onclick="saveDialogStock()">保&nbsp;&nbsp;&nbsp;&nbsp;存</a> <a
					class="btn btn-warning" style="margin: 20px 20px;"
					onclick="CloseDiv()">关&nbsp;&nbsp;&nbsp;&nbsp;闭</a>
			</div>
		</div>
	</div>
	<div id="dialog_black" class="black_overlay"></div>
</body>
</html>
<script type="text/javascript">
	$(function() {
		initCategoryHover();
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
		pageinfo["categoryId"] = selectCategoryIndex;

		$
				.ajax({
					type : "post",
					url : '${ctx}/optionaproductcategory!findShopSelectedProduct.action',
					dataType : 'json',
					timeout : 10000,
					data : pageinfo,
					success : function(msg, status) {
						if (msg.status == 200) {
							var array = [];
							for ( var i = 0; i < msg.rows.length; i++) {
								var data = msg.rows[i];
								for ( var h = 0; h < data["shopProductSkuList"].length; h++) {
									var sku = data["shopProductSkuList"][h];
									var functionType = '推广';
									if (data["functionType"] == 'C') {
										functionType = '促销';
									} else if (data["functionType"] == 'T') {
										functionType = '推广';
									} else {
										functionType = '无';
									}
									var td0 = '';
									if (h == 0) {
										td0 = '<td rowspan='
												+ (data["shopProductSkuList"].length == 0 ? 1
														: data["shopProductSkuList"].length)
												+ '>'
												+ '<input type="checkbox" value="'+data["companyShopProductId"]+'" name="checkbox" />'
												+ '</td>';
										td0 += '<td rowspan='
												+ (data["shopProductSkuList"].length == 0 ? 1
														: data["shopProductSkuList"].length)
												+ '>'
												+ '<label class="control-label">'
												+ data["productName"]
												+ '</label> '
												+ '</td>'
												+ '<td rowspan='
												+ (data["shopProductSkuList"].length == 0 ? 1
														: data["shopProductSkuList"].length)
												+ '>'
												+ '	<div class="control-group">'
												+ '	<div class="controls">'
												+ functionType + '</div>'
												+ '</div></td>';
									}
									var str = '<tr">'
											+ td0
											+ '<td><label class="control-label">'
											+ sku["sku"]["skuKind"]
											+ '</label></td>'
											+ '<td><label class="control-label">'
											+ sku["sku"]["price"]
											+ '</label></td>'
											+ '<td>'
											+ sku["stock"]
											+ '</td>'
											+ '<td>'
											+ sku["stockDay"]
											+ '</td>'
											+ '<td><a href="javascript:void(0)" class="updateFontColor" onclick="updateShopStock('
											+ data["companyShopProductId"]
											+ ',' + sku["stock"] + ',\''
											+ data["functionType"] + '\','
											+ sku["stockDay"] + ')">' + '修改'
											+ '</a></td></tr>';
									array.push(str);
								}
							}
							$('#table_content').html(array.join(''));
							array = [];

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

						} else {
							alert(msg.msg);
						}
					}
				});

	}
	function addShopProduct() {
		if (selectCategoryIndex == '') {
			alert('请选择分类!');
			return;
		}
		$('#shopIdHidden').val('${shopId}');
		$('#shopNameHidden').val('${shopName}');
		$('#shopCategoryIdHidden').val(selectCategoryIndex);
		$('#shopCategoryNameHidden').val(selectCategoryName);
		$('#formturn').attr("action",
				"${ctx}/optionaproductcategory!shopSelectProduct.action");
		$('#formturn').submit();
	}
	var selectCategoryIndex = '';
	var selectCategoryName = '';
	function initCategoryHover() {
		$("#tagSecond li").hover(function() {
			$(this).css("background", "#056698");
		}, function() {
			var selVal = this.getAttribute("value");
			if (selectCategoryIndex != selVal)
				$(this).css("background", "#fff");
		});

		$("#tagSecond li").click(function(index) {

			var selVal = this.getAttribute("value");
			selectCategoryIndex = selVal;
			selectCategoryName = $(this).html();

			$.each($("#tagSecond li"), function() {
				var cate = this.getAttribute("value");
				if (cate == selVal) {
					$(this).css({
						background : "#056698",
						color : "#fff"
					});
				} else {
					$(this).css({
						background : "#fff",
						color : "#444"
					});
				}
			});
			loadData(1);
		});
	}
	function deleteShopProduct() {
		var array = [];
		$("input[name=checkbox]").each(function() {
			var flag = $(this).attr("checked");
			if (flag == 'checked') {
				array.push($(this).val());
			}
		});

		if (array.length == 0) {
			alert('请选择商品!');
		} else {
			if (window.confirm('确定删除吗?')) {
				$
						.ajax({
							type : "post",
							url : '${ctx}/optionaproductcategory!deleteShopSelectedProduct.action',
							dataType : 'json',
							timeout : 10000,
							data : {
								ids : array.join(','),
								shopId : '${shopId}'
							},
							success : function(msg, status) {
								if (msg.status == 200) {
									alert('删除成功!');
									loadData(1);
								} else
									alert(msg.msg);
							}
						});
			}

		}
	}
	//返回按钮   
	function sendShopList() {
		location.href = "${ctx}/pages/company/ShopList.jsp";
	}
	function updateShopStock(companyShopProId, stock, functionType, stockDay) {
		$('#hiddenShopProductId').val(companyShopProId);
		$('#txtStock').val(stock);
		$('#txtStockDay').val(stockDay);
		$('input[name="functionType"]').each(function() {
			if ($(this).val() == functionType) {
				$(this).attr('ckecked', 'checked');
			} else {
				$(this).removeAttr('ckecked');
			}
		});
		document.getElementById('dialog_div').style.display = 'block';
		document.getElementById('dialog_black').style.display = 'block';
	}
	//关闭遮罩层
	function CloseDiv() {
		document.getElementById("dialog_div").style.display = 'none';
		document.getElementById("dialog_black").style.display = 'none';
	}

	function saveDialogStock() {
		if ($.trim($('#txtStock').val()).length == 0) {
			alert('现存数量不为空!');
			return;
		}
		if ($.trim($('#txtStockDay').val()).length == 0) {
			alert('库存量不为空!');
			return;
		}
		var functionType = $("input[type=radio]:checked").val();
		$
				.ajax({
					type : "post",
					url : '${ctx}/productshopcategory!updateCompanyShopProductStock.action',
					dataType : 'json',
					timeout : 10000,
					data : {
						companyShopProductId : $('#hiddenShopProductId').val(),
						stock : $('#txtStock').val(),
						stockDay : $('#txtStockDay').val(),
						functionType : functionType
					},
					success : function(msg, status) {
						if (msg.status == 200) {
							alert('修改成功!');
							CloseDiv();
							loadData(1);
						} else
							alert('修改失败!');
					}
				});
	}

	function dickThis(obj) {
		$("input[name=checkbox]").each(function() {
			if (obj.checked) {
				$(this).attr('checked', 'checked');
			} else {
				$(this).attr('checked', false);
			}
		});
	}
</script>






