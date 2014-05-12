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
	position: absolute;
	top: 0%;
	left: 0%;
	width: 100%;
	height: 100%;
	background-color: black;
	z-index: 1001;
	-moz-opacity: 0.8;
	opacity: .80;
	filter: alpha(opacity = 80);
}

.white_content {
	display: none;
	position: absolute;
	top: 30%;
	left: 10%;
	width: 50%;
	height: 30%;
	border: 2px solid lightblue;
	background-color: white;
	z-index: 1002;
    overflow: auto; 
}

.white_content_small {
	display: none;
	position: absolute;
	top: 10%;
	left: 40%;
	width: 10%;
	height: 20%;
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
										<div class="container-fluid">
											<thead>
												<tr>
													<th style="width:7%">
													 <input type="checkbox" /> 全选
													 </th>
													<!-- <th>序号</th> -->
													<th>分类名称</th>
													<th>创建日期</th>
													<th>所属数量</th>
												</tr>
											</thead>
											<input type="hidden" name="selectedShopId" id="selectedShopId">
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
										style="margin-left: 0px; margin-top: 6px; float:left;">
										<button class="btn btn-warning" onclick="startDiv(this)">新&nbsp;&nbsp;&nbsp;&nbsp;增</button>
										 &nbsp;&nbsp;&nbsp;<!-- onclick="addClassify()" -->
										<button class="btn btn-warning" onclick="openDiv(this)">更&nbsp;&nbsp;&nbsp;&nbsp;新</button>
										&nbsp;&nbsp;&nbsp;
										<button class="btn btn-warning" type="button"
											onclick="deleteCategory()">删&nbsp;&nbsp;&nbsp;&nbsp;除</button>
									</div>
								</div>
							</div>
	<!--新增   遮罩层  -->
			<div id="white" class="white_content"
				style="padding: 30px 0px 0px 50px;">
				<div style="text-align: right; cursor: default; height: 40px; padding: 0px 20px 0px 0px;">
					<a href="#"><span style="font-size: 16px;"
						onclick="CloseDiv('white','black')"> <font color="orange">关闭
						</font></span></a>
				</div>
					<form method="post"
								action="${ctx}/productshopcategory!saveProductShopCategory.action"   name="basic_validate" 
								id="basic_validate"  novalidate="novalidate">
								<input type="hidden"  name="shopId"  id="shopId"   />
				<table>
				<tr>
						<td><label class="control-label">新增分类：</label></td>
						<td>
							<div class="controls">
								<input type="text" name="newCategoryName"  id="newCategoryName" />
							</div>
						</td>
					</tr>
				</table>
				<br>
				<br>
				<table>
					<tr>
						<td>
							<button class="btn btn-warning" type="button"
							onclick="saveCompany()">确&nbsp;&nbsp;&nbsp;&nbsp;认</button>
						</td>	
					</tr>
				</table>
				</form>
			</div>
			<div id="black" class="black_overlay"></div>							
							
	
	
	<!-- 更改  遮罩层  -->
			<div id="updateOpenWhite" class="white_content"
				style="padding: 30px 0px 0px 50px;">
				<div style="text-align: right; cursor: default; height: 40px; padding: 0px 20px 0px 0px;">
					<a href="#"><span style="font-size: 16px;"
						onclick="CloseUpdateDiv('updateOpenWhite','updateOpenBlack')"> <font color="orange">关闭
						</font></span></a>
				</div>
					<form method="post"
								action="${ctx}/productshopcategory!updateCategory.action"
								name="updateOperate" id="updateOperate">
					<input type="hidden"  name="categoryId"  id="categoryId" />
					<input type="hidden"  name="companyShopId"  id="companyShopId"   />
				<table>
				<tr>
						<td><label class="control-label">更改分类名称：</label></td>
						<td>
							<div class="controls">
								<input type="text" name="updateCategoryName"  id="updateCategoryName" />
							</div>
						</td>
					</tr>
				</table>
				<br>
				<br>
				<table>
					<tr>
						<td>
							<button class="btn btn-warning" type="button"
							onclick="updateCategory()">确&nbsp;&nbsp;&nbsp;&nbsp;认</button>
						</td>
					</tr>
				</table>
				</form>
			</div>
			<div id="updateOpenBlack" class="black_overlay"></div>								
		</div>
			</div>
		</div>					

						<%-- 	<form method="post"
								action="${ctx}/productshopcategory!updateCategory.action"
								name="updateOperate" id="updateOperate">
								
								<input type="hidden"  name="categoryId"  id="categoryId"  />
								<input type="hidden"  name="shopId"  id="shopId"   />
								<div id="form-wizard-1" class="step">
									<div class="control-group">
										<table>
											<tr>
												<td><label class="control-label">分类选择：</label></td>
												<td>
													<div class="controls">
														<input type="text"  name="name"  id="name"  placeholder="点击分类名称，更改类别" />
													</div>
												</td>
											</tr>
										</table>
									</div>
								</div>

								<div class="pagination alternate"
									style="margin-left: 0px; margin-top: 8px; float: left;">
									<button class="btn btn-warning" onclick="updateCategory()"
										type="button">更&nbsp;&nbsp;&nbsp;&nbsp;改</button>
									</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="btn btn-warning" type="button"
										onclick="window.location.reload(true)">取&nbsp;&nbsp;&nbsp;&nbsp;消</button>
								</div>
						</form>  --%>
			

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

var shopId = <%=request.getParameter("shopId")%>;
$("#shopId").val(shopId);
var companyShopId = <%=request.getParameter("shopId")%>;
$("#companyShopId").val(companyShopId);
	var listData = [];//每一页的数据
	$(function() {
		var  flag= "${flag}" ;
		if(flag!="" && flag=="true"){
			alert("保存成功");
		} /* else if(flag!="" && flag=="false"){
			alert("系统繁忙，请稍后再试！");
		}   */
		
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
					url : '${ctx}/productshopcategory!findProductShopCategoryList.action?shopId='+shopId,
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
												+ '<input  style="margin:0 0 0 10px;padding:0px"  type="checkbox" value="' + msg.rows[i]["product_shop_category_id"]+ '"/>'
												+ '</td>'); 
								/* array.push('<td>' + (i + 1) + '</td>'); */
										array.push('<td>'
										+  data["name"] 
										+ '</td>'); 
					 			array.push('<td>' +  data["creation_time"]  + '</td>'); 
							 	array.push('<td>' +  data["count"]  + '</td>'); 
								array.push('</tr>'); 
							}
							$('#table_content').html(array.join(''));
							 
							if(msg.total>pageinfo["size"]){
								if(msg.total%pageinfo["size"]==0)
									pageinfo["tp"]=msg.total/pageinfo["size"];
							 else
									pageinfo["tp"]=Math.ceil(msg.total/pageinfo["size"]);
							 $("#pager").pager({ pagenumber: pageinfo["page"], pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
							
							}else{
								$('#pager').html('');	
							}
							
						} else {
							alert(msg.msg);
						}
					}
				});
	}
	PageClick = function(pageclickednumber) {
	    $("#pager").pager({ pagenumber: pageclickednumber, pagecount: pageinfo["tp"], buttonClickCallback: PageClick });
	    loadData(pageclickednumber);
	};

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
				});
			}
		}
	}
	// 更新分类名称 
	function updateCategory() {
		var updateCategoryName = $.trim($("#updateCategoryName").val());
		if(updateCategoryName !="" ){
	  		$("#updateOperate").submit();
		}else{
			alert("分类选择为空!");
		}
	}

