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
.shopNum {
	color: #FF0000;
}

.orderCss {
	color: #48d1cc;
}

.productListCss {
	color: #FF99FF;
}

.shopCheckNoPassCss {
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
				<a href="${ctx}/pages/index.jsp" title="主页" class="tip-bottom"><i
					class="icon-home"></i> 主页</a>
				<c:if test="${not empty param.companyId&&param.companyId!=null}">
					<a href="${ctx}/pages/manager/companyInfoManager.jsp" title="企业列表"
						class="current"> <i class=" icon-fire"></i>企业列表
					</a>
				</c:if>
				<a href="#" class="current">店铺列表</a>
			</div>
		</div>

		<c:if test="${empty param.companyId||param.companyId==null}">
			<div style="padding: 10px 0 0 20px;">
				<table style="font-size: 14px; font-weight: bold;">
					<tr>
						<td width="100px" align="right">审核状态：</td>
						<td width="150px">
							<div class="controls">
								<select style="height: 25px; width: 150px;" id="status">
									<option value="">全部</option>
									<option value="3">待审核</option>
									<option value="2">审核不通过</option>
									<option value="1">审核通过</option>
									<option value="T">被推荐</option>
								</select>
							</div>
						</td>
						<td width="40px">企业:</td>
						<td width="100px"><input
							style="margin-top: 8px; width: 150px;" type="text"
							id="companyName" placeholder="企业名称"></td>
						<td width="40px">店铺:</td>
						<td><input style="margin: 3px 0px 2px 5px" align="right"
							type="text" id="txtName" placeholder="店铺名称"></td>
						<td><input style="margin: 2px 0px 2px 0px" type="button"
							value="查询" class="btn btn-success" onclick="loadData(1)" /></td>
					</tr>
				</table>
			</div>
		</c:if>
		<div class="row-fluid"
			style="background-color: #FFF; padding-left: 20px; padding-bottom: 20px;">
			<div class="span12">
				<div class="widget-box" style="margin-right: 40px;">
					<table class="table table-bordered table-striped"
						style="margin: 0px; float: right; border: 1px solid #ccc;">
						<thead>
							<tr>
								<th width="15px"><input type="checkbox" /></th>								
								<th width="45px">店铺<br />编号</th>
								<th width="150px">店铺名称</th>
								<c:if test="${empty param.companyId||param.companyId==null}">
									<th>所属公司</th>
								</c:if>
								<c:if test="${not empty param.companyId&&param.companyId!=null}">
									<th>店铺地址</th>
								</c:if>
								<th  style="width: 50px;">店铺<br />联系人</th>
								<th width="80px">店铺号码</th>
								<th colspan="2" width="80px">查看信息</th>
								<th>店铺状态</th>
								<th style="width: 40px;">web<br />推荐</th>
								<th style="width: 50px;">手机首<br />页推荐</th>
								<th style="width: 50px;">手机便<br />捷推荐</th>
							</tr>
						</thead>
						<tbody id="table_content">
						</tbody>
					</table>

					<div class="widget-title"
						style="height: 50px; border: 1px solid #ccc; float: right; width: 100%;">
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
					</div>
					<div class="widget-title"
						style="border: 1px solid #ccc; float: right; width: 100%; height: auto;">
						<div class="btn-group" style="float: left;">
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="checkShopStatus(1)">审核通过</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="checkShopStatus(2)">审核不通过</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="openOrCloseShop(1,3)">开启店铺</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="openOrCloseShop(3,1)">关闭店铺</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="webSHOPExtend(0,1,4)">web推荐</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="webSHOPExtend(0,0,0)">取消推荐</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="webSHOPExtend(1,1,3)">手机首页</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="webSHOPExtend(1,0,0)">取消首页</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="webSHOPExtend(2,1,3)">手机便捷</button>
							<button class="btn btn-warning" style="margin: 5px;"
								onclick="webSHOPExtend(2,0,0)">取消便捷</button>
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
	var companyId = '${param.companyId}';

	var shopStatus = [ "", "新创建", "修改申请", "关闭申请", "开启申请" ];//店铺状态
	var examineResult = [ "", "审核通过", "审核未通过", "未审核", "关闭" ];

	$(function() {
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
		if (companyId == null || companyId == '') {
			pageinfo["companyName"] = $('#companyName').val();
			pageinfo["name"] = $('#txtName').val();
			var serStatus = $('#status').val();
			if (serStatus == 'T') {
				pageinfo["top"] = 1;
				pageinfo["status"] = '';
			} else {
				pageinfo["top"] = 0;
				pageinfo["status"] = serStatus; //状态
			}
		} else {
			pageinfo["companyId"] = companyId;
		}
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
												+ '<input type="checkbox" name="shopId" style="margin:0px 5px 0px 7px;padding:0px" value="' + msg.rows[i]["company_shop_id"]+ '"/>'
												+ '</td>');			
								array
										.push('<td>'
												+ '<a href="javascript:void(0)" class="shopNum" onclick="shopInfo('
												+ data["company_shop_id"] + ','
												+ data["company_id"] + ')">'
												+ data["company_shop_id"] + '</td>');
								array
										.push('<td>'
												+ '<a href="javascript:void(0)" onclick="shopInfo('
												+ data["company_shop_id"]
												+ ')">' + data["name"] + '</a>'
												+ '</td>');
								if ($.trim('${param.companyId}') == '') {
									array.push('<td>' + data["companyName"]
											+ '</td>');
								} else {
									array.push('<td>' + data["address"]
											+ '</td>');
								}
								array.push('<td>' + data["linkman"] + '</td>');
								array.push('<td>' + data["linkman_tel"]
										+ '</td>');
								array
										.push('<td style="text-align:center;">'
												+ '<a class="orderCss" href="javascript:void(0)" onclick="shopOrder('
												+ msg.rows[i]["company_shop_id"]
												+ ',\'' + data["name"]+ '\')">店铺<br />订单</a></td>');
								array
										.push('<td style="text-align:center;">'
												+ '<a class="productListCss" href="javascript:void(0)" onclick="productList('
												+ data["company_shop_id"]
												+ ',\'' + data["name"] + '\','
												+ data["company_id"] + ')">店铺<br />商品</a></td>');
								array.push('<td>' + shopStatus[data["status"]]
										+ ":"
										+ examineResult[data["examine_result"]]
										+ '</td>');
								if (data["order_field"] > 0) {
									array
											.push('<td style="text-align:center;">web推荐<br /><span style="color:red;">第'
													+ data["order_field"]
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
									'<tr><td colspan="12">' + msg.msg
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
	function webSHOPExtend(filName, filValue, filnum) {
		var str = [];
		$('input[name="shopId"]:checked').each(
				function(k, v) {
					str.push($(this).val());
				});
		if (str.length == 0) {
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
		setData["shopIdlist"] = str.join(',');
		setData["filName"] = filName;
		setData["filnum"] = filnum;

		$.ajax({
			type : "post",
			data : setData,
			url : '${ctx}/shop!companyShopWebExtend.action',
			dataType : 'json',
			success : function(msg, status) {
				if (msg.status == 200) {
					alert("设置成功！");
					loadData(1);
				} else {
					alert(msg.msg);
				}
			}
		});
	}
		
	//店铺订单
	function shopOrder(companyShopId, companyId) {
		location.href = "${ctx}/pages/manager/companyInfoManagerOrderList.jsp?companyShopId="
				+ companyShopId + "&companyId=" + companyId;
	}
	//店铺详情
	function shopInfo(companyShopId) {
		location.href = "${ctx}/shop!updateShopInfo.action?companyShopId="
				+ companyShopId;
	}
	//进入商品列表 
	function productList(companyShopId, name, companyId) {
		location.href = "${ctx}/pages/manager/companyInfoManagerProductList.jsp?companyShopId="
				+ companyShopId + "&companyId=" + companyId;
	}

	//审核店铺
	function checkShopStatus(status) {
		if (status == 1) {//审核通过
			var checkedCount = $("input[type=checkbox]:checked").size();
			if (checkedCount > 1) {
				alert("每次只能选择一条数据");
			} else if (checkedCount == 0) {
				alert("请选择数据");
			} else {
				var companyNoPass = $("input[type=checkbox]:checked").parents(
						"tr").find("td:eq(8)").find("p").html();
				if (companyNoPass == "审核通过") {
					alert("不可重复审核");
				} else {
					var label = $("input[type=checkbox]:checked").parents("tr")
							.find("td:eq(0)>input[type=checkbox]").val();
					$.ajax({
						type : "post",
						url : '${ctx}/shop!updateShopExamineResult.action',
						data : "companyShopId=" + label + "&examineResult="
								+ status,
						dataType : 'json',
						success : function(msg, status) {
							if (msg.status == 200) {
								alert("该店铺审核通过！");
								loadData(1);
							} else if (msg.status == 400) {
								alert("系统繁忙，请稍后再试！");
								window.location.reload(true);
							}
						}
					});
				}
			}
		} else if (status == 2) {
			var checkedCount = $("input[type=checkbox]:checked").size();
			if (checkedCount > 1) {
				alert("每次只能选择一条数据");
			} else if (checkedCount == 0) {
				alert("请选择数据");
			} else {
				var companyNoPass = $("input[type=checkbox]:checked").parents(
						"tr").find("td:eq(8)").find("p").html();
				if (companyNoPass == "审核不通过") {
					alert("不可重复审核");
				} else {
					var label = $("input[type=checkbox]:checked").parents("tr")
							.find("td:eq(0)>input[type=checkbox]").val();
					$.ajax({
						type : "post",
						url : '${ctx}/shop!updateShopExamineResult.action',
						data : "companyShopId=" + label + "&examineResult="
								+ status,
						dataType : 'json',
						success : function(msg, status) {
							if (msg.status == 200) {
								alert("该店铺审核不通过！");
								loadData(1);
							} else if (msg.status == 400) {
								alert("系统繁忙，请稍后再试！");
								window.location.reload(true);
							}
						}
					});
				}
			}
		}
	}

	//开启或者关闭 店铺
	function openOrCloseShop(status, examineResult) {
		var checkedCount = $("input[type=checkbox]:checked").size();
		if (checkedCount > 1) {
			alert("每次只能选择一条数据");
		} else if (checkedCount == 0) {
			alert("请选择数据");
		} else {
			var companyNoPass = $("input[type=checkbox]:checked").parents("tr")
					.find("td:eq(8)").find("p").html();
			if (companyNoPass == "关闭") {
				alert("不可重复审核");
			} else {
				var label = $("input[type=checkbox]:checked").parents("tr")
						.find("td:eq(0)>input[type=checkbox]").val();
				$.ajax({
					type : "post",
					url : '${ctx}/shop!openOrCloseShop.action',
					data : "companyShopId=" + label + "&examineResult="
							+ examineResult + "&status=" + status,
					dataType : 'json',
					success : function(msg, status) {
						if (msg.status == 200) {
							alert("审核成功！");
							loadData(1);
						} else if (msg.status == 400) {
							alert("系统繁忙，请稍后再试！");
						} else {
							alert("不可重复审核！");
						}
					}
				});
			}
		}
	}
</script>


