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
</head>

<style type="text/css">
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
	filter: alpha(opacity =                     80);
}

.white_content {
	display: none;
	position: fixed;
	top: 30%;
	left: 30%;
	width: 30%;
	height: 30%;
	border: 2px solid lightblue;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}
</style>

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
					class="current">店铺(商品分类列表)</a>
			</div>
		</div>
		<div class="row-fluid"
			style="background-color: #FFF; padding-left: 20px;">
			<div class="span12">
				<div class="widget-box" style="margin-right: 40px;">
					<input type="hidden" name="selectedShopId" id="selectedShopId" />
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th style="width: 8%"><input type="checkbox" /> 全选</th>
								<!-- <th>序号</th> -->
								<th>分类名称</th>
								<th>创建日期</th>
								<th>所属数量</th>
								<th>顺序</th>
							</tr>
						</thead>
						<tbody id="table_content">
						</tbody>
					</table>
					<div class="widget-title"
						style="height: 60px; border: 1px solid #ccc; padding-bottom: 4px; padding-left: 20px;">
						<div class="btn-group" style="margin-top: 6px; float: left;">

							<button class="btn btn-warning" style="margin: 0 5px;"
								onclick="openDiv(1)">新增分类</button>

							<button class="btn btn-warning" style="margin: 0 5px;"
								onclick="openDiv(2)">更新分类</button>

							<button class="btn btn-warning" style="margin: 0 5px;"
								onclick="deleteCategory()">删除分类</button>

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

	<div id="black" class="black_overlay"></div>
	<!-- 更改  遮罩层  -->
	<div id="updateOpenWhite" class="white_content"
		style="padding: 10px 0px 0px 50px;">
		<div
			style="text-align: right; height: 40px; padding: 0px 20px 0px 0px; cursor: pointer;">
			<span style="font-size: 16px;"
				onclick="CloseUpdateDiv('updateOpenWhite','black')"> <font
				color="orange">关闭 </font>
			</span>
		</div>
		<form id="formDivId">
			<input type="hidden" name="categoryId" id="categoryId" />
			<div class="control-group">
				<label>更改分类名称： <input type="text" name="updateCategoryName"
					id="updateCategoryName" />
				</label>
			</div>
			<div class="control-group">
				<label>更改分类顺序： <input type="text" name="categorynumber"
					id="categorynumber" />
				</label>
			</div>
			<div class="control-group">
				<a class="btn btn-warning" style="margin: 10px 0 0 50px;"
					onclick="updateCategory()">确认</a>
			</div>
		</form>
	</div>
</body>
</html>
<script type="text/javascript">
	var shopId = '${param.shopId}';
	$(function() {
		$
				.ajax({
					type : "post",
					url : '${ctx}/productshopcategory!findProductShopCategoryList.action',
					dataType : 'json',
					data : {
						shopId : shopId
					},
					success : function(msg, status) {
						var array = [];
						if (msg.status == 200) {
							listData = msg.rows;
							for ( var i = 0; i < msg.rows.length; i++) {
								var data = msg.rows[i];
								if (data["num"] == null || data["num"] == '') {
									data["num"] = 0;
								}
								if (data["order_field"] == null || data["order_field"] == '') {
									data["order_field"] = 0;
								}
								array.push('<tr>');
								array
										.push('<td><input type="checkbox" style="margin:0px 0px 0px 15px;padding:0px" value="'
				+ msg.rows[i]["product_shop_category_id"]+ '"  num="'+data["order_field"]+'"/></td>');
								array.push('<td>' + data["name"] + '</td>');
								array.push('<td>' + data["creation_time"]
										+ '</td>');

								array.push('<td>' + data["num"] + '</td>');
								if (data["order_field"] > 0) {
									array
											.push('<td style="text-align:center;"><span style="color:red;">第'
													+ data["order_field"]
													+ '位<span></td>');
								} else {
									array.push('<td></td>');
								}
								array.push('</tr>');
							}
							$('#table_content').html(array.join(''));
						} else {
							$('#table_content').html(
									'<tr><td colspan="5">' + msg.msg
											+ '</td></tr>');
						}
					}
				});
	});

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
							window.location.reload(true);
						} else {
							alert("删除失败！");
						}
					}
				});
			}
		}
	}
	// 更新分类名称 
	function updateCategory() {
		var name = $.trim($("#updateCategoryName").val());
		if (name == '') {
			alert("分类名称不能为空!");
			return;
		}
		var nums = $("#categorynumber").val();
		if (nums != '' && isNaN(nums)) {
			alert("分类顺序是数字!");
			return;
		}
		var data = {};
		data["shopId"] = shopId;
		data["categoryId"] = $.trim($("#categoryId").val());
		data["categoryName"] = $.trim($("#updateCategoryName").val());
		data["categorynumber"] = $.trim($("#categorynumber").val());

		$.ajax({
			type : "post",
			url : '${ctx}/productshopcategory!updateCategory.action',
			dataType : 'json',
			data : data,
			timeout : 10000,
			success : function(msg, status) {
				if (msg.status == 200) {
					alert("更新成功!");
					window.location.reload();
				} else {
					alert("更新失败!");
				}
			}
		});

	}

	//更改名称  打开遮罩层
	function openDiv(parm) {
		if (parm == 1) {
			$("#categoryId").val('');
			$("#updateCategoryName").val('');
			$("#categorynumber").val('');
			document.getElementById('updateOpenWhite').style.display = 'block';
			document.getElementById('black').style.display = 'block';
		} else if (parm == 2) {
			var checkedObj = $("input[type=checkbox]:checked");
			if (checkedObj.size() != 1) {
				alert("请选择一条数据修改!");
			} else {
				$("#categoryId").val(checkedObj.val());
				$("#updateCategoryName").val(
						checkedObj.parents("tr").find("td:eq(1)").html());
				$("#categorynumber").val(checkedObj.attr('num'));
			}
			document.getElementById('updateOpenWhite').style.display = 'block';
			document.getElementById('black').style.display = 'block';
		}
	}
	//关闭DIV 
	function CloseUpdateDiv(show_div, bg_div) {
		document.getElementById(show_div).style.display = 'none';
		document.getElementById(bg_div).style.display = 'none';
	};

	//打开遮罩层
	function startDiv(parameter) {
		document.getElementById('white').style.display = 'block';
		document.getElementById('black').style.display = 'block';
	}
	//关闭遮罩层
	function CloseDiv(show_div, bg_div) {
		$("#newCategoryName").val("");
		document.getElementById(show_div).style.display = 'none';
		document.getElementById(bg_div).style.display = 'none';
	};

	//保存分类
	function saveCompany() {
		var newCategoryName = $.trim($("#newCategoryName").val());
		if (newCategoryName != "") {
			var data = $("#basic_validate").serialize();
			$
					.ajax({
						type : "post",
						url : '${ctx}/productshopcategory!saveProductShopCategory.action',
						dataType : 'json',
						data : data,
						timeout : 10000,
						success : function(msg, status) {
							if (msg.status == 200) {
								alert("保存成功");
								window.location.reload(true);
							} else {
								alert("保存失败");
							}
						}
					});
		} else {
			alert("名称为空!");
		}
	}
</script>


