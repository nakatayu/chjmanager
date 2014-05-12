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
				<a href="${ctx}/pages/index.jsp" title="主页" class="tip-bottom">
				<i class="icon-home"></i> 主页</a> <a href="#" class="current">店铺设置</a>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
					<div class="widget-box" style="margin-bottom: 0px;">
						<div class="widget-title">
							<span class="icon"><i class="icon-th"></i></span>
							<h5>店铺信息</h5>
						</div>
						<table class="table table-bordered table-striped">
						<div class="widget-content nopadding">
						<div  style="float: right;top:background-position: " >
						<table class="table table-bordered table-striped">
						<div class="widget-content nopadding">
						<div class="container-fluid">
									<thead>
									<tr>
										<th>序号</th>
										<th>店铺编号</th>
										<th>店铺名称</th>
										<th>店铺地址</th>
										<th>店铺联系人</th>
										<th>店铺号码</th>
										<th></th>
									</tr>
								</thead>
									<input type="hidden" name="selectedShopIds" id="selectedShopIds">
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
										<li><a href="javascript:void(0)"
											onclick="loadData(1,100)">100</a></li>
									</ul>
								</div>
								<div class="pagination alternate"
									style="margin-left: 30px; margin-top: 8px; float: right;">
									<ul id="ul-page">

									</ul>
								</div>
							<!-- 	 <div class="pagination alternate"
									style="margin-left: 0px; margin-top: 8px; float: left;">
									<button class="btn btn-warning" onclick="addshopinfo()">新&nbsp;&nbsp;&nbsp;&nbsp;增</button>
									 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="btn btn-warning" type="" onclick="deleteshop()">删&nbsp;&nbsp;&nbsp;&nbsp;除</button>
								</div> -->
						  </div>
						 
					    </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div></div>
					
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
</body>
</html>
<script type="text/javascript">
	var listData = [];//每一页的数据
	
	$(function() {

		loadData(1,10);

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
		$.ajax({
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
								/* array
										.push('<td>'
												+ '<input type="checkbox" value="' + data["company_shop_id"]+ '"/>'
												+ '</td>'); */
								array.push('<td>' + (i + 1) + '</td>');				
								array.push('<td>' + data["shop_number"]
										+ '</td>');
								array.push('<td>' + data["name"] + '</td>');
								array.push('<td>' + data["address"] + '</td>');
								array.push('<td>' + data["linkman"] + '</td>');
								array.push('<td>' + data["linkman_tel"]
										+ '</td>');
								array.push('<td>'
												+ '<a href="javascript:void(0)" onclick="updateShopInfo('
												+ data["company_shop_id"]
												+ ')">' + "店铺详情" + '</a>'
												+ '</td>');
							/* 	array.push('<td>'
										+ '<a  href="javascript:void(0)" onclick="addProduct('
										+ msg.rows[i]["company_shop_id"]+',\''+ data["name"]
										+ '\')">' + "商品列表" + '</a>'
										+ '</td>');
								array.push('<td>'
										+ '<a  href="javascript:void(0)" onclick="addProductCategory('
										+ msg.rows[i]["company_shop_id"]+',\''+ data["name"]
										+ '\')">' + "商品分类" + '</a>'
										+ '</td>'); */
								array.push('</tr>');
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

						} else {
							alert(msg.msg);

						}
					}
				});
	}

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
	
	/* 店铺详情 */
	function updateShopInfo(shopId) {
		window.location = "${ctx}/shop!updateShopInfo.action?shopId="+shopId;
	}
	//添加商品
	function addProduct(shopId,name) {
		$('#shopIdHidden').val(shopId);
		$('#shopNameHidden').val(name);
		$('#formturn').attr("action","${ctx}/optionaproductcategory!shopProductList.action");
		$('#formturn').submit();
	}
	//进入商品分类列表 
	function addProductCategory(shopId,name){
		location.href = "${ctx}/pages/company/ProductCategory.jsp?shopId="+shopId+"&name="+name;
	}
	function addshopinfo() {
		location.href = "${ctx}/pages/company/SaveShopInfo.jsp";
	}
</script>


