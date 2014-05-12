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
<body>

	<jsp:include page="/common/head.jsp"></jsp:include>
	<jsp:include page="/common/leftmenue.jsp"></jsp:include>

	
<div id="content">
		<div id="content-header">
			<div id="breadcrumb">
				<a href="../index.jsp" title="主页" class="tip-bottom"><i
					class="icon-home"></i> 主页</a> <a
					href="${ctx}/pages/company/CustomizeFlavors.jsp" title="商品附加属性"
					class="tip-bottom"><i class="icon-home"></i>商品附加属性</a> 
			</div>
		</div>
		<div class="container-fluid">
			<div class="row-fluid">
					<div class="widget-box" style="margin-bottom: 0px;">
						<div class="widget-title">
							<span class="icon"><i class="icon-th"></i></span>
							<h5>商品信息</h5>
						</div>
						<div style="margin:10px 0 10px 10px">
						<span style='font-size: 14px;'>商品附加属性：
										<button class='btn btn-warning' type='button'
											onclick='addAttributeName()'>添加属性</button>&nbsp;&nbsp;&nbsp;&nbsp;
										<button class='btn btn-warning' type='button'
											onclick='delAttributeValue(this)'>删除属性</button>
									</span> 
									<input type="hidden" name="parentId" id="parentId" />
						</div>
						<table class="table table-bordered table-striped">
						<div class="widget-content nopadding">
						<div  style="float: right;top:background-position: " >
						<table class="table table-bordered table-striped">
						<div class="widget-content nopadding">
						<div class="container-fluid">
									<thead>
									<tr>
										  <td>是否多选</td>
											<td>附加属性</td>
											<td>附加属性值</td>
											<td>添加操作</td>
											<!-- <td>删除操作</td> -->
									</tr>
								</thead>
									<input type="hidden" name="selectedProductId"  id="selectedProductId">
								<tbody id="customizeFlavors">

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
									<ul id="pager">

									</ul>
								</div>
								
						  </div>
						 
					    </div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div></div>
	
	

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
	<jsp:include page="/common/buttom.jsp"></jsp:include>
</body>
</html>

<script type="text/javascript">
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

		//附加属性显示 
		$.ajax({
					type : "post",
					url : '${ctx}/addproductattribute!findCustomizeFlavors.action',
					dataType : 'json',
					timeout : 10000,
					data : pageinfo,
					success : function(msg, status) {
						if (msg.status == 200) {
							var array = [];
							for ( var i = 0; i < msg.rows.length; i++) {
									array.push('<tr>');
								
													if(msg.rows[i]['isCkeckbox']=="T"){
														array	.push('<td>是</td>');
													}
													else{
														array	.push('<td>否</td>');
													}
												
									array.push("<td><span style='font-size:14px'><input type='checkbox' value="+msg.rows[i]['appendId']+" />"
													+ msg.rows[i]["name"]
													+ ':'
													+ "</span></td>");
									array.push("<td>");
									for ( var h = 0; h < msg.rows[i]["child"].length; h++) {
										
											array	.push(msg.rows[i]["child"][h]["name"]
															+ '<input type="checkbox"  value="'+msg.rows[i]["child"][h]["appendId"]+'"/>');
										
									}
									array.push('</td>');
									array.push('<td>'
													+ "<input name='appendId' id='appendId' type='hidden' value="+msg.rows[i]['appendId']+" /><button  type='button' onclick='addAttributeValue(this)' >+</button>"
													+ '</td>');
							}
							$('#customizeFlavors').html(array.join(''));

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
							$('#pager').html('');	
							$('#customizeFlavors').html('<tr><td colspan="5">'+msg.msg+'</td></tr>');
						}
					}
				});
	}

	//增加属性值
	function addAttributeValue(add) {
		var appendId = $(add).parent().find("input[type=hidden]").val(); //获取hidden里面的值
		window.location = "addAttributeValue.jsp?appendId=" + appendId;
	}
	// 增加属性名称 
	function addAttributeName() {
		window.location = "addAttributeName.jsp";
	}
	//删除属性  父属性 
	function delAttributeValue() {
		if (confirm("您确认删除此记录吗？")) {
			if ($("#customizeFlavors").parent().find(
					"input[type=checkbox]:checked").size() == 0) {
				alert("请选择需要删除的记录！");
				return;
			} else {
				var label = "";
				$("#customizeFlavors").parent().find(
						"input[type=checkbox]:checked").each(function() {
					label = label + $(this).attr("value") + ",";
				});
				$.ajax({
							type : "post",
							url : '${ctx}/addproductattribute!deleteProductAttribute.action',
							dataType : 'json',
							data : {
								selectedShopId : label
							},
							success : function(msg, status) {
								if (msg.status == 200) {
									alert("删除成功！");
									window.location = "CustomizeFlavors.jsp";
								}
							}
						})
			}
		}
	}
</script>




