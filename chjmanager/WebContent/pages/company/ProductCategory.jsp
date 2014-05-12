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
					class="tip-bottom"><i class="icon icon-signal"></i> 店铺设置</a>  <a href="#"
					class="current">商品分类</a>
			</div>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="widget-box" style="margin-bottom: 0px;">
					<div class="widget-title">
						<span class="icon"><i class="icon-th"></i></span>
						<h5>商品分类维护</h5>
					</div>
					<table class="table table-bordered table-striped">
						<div class="widget-content nopadding">
							<div style="float: right; top: background-position:">
								<table class="table table-bordered table-striped">
									<div class="widget-content nopadding">
										<div class="container-fluid">
											<thead>
												<tr>
													<th></th>
													<th>序号</th>
													<th>分类名称</th>
													<th>创建日期</th>
													<th>所属数量</th>
												</tr>
											</thead>
											<input type="hidden" name="selectedShopId"
												id="selectedShopId">
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
											<li><a href="javascript:void(0)"
												onclick="loadData(1,10)">10</a></li>
											<li class="divider"></li>
											<li><a href="javascript:void(0)"
												onclick="loadData(1,20)">20</a></li>
											<li class="divider"></li>
											<li><a href="javascript:void(0)"
												onclick="loadData(1,50)">50</a></li>
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
									<div class="pagination alternate"
										style="margin-left: 0px; margin-top: 8px; float: left;">
										<button class="btn btn-warning" onclick="AddClassify()">新&nbsp;&nbsp;&nbsp;&nbsp;增</button>
										</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<button class="btn btn-warning" type=""
											onclick="deleteCategory()">删&nbsp;&nbsp;&nbsp;&nbsp;除</button>
									</div>
								</div>
							</div>
							<br>
							<h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;分类名称：</h5>
							<hr>

							<form method="post"
								action="${ctx}/productshopcategory!updateCategory.action"
								name="updateOperate" id="updateOperate">
								<div id="form-wizard-1" class="step">
									<div class="control-group">
										<table>
											<tr>
												<td><label class="control-label">分类选择：</label></td>
												<td>
													<div class="controls">
														<input type="text"  name="name"  id="name" />
														<input type="hidden" name="categoryId" id="categoryId"  />
														<input name="shopId" id="shopId" type="hidden"  />
													</div>
												</td>
											</tr>
										</table>
									</div>
								</div>

								<div class="pagination alternate"
									style="margin-left: 0px; margin-top: 8px; float: left;">
									<button class="btn btn-warning" onclick="updateCategory()"
										type="button">保&nbsp;&nbsp;&nbsp;&nbsp;存</button>
									</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="btn btn-warning" type="button"
										onclick="location.reload()">取&nbsp;&nbsp;&nbsp;&nbsp;消</button>
						<button class="btn btn-info" type="button" onclick="sendShopList()">返回</button>
								</div>
						</form>
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
</body>
</html>
<script type="text/javascript">
	var shopId = <%=request.getParameter("shopId")%>;
   $("#shopId").val(shopId);


	var listData = [];//每一页的数据
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
		pageinfo["name"] = $('#txtName').val();
		$.ajax({
					type : "post",
					url : '${ctx}/productshopcategory!findProductShopCategoryList.action?shopId='
							+ shopId,
					dataType : 'json',
					data : pageinfo,
					success : function(msg, status) {
						var array = [];
						if (msg.status == 200) {
							listData = msg.rows;
							for ( var i = 0; i < msg.rows.length; i++) {
								var data = msg.rows[i];
								 array.push('<tr>');
								 array.push('<td>'
												+ '<input type="checkbox" value="' + msg.rows[i]["product_shop_category_id"]+ '"/>'
												+ '</td>'); 
								array.push('<td>' + (i + 1) + '</td>');
								array.push('<td onclick="findCategory(this)">' + data["name"] + '</td>');
					 			array.push('<td>' +  data["creation_time"]  + '</td>'); 
							 	array.push('<td>' +  data["count"]  + '</td>'); 
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
	function findCategory(ca) {
		 $("#name").val($(ca).html());
		 $("#categoryId").val($(ca).parent().find("td:eq(0)>input[type=checkbox]").val());  
	}

	//删除选中分类 
	function deleteCategory() {
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
						selectedShopId : label
					},
					url : '${ctx}/productshopcategory!deleteCategory.action',
					dataType : 'json',
					success : function(msg, status) {
						if (msg.status == 200) {
							alert("删除成功！");
						}
						window.location.reload(true);
					}
				})
			}
		}
	}
	//保存分类
	function saveFrom() {
		$("#submitForm").submit();
			window.location.reload(true);
	}
	//更新分类 
	function updateCategory() {
			$("#updateOperate").submit();
			window.location.reload(true);
	}
	//点击增加分类 
	function AddClassify() {
		window.location = "AddClassify.jsp?shopId=" + <%=request.getParameter("shopId")%>;
	}
	//返回按钮   
	function sendShopList(){
		location.href = "${ctx}/pages/company/ShopList.jsp";
	}
</script>
</body>
</html>