/* 	function findCategory(ca) {
		 $("#name").val($(ca).html());
		 $("#categoryId").val($(ca).parent().find("td:eq(0)>input[type=checkbox]").val());  
	}
	 */
	//更改名称  打开遮罩层
	function openDiv(parm) {
		document.getElementById('updateOpenWhite').style.display = 'block';
		document.getElementById('updateOpenBlack').style.display = 'block';
		
		
		/*  		var secondAreaId = $(checkbox).val();
			alert(secondAreaId);
			$(parm).parent("tr").find("td:eq(0)")
			 if (secondAreaId == -1) {
				$("#thirdAreaId").find("input[type=checkbox]").each(function() {
					$(this).attr("checked", true);
				});
			} else {
				$("#thirdAreaId").find("input[type=checkbox]").each(function() {
					if ($(this).attr("parentId") == secondAreaId) {
						$(this).attr("checked", true);
					} else {
						$(this).attr("checked", false);
					}
				});
			} */
		//alert($(parm).parent("tr").find("td:eq(0)"));
		//	.find("td:eq(0)=input[type=checkbox checked]")
		//alert($("#categoryId").val($(parm).parents("tr").find("td:eq(0)>input[type=checkbox]").val()));
		 $("#categoryId").val($(parm).parents("tr").find("td:eq(0)>input[type=checkbox]").val()); 
		// $("#updateCategoryName").val($(parm).html());
	}
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
	function saveCompany(){
		var newCategoryName = $.trim($("#newCategoryName").val());
		if(newCategoryName !=""){
			$("#basic_validate").submit();
		}else{
			alert("名称为空!");
		}
	} 
</script>


