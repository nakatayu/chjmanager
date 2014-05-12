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
<link rel="stylesheet" href="${ctx}/css/pager.css" />
<style type="text/css">
.productCategoryCss {
	color: #FF6600;
}

.productCss {
	color: #4169e1;
}

.shopNum {
	color: #FF0000;
}
</style>
</head>
<body>

	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>


	<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="${ctx}/pages/index.jsp" title="主页" class="tip-bottom">
					<i class="icon-home"></i> 主页
				</a> <a href="#" class="current">店铺列表</a>
			</div>
		</div>
		<div class="row-fluid"
			style="background-color: #FFF; padding-left: 20px;min-height: 700px;">
			<div class="span12">
				<div class="widget-box"
					style="margin-right: 40px;margin-bottom: 100px;">


					<input type="hidden" name="selectedShopIds" id="selectedShopIds">
					<table class="table table-bordered table-striped">
						<div class="widget-content nopadding">
							<div class="container-fluid">
								<thead>
									<tr>
										<th style="width: 7%"><input type="checkbox" /> 全选</th>
										<th>编号</th>
										<th>店铺编号</th>
										<th>店铺名称</th>
										<th>店铺地址</th>
										<th>店铺联系人</th>
										<th>店铺号码</th>
										<th>操作</th>
										<th>操作</th>
										<th style="width: 120px">店铺状态</th>
										<th>营业状态</th>
									</tr>
								</thead>
								<tbody id="table_content">
								</tbody>
							</div>
						</div>
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
							<ul id="pager">

							</ul>
						</div>
						<div class="pagination alternate"
							style="margin-left: 0px; margin-top: 8px; float: left;">
							<button class="btn btn-warning" onclick="addshopinfo()">新增店铺</button>
							&nbsp;
							<button class="btn btn-warning" type="" onclick="deleteshop()">删除店铺</button>
							&nbsp;
							<button class="btn btn-warning" type="button"
								onclick="closeShop(4)">申请开启</button>
							&nbsp;
							<button class="btn btn-warning" type="button"
								onclick="closeShop(3)">申请关闭</button>
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
	<script src="${ctx}/js/jquery.pager.js"></script>
</body>
</html>
<script type="text/javascript">
	var listData = [];//每一页的数据

	var shopStatus = [ "", "创建待审核", "修改申请", "申请关闭", "申请开启" ];//店铺状态
	var examineResult = [ "", "审核通过", "审核未通过", "未审核", "关闭" ];
	$(function() {
		loadData(1, 10);
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

		pageinfo["name"] = $('#txtName').val();
		$
				.ajax({
					type : "post",
					url : '${ctx}/shop!findShopList.action',
					dataType : 'json',
					data : pageinfo,
					success : function(msg, status) {
						var array = [];
						if (msg.status == 200) {
							for ( var i = 0; i < msg.rows.length; i++) {
								var data = msg.rows[i];
								array.push('<tr>');
								array
										.push('<td>'
												+ '<input id="checkbox" type="checkbox" value="' + data["company_shop_id"]+ '" estatus="'+data["status"]+'"/>'
												+ '</td>');
								array.push('<td><a href="javascript:void(0)" class="shopNum" onclick="updateShopInfo('
										+ data["company_shop_id"]
										+ ')">'+ data["company_shop_id"]+ '</a></td>');
								array
										.push('<td>'
												+ '<a href="javascript:void(0)" class="shopNum" onclick="updateShopInfo('
												+ data["company_shop_id"]
												+ ')">' + data["shop_number"]
												+ '</a></td>');
								array
										.push('<td>'
												+ '<a href="javascript:void(0)" onclick="updateShopInfo('
												+ data["company_shop_id"]
												+ ')">' + data["name"] + '</a>'
												+ '</td>');
								array.push('<td>' + data["address"] + '</td>');
								array.push('<td>' + data["linkman"] + '</td>');
								array.push('<td>' + data["linkman_tel"]
										+ '</td>');
								array
										.push('<td>'
												+ '<a  href="javascript:void(0)" class="productCss"  onclick="addProduct('
												+ msg.rows[i]["company_shop_id"]
												+ ',\'' + data["name"]
												+ '\')">' + "商品列表" + '</a>'
												+ '</td>');
								array
										.push('<td>'
												+ '<a  href="javascript:void(0)" class="productCategoryCss" onclick="addProductCategory('
												+ msg.rows[i]["company_shop_id"]
												+ ',\'' + data["name"]
												+ '\')">' + "商品分类" + '</a>'
												+ '</td>');

								array.push('<td>' + shopStatus[data["status"]]
										+ ":"
										+ examineResult[data["examine_result"]]
										+ '</td>');
								if (data["status"] != 3
										&& data["examine_result"] == 1) {
									if (data["deliver_ok"].length == 1) {
										array
												.push('<td style="text-align:center;">正在营业<br>');
									} else {
										array
												.push('<td style="text-align:center;">已停止营业<br>');
									}

									array
											.push('<a href="javascript:void(0)" onclick="updeliverOk('
													+ data["company_shop_id"]
													+ ',\''
													+ data["deliver_ok"]
													+ '\',this)" style="color:red;">');
									if (data["deliver_ok"].length == 1) {
										array.push(' 暂停</a></td>');
									} else {
										array.push('开始</a></td>');
									}
								} else {
									array.push('<td>&nbsp;<br>&nbsp;</td>');
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
							$('#table_content').html(
									'<tr><td colspan="5">' + msg.msg
											+ '</td></tr>');
						}
					}
				});
	}
	PageClick = function(pageclickednumber) {
		$("#pager").pager({
			pagenumber : pageclickednumber,
			pagecount : pageinfo["tp"],
			buttonClickCallback : PageClick
		});
		loadData(pageclickednumber);
	};

	//删除选中店铺  			
	function deleteshop() {
		if (confirm("您确认删除此记录吗？")) {
			if ($("#table_content").find("input[type=checkbox]:checked").size() == 0) {
				alert("请选择需要删除的记录！");
			} else {
				var label = "";
				$("#table_content").find("input[type=checkbox]:checked").each(
						function() {
							label = label + $(this).attr("value") + ",";
						});
				$.ajax({
					type : "post",
					data : {
						selectedShopIds : label
					},
					url : '${ctx}/shop!deleteShopInfo.action',
					dataType : 'json',
					success : function(msg, status) {
						if (msg.status == 200) {
							alert("删除成功！");
							window.location = "ShopList.jsp";
						}
					}
				});
			}
		}
	}
	function updateShopInfo(shopId) {

		window.location = "${ctx}/shop!updateShopInfo.action?companyShopId="
				+ shopId;
	}
	//添加商品
	function addProduct(shopId, name) {
		$('#shopIdHidden').val(shopId);
		$('#shopNameHidden').val(name);
		$('#formturn').attr("action",
				"${ctx}/optionaproductcategory!shopProductList.action");
		$('#formturn').submit();
	}
	//进入商品分类列表 
	function addProductCategory(shopId, name) {
		location.href = "${ctx}/pages/company/ShopProductCategory.jsp?shopId="
				+ shopId + "&name=" + name;
	}
	function addshopinfo() {
		location.href = "${ctx}/pages/company/SaveShopInfo.jsp";
	}
	//店铺开启/关闭申请
	function closeShop(type) {
		var checkedCount = $("input[id=checkbox]:checked").size();
		if (checkedCount != 1) {
			alert("请选择一条数据!");
		} else {
			var label = '';
			$("#table_content").find("input[id=checkbox]:checked").each(
					function() {
						if (type == $(this).attr("estatus")) {
							alert("此店铺已" + (type == 3 ? "关闭！" : "开启！"));
						} else {
							label = $(this).attr("value");
						}
					});
			if ($.trim(label) == '') {
				return;
			}
			$.ajax({
				type : "post",
				data : {
					companyShopId : label,
					payTypeId : type
				},
				url : '${ctx}/shop!closeShopStatus.action',
				dataType : 'json',
				success : function(msg, status) {
					if (msg.status == 200) {
						alert("申请成功，请等待审核结果!");
						window.location.reload();
					} else if (msg.status == 500) {
						if (type == 4) {
							alert("该店铺已开启或正在审核!");
						} else {
							alert("该店铺已关闭或正在审核!");
						}
					} else {
						alert(msg.msg);
					}
				}
			});
		}
	}

	function updeliverOk(companyShopId, deliverOk, obj) {
		
		if (confirm('您确认' + $.trim($(obj).html()) + '营业吗？')) {
			$.ajax({
				type : "post",
				data : {
					companyShopId : companyShopId,
					deliverOk : deliverOk
				},
				url : '${ctx}/shop!deliverOk.action',
				dataType : 'json',
				success : function(msg, status) {
					if (msg.status == 200) {
						alert("修改成功!");
						window.location.reload();
					} else {
						alert(msg.msg);
					}
				}
			});
		}
	}
</script>


